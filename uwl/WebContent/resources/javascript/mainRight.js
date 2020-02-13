var sessionUserId = $('input#sessionUserId').val();

$(function () {
    $.ajax({
        url: "/friend/rest/getFriendListForSearch",
        method: "POST",
        headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
        },
        data: JSON.stringify({
            userId: sessionUserId
        }),
        success: function (d) {
            for (var i = 0; i < d.list.length; i++) {
                var html = "<li><a href='#'><img src='/images/" + d.list[i].profileName + "'>" + d.list[i].name + "<span></span></a>" +
                    "<input type='hidden' value='" + d.list[i].userId + "'></li>";
                $(html).appendTo("div.friendList ul");
            }
        }
    })
})

$(document).on("click", "div.friendList ul li a", function () {
    var targetUserId = $(this).next().val();
    console.log("targetUserId", targetUserId);

    $.redirect("/userrr/getProfile/" + targetUserId + "", {}, "GET");
})
