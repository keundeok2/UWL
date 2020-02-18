<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="https://kit.fontawesome.com/4b823cf630.js"	crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="http://localhost:82/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
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

        div.chattingIcon {

            display: inline-block;
            position: fixed;
            bottom: 30px;
            right: 30px;
        }

        div.chattingIcon a {

            display: block;
            width: 70px;
            height: 70px;
            text-align: center;
            border-radius: 50%;

            background-color: #EBAD7A;
            box-shadow: 1px 1px 1px #333;
        }

        div.chattingIcon a i {
            vertical-align: middle;

            line-height: 70px;
            font-size: 35px;
            text-shadow: 1px 1px 1px #333;
        }

        div.chattingList {

            width: 425px;

            font-size: 13px;

            background: #fff;

            position: fixed;
            max-height: 0;
            overflow: hidden;
            right: 10px;
            bottom: 110px;
            transition: max-height 0.3s;
            border: none;

        }

        div.chattingList.on {
            max-height: 600px;
            overflow-y: scroll;
            border: 1px solid #ebebeb;
        }




        div.chattingListTop {

            overflow: hidden;
            line-height: 30px;
            padding: 0 10px;
            border-bottom: 1px solid #ebebeb;
        }

        div.chattingListTopLeft {

            width: 50%;
            float: left;
            font-weight: bold;
        }

        div.chattingListTopRight {

            width: 50%;
            float: right;
            text-align: right;
        }

        div.chattingListTopRight a {
            color: #EBAD7A;
        }

        div.chattingListTopRight a:hover {
            text-decoration: underline;
        }

        div.chattingList ul li {


            border-bottom: 1px solid #ebebeb;


        }

        div.chattingList ul li:last-child {
            border-bottom: none;
        }

        div.chattingList ul li a {

            display: block;
            overflow: hidden;
            
            padding: 5px 10px;
        }

        div.profileImage {

            width: 60px;
            border-radius: 50%;
            overflow: hidden;
            height: 60px;
            text-align: center;
            display: inline-block;
            vertical-align: middle;
        }

        div.profileImage img {
            vertical-align: middle;
            height: 100%;
        }

        div.chattingInfo {


            vertical-align: middle;
            width: 322px;
            display: inline-block;
            vertical-align: middle;
            padding-left: 5px;
        }

        div.chattingUser p:nth-child(1) {
            width: 50%;

            float: left;
            color: #d25412;
            font-weight: bold;
        }

        div.chattingUser p:nth-child(2) {

            width: 50%;
            float: right;
            text-align: right;
        }

        div.chattingBox {
            
            width: 290px;
            font-size: 14px;
            display: none;
            position: fixed;
            bottom: 110px;
            right: 440px;
            background: #fff;
        }
        div.chattingBox.on {
            display: block;
        }

        div.chattingBoxTop {
            border: 1px solid #ebebeb;
            height: 45px;
            position: relative;
        }

        div.chattingBoxTopLeft {
            
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            left: 10px;
        }

        div.userProfileImage {
            width: 35px;
            height: 35px;
            overflow: hidden;
            border-radius: 50%;
            vertical-align: middle;
            display: inline-block;
        }

        div.userProfileImage img {
            height: 100%;
            vertical-align: middle;
        }

        div.chattingUserName {
            display: inline-block;
        }

        div.chattingBoxTopRight {
            


            text-align: right;
            font-size: 15px;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            right: 10px;
            color: #aaaaaa;;

        }

        div.chattingBoxTopRight a:nth-child(1) {
            
            display: inline-block;
            
        }

        div.chattingBoxTopRight a:nth-child(2) {
            
            display: inline-block;
            margin-right: 5px;
        }

        div.chattingBoxTop>a {
            display: block;
        }

        div.chattingBoxContent {
            border: 1px solid #ebebeb;
            border-top: none;
        }

        div.message {
            background-color: rgba(235, 173, 122, 0.1);
            display: inline-block;
            line-height: 30px;
            padding: 0 10px;
            border-radius: 10px;
        }

        div.chattingBoxProfileImage {
            width: 35px;
            height: 35px;
            overflow: hidden;
            border-radius: 50%;
            display: inline-block;
        }

        div.chattingBoxProfileImage img {
            height: 100%;

        }

        div.chattingMessage {
            display: inline-block;
            
        }
        div.chatDate p {
            display: inline-block;
            

            line-height: 25px;
            padding: 0 5px;
            border-radius: 10px;
            font-size: 12px;
            color: #aaaaaa;
        }
        div.chattingBoxContent > div {
            padding: 5px 10px;
            
        }
        div.chatDate {
            text-align: center;
        }
        div.chatFromMe {
            text-align: right;
        }
        div.chatFromMe div.message {
            background-color: #EBAD7A;
            color: #fff;
        }
        div.chatFromUser div.message {
            background-color: #eee;
        }
        
        .ui-widget {
        	white-space: nowrap;
        	background: #fff;
        }
        
        .ui-helper-hidden-accessible div:last-child {
        	display: none;
        }
        
       	/* 팝업창 */
        .imgSelect {
			cursor: pointer;
		}

		.popupLayer {
			position: absolute;
			display: none;
			background-color: #ffffff;
			border: solid 2px #d0d0d0;
			width: 350px;
			height: 150px;
			padding: 10px;
			
			z-index: 1;
		}
		.popupLayer div {
			position: absolute;
			top: 5px;
			right: 5px
		}
		
		#searchFriendByProfile{
			border-radius: 15px; /* 이미지 반크기만큼 반경을 잡기*/
		}
    </style>
    
    <!-- 소켓연결 -->
    <script type="text/javascript">
    	$(document).ready(function(){
	    	var socket = io("http://localhost:82"); //82번 포트와 소켓을 연다
	    	var chattingRoomNo = '10004';	//82번포트와 연결됨과 동시에 채팅방 번호를 넘겨준다.
	    	var enterUserId = "${user.userId}";	//입장 회원의 정보
	    	socket.emit("enterUserId", enterUserId);	//입장 회원 정보 전송
	        //socket.emit("chattingRoomNo", chattingRoomNo);	//채팅방 번호 전송
    	});
    </script>
    
    <script type="text/javascript">
	    $(function() {
	        $('div.chattingIcon a').on('click', function() {
	            $('div.chattingList').toggleClass('on');
	        });
	        $(document).on("click", 'div.chattingList li a', function(){
	        	
	        	//이거 누르면 노드 서버 연결시켜줘야할 듯	
	        	
	        	$('div.chattingBox').toggleClass('on');
	        });
	    });
	    
	    
	    
	    $(document).ready(function(){
    		var sessionUserId = "${sessionScope.user.userId}";
	    	$.ajax({
	    		url : "/chatting/rest/getChattingRoomList",
	    		method : "POST",
	    		headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					master : sessionUserId
				}),
				success : function(data){
					var length = data.length;
					for(var i=0; i<data.length; i++){
						if(sessionUserId == data[i].master){
							var userName = data[i].enterUserName;
						}else{
							var userName = data[i].masterName
						}
						var view = "<li><a href='#'>"
                    				+"<div class='profileImage'>"
				                        +"<img src='/images/bonobono.jpg' alt=''>"
				                    +"</div>"
				                    +"<div class='chattingInfo'>"
				                        +"<div class='chattingUser'>"
				                            +"<p>"+userName+"</p>"
				                            +"<p>오전 10:13</p>"
				                        +"</div>"
				                        "<div class='chattingContent'>"
				                            +"줄여서 테마"
				                        +"</div>"
				                    +"</div>"
				                "</a></li>";
				       $('#forFriendListAppend').after(view);
				       
				       var howManyView = "채팅("+length+")";
				       $('#howManyChattingRoom').text(howManyView);
					}
				},
				error : function(){
					console.log("에러당1 ㅋㅋ");
				}
	    	});
	    });
	    	//친구 찾기
	    	$(document).ready(function(){
	    		var sessionUserId = "${sessionScope.user.userId}"
	    		$.ajax({
	    			url : "/friend/rest/getFriendListForSearch",
	    			method : "POST",
	    			headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					data : JSON.stringify({
						userId : sessionUserId
					}),
					success : function(data){
						var friendArr = new Array();
						for(var i=0; i<data.list.length; i++){
							friendArr[i] = data.list[i].name; 
						}
						$( "#tags" ).autocomplete({
						      source: friendArr
						});
					},
					error : function(){
						console.log("error");
					}
	    		});
	    	});
	    	
	    	
	    	function closeLayer( obj ) {
	    		$(obj).parent().parent().hide();
	    	}
	    	
	    	
	    	$(document).on("click", "#findFriendByName", function(e){
	    		var sWidth = window.innerWidth;
	    		var sHeight = window.innerHeight;

	    		var oWidth = $('.popupLayer').width();
	    		var oHeight = $('.popupLayer').height();

	    		// 레이어가 나타날 위치를 셋팅한다.
	    		var divLeft = e.clientX + 10;
	    		var divTop = e.clientY + 5;

	    		// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
	    		if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
	    		if( divTop + oHeight > sHeight ) divTop -= oHeight;

	    		// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
	    		if( divLeft < 0 ) divLeft = 0;
	    		if( divTop < 0 ) divTop = 0;

	    		$('.popupLayer').css({
	    			"top": divTop,
	    			"left": divLeft,
	    			"position": "absolute"
	    		}).show();
	    		
	    		var friendName = $('#tags').val();
	    		
	    		
	    	});
	    		/* $.ajax({
					 url : "/chatting/rest/addChattingRoom",
					 method : "POST",
					 dataType : 'json',
					 data : JSON.stringify({
						 master : masterId,
						 enterUser : userId
					 }),
					 headers : {
		    				"Accept" : "application/json",
		    				"content-Type" : "application/json"
		    			},
		    			success : function(data){
		    				if(data == true){
		    					var view = "<li><a href='#'>"
	                    				+"<div class='profileImage'>"
					                        +"<img src='img/10506738_10150004552801856_220367501106153455_o.jpg' alt=''>"
					                    +"</div>"
					                    +"<div class='chattingInfo'>"
					                        +"<div class='chattingUser'>"
					                            +"<p>"+userId+"</p>"
					                            +"<p>오전 10:13</p>"
					                        +"</div>"
					                        "<div class='chattingContent'>"
					                            +"줄여서 테마"
					                        +"</div>"
					                    +"</div>"
					                "</a></li>";
		    					$('#forFriendListAppend').after(view);
		    				}
		    			},
		    			error : function(){
		    				console.log('에러당 ㅋㅋ')
		    			}
				  }); */
	    
    </script>
    
</head>
<body>
				<div class="popupLayer" style="overflow-y:scroll; overflow-x:scroll ">
					<div>
						<span onClick="closeLayer(this)"
							style="cursor: pointer; font-size: 1.5em" title="닫기"><i class="fas fa-times"></i>
						</span>
					</div>
					<br>
					<span style="color:#cb4414; font-size:1em; font-weight:bold" >
						<img src="/images/bonobono.jpg" width="30" height="30" id="searchFriendByProfile" style="vertical-align: middle"/>&emsp;주형진 &emsp;신라공업고등학교&emsp; <i class="fas fa-comment-medical"></i>
					</span><br>
				</div>
    <div class="chattingIcon"><a href="#"><i class="fas fa-comments"></i></a></div>



    <div class="chattingList">
        <div class="chattingListTop">
            <div class="chattingListTopLeft">
                <a href="#" id="howManyChattingRoom"></a>
            </div>
            <div class="chattingListTopRight">
            
            
				
				
				<div class="ui-widget">
	 				<label for="tags"><i class="fas fa-search" id="findFriendByName"></i> </label>
	  				<input id="tags" style="width: 100px">
				</div>
			</div>
		</div>
		
        <ul id="forFriendListAppend">
        </ul>
    </div>


    <div class="chattingBox">
        <div class="chattingBoxTop">
            <a href="#">
                <div class="chattingBoxTopLeft">
                    <div class="userProfileImage">
                        <img src="/images/bonobono.jpg" alt="">
                    </div>
                    <div class="chattingUserName">
                        🎀주주장님🎀
                    </div>
                </div>
                <div class="chattingBoxTopRight">
                    <a href="#"><i class="fas fa-cog"></i></a>
                    <a href="#"><i class="fas fa-times"></i></a>
                </div>
            </a>
        </div>
        <div class="chattingBoxContent">
            <div class="chatDate">
                <p>2020년 2월 17일 월요일</p>
            </div>
            <div class="chatFromUser">

                <div class="chattingBoxProfileImage">
                    <img src="/images/bonobono.jpg" alt="">

                </div>
                <div class="chattingMessage">
                    <div class="userInfo">
                        🎀주주장님🎀
                    </div>
                    <div class="message">
                        채팅ㅋㅋ
                    </div>
                </div>
            </div>
            <div class="chatFromUser">

                <div class="chattingBoxProfileImage">
                    <img src="/images/bonobono.jpg" alt="">

                </div>
                <div class="chattingMessage">
                    <div class="userInfo">
                        🎀주주장님🎀
                    </div>
                    <div class="message">
                        채팅ㅋㅋ
                    </div>
                </div>
            </div>
            <div class="chatFromUser">

                <div class="chattingBoxProfileImage">
                    <img src="img/10506738_10150004552801856_220367501106153455_o.jpg" alt="">

                </div>
                <div class="chattingMessage">
                    <div class="userInfo">
                        🎀주주장님🎀
                    </div>
                    <div class="message">
                        채팅ㅋㅋ
                    </div>
                </div>
            </div>
            <div class="chatFromMe">


                <div class="chattingMessage">

                    <div class="message">
                        답장ㅋㅋ
                    </div>
                </div>
            </div>
            <div class="chatFromUser">

                <div class="chattingBoxProfileImage">
                    <img src="img/10506738_10150004552801856_220367501106153455_o.jpg" alt="">

                </div>
                <div class="chattingMessage">
                    <div class="userInfo">
                        🎀주주장님🎀
                    </div>
                    <div class="message">
                        채팅ㅋㅋ
                    </div>
                </div>
            </div>
        </div>
        <div class="chattingArea">
            <input type="text">
            <button type="button">보낼래!</button>
        </div>
    </div>

</body>
</html>