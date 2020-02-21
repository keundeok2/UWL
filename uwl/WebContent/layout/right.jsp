<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="/javascript/iscroll.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
    <script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
    <script src="http://192.168.0.23:82/socket.io/socket.io.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
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
            border-radius: 10px 0 0 10px;
            width: 15%;
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
            width: 60%;
        }
        
        div.search2 select {
            width: 25%;
            line-height: 40px;
            height: 40px;
            border: none;
            background: #efefef;
            color: #919191;
            border-radius: 0 10px 10px 0;
            position: relative;
            z-index: 1;
        }

        input:focus {
            outline: none;
        }
        selece:focus {
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
            background-color: #AAA;
            width: 10px;
            height: 10px;
            display: inline-block;
            border-radius: 50%;
            position: absolute;
            right: 23px;
            top: 50%;
            transform: translateY(-50%);

        }
        
        
/*================================= 채팅  css ===================================================================*/
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
            bottom: 25px;
            right: 90px;
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
            z-index: 9;

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
			width: 200px;
			height: 80px;
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
		
		div.chattingBoxContent{
			height: 300px;
			overflow-y: scroll; 
			overflow-x: hidden; 
		}
		
		/*채팅 배찌*/
		div.chattingIcon > div{
            position: absolute;
            background-color: #d25412;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            top: -5px;
            right: -5px;
            
        }
        div.chattingIcon > div span {
            font-weight: bold;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: #fff;
            font-size: 12px;
        }
/*================================= 채팅  css ===================================================================*/

		#loginColor.on {
			background: green;
		}
	</style>
	
<!--  ================================== 채팅 CDN =============================================================== -->

<!-- ================================== 채팅 CDN =============================================================== -->
 <script>
    
/*================================== 채팅 script ===============================================================*/

    	
    	
//채팅파트--------------------------------------------------------------
	    $(function() {
	    	//////////////////소켓 연결되는 구간
	    	
	        
	        
	        
							
		    });
	      ////////////////////////노드에서 데이터 받는 파트///////////////////////////
//채팅파트--------------------------------------------------------------
	    
	    
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
						var roomNo = data[i].roomNo;
						if(sessionUserId == data[i].master){
							var userName = data[i].enterUserName;
							var userId = data[i].enterUser;
						}else{
							var userName = data[i].masterName;
							var userId = data[i].master;
						}
						var view = "<li><a href='#'>"
                    				+"<div class='profileImage'>"
				                        +"<img src='/images/bonobono.jpg' alt=''>&emsp;"
				                    +"</div>"
				                    +"<div class='chattingInfo'>"
				                        +"<div class='chattingUser'>"
				                            +"<p>"+userName+"</p>"
				                            +"<p>오전 10:13</p>"
				                            +"<input type='hidden' id='chattingUserId' value='"+userId+"'>"
						                    +"<input type='hidden' id='roomNo' value='"+roomNo+"'>"
				                        +"</div>"
				                        "<div class='chattingContent'>"
				                            +"줄여서 테마"
				                        +"</div>"
				                    +"</div>"
				                +"</a></li>";
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
	    		$('#searchFriendListByName').empty();
	    		$.ajax({
	    			url : "/friend/rest/getFriendListByName",
	    			method : "POST",
	    			dataType : "json",
	    			data : JSON.stringify({
	    				name : friendName
	    			}),
	    			headers : {
	    				"Accept" : "application/json",
	    				"content-Type" : "application/json"
	    			},
					success : function(data){
						if(data.list.length == 0){
							var view = "<span style='color:#cb4414; font-size:1em; font-weight:bold'>"
										+"검색된 친구가 없어요!"
										+"</span>";
							$('#searchFriendListByName').append(view);
						}else{
							for(var i=0; i<data.list.length; i++){
								var name = data.list[i].name;
								var school = data.list[i].schoolName;
								var profile = data.list[i].profileName;
								var enterUserId = data.list[i].userId;
								var view = "<span style='color:#cb4414; font-size:1em; font-weight:bold'  id='startChattingButton'>"
												+"<img src='/images/"+profile+"' width='30' height='30' id='searchFriendByProfile' style='vertical-align: middle'/>&emsp;"+name+" &emsp;"+school+"&emsp; <i class='fas fa-comment-medical'></i>"
												+"<input type='hidden' id='searchByNameResultId' value='"+enterUserId+"'>"
												+"<input type='hidden' id='searchByNameResultName' value='"+name+"'>";
											+"</span><br>";	
								$('#searchFriendListByName').append(view);
							}
						}
					},
					error : function(){
						console.log('친구가 에러네 ㅋㅋ');
					}
	    		});
	    		
	    	});

/*================================== 채팅 script ===============================================================*/
        var sessionUserId = null;
        var sessionUserName = "${user.name}";
        
        var socket = null;
    	var chattingRoomNo = null;
    	var enterUserId = null;	//본인의 세션
    	var clickEnterUser = null; //소켓에서 불러온 입장자
    	var targetId = null;
    	var sender = null;
    	var receiver = null;
    	var chattingRoom = null;
    	
        $(function() {
  			
        	var newUser = "${sessionScope.user.userId}";
       		socket = io.connect("192.168.0.23:82");	//소켓연결 
       		console.log('node.js Server Connection...');
       		socket.emit("new",newUser);
	        $('div.chattingIcon a').on('click', function() {
	            $('div.chattingList').toggleClass('on');
	            $('div.chattingBox').css({
	            	"bottom": "110px",
	            	"right": "440px",
					"z-index": '9'
				});
	            if(!$('div.chattingList').hasClass('on')){
	            	 $('div.chattingBox').css({
	            		'bottom': '30px',
						'right': '160px',
						"z-index": '9'
	 				});
	            }
	        });
	        ///////////////////소켓 연결되는 구간
	        
	         ////////////////////////로그인 상태 판단(include라서 임시보관함)
	        
	        
	        
	         ////////////////////////로그인 상태 판단(include라서 임시보관함)
	         
	        
	        ////////////////////채팅 방 폭파//////////////////////////////////
	        $('#chattingSystemChangeButton').on('click', function(){
	        	Swal.fire({
	        		  title: '잠깐!!!!!!',
	        		  text: "채팅방이 폭파되면 복구가 불가능합니다!",
	        		  icon: 'warning',
	        		  showCancelButton: true,
	        		  confirmButtonColor: '#3085d6',
	        		  cancelButtonColor: '#d33',
	        		  cancelButtonText : '다시 생각하기',
	        		  confirmButtonText: '히히 폭파!!!'
	        		}).then((result) => {
	        		  if (result.value) {
	        		    Swal.fire(
	        		      '폭파되었습니다!',
	        		      '이제 채팅내용은 복구 할 수 없습니다.',
	        		      'success'
	        		    )
	        		  }
	        		})
	        });
	        
	        ////////////////////채팅 방 폭파//////////////////////////////////
       		
       		
       		///////////////////유저가 채팅창을 눌렀을 때
	        socket.on('userChatting', function(userChatting){
	        	var top = 	"<div class='userProfileImage'>"
			    				+"<img src='/images/bonobono.jpg' alt=''>"
			    			+"</div>"
			    			+"<div class='chattingUserName'>"
			       				 +"🎀주주장님🎀"
			    			+"</div>";
			    var friendView = "<div class='chatFromUser'>"
									+"<div class='chattingBoxProfileImage'>"
										+"<img src='/images/bonobono.jpg' alt=''>"
										+"</div>"
									+"<div class='chattingMessage'>"
										+"<div class='userInfo'>"
			    							+userChatting.sender
										+"</div>"
										+"<div class='message'>"
			    							+userChatting.msg
										+"</div>"
									+"</div>"
								+"</div>";
			   var myView = "<div class='chatFromMe'>"
									+"<div class='chattingMessage'>"
									+"<div class='message'>"
										+userChatting.msg
							    	+"</div>"
								+"</div>"
							+"</div>";
				
				var sessionId = "${sessionScope.user.userId}";
				if(clickEnterUser == sessionId){
					if(userChatting.sender == sessionId){	//본인의 채팅
						$('#ChattingAppend').before(myView);
					}else if(userChatting.receiver == sessionId){
						$('#ChattingAppend').before(friendView);
					}
				}
	        });
	        
	        socket.on('enterUser', function(enterUser){
				clickEnterUser = enterUser;
			});
       		///////////////////우저가 채팅창을 눌렀을때
	        
	        
	        
	        
	        $(document).on("click", 'div.chattingList li a', function(){
	        	$('div.chattingList li').css("backgroundColor", "#fff");
	        	if(! $('div.chattingBox').hasClass('on')){	//채팅방이 열려있지 않다면 즉, 최초실행
	        		$(this).parent().css("backgroundColor", "#ebad7a");	//바탕 색 변경
	        		$('div.chattingBox').toggleClass('on');	//채팅방 열기
	        		
	        		$('.chattingBoxContent').animate({
		        		'scrollTop': '10000000px'
		        	});
	        		
	        		chattingRoomNo = $(this).children().find('#roomNo').val();//열린 룸 넘버
	        		enterUserId = "${sessionScope.user.userId}";	//입장자
	        		targetId = $(this).children().find("#chattingUserId").val();	//피입장자
	        		socket.emit("enterUserId", enterUserId);
	        		socket.emit("targetId", targetId);
	        		socket.emit("chattingRoomNo", chattingRoomNo);
	        		//true
	        	}else{	//채팅방이 열려있다면
	        		var roomNo = $(this).children().find('#roomNo').val();
	        		if(chattingRoomNo == roomNo){	//기존에 열려있던 채팅방과 동일하다면
	        			$('div.chattingBox').removeClass('on');	//채팅방 닫아버리기
	        			$('.chatFromMe').remove();
						$('.chatFromUser').remove();
	        		}else{	//기존에 열려있던 채팅방이랑 다른 채팅방이면
	        			$('.chatFromMe').remove();
						$('.chatFromUser').remove();
	        			$(this).parent().css("backgroundColor", "#ebad7a");
	        			//새로운 채팅방 세팅
	        			chattingRoomNo = $(this).children().find("#roomNo").val();
						enterUserId = "${sessionScope.user.userId}";
						targetId = $(this).children().find('#chattingUserId').val();
						socket.emit("enterUserId", enterUserId);
						socket.emit("targetId", targetId);
						socket.emit("chattingRoomNo", chattingRoomNo);
						
						$('.chattingBoxContent').animate({
			        		'scrollTop': '10000000px'
			        	});
	        		}
	        	}
	        });
	        $(document).on("click","#outOfChattingByTimes",function(){	//x눌렀을때
	        	$('div.chattingBox').removeClass('on');
	        	$('div.chattingList li').css("backgroundColor", "#fff");
	         	$('.chatFromMe').remove();
				$('.chatFromUser').remove();
	        });
	        
	        $(document).on("click", "#startChattingButton", function(){	//채팅방 개설
	        	var enterUserId = $(this).parent().find('#searchByNameResultId').val();
	        	var enterUserName = $(this).parent().find('#searchByNameResultName').val();
	        	var masterId = "${sessionScope.user.userId}";
	    		$.ajax({
					 url : "/chatting/rest/addChattingRoom",
					 method : "POST",
					 dataType : 'json',
					 data : JSON.stringify({
						 master : masterId,
						 enterUser : enterUserId
					 }),
					 headers : {
		    				"Accept" : "application/json",
		    				"content-Type" : "application/json"
		    			},
		    			success : function(data){
		    				if(data == true){
		    					var view = "<li><a href='#'>"
                    				+"<div class='profileImage'>"
				                        +"<img src='/images/bonobono.jpg' alt=''>&emsp;"
				                    +"</div>"
				                    +"<div class='chattingInfo'>"
				                        +"<div class='chattingUser'>"
				                            +"<p>"+enterUserName+"</p>"
				                            +"<p>오전 10:13</p>"
				                            +"<input type='hidden' id='chattingUserId' value='"+masterId+"'>"
						                    +"<input type='hidden' id='roomNo' value='"+roomNo+"'>"
				                        +"</div>"
				                        "<div class='chattingContent'>"
				                            +"줄여서 테마"
				                        +"</div>"
				                    +"</div>"
				                +"</a></li>";
				       $('#forFriendListAppend').after(view);
		    				}
		    			},
		    			error : function(){
		    				console.log('에러당 ㅋㅋ')
		    			}
				  }); 
	    	});
			$(window).keydown(function(key){
				if(key.keyCode == 27){		//esc 눌렀을때
					$('div.chattingList').removeClass('on');
					$('div.chattingBox').removeClass('on');
					$('div.chattingList li').css("backgroundColor", "#fff");
					$('.chatFromMe').remove();
					$('.chatFromUser').remove();
				}
			});	        
	        $("#msg").keydown(function(key){
                //해당하는 키가 엔터키(13) 일떄
                if(key.keyCode == 13){
	               $('#msgProcess').click();
    	        }
            });
	        $('#msgProcess').on("click",function(){
	        	var msg = $('#msg').val();
	        	if(msg == "" || msg == null){	//채팅내용이 없으면 반응 x
	        	}else{
		        	$('#msg').val("");
		        	var senderId = "${sessionScope.user.userId}";
		        	var receiverId = targetId;
		        	var sendMsg = msg;
		        	socket.emit("sender", senderId);
		        	socket.emit("receiver", receiverId);
		        	socket.emit("msg", sendMsg);
		        	socket.emit("chattingRoom", chattingRoomNo);
		        	$('.chattingBoxContent').animate({
		        		'scrollTop': '10000000px'
		        	},1000);
	        	}
	        });
	        
	      ////////////////////////노드에서 데이터 받는 파트///////////////////////////  	
            socket.on('sender', function(senderId){
        		sender = senderId; 
	        });
	        socket.on('receiver', function(receiverId){
	        	receiver = receiverId;
	        });
	        socket.on('chattingRoomNo', function(room){
	        	chattingRoom = room
	        });
	        socket.on('msg', function(sendMsg){
	        	//////////////////////채팅 뷰///////////////////////////////////////
		        var top = 	"<div class='userProfileImage'>"
	            				+"<img src='/images/bonobono.jpg' alt=''>"
		        			+"</div>"
		        			+"<div class='chattingUserName'>"
		           				 +"🎀주주장님🎀"
		        			+"</div>";
		        var friendView = "<div class='chatFromUser'>"
	        						+"<div class='chattingBoxProfileImage'>"
	        							+"<img src='/images/bonobono.jpg' alt=''>"
	   								+"</div>"
	    							+"<div class='chattingMessage'>"
	        							+"<div class='userInfo'>"
	            							+sender
	        							+"</div>"
	        							+"<div class='message'>"
	            							+sendMsg
	        							+"</div>"
	    							+"</div>"
								+"</div>";
		       var myView = "<div class='chatFromMe'>"
	       						+"<div class='chattingMessage'>"
	    							+"<div class='message'>"
	        							+sendMsg
							    	+"</div>"
								+"</div>"
							+"</div>";
	        	//////////////////////채팅 뷰///////////////////////////////////////
							
	        	var sessionId = "${sessionScope.user.userId}";
	        	if(sender == sessionId){	//본인의 채팅
	        		$('#ChattingAppend').before(myView);
	        	}else if(receiver == sessionId){
	        		$('#ChattingAppend').before(friendView);
	        		$('.chattingBoxContent').animate({
		        		'scrollTop': '10000000px'
		        	});
	        	}
	        });
        	
        	
            //////로그인 유저 정보////////////////
	        socket.on('loginUserList', function(data){
	        	var loginUserList = [];
	        	for(var i=0; i<data.length; i++){
	        		loginUserList.push(data[i]);
	        	}
	            var countLi = $('div.friendList ul').find('input[id="hiddenUserId"]').length;
	            var friendList = [];
	            for(var i=0; i<countLi; i++){
					friendList.push($('div.friendList ul').find('input[id="hiddenUserId"]').eq(i).val());	//내친구목록
	            }
	            var loginFriendList = [];
	            for(var login=0; login<loginUserList.length; login++){
	            	for(var friend=0; friend<friendList.length; friend++){
	            		if(loginUserList[login] == friendList[friend]){
	            			loginFriendList.push(loginUserList[login]);	//로그인된 친구목록
	            		}
	            	}
	            }
	            console.log(loginFriendList);
	            
	            /* if(loginFriendList.length == 0){
	            	for(var i=0; i<countLi; i++){
	            		$('div.friendList ul li').find('span.' + friendList[i]).removeClass('on');
	            	}
	            } */
	            for(var i=0; i<friendList.length; i++){
	            	$('div.friendList ul li').find('span.' + friendList[i]).removeClass('on');
	            }
	            for(var i=0; i<loginFriendList.length; i++){
	            	for(var j=0; j<countLi; j++){
	            		if(loginFriendList[i] == $('div.friendList ul li').find('input[id="hiddenUserId"]').eq(j).val()){
	            			$('div.friendList ul li').find('span.' + loginFriendList[i]).addClass('on');
	            		}
	            	}
	            }
	        });
            
            //////로그인 유저 정보////////////////
            
            
            rightLoad();
            connectWS();
            notiIconLoad();
            
            
	        
	        
        });

        //	우측툴바 알림아이콘 load
        function notiIconLoad() {
        	sessionUserId = $('input#sessionUserId').val();
        	$.ajax({
        		url: "/social/rest/getNotiList",
                method: "POST",
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                data: JSON.stringify({
                }),
                success : function (d) {
					console.log("notiTotalCount", d.totalCount);
					
					if (d.totalCount != 0) {
						$(".notiBadge").html(d.totalCount +"개");
					}
				}
        	});
		}
        
        
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
                        var html = '<li>' +
                            '<a href="#" class="rightProfileName">' +
                            '<span><img src="/images/' + d.list[i].profileName + '" alt=""></span>' +
                            '<span>' + d.list[i].name + '</span>' +
                            '<span class="'+d.list[i].userId+'" id="loginColor"></span>' +
                            '</a>' +
                            '<input type="hidden" id="hiddenUserId" value="' + d.list[i].userId + '">' +
                            '</li>';
                        /*재이가 고침!!*/

                        $(html).appendTo("div.friendList ul");

                    }
                }
            })
        }


  //	우측툴바 프로필 이동 event 근덕이형꺼
        $(document).on("click", "div.friendList ul li a.rightProfileName", function() {	//팝업 레이어 누른 칸만 색깔 들어오기
            var targetUserId = $(this).next().val();
            $('.friendList ul li a').css('backgroundColor','#efefef');
            $(this).css('backgroundColor','#ebad7a');
        });
  		$(document).on("click", "#friendListPopUpTimes", function(){	//팝업 레이어 x 눌렀을때 색깔 다 빼기
  			$('.friendList ul li a').css('backgroundColor','#efefef');
  		});

 /////형진이가 수정중///////////////////////////////////////////       
        $(document).on("click", "div.friendList ul li a.rightProfileName", function(e) {
        	$('#searchFriendListByName').children().empty();
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
    			"position": "absolute",
    			"z-index": 9,
    			"overflow-x":"hidden",
				"overflow-y":"hidden"
    		}).show();
    		var friendName = $(this).parent().find('span').text();
    		var userId = $(this).parent().find('#hiddenUserId').val();
    		var view = "<span style='color:#cb4414; font-size:1em; font-weight:bold'>"+friendName+"</br>"
    						+"<input class='btn btn-secondary' style='background-color:#ebad7a; color:black; font-weight:bold' type='submit' value='프로필' id='goToProfile'> &nbsp;"
    						+"<input class='btn btn-secondary' style='background-color:#ebad7a; color:black; font-weight:bold' type='submit' value='채팅창' id='goToChatting'>"
    						+"<input type='hidden' class='userIdForProfile' value='"+userId+"'>" 
    					+"</span>";
    		$('#searchFriendListByName').append(view);
        });
 		$(document).on("click", "#goToProfile", function(){	//프로필 가기
 			$('.friendList ul li a').css('backgroundColor','#efefef');
 			var targetUserId = $(this).parent().find('.userIdForProfile').val();
 			$.redirect("/user/getProfile/" + targetUserId + "", {}, "GET");
 		});
 		$(document).on("click", '#goToChatting', function(){	//채팅창으로 가기
 			$('.friendList ul li a').css('backgroundColor','#efefef');
 			$('.popupLayer').hide();
 			$('div.chattingBox').removeClass('on');
 			$('div.chattingList li').css("backgroundColor", "#fff");
         	$('.chatFromMe').remove();
			$('.chatFromUser').remove();
			$('div.chattingList').removeClass('on');
			var sessionUserId = "${sessionScope.user.userId}";
			targetId = $(this).parent().find(".userIdForProfile").val();
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
					if(data.length == 0){															//해당 유저가 채팅방이 하나도 없을때
						$.ajax({
							 url : "/chatting/rest/addChattingRoom",
							 method : "POST",
							 dataType : 'json',
							 data : JSON.stringify({
								 master : sessionUserId,
								 enterUser : targetId
							 }),
							 headers : {
				    				"Accept" : "application/json",
				    				"content-Type" : "application/json"
				    			},
				    		success : function(data){
				    				if(data == true){ //만들어졌다면 룸너버 가져오기
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
				    							for(var i=0; i<data.length; i++){		
				    								//console.log(data[i]);											//확인완료--------------------------
				    								if((data[i].master == sessionUserId && data[i].enterUser == targetId) || (data[i].master == targetId && data[i].enterUser == sessionUserId)){
				    									console.log('일치하는 채팅방이 있다1');							//확인완료
				    									chattingRoomNo = data[i].roomNo;
				    									socket.emit("enterUserId", data[i].master);
				    									socket.emit("targetId", data[i].enterUser);
				    									socket.emit("chattingRoomNo", chattingRoomNo);
				    									//-----------------------------------------------------확인완료
				    									var view = "<li><a href='#'>"
						                    				+"<div class='profileImage'>"
										                        +"<img src='/images/bonobono.jpg' alt=''>&emsp;"
										                    +"</div>"
										                    +"<div class='chattingInfo'>"
										                        +"<div class='chattingUser'>"
										                            +"<p>"+data[i].enterUserName+"</p>"
										                            +"<p>오전 10:13</p>"
										                            +"<input type='hidden' id='chattingUserId' value='"+sessionUserId+"'>"
												                    +"<input type='hidden' id='roomNo' value='"+chattingRoomNo+"'>"
										                        +"</div>"
										                        "<div class='chattingContent'>"
										                            +"줄여서 테마"
										                        +"</div>"
										                    +"</div>"
										                +"</a></li>";
										      		 $('#forFriendListAppend').after(view);
				    									//----------------------------------------------------확인완료
				    									$('div.chattingBox').addClass('on');
				    									$('.chattingBoxContent').animate({
				    						        		'scrollTop': '10000000px'
				    						        	});
				    									$('div.chattingBox').css({
				    										'bottom': '30px',
				    										'right': '160px',
				    										"z-index": '9'
				    									});							
				    								}
				    							} //for end
				    							
				    						},
				    						error : function(){
				    							console.log('새로운 채팅방 갱신 실패 ㅋㅋ');
				    						}
				    					});
				    				}
				    			},
				    			error : function(){
				    				console.log('에러당 ㅋㅋ')
				    			}//listChattingRoom end
						  }); 						
					}			//유저의 채팅방이 하나도 없을때 if 종료
					for(var i=0; i<data.length; i++){				//-----------------유저의 채팅방 목록을 불러올 수 있을때
						console.log('난 채팅방이 여러개다');				//확인완료
						if((data[i].master == sessionUserId && data[i].enterUser == targetId) || (data[i].master == targetId && data[i].enterUser == sessionUserId)){	//이미 하고있는 채팅?
							console.log('기존에 채팅중이었던 유저다');
							chattingRoomNo = data[i].roomNo;
							socket.emit("enterUserId", data[i].master);
							socket.emit("targetId", data[i].enterUser);
							socket.emit("chattingRoomNo", chattingRoomNo);
							$('div.chattingBox').toggleClass('on');
							$('.chattingBoxContent').animate({
				        		'scrollTop': '10000000px'
				        	});
							$('div.chattingBox').css({
								'bottom': '30px',
								'right': '160px',
								"z-index": '9'
							});			//-------------------------------------------------------확인완료
							break;
						}else{			//--------------------------------------------------첫 채팅의 시작 여기로 엄청빠짐
							console.log('채팅 중이 아니었네!');		//------------------확인완료
							$.ajax({
								 url : "/chatting/rest/addChattingRoom",
								 method : "POST",
								 dataType : 'json',
								 data : JSON.stringify({
									 master : sessionUserId,
									 enterUser : targetId
								 }),
								 headers : {
					    				"Accept" : "application/json",
					    				"content-Type" : "application/json"
					    			},
					    		success : function(data){
					    				//console.log('채팅방 생성을 완료했다.')		--------------------확인완료
					    				if(data == true){ //만들어졌다면 룸너버 가져오기
					    					///console.log('진짜로 채팅방이 만들어졌다');	//-------------확인완료
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
					    							for(var i=0; i<data.length; i++){
					    								//console.log(data[i]);	///------------------------ 잘 가져옴 확인완료
					    								if((data[i].master == sessionUserId && data[i].enterUser == targetId) || (data[i].master == targetId && data[i].enterUser == sessionUserId)){
					    									//console.log('기존에 채팅중이었던 방이다.'); -----------------확인완료 (for문 제어 잘해주길)
					    									chattingRoomNo = data[i].roomNo;
					    									socket.emit("enterUserId", data[i].master);
					    									socket.emit("targetId", data[i].enterUser);
					    									socket.emit("chattingRoomNo", chattingRoomNo);
					    									
					    									var view = "<li><a href='#'>"
							                    				+"<div class='profileImage'>"
											                        +"<img src='/images/bonobono.jpg' alt=''>&emsp;"
											                    +"</div>"
											                    +"<div class='chattingInfo'>"
											                        +"<div class='chattingUser'>"
											                            +"<p>"+data[i].enterUserName+"</p>"
											                            +"<p>오전 10:13</p>"
											                            +"<input type='hidden' id='chattingUserId' value='"+sessionUserId+"'>"
													                    +"<input type='hidden' id='roomNo' value='"+chattingRoomNo+"'>"
											                        +"</div>"
											                        "<div class='chattingContent'>"
											                            +"줄여서 테마"
											                        +"</div>"
											                    +"</div>"
											                +"</a></li>";
											      		 $('#forFriendListAppend').after(view);
					    									
					    									$('div.chattingBox').addClass('on');
					    									$('.chattingBoxContent').animate({
					    						        		'scrollTop': '10000000px'
					    						        	});
					    									$('div.chattingBox').css({
					    										'bottom': '30px',
					    										'right': '160px',
					    										"z-index": '9'
					    									});	
					    									break;
					    								}
					    								console.log('for control');
					    							//break;             -----------------------존재의 이유 다시 생각
					    							} //for end
					    						},	//success 끝
					    						error : function(){
					    							console.log('새로운 채팅방 갱신 실패 ㅋㅋ');
					    						}
					    					});
					    				}	//채팅방이 잘 만들어졌다의 if end
					    			},  //getChattingRoomList end-----------
					    			error : function(){
					    				console.log('에러당 ㅋㅋ')
					    			}
							  });
							break;
						} 	//채팅방이 없는 유저가 아니라면 else end
					}		//유저 채팅방 목록 찾을 수 있게 해주는 for end
				},				//총괄 success 끝
				error : function(){
					alert('채팅방 찾기 에러');
				}
			});
			
 		});
 /////형진이가 수정중///////////////////////////////////////////       
		
        
        
        
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

                    //	socket push msg = (senderId,receiverId,senderName,notiOrigin,notiCode,postNo); 하나라도 빼먹으면 안됨.
                    //	해당하는 인자값 없으면 1이라도 넣어야함. CSV = ','임  ,앞뒤로 띄어쓰기 하면 안됨.
                    socketMsg = sessionUserId + "," + userId + "," + sessionUserName + "," + "4,4";
                    wsocket.send(socketMsg);
                    
                    addNoti(sessionUserId, userId, "4", "4");

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

        //	addNoti Function
        function addNoti(senderId, receiverId, notiOrigin, notiCode, postNo) {
            console.log(senderId, receiverId, notiOrigin, notiCode, postNo);
            $.ajax({
                url: "/social/rest/addNoti",
                method: "POST",
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                data: JSON.stringify({
                    senderId: senderId,
                    receiverId: receiverId,
                    notiOrigin: notiOrigin,
                    notiCode: notiCode,
                    postNo: postNo
                }),
                success: function() {
                }
            })
        }

        //////////////// WebSocket //////////////////
        var wsocket = null;

        function connectWS() {
            var ws = new WebSocket("ws://localhost:8080/replyEcho");
            wsocket = ws;

            ws.onopen = function() {
                console.log('Info: connection opened.');
            };

            ws.onmessage = function(event) {
                console.log("ReceiveMessage:", event.data + '\n');
                $(".toast-body").html(event.data);
                $(".toast").toast('show');
                
				$("#notiIcon").children("i").remove();
				var html = "<i class='fas fa-bell'></i>"
				$("#notiIcon").prepend(html);
				
                /* let $socketAlert = $("div#socketAlert");
                $socketAlert.html(event.data);
                $socketAlert.css("display", "block");
                
                
                setTimeout(function() {
					$socketAlert.css('display', 'none');
				},5000); */
            };

            ws.onclose = function(event) {
                console.log('Info: connection closed.');
                setTimeout(function() {
                    connectWS();
                }, 100); // retry connection!!
            };
            ws.onerror = function(err) {
                console.log('Error:', err);
            };
        }

    </script>


</head>
<body>

	<!-- ====================================== chattingHTML========================================================================== -->
	<div class="popupLayer" id="popupLayer" style="overflow-y:scroll; overflow-x:scroll ">
					<div>
						<span onClick="closeLayer(this)"
							style="cursor: pointer; font-size: 1.5em" title="닫기"><i class="fas fa-times" id="friendListPopUpTimes"></i>
						</span>
					</div>
					<span id="searchFriendListByName"></span>
				</div>
    <div class="chattingIcon"><a href="#"><i class="fas fa-comments"></i></a>
    
		<!-- ----------------이거 배찌임 -->
		<div><span>999</span></div>
		<!-- -------------이거 배찌임 -->
		
    </div>
	

    <div class="chattingList">
        <div class="chattingListTop">
            <div class="chattingListTopLeft">
                <a href="#" id="howManyChattingRoom"></a>
            </div>
            <div class="chattingListTopRight">
            
            
				
				
				<!-- <div class="ui-widget">
	 				<label for="tags"><i class="fas fa-search" id="findFriendByName"></i> </label>
	  				<input id="tags" style="width: 100px">
				</div> -->
			</div>
		</div>
		
        <ul id="forFriendListAppend">
        </ul>
    </div>


    <div class="chattingBox">
    
    
        <div class="chattingBoxTop">
            <a href="#">
            
 <!-- ---------------------------여기가 채팅창 상단--------------------------------------------------------- -->
                <div class="chattingBoxTopLeft">
                    <div class="userProfileImage">
                        <img src="/images/bonobono.jpg" alt="">
                    </div>
                    <div class="chattingUserName">
                        	🎀주주장님🎀
                    </div>
                </div>
 <!-- ---------------------------여기가 채팅창 상단--------------------------------------------------------- -->
 
                <div class="chattingBoxTopRight">
                    <a href="#"><i class="fas fa-bomb" id="chattingSystemChangeButton"></i></a>
                    <a href="#" id="outOfChattingByTimes"><i class="fas fa-times"></i></a>
                </div>
            </a>
        </div>
        
        
        <div class="chattingBoxContent">
 <!-- --------------------------여긴 채팅 날짜------------------------------------------------------------ -->       
            <div class="chatDate">
                <p>2020년 2월 17일 월요일</p>
            </div>
 <!-- --------------------------여긴 채팅 날짜------------------------------------------------------------ -->       
            
            
            <div id="ChattingAppend"></div>
            
            
            
        </div>
        <div class="chattingArea">
            <input type="text" id="msg">
            <button type="button" id="msgProcess">보낼래!</button>
        </div>
    </div>
	<!-- ====================================== chattingHTML========================================================================== -->
	
    <!--  여기서부터 챗봇  -->
    <div id="frogue-container" class="position-right-bottom" data-chatbot="4626e9e6-320e-4c99-afe8-c196f85db573" data-user="akxorb1234" data-init-key="value"></div>


    <script>
        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) {
                return;
            }
            js = d.createElement(s);
            js.id = id;
            js.src = "https:\/\/danbee.ai/js/plugins/frogue-embed/frogue-embed.min.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'frogue-embed'));

    </script>
    <!--   여기까지 ㅋㅋ  -->
    

    
    <div class="rightLayout">
        <input type="hidden" id="sessionUserId" name="sessionUserId" value="${user.userId}">

        <div id="socketAlert" class="alert alert-warning" role="alert" style="display : none;"></div>

        <div class="search2">

            <i class="fas fa-search"></i><input type="text" placeholder="어울림 검색">
            <select name="searchCondition">
                <!--<option value="0" ${search.searchCondition==0 ? "selected" : "" }>아이디</option>
<option value="1" ${search.searchCondition==1 ? "selected" : "" }>이름</option>
<option value="2" ${search.searchCondition==2 ? "selected" : "" }>학교명</option>-->
                <option value="0">아이디</option>
                <option value="1">이름</option>
                <option value="2">학교명</option>
            </select>
        </div>
        <div class="friendList">
            <ul>
                <li>친구 목록<a href="#"><i class="fas fa-user-plus"></i></a></li>

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

    <div class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-delay="5000" style="position: absolute; top: 0; right : 0; z-index:2;">
        <div class="toast-header">
            <img src="/images/rj.gif" class="rounded mr-2" alt="..." style="width:40px; height:20px;">
            <strong class="mr-auto">알림</strong>
            <small>방금</small>
            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="toast-body"></div>
    </div>

</body>

</html>
