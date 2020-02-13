<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    
    
    <script type="text/javascript">
        var sessionUserId = "${user.userId}";

        $(function() {
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
                success: function(d) {
                    for (var i = 0; i < d.list.length; i++) {
                        var html = "<li><a href='#'><img src='/images/" + d.list[i].profileName + "'>" + d.list[i].name + "<span></span></a>" +
                            "<input type='hidden' value='" + d.list[i].userId + "'></li>";
                        $(html).appendTo("div.friendList ul");
                    }
                }
            })
        })

        $(document).on("click", "div.friendList ul li a", function() {
            var targetUserId = $(this).next().val();
            console.log("targetUserId", targetUserId);

            $.redirect("/userrr/getProfile/" + targetUserId + "", {}, "GET");
        })

    </script>
</head>

<body>
    <div class="search2">
        <i class="fas fa-search"></i><input type="text" placeholder="어울림 검색">
    </div>
    <div class="friendList">
        <ul>
            <li>친구 목록<i class="fas fa-cog"></i></li>
        </ul>
    </div>
</body>

</html>
