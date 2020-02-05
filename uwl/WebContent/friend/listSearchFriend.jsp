<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>어울림</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!--  jQuery CDN -->	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- bootstrap 4.4 CDN -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" >	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<!-- jQuery Redirect CDN     https://github.com/mgalante/jquery.redirect  -->
	<script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
	<!-- Modal Alert https://github.com/PureOpenSource/pureAlert  -->
	<script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
	
	<script type="text/javascript">
	
	$(function() {
		var sessionId = $("input#sessionId").val();
		console.log("sessionId", sessionId);
		
		$("span#userId").on("click", function() {
			var userId = $(this).html();
			self.location = "/user/getProfile/"+userId;
		})
		
		$("img#profileName").on("click", function() {
			var userId = $(this).next().html();
			self.location = "/user/getProfile/"+userId;
		})
		
		
	})
	
	$(document).on("click","#applyBtn", function() {
		var sessionId = $("input#sessionId").val();
		console.log("sessionId", sessionId);
		var userId = $(this).next().val();
		console.log("userId", userId);
		
		$.ajax({
			url : "/friend/json/requestFriend",
			method : "POST",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				firstUserId : sessionId,
				secondUserId : userId
			}),
			success : function() {
				var html = "<button type='button' class='btn btn-secondary "+userId+"' id='cancelBtn'>신청취소</button>"
				+"<input type='hidden' value='"+userId+"'>";
				$("."+userId+"").remove();
				$(html).appendTo("#"+userId+"");
			}
	})
	})
	
	$(document).on("click", "#cancelBtn", function() {
		var sessionId = $("input#sessionId").val();
		console.log("sessionId", sessionId);
		var userId = $(this).next().val();
		console.log("userId", userId);
		$.ajax({
			url : "/friend/json/deleteFriend",
			method : "post",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				firstUserId : sessionId,
				secondUserId : userId
			}),
			success : function() {
				var html = "<button type='button' class='btn btn-primary "+userId+"' id='applyBtn'>친구신청</button>"
				+"<input type='hidden' value='"+userId+"'>"
				$("."+userId+"").remove();
				$(html).appendTo("#"+userId+"");
			}
		})
	})
	
	</script>
	
	<style type="text/css">
	
	body {
		margin-top: 100px;
	}
	
	</style>
</head>
<body>
	<jsp:include page="/friend/friendToolbar.jsp"></jsp:include>
	<div class="container">
		<input type="hidden" name="sessionId" id="sessionId" value="${user.userId}">
		<div class="page-header text-info">
			<h3>검색 목록</h3>	
		</div>
		<div class="row">
			<c:forEach var="friendUser" items="${map.list}">
		<div class="col-sm-12">
			<div id="${friendUser.userId}">
				<img src="../../images/${friendUser.profileName}" id="profileName"/>&nbsp; 
				<span id="userId">${friendUser.userId}</span> &nbsp; 
				<span id="name">${friendUser.name}</span> &nbsp; 
				<span>${friendUser.schoolName}</span> &nbsp;
				 <button type="button" class="btn btn-primary ${friendUser.userId}" id="applyBtn">친구신청</button>
				 <input type="hidden" value="${friendUser.userId}"/>
			</div>
		</div>
			</c:forEach>
			<c:if test="${empty map.list}">
			검색된 회원이 없습니다.
			</c:if>
		</div>
		
	</div>
	
</body>
</html>