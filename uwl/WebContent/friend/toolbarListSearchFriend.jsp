<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--  CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
    <script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/4b823cf630.js" crossorigin="anonymous"></script>
    <title>Document</title>

    <script type="text/javascript">
        var sessionName = "${user.name}";

        $(function() {
            var sessionId = $("input#sessionId").val();
            console.log("sessionId", sessionId);

            $("span#userId").on("click", function() {
                var userId = $(this).html();
                self.location = "/user/getProfile/" + userId;
            })

            $("img#profileName").on("click", function() {
                var userId = $(this).next().html();
                self.location = "/user/getProfile/" + userId;
            })

            friendBtn();
            askedBtn();
            requestBtn();

        })


        $(document).on("click", "#applyBtn", function() {
            var sessionId = $("input#sessionId").val();
            console.log("sessionId", sessionId);
            var userId = $(this).next().val();
            console.log("userId", userId);

            $.ajax({
                url: "/friend/rest/requestFriend",
                method: "POST",
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                data: JSON.stringify({
                    firstUserId: sessionId,
                    secondUserId: userId
                }),
                success: function() {
                    var html = "<button type='button' class='btn btn-outline-secondary " + userId + "' id='cancelBtn'>신청취소</button>" +
                        "<input type='hidden' value='" + userId + "'>";
                    $("." + userId + "").remove();
                    $(html).appendTo("#" + userId + "");

                    //socket push msg = (senderId,receiverId,senderName,notiOrigin,notiCode); 하나라도 빼먹으면 안됨. 해당하는 인자값 없으면 1이라도 넣어야함
                    socketMsg = sessionId + "," + userId + "," + sessionName + "," + "4,3";
                    console.log(socketMsg)
                    socket.send(socketMsg);

                    addNoti(sessionId, userId, "4", "3");
                }
            })
        })

        $(document).on("click", "#cancelBtn", function() {
            var sessionId = $("input#sessionId").val();
            console.log("sessionId", sessionId);
            var userId = $(this).next().val();
            console.log("userId", userId);
            $.ajax({
                url: "/friend/rest/deleteFriend",
                method: "post",
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                data: JSON.stringify({
                    firstUserId: sessionId,
                    secondUserId: userId
                }),
                success: function() {
                    var html = "<button type='button' class='btn btn-outline-primary " + userId + "' id='applyBtn'>친구신청</button>" +
                        "<input type='hidden' value='" + userId + "'>"
                    $("." + userId + "").remove();
                    $(html).appendTo("#" + userId + "");
                }
            })
        })

        function friendBtn() {
            var sessionId = $("input#sessionId").val();
            console.log("sessionId", sessionId);

            $.ajax({
                url: "/friend/rest/getFriendListForSearch",
                method: "POST",
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                data: JSON.stringify({
                    userId: sessionId
                }),
                success: function(d) {
                    for (var i = 0; i < d.list.length; i++) {
                        $("." + d.list[i].userId + "").remove();
                    }
                }
            })
        }

        function askedBtn() {
            var sessionId = $("input#sessionId").val();
            $.ajax({
                url: "/friend/rest/getAskedList",
                method: "POST",
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                data: JSON.stringify({}),
                success: function(d) {
                    console.log("askedBtn");
                    for (var i = 0; i < d.list.length; i++) {
                        var html = "<button type='button' class='btn btn-outline-primary " + d.list[i].userId + "' id='acceptButton'>친구신청</button>" +
                            "<input type='hidden' value='" + d.list[i].userId + "'/>";
                        $("." + d.list[i].userId + "").remove();
                        $(html).appendTo("#" + d.list[i].userId + "");


                    }
                }
            })
        }

        //	이미 친구신청한 유저 친구신청버튼
        function requestBtn() {
            var sessionId = $("input#sessionId").val();
            $.ajax({
                url: "/friend/rest/getRequestList",
                method: "POST",
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                data: JSON.stringify({
                    userId: sessionId
                }),
                success: function(d) {
                    for (var i = 0; i < d.list.length; i++) {
                        var html = "<button type='button' class='btn btn-outline-secondary " + d.list[i].userId + "' id='cancelBtn'>신청취소</button>" +
                            "<input type='hidden' value='" + d.list[i].userId + "'/>";
                        $("." + d.list[i].userId + "").remove();
                        $(html).appendTo("#" + d.list[i].userId + "");

                    }
                }
            })
        }
    </script>


    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        li {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        a:hover {
            text-decoration: none;
            color: inherit;
        }

        body {

            color: #333;
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;
        }





        img#searchProfileName {
            width: 100px;
            height: 100px;
            border-radius: 50px;
        }
    </style>

    <style>
        div.layoutWrap {

            width: 100%;
            min-height: 200vh;
            padding: 0 20%;
            position: relative;
        }

        div.leftToolbar {
            width: 20%;
            height: 100vh;

            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            background: #fff;
            border-right: 1px solid #eee;
        }

        div.rightToolbar {
            width: 20%;
            height: 100vh;

            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            background: #fff;
            border-left: 1px solid #eee;
        }
    </style>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        li {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: inherit;

        }

        a:hover,
        a:focus {
            text-decoration: none;
            color: inherit;
        }

        body {
            color: #333;
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;

        }

        div.layoutWrap2 {
            width: 1500px;
            height: 100vh;

            margin: 0 auto;
            overflow: hidden;
        }

        div.leftToolbar2 {

            width: 300px;
            height: 100vh;
            float: left;
            background-color: #fff;
            border-right: 1px solid #eee;
        }

        div.work2 {

            width: 900px;
            height: 100vh;
            float: left;
            overflow: hidden;
            overflow-y: scroll;

        }

        div.rightToolbar2 {

            width: 300px;
            height: 100vh;
            float: left;
            background-color: #fff;
            border-left: 1px solid #eee;
        }
        
        div.searchList {
        	margin-bottom : 30px;
        }
    </style>
</head>

<body>
    <div class="layoutWrap2">
        <div class="leftToolbar2">
            <jsp:include page="/layout/left.jsp" />
        </div>
        <div class="work2">
            <div class="container">
                <input type="hidden" name="sessionId" id="sessionId" value="${user.userId}">
                <br />
                <div class="row justify-content-center">
                    <c:forEach var="friendUser" items="${map.list}">
                        <div class="col-sm-8 col-md-8">
                            <div id="${friendUser.userId}" class="searchList">
                                <img src="../../images/${friendUser.profileName}" id="searchProfileName" />&nbsp;
                                <span id="name" style="margin-right:20px;">${friendUser.name}</span>
                                <span style="margin-right:20px;">${friendUser.schoolName}</span>
                                <button type="button" class="btn btn-outline-primary ${friendUser.userId}" id="applyBtn">친구신청</button>
                                <input type="hidden" value="${friendUser.userId}" />
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty map.list}">
                        검색된 회원이 없습니다.
                    </c:if>
                </div>

            </div>
        </div>
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>
</body></html>