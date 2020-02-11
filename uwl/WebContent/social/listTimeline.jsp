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
<!-- Font Awesome CDN -->
<script src="https://kit.fontawesome.com/376450b3c6.js" crossorigin="anonymous"></script>
<script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
<script type="text/javascript">
	var postNo = null;
	
	
	$(document).on("click", "button#addTimeline", function() {
		var timelinePostContent =$(".timelinePostContent").val();
		console.log("timelinePostContent", timelinePostContent);
		
		if (timelinePostContent.length < 1 || timelinePostContent == null) {
			alert('내용을 입력하세요').
			return;
		}
		
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
				$(".addCommentDiv").remove();
				
				var html = "<div class='addCommentDiv'>";
				if (d.list.length != 0) {
					
					for (var i = 0; i < d.list.length; i++) {
						html += "<i class='fas fa-times deleteCommentBtn'></i>" 
							+"<hr/><p>"+d.list[i].userId+" &nbsp; "+d.list[i].commentContent+"</p>"
							+"<input type='hidden' value='"+d.list[i].commentNo+"'>";
					}
					
					html += "<input type='text' class='form-control regCommentText' name='commentContent' placeholder='댓글을 입력하세요'>";
				} else {
					html += "<input type='text' class='form-control regCommentText' name='commentContent' placeholder='댓글을 입력하세요'>";
				}
							
				$("li."+postNo).append(html);
			}
		})
	});
	
	$(document).on("keypress", ".regCommentText", function(e) {
		var content = $(this).val();
		
		if (e.which == 13) {
			
			if (content.length < 1 || content == "" || content == null) {
				alert('내용을 입력하세요');
				return;
			} else {
				
			$.ajax({
				url : "/community/rest/addComment",
				method : "POST",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({commentContent : content, userId : "", postNo : postNo}),
				success : function(d) {
					console.log("d", d)
					var html = "<i class='fas fa-times deleteCommentBtn'></i>"
							+"<hr/><p>"+d.userId+" &nbsp; "+d.commentContent+"</p>"
							+"<input type='hidden' value='"+d.commentNo+"'>"
					
					$(".addCommentDiv").prepend(html);
					$("input.regCommentText").val("");
				}
			})
			}
		}
	});
		
	$(document).on("click", ".deleteCommentBtn", function() {
		var commentNo = $(this).next().next().next().val(); 
		console.log("commentNo", commentNo);
	});
</script>

<style type="text/css">

body {
	margin : 50px;
}
ul.timeline {
    list-style-type: none;
    position: relative;
}
ul.timeline:before {
    content: ' ';
    background: #d4d9df;
    display: inline-block;
    position: absolute;
    left: 29px;
    width: 2px;
    height: 100%;
    z-index: 400;
}

ul.timeline {
	margin-top: 40px;
}

ul.timeline > li {
    margin: 20px 0;
    padding-left: 20px;
}
ul.timeline > li:before {
    content: ' ';
    background: white;
    display: inline-block;
    position: absolute;
    border-radius: 50%;
    border: 3px solid #22c0e8;
    left: 20px;
    width: 20px;
    height: 20px;
    z-index: 400;
}	

.viewStatus {
	width : 110px;
	height : 40px;
}

.nononotext {
	display: none;
}

.regCommentText {
	margin-top: 5px; 
}

.deleteCommentBtn {
	margin-top : 22px;
	float: right;
	cursor: url;
	
}
</style>
<title>어울림</title>
</head>
<body>
	<div class="container mt-5 mb-5">
		<div class="row">
			<div class="col-md-6 offset-md-3 addTargetDiv">
				<h4>Timeline</h4>
				<form id="addTimelineForm">
					<div class="input-group">
						<textarea class="form-control timelinePostContent" name="postContent" style="height:100px" placeholder="게시글을 등록하세요"></textarea>
						<input type="text" class="nononotext">
						<input type="text" class="nononotext">
					</div>
			            <div class="float-right" >
							<button class="btn btn-primary btn-rt " id="addTimeline">등록</button>
			            </div>
					<input type="hidden" name="userId" value="${user.userId}">
			           	<select class="custom-select float-right viewStatus" name="viewStatus">
			              <option value="1" selected="selected">전체공개</option>
			              <option value="2">나만보기</option>
			            </select>
				</form>
				<ul class="timeline">
				<c:forEach var="post" items="${map.list}">
					<li class="${post.postNo}">
						<a class="float-left text-monospace text-primary">${post.postDate}</a><br/> 
						<p>${post.postContent}</p>
						<button class="btn btn-primary btn-sm">좋아요</button>
						<button class="btn btn-primary btn-sm commentBtn" value="${post.postNo}">댓글</button>
					</li>
				</c:forEach>
				</ul>
			</div>
		</div>
	</div>	
</body>
</html>