<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!--  jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- bootstrap 4.4 CDN -->
	<link
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		rel="stylesheet">
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<!-- jQuery Redirect CDN     https://github.com/mgalante/jquery.redirect  -->
	<script
		src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
	<!-- Modal Alert https://github.com/PureOpenSource/pureAlert  -->
	<script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
    
    <link rel="stylesheet" href="/css/jaeiCommon.css">
    
	<script type="text/javascript">
		var sessionUserId = "${user.userId}";
		var targetUserId = "${targetUserId}";
		
		/* pureAlert confirm 주석풀지마셈 
		var pureAlert = $.pureAlert.confirm({
			title : "알림",
			content : "친구를 끊으시겠습니까?",
			okBtn : "삭제",
			cancelBtn : "취소",
			autoShow : true,
			closeButton : false
		});
		pureAlert.on('ok.pure-alert', function(e) {}) 
		*/
		
		
		//	친구신청 Btn Event
		$(document).on("click", "div.addFriend", function() {
			
			$.ajax({
				url : "/friend/rest/requestFriend",
				method : "POST",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				dataType : "json",
				data : JSON.stringify({
					firstUserId : sessionUserId,
					secondUserId : targetUserId
				}),
				success : function() {
					var html = "<div class='deleteFriend'><a href='#'>친구신청취소</a></div>"
					$("div.sendFlower").before(html);
					$("div.addFriend").remove();
				}
			});
		});
		
		// 친구신청취소, 친구끊기 Btn Event
		$(document).on("click", "div.deleteFriend", function() {
			var text = $(this).children("a").text();
			
			var pureAlert = $.pureAlert.confirm({
				title : "알림",
				content : text + "를 하시겠습니까?",
				okBtn : "확인",
				cancelBtn : "취소",
				autoShow : true,
				closeButton : false
			});
			pureAlert.on('ok.pure-alert', function(e) {
				
				$.ajax({
					url : "/friend/rest/deleteFriend",
					method : "POST",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					dataType : "json",
					data : JSON.stringify({
						firstUserId : sessionUserId,
						secondUserId : targetUserId
					}),
					success : function() {
						$("div.deleteFriend").remove();
						var html = "<div class='addFriend'><a href='#'>친구신청</a></div>"
						$("div.sendFlower").before(html);
					}
				});
			}) 
		})
		
		// 친구신청(수락) div.acceptFriend Btn Event
		$(document).on("click", "div.acceptFriend", function() {
			console.log("click");
			
			$.ajax({
				url : "/friend/rest/acceptFriend",
				method : "POST",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				dataType : "json",
				data : JSON.stringify({
					firstUserId : sessionUserId,
					secondUserId : targetUserId
				}),
				success : function() {
					$("div.acceptFriend").remove();
					var html = "<div class='deleteFriend'><a href='#'>친구끊기</a></div>"
					$("div.sendFlower").before(html);
				}
			});
		})
		
		//프로필수정 Btn Event
		$(document).on("click", "div.profileUpdate", function() {
			$.redirect("/userr/updateProfileView", {userId : sessionUserId});
		})
		
		
	
	</script>
	
	    
    <title>어울림</title>
    <style>
        body {
            background-color: rgb(250, 250, 250);
        }
        div.wrap {
            width: 900px;
            margin: 0 auto;
        }
        div.profileHeader {
            
            width: 100%;
            overflow: hidden;
            padding: 50px 0;
        }
        div.profileImage {
            
            width: 35%;
            text-align: center;
            float: left;
        }
        div.profileImage a {
            
            display: inline-block;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            overflow: hidden;
        }
        div.profileImage a img {
            width: 100%;
        }
        div.profile {
            
            width: 65%;
            float: right;
        }
        
        div.user {
            
            font-size: 26px;
            display: inline-block;
            vertical-align: bottom;
            margin-right: 10px;
        }
        div.profileUpdate,
        div.addFriend,
        div.deleteFriend,
        div.acceptFriend,
        div.sendFlower,
        div.useSpear {
            
            display: inline-block;
        }
        div.profileUpdate a,
        div.addFriend a,
        div.deleteFriend a,
        div.acceptFriend a,
        div.sendFlower a,
        div.useSpear a {
            
            line-height: 27px;
            display: inline-block;
            padding: 0 10px;
            border: 1px solid #c6c6c6;
            border-radius: 5px;
            font-weight: bold;
            vertical-align: middle;
            margin-right: 5px;
            font-size: 14px;
        }
        div.setting {
            
            display: inline-block;
            
        }
        div.setting a {
            
            font-size: 25px;
            display: inline-block;
            line-height: 30px;
            vertical-align: middle;
            padding: 0 3px;
        }
        div.setting a i {
            vertical-align: 0;
        }
        div.post {
            
            margin-top: 15px;
            font-size: 14px;
        }
        div.totalFlower {
            
            display: inline-block;
            margin-right: 35px;
        }
        div.totalFlower span {
            font-weight: bold;
        }
        div.activityPoint{
            
            display: inline-block;
            margin-right: 35px;
        }
        div.point{
            
            display: inline-block;
            margin-right: 35px;
        }       
        div.activityPoint span {
            font-weight: bold;
        }
        div.point span {
            font-weight: bold;
        }
        
        div.totalItem {
            
            display: inline-block;
            margin-right: 35px;
        }
        div.totalItem span {
            font-weight: bold;
        }
        div.totalItem2 {
            
            display: inline-block;
        }
        div.totalItem2 span {
            font-weight: bold;
        }
        div.name {
            
            margin-top: 15px;
            line-height: 1.5;
        }
        div.userName {
            
            font-weight: bold;
            font-size: 16px;
        }
        
        div.introduction a {
            color: rgb(0, 53, 105);
            font-weight: bold;
        }
        
        div.innerSection {
            
            border-top: 1px solid #dddddd;
            
        }
        div.section ul {
            
            width: 55%;
            margin: 0 auto;
            
            
            
        }
        div.section ul li {
            
            float: left;
            width: 25%;
            text-align: center;
            line-height: 50px;
            font-size: 12px;
            color: #898989;
            font-weight: bold;
        }
        div.section ul li.on {
            color: #333;
        }
        div.section ul li a {
            
            display: block;
            position: relative;
            
        }
        div.section ul li a:after {
            content: '';
            width: 45%;
            height: 1px;
            background-color: #333;
            
            position: absolute;
            top: -1px;
            left: 50%;
            transform: translateX(-50%);
            display: none;
            
        }
        div.section ul li.on a:after {
            display: block;
        }
        div.section ul li a i {
            
            margin-right: 3px;
        }
        section > div.list1 {
            background-color: lightblue;
        }
        section > div.list2 {
            background-color: lightcoral;
        }
        section > div.list3 {
            background-color: lightcyan;
        }
        section > div.list4 {
            background-color: lightgray;
        }
        section > div {
            display: none;
            height: 300px;
        }
        section > div.on {
            display: block;
        }
        section {
            clear: both;
        }
    </style>
    
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <script>
        $(function() {
            $('div.section ul li a').on('click', function() {
                
                var i = $(this).parent().index();
                $('div.section ul li').removeClass('on');
                $('div.section ul li').eq(i).addClass('on');
                $('section > div').removeClass('on');
                $('section > div').eq(i).addClass('on');
                
            });
        });
    </script>
</head>

<body>
    <div class="wrap">	
        <div class="profileHeader">
            <div class="profileImage">
                <a href="#"><img src="/images/${user.profileName}" width="100px" alt=""></a>
            </div>
            <div class="profile">
                <div class="userId">
                    <div class="user">${targetUser.userId}</div>
                    ${checkFriend1.friendStatus} ${checkFriend2.friendStatus}
                    <c:if test="${user.userId eq targetUserId }">
                    <div class="profileUpdate"><a href="#">프로필 편집</a></div>
                    <div class="setting"><a href="#"><i class="fas fa-cog"></i></a></div>
                    </c:if>
                    <c:if test="${user.userId ne targetUserId }">
                    	<c:if test="${checkFriend1.friendStatus == 2 }">
                    	<!-- 친구끊기/친구신청취소, 친구신청(수락) div 추가했음 -->
                    	<div class="deleteFriend"><a href="#">친구끊기</a></div>
                    	</c:if>
                   		<c:if test="${checkFriend1.friendStatus == 1 }">
	                    <div class="deleteFriend"><a href="#">친구신청취소</a></div>
	                    </c:if>
	                    <c:if test="${checkFriend2.friendStatus == 1 }">
	                    <div class="acceptFriend"><a href="#">친구신청</a></div>
	                    </c:if>
	                    <c:if test="${empty checkFriend1.friendStatus and empty checkFriend2.friendStatus}">
	                    <div class="addFriend"><a href="#">친구신청</a></div>
	                    </c:if>
	                    
	                    <!--////////////////// 매칭여부 / 꽃보냈는지 여부 추가바람/////////////////////////// -->
	                    <div class="sendFlower"><a href="#">꽃보내기</a></div>
	                    <div class="useSpear"><a href="#">찔러보기</a></div>
                    </c:if>
                </div>
                <div class="post">
                    <div class="totalFlower">
                    	<!-- /////////////// totalFlower 추가바람/////////////// -->
                        <img src="/images/love-and-romance.png" width="30px" alt=""> <span>37</span>
                    </div>
                    	<!-- /////////////// 활동점수, 포인트 추가바람/////////////// -->
                    <div class="activityPoint"> 활동점수 <span>170</span>
                    </div>
                    <c:if test="${targetUserId eq user.userId }">
                    <!-- point div 추가했음 -->
                    <div class="point"> 포인트 <span>170</span>
                    </div>
                    
                    <div class="totalItem">
                        <img src="/images/spear.png" width="30px" alt=""> <span>${totalSpear }</span>
                    </div>
                    <div class="totalItem2">
                        <img src="/images/shield.png" width="30px" alt=""> <span>${totalShield }</span>
                    </div>
                    </c:if>
                </div>
                <div class="name">
                    <div class="userName">
                    	${targetUser.name}
                    </div>
                    <div class="introduction">
                        ${targetUser.selfIntroduction }<br>
                    </div>
                </div>
            </div>
        </div>
        <div class="section">
            <div class="innerSection">
                <ul>
                    <li class="on"><a href="#"><i class="fas fa-th"></i> 타임라인</a></li>
                    <li><a href="#"><i class="fas fa-tv"></i> ASK</a></li>
                    <li><a href="#"><i class="far fa-bookmark"></i> 커플타임라인</a></li>
                    <li><a href="#"><i class="fas fa-user-tag"></i> 커플캘린더</a></li>
                </ul>
            </div>
            <section>
                <div class="list1 on">
                    게시물ㅋㅋ
                </div>
                <div class="list2">
                    IGTVㅋㅋ
                </div>
                <div class="list3">
                    저장됨ㅋㅋ
                </div>
                <div class="list4">
                    태그됨ㅋㅋ
                </div>
            </section>
        </div>
    </div>
</body>
