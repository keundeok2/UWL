<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		<!-- 참조 : http://getbootstrap.com/css/   참조 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
	    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
	    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
	    
	    <script type="text/javascript">
	    	$(document).ready(function(){
	    		$('#addComment').on("click", function(){
	    			var postNo = ${post.postNo}
	    			var commentContent = $('#commentContent').val();
	    			$.ajax({
	    				url : "/community/rest/addComment",
	    				method : "POST",
	    				dataType : "json",
	    				data : JSON.stringify({
	    					postNo : postNo,
	    					commentContent : commentContent
	    				}),
	    				headers : {
		    				"Accept" : "application/json",
		    				"content-Type" : "application/json"
		    			},
	    				success : function(data){
	    					alert('성공ㅋㅋ');
	    				},
	    				error : function(){
	    					alert('에러 ㅋㅋ');
	    				}
	    			});
	    		});
	    	});
	    </script>
	    
	<title>Insert title here</title>
</head>
<body>
    <form method="POST" action="/rest/addComment">
	    <!--for문 돌릴것-->
	    <h3>${resultPage.totalCount }(댓글 수 출력)</h3>
	    <c:forEach var="comment" items="${list }">
	    <span>${comment.userId }</span> / <span>${comment.commentDate }</span>
	    <br>
	    <span>${comment.commentContent }</span>
	    <input type="button" value="좋아요"> <span>${comment.likeCount }(좋아요 개수 출력)</span>
	    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	    <input type="button" value="수정"><!--모달창으로 수정 창 출력--><input type="button" value="삭제"><!--본인 일때-->
	    <input type="button" value="신고"><!--타인 댓글--><!--모달 인클루드-->
	    <hr>
	    </c:forEach>
	    
	    <textarea rows="3" cols="85" name="commentContent" id="commentContent"></textarea>
	    <input type="button" id="addComment" value="등록">
    </form>
</body>
</html>