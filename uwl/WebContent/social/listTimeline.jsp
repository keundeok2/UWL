<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript">
	var postNo = null;
	
	
	$(document).on("click", "button#addTimeline", function() {
		$("form#addTimelineForm")
		.attr("method", "post")
		.attr("action", "/social/addTimeline")
		.submit();
	})
	
	$(document).on("click", ".commentBtn", function() {
		postNo = $(this).val();
		console.log("postNo", postNo);
		
		$.ajax({
			url : "/social/rest/getCommentList",
			method : "POST",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({searchCondition : "1", userId : "", postNo : postNo}),
			success : function(d) {
				$(".addDiv").remove();
				
				var html = "<div class='addDiv'>";
				if (d.list.length != 0) {
					
					for (var i = 0; i < d.list.length; i++) {
						html += "<p>"+d.list[i].userId+" &nbsp; "+d.list[i].commentContent+"</p><hr/>";
					}
					
					html += "<textarea class='form-control commentText' name='commentContent' rows='1' placeholder='댓글을 입력하세요'></textarea>"
								+"<button class='btn' id='regBtn'>등록</button></div>";
				} else {
					html += "<textarea class='form-control commentText' name='commentContent' rows='1' placeholder='댓글을 입력하세요'></textarea>"
						+"<button class='btn' id='regBtn'>등록</button></div>";
				}
							
				$("div."+postNo).append(html);
			}
		})
	});
	
	$(document).on("click", "#regBtn", function() {
		var content = $(this).prev().val();
		console.log("content", content);
		
		$.ajax({
			url : "/community/rest/addComment",
			method : "POST",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({commentContent : content, userId : "", postNo : postNo}),
			success : function(d) {
				console.log("d", d);
			}
		})
	})
		
</script>

<style type="text/css">

body {
	margin : 50px;
}


</style>
<title>어울림</title>
</head>
<body>
	<div class="container">
		<c:if test="${search.searchCondition eq 1 }">
		<div class="col-md-6">
			<form id="addTimelineForm">
				<div class="input-group">
					<textarea class="form-control" name="postContent" style="height:150px" placeholder="게시글을 등록하세요"></textarea>
				</div>
				<input type="hidden" name="userId" value="${user.userId}">
		           	<select class="custom-select" name="viewStatus">
		              <option value="1" selected="selected">전체공개</option>
		              <option value="2">나만보기</option>
		            </select>
				<button class="btn btn-primary btn-rt" id="addTimeline">등록</button>
			</form>
		</div>
		</c:if>
		
		<div class="col-md-6">
		<p>${map.totalCount}개</p>
		<c:forEach var="post" items="${map.list}">
			<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-4 flex-column position-static" id="${post.postNo}">
					<div class="mb-1 text-muted">${post.postDate}</div>
					<strong class="d-inline-block mb-2 text-primary">${post.userId}</strong>
					<p class="mb-0">${post.postContent}</p>
					<input type="hidden" value="${post.postNo}">
					<hr/>
					<button class="btn btn-primary btn-sm">좋아요</button>
					<button class="btn btn-primary btn-sm commentBtn" value="${post.postNo}">댓글</button>
					<div class="${post.postNo}"></div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
	
</body>
</html>