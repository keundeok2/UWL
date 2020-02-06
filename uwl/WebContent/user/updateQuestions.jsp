<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8">

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">

$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button").on("click", function() {
// 			self.location = "/user/getUser?userId=${user.userId}"
			$("form").attr("method" , "POST").attr("action" , "/user/updateQuestions").submit();
		});
	});
</script>
</head>


<body>
	
	updateQuestions.jsp
	<hr>
	
	<form>
<%-- 	아이디  : <input type="text"	name="userId"		 value="${user.userId}"		readonly> --%>
	아이디  :${user.userId} <input type="hidden" 	name="postDate"	 value="${user.userId}">
	<hr>
	제목  : <input type="text"		name="postTitle"	 value="${post.postTitle}">
	<hr>
	내용  : <input type="text" 	name="postContent"	 value="${post.postContent}">
	<hr>
		<input type="hidden" 	name="postDate"	 value="${post.postDate}">
		<input type="hidden" 	name="postNo"	 value="${post.postNo}">
		<input type="hidden" 	name="hitCount"	 value="${post.hitCount}">
		<input type="hidden" 	name="likeCount"	 value="${post.likeCount}">
		<input type="hidden" 	name="commentCount"	 value="${post.commentCount}">
	
	  공개설정 :    <input type= "radio" id="viewStatus"	name="viewStatus"	value="1"	checked/> 공개
    <input type= "radio" id="viewStatus"	name="viewStatus"	value="2"/> 비공개
  
  
    <br> 
    <br> 
    <br> 
	
	
	
</form>
	<button type="button" id="updateQuestions">완료</button>

</body>


</html>