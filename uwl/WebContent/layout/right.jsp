<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style type="text/css">
        /* 일단 여기에 박았음 */
        div.addAskedFriendData img {
            width: 60px;
            height: 60px;
            border-radius: 30px;
        }

        div.addAskedFriendData div {
            text-align: center;
            line-height: 70px;
        }

        div.modal-content {
            width: 510px;
        }

        div.modal-body {
            max-height: 500px;
            overflow-y: auto;
            /* prevent horizontal scrollbar */
            overflow-x: hidden;
            /* add padding to account for vertical scrollbar */
            padding-right: 20px;
        }

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

        div.rightLayout {
        	margin-right: 20px;
        	margin-top: 20px;
        	margin-left: 20px;
        }

        div.search2 {
            
            overflow: hidden;
            margin-bottom: 15px;
            
        }

        div.search2 i {
            line-height: 40px;
            background-color: #efefef;
            vertical-align: bottom;
            float: left;
            padding: 0 15px;
            font-size: 17px;
            border-radius: 15px 0 0 15px;
        }

        div.search2 input {
            background-color: #efefef;
            line-height: 40px;
            border: none;
            float: left;
            font-size: 15px;

            font-size: 16px;
            color: #919191;
            padding-right: 35px;
        }

        input:focus {
            outline: none;
        }

        div.friendList {
            background-color: #efefef;
            border-radius: 10px;
            overflow: hidden;
        }

        div.friendList ul {
            
            padding-bottom: 20px;
        }

        

        div.friendList ul li:nth-child(1) {
            
            font-size: 20px;
            font-weight: bold;
            line-height: 40px;
            padding: 5px 10px;
            position: relative;
        }

        div.friendList ul li:nth-child(1) a {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            line-height: 1;
            padding: 8px;
            border-radius: 50%;
            
            color: #EBAD7A;
            
        }

        div.friendList ul li:nth-child(1) a:hover {
            background-color: rgba(235, 173, 122, 0.1);
        }

        div.friendList ul li:nth-child(n + 2) {
            
            border-top: 1px solid #eee;
            line-height: 50px;
            
        }
        div.friendList ul li:last-child {
            border-bottom: 1px solid #eee;
        }
        div.friendList ul li:nth-child(n + 2) a {
            
            display: block;
            padding: 0 10px;
            position: relative;
        }
        div.friendList ul li:nth-child(n + 2) a span:nth-child(1) {
            width: 40px;
            height: 40px;
            display: inline-block;
            border-radius: 50%;
            overflow: hidden;
            text-align: center;
            vertical-align: middle;
            position: relative;
            margin-right: 10px;
            background-color: #aaa;
        }
        div.friendList ul li:nth-child(n + 2) a span:nth-child(1) img {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            height: 100%;
            
        }
        div.friendList ul li:nth-child(n + 2) a span:nth-child(2) {
            font-weight: bold;
            
        }
        div.friendList ul li:nth-child(n + 2) a span:nth-child(3) {
            background-color: green;
            width: 10px;
            height: 10px;
            display: inline-block;
            border-radius: 50%;
            position: absolute;
            right: 23px;
            top: 50%;
            transform: translateY(-50%);
            
        }
    </style>
    <script>
        var sessionUserId = null;

        $(function() {
            rightLoad();
            connectWS();
        })

        //	우측툴바 load 
        function rightLoad() {
            sessionUserId = $('input#sessionUserId').val();
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
                        /*재이가 고침!!*/
                       var html = '<li>'
                    + '<a href="#" class="rightProfileName">'
                        + '<span><img src="/images/' + d.list[i].profileName + '" alt=""></span>'
                        + '<span>' + d.list[i].name + '</span>'
                        + '<span></span>'
                    + '</a>'
                    + '<input type="hidden" value="' + d.list[i].userId + '">'
                + '</li>';
                        /*재이가 고침!!*/
                        
                        $(html).appendTo("div.friendList ul");
                        
                        
                    }
                }
            })
        }


        //	우측툴바 프로필 이동 event
        $(document).on("click", "div.friendList ul li a.rightProfileName", function() {
            var targetUserId = $(this).next().val();
            console.log("targetUserId", targetUserId);

            $.redirect("/user/getProfile/" + targetUserId + "", {}, "GET");
        });

        //	우측툴바 검색 event
        $(document).on("keypress", "div.search2 input", function(e) {
            var searchKeyword = $(this).val();
            var searchCondition = $(this).next().val();
            if (e.which == 13) {
                console.log("searchKeyword", searchKeyword);
                if (searchKeyword == null || searchKeyword.length < 1) {
                    alert("검색어를 입력해주세요");
                    return;
                }

                $.redirect("/friend/getSearchFriendList", {
                    searchCondition: searchCondition,
                    searchKeyword: searchKeyword,
                    userId: sessionUserId
                })

            }
        });

        //	친구요청 Modal Event
        $(document).on("click", "div.friendList ul i", function() {
            $("div#askedFriendModal").modal();

            $.ajax({
                url: "/friend/rest/getAskedList",
                method: "POST",
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                data: JSON.stringify({

                }),
                success: function(d) {
                    $("div.addAskedFriendData").remove();
                    for (var i = 0; i < d.list.length; i++) {
                        var addData = "<div id='" + d.list[i].userId + "' class='row addAskedFriendData'>" +
                            "<div class='col-sm-1'><img src='../../images/" + d.list[i].profileName + "'/></div>" +
                            "<div class='col-sm-7'> &nbsp; " + d.list[i].name + " &nbsp; " + d.list[i].schoolName + " &nbsp;</div>" +
                            "<div class='col-sm-4 addTarget" + d.list[i].userId + "'><button type='button' class='btn btn-primary btn" + d.list[i].userId + "' id='acceptModalButton'>수락</button>" +
                            "<button type='button' class='btn btn-danger btn" + d.list[i].userId + "' id='deleteModalButton'>거절</button></div>" +
                            "<input type='hidden' value='" + d.list[i].userId + "'/>" +
                            "</div>";

                        $(addData).appendTo("div.addAskedFriendTarget");
                    }
                }
            });
        })

        //	친구요청 Modal 수락 event
        $(document).on("click", "#acceptModalButton", function() {
            var userId = $(this).parent().next().val();
            console.log("userId", userId);

            $.ajax({
                url: "/friend/rest/acceptFriend",
                method: "POST",
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                data: JSON.stringify({
                    firstUserId: sessionUserId,
                    secondUserId: userId
                }),
                success: function() {
                    var html = "<button type='button' class='btn btn-success'>친구</button>";
                    $(html).appendTo("div.addTarget" + userId + "");
                    $(".btn" + userId + "").remove();
                    $("div.friendList ul").html("");

                    var li = "<li>친구 목록<a href='#'><i class='fas fa-cog'></i></a></li>";
                    $(li).appendTo("div.friendList ul");
                    rightLoad();

                }
            })
        });

        //	친구요청 Modal 거절 event
        $(document).on("click", "#deleteModalButton", function() {
            var userId = $(this).parent().next().val();

            $.ajax({
                url: "/friend/rest/deleteFriend",
                method: "POST",
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                data: JSON.stringify({
                    firstUserId: sessionUserId,
                    secondUserId: userId
                }),
                success: function() {
                    var html = "<button type='button' class='btn btn-secondary'>거절됨</button>";
                    $(html).appendTo("div.addTarget" + userId + "");
                    $(".btn" + userId + "").remove();

                }
            })

        });
        
        //////////////// WebSocket //////////////////
        var socket = null;
        
        function connectWS() {
            console.log("tttttttttttttt")
            var ws = new WebSocket("ws://localhost:8080/replyEcho");
            socket = ws;

            ws.onopen = function () {
                console.log('Info: connection opened.');
            };

            ws.onmessage = function (event) {
                console.log("ReceiveMessage:", event.data+'\n');
            };

            ws.onclose = function (event) { 
                console.log('Info: connection closed.');
                //setTimeout( function(){ connectWS(); }, 1000); // retry connection!!
            };
            ws.onerror = function (err) { console.log('Error:', err); };
        }
        
		//	푸시 메시지 send 이벤트 
		$('#btnSend').on('click', function (evt) {
			evt.preventDefualt();
			if (socket.readyState !== 1) return;
			let msg = $('input#msg').val();
			socket.send(msg);
		});
		
    </script>


</head>

<body>
    <div class="rightLayout">
        <input type="hidden" id="sessionUserId" name="sessionUserId" value="${user.userId}">
        <div class="search2">

            <i class="fas fa-search"></i><input type="text" placeholder="어울림 검색">
            <select class="custom-select mr-sm-2" id="inlineFormCustomSelect" name="searchCondition">
                <option value="0" ${search.searchCondition==0 ? "selected" : "" }>아이디</option>
                <option value="1" ${search.searchCondition==1 ? "selected" : "" }>이름</option>
                <option value="2" ${search.searchCondition==2 ? "selected" : "" }>학교명</option>
                
            </select>
        </div>
        <div class="friendList">
            <ul>
                <li>친구 목록<a href="#"><i class="fas fa-cog"></i></a></li>
                
            </ul>
        </div>

        <!-- Right AskedFriend Modal -->
        <div class="modal fade" id="askedFriendModal" tabindex="-1" role="dialog" aria-labelledby="askedFriendModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <p class="modal-title" id="askedFriendModalLabel">친구 요청</p>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-sm-12 addAskedFriendTarget">

                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body></html>
