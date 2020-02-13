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
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<!-- jQuery Redirect CDN     https://github.com/mgalante/jquery.redirect  -->
	<script
		src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
	<!-- Modal Alert https://github.com/PureOpenSource/pureAlert  -->
	<script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
    
    
    
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
					$("div.user").after(html);
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
						$("div.sendFlower").remove();
						$("div.useSpear").remove();
						var html = "<div class='addFriend'><a href='#'>친구신청</a></div>"
						$("div.user").after(html);
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
							+"<div class='sendFlower'><a href=''#' class='addMatching' data-toggle='modal' data-target='#exampleModal'>꽃보내기</a></div>"
							+"<div class='useSpear'><a href='#'>찔러보기</a></div>";
					$("div.user").after(html);
				}
			});
		})
		
		//프로필수정 Btn Event
		$(document).on("click", "div.profileUpdate", function() {
			$.redirect("/userr/updateProfileView", {userId : sessionUserId});
		})
		
		
		


		
		
		
		
		
		
		
		$(function() {
			$(document).on('click', '.addMatching', function() {
			 
                alert('클릭ㅋㅋ');
                
                alert('userId : ' + sessionUserId);
                alert('secondUserId : ' + targetUserId);
                $.ajax({
                    url: '/matching/rest/addMatching2/' + sessionUserId + '/' + targetUserId,
                    method: 'GET',
                    dataType: 'json',
                    data: JSON.stringify({
                    	userId: sessionUserId,
                    	secondUserId: targetUserId
                    }),
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    success: function(data) {
                        alert('성공ㅋㅋ');
                        
                        var secondUserId2 = data.secondUserId;
                        alert('secondUserId2 : ' + secondUserId2);
                        var displayValue = '';
                        if(targetUserId == secondUserId2) {
                            
						    displayValue = '<form action="">'
						        + ' <h3>꽃 보내는거 확인</h3>'
						         + ' <input type="text" name="userId" value="' + sessionUserId + '">'
						         + ' <input type="text" name="secondUserId" value="' + targetUserId + '"><br><br>'
						         + ' <input type="text" name="secondUserId" value="' + targetUserId + '">님에게 꽃을 보내시겠습니까? 30일 후 취소가 가능합니다.<br>'
						         + ' <a href="#" class="check">확인</a>'
						     + ' </form>';
                            alert(displayValue);
                        } else {
                        	displayValue = '<form action="">'
                        	       + ' <h3>꽃 보내기 취소 확인</h3>'
                        	        + ' <input type="text" name="userId" value="' + sessionUserId + '">'
                        	        + ' <input type="text" name="secondUserId"value="' + secondUserId2 + '"><br><br>'
                        	        + ' <input type="text" name="secondUserId" value="' + secondUserId2 + '">님에게 보낸 꽃을 취소하시겠습니까?<br>'
                        	        + ' <a href="#" class="check2">확인</a>'
                        	    + ' </form>';
                            alert(displayValue);
                        }
                        $('div.modal-body').html(displayValue);
                    },
                    error: function(request, status, error) {
                        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            }); 
			
			
			
			
			
			$('#myModal').on('shown.bs.modal', function() {
                $('#myInput').trigger('focus');
            });
			
			
			
			
			
			$(document).on('click', '.check', function() {
                alert('클릭ㅋㅋ');
                
                alert('userId : ' + sessionUserId);
                alert('secondUserId : ' + targetUserId);
                $.ajax({
                    url: '/matching/rest/addMatching3/' + sessionUserId + '/' + targetUserId,
                    method: 'GET',
                    dataType: 'json',
                    data: JSON.stringify({
                        userId: sessionUserId,
                        secondUserId: targetUserId
                    }),
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    success: function(data) {
                        alert('성공ㅋㅋ');
                        var displayValue = '<h3>꽃 보냄</h3>'
    + '꽃을 보냈습니다.';
                        
                        $('div.modal-body').html(displayValue);
                        $('div.totalFlower span').text(data);
                        alert($('div.totalFlower span').text());
                        $('.addMatching').text('꽃보내기취소');
                        $('.addMatching').removeClass('addMatching').addClass('deleteMatching');
                    },
                    error: function(request, status, error) {
                        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });
			
			
			
			
			
			$(document).on('click', '.deleteMatching', function() {
			
                alert('클릭ㅋㅋ');
                
                alert('userId : ' + sessionUserId);
                alert('secondUserId : ' + targetUserId);
                $.ajax({
                    url: '/matching/rest/deleteMatching/' + sessionUserId + '/' + targetUserId,
                    method: 'GET',
                    dataType: 'json',
                    data: JSON.stringify({
                        userId: sessionUserId,
                        secondUserId: targetUserId
                    }),
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    success: function(data) {
                        alert('성공ㅋㅋ');
                        var displayValue = '<form action="">'
       + '<h3>꽃 보내기 취소 확인</h3>'
        + '<input type="text" name="userId" value="' + sessionUserId + '">'
        + '<input type="text" name="secondUserId"value="' + targetUserId + '"><br><br>'
        + '<input type="text" name="secondUserId" value="' + targetUserId + '">님에게 보낸 꽃을 취소하시겠습니까?<br>'
        + '<a href="#" class="check2">확인</a>'
    + '</form>';
                        $('div.modal-body').html(displayValue);
                    },
                    error: function(request, status, error) {
                        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });
			
			
			
			$(document).on('click', '.check2', function() {
                alert('클릭ㅋㅋ');
                
                alert('userId : ' + sessionUserId);
                alert('secondUserId : ' + targetUserId);
                $.ajax({
                    url: '/matching/rest/deleteMatching2/' + sessionUserId + '/' + targetUserId,
                    method: 'GET',
                    dataType: 'json',
                    data: JSON.stringify({
                        userId: sessionUserId,
                        secondUserId: targetUserId
                    }),
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    success: function(data) {
                        alert('성공ㅋㅋ');
                        var displayValue = '';
                        alert('data.result : ' + data.result);
                        if(data.result == false) {
                            displayValue = '<h3>꽃 보내고 30일 안 지남</h3>'
    + '꽃 보내기 30일 후 취소가 가능합니다.';
                            
                            
                            
                        } else {
                            displayValue = '<h3>꽃 보내기 취소함</h3>'
    + '보낸 꽃을 취소했습니다.';
                            
                            
                            
                            
                            
                            var totalMatching = data.totalMatching;
                            alert('totalMatching : ' + totalMatching);
                            $('div.totalFlower span').text(totalMatching);
                            $('.deleteMatching').text('꽃보내기');
                            $('.deleteMatching').removeClass('deleteMatching').addClass('addMatching');
                            
                        }
                        
                        $('div.modal-body').html(displayValue);
                        
                        
                    },
                    error: function(request, status, error) {
                        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });
			
			
			
			
			
			$(document).on('click', 'div.useSpear a', function() {
                
	            
                alert('클릭ㅋㅋ');
                
                alert('userId : ' + sessionUserId);
                alert('secondUserId : ' + targetUserId);
                $.ajax({
                    url: '/matching/rest/updateItem/' + sessionUserId + '/' + targetUserId,
                    method: 'GET',
                    dataType: 'json',
                    data: JSON.stringify({
                        userId: sessionUserId,
                        secondUserId: targetUserId
                    }),
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    success: function(data) {
                        alert('성공ㅋㅋ');
                        var displayValue = '';
                        if(data.result == true) {
                            displayValue = '<form action="">'
       + '<h3>창 사용 확인</h3>'
        + '<input type="text" name="userId" value="' + sessionUserId + '">'
        + '<input type="text" name="secondUserId" value="' + targetUserId + '"><br><br>'
        + '<input type="text" name="secondUserId" value="' + targetUserId + '">님에게 창을 사용하시겠습니까?<br>'
        + '<a href="#" class="check3">확인</a>'
    + '</form>';
                        } else {
                            displayValue = '<h3>창 없음</h3>'
    + '창이 없습니다.';
                        }
                        
                        
                        $('div.modal-body').html(displayValue);
                    },
                    error: function(request, status, error) {
                        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });
			
			
			
			
			$(document).on('click', 'a.check3', function() {
                
	            
                alert('클릭ㅋㅋ');
                
                alert('userId : ' + sessionUserId);
                alert('secondUserId : ' + targetUserId);
                $.ajax({
                    url: '/matching/rest/updateItem3/' + sessionUserId + '/' + targetUserId,
                    method: 'GET',
                    dataType: 'json',
                    data: JSON.stringify({
                        userId: sessionUserId,
                        secondUserId: targetUserId
                    }),
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    success: function(data) {
                        alert('성공ㅋㅋ');
                        var displayValue = '';
                        alert('data.useResult : ' + data.useResult);
                         if(data.useResult == '1') {
                            displayValue = '<form action="">'
       + '<h3>창 사용 결과 : 꽃 보냄</h3>'
        + '<input type="text" name="userId" value="' + sessionUserId + '">'
        + '<input type="text" name="secondUserId" value="' + targetUserId + '"><br><br>'
        + '<input type="text" name="secondUserId" value="' + targetUserId + '">님이 꽃을 보냈습니다.'
    + '</form>';
                        } else if(data.useResult == '2') {
                            displayValue = '<form action="">'
       + '<h3>창 사용 결과 : 꽃 안 보냄</h3>'
        + '<input type="text" name="userId" value="' + sessionUserId + '">'
        + '<input type="text" name="secondUserId" value="' + targetUserId + '"><br><br>'
        + '<input type="text" name="secondUserId" value="' + targetUserId + '">님이 꽃을 보내지 않았습니다.'
    + '</form>';
                        } else {
                            displayValue = '<form action="">'
       + '<h3>창 사용 결과 : 방패 씀</h3>'
        + '<input type="text" name="userId" value="' + sessionUserId + '">'
        + '<input type="text" name="secondUserId" value="' + targetUserId + '"><br><br>'
        + '방패가 자동 사용되었습니다.'
    + '</form>'; 
                        }
                        
                        
                        $('div.modal-body').html(displayValue);
                    },
                    error: function(request, status, error) {
                        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		});
		
		
		
	
	</script>
	
	    
    <title>어울림</title>
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
		
		input,
		i,
		img {
		    vertical-align: middle;
		}
		
		input:focus {
		    outline: none;
		}
		
		body {
		    color: #333;
		    font-size: 15px;
		    font-family: 'Roboto', sans-serif;
		    font-family: 'Nanum Gothic', sans-serif;
		}
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
            position: relative;
        }
        div.profileImage a img {
            height: 100%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
        }
        div.profile {
            
            width: 65%;
            float: right;
        }
        
        div.user {
            
            font-size: 26px;
            display: inline-block;
            vertical-align: middle;
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









<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>









    <div class="wrap">	
        <div class="profileHeader">
            <div class="profileImage">
                <a href="#">
	                <c:if test="${empty user.profileName}">
	                	
	                	<img src="/images/bonobono.jpg" alt="">
	                </c:if>
	                <c:if test="${!empty user.profileName}">
	                	<img src="/images/${user.profileName}" width="100px" alt="">
	                </c:if>
                	
                </a>
            </div>
            <div class="profile">
                <div class="userId">
                    <div class="user">${targetUser.userId}</div>
                    <%-- ${checkFriend1.friendStatus} ${checkFriend2.friendStatus} --%>
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
	                    <c:if test="${checkFriend1.friendStatus == 2 }">
	                    
	                    
	                    
	                    
	                    
	                    
	                    
	                    
	                    <!-- <div class="sendFlower"><a href="#">꽃보내기</a></div> -->
	                    
	                    
	                    
	                    <c:if test="${matching.secondUserId ne targetUserId}">
	                    
	        	<div class="sendFlower"><a href="#" class="addMatching" data-toggle="modal" data-target="#exampleModal">
	        		꽃보내기
	        	</a></div>
	        </c:if>
	        
	        <c:if test="${matching.secondUserId eq targetUserId}">
                <div class="sendFlower"><a href="#" class="deleteMatching" data-toggle="modal" data-target="#exampleModal">
                    꽃보내기취소
                </a></div>
            </c:if>
	                    
	                    
	                    
	                    
	                    
	                    <div class="useSpear"><a href="#" data-toggle="modal" data-target="#exampleModal">찔러보기</a></div>
	                    </c:if>
                    </c:if>
                </div>
                <div class="post">
                    <div class="totalFlower">
                    	<!-- /////////////// totalFlower 추가바람/////////////// -->
                        <img src="/images/love-and-romance.png" width="30px" alt=""> <span>${totalMatching }</span>
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
</html>