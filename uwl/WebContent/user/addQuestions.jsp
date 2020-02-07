<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>Insert title here</title>

	<script type="text/javascript">

		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddQuestions();
			});
		});	
		
		
		function fncAddQuestions() {
			
			var postTitle = $("input[name='postTitle']").val();
			var postContent = $("input[name='postContent']").val();

			if(postTitle == null || postTitle.length <1){
				alert("제목을 입력하세요.");
				return;
			}
			if(postContent == null || postContent.length <1){
				alert("내용을 입력하세요.");
				return;
			}

			$("form").attr("method" , "POST").attr("action" , "/user/addQuestions").submit();
		}

</script>
</head>


<body>
<h1>문의사항 등록</h1>
    <hr>
    <form>
아 이 디 
 <div>
${user.userId}
<input type="hidden" id="userId" name="userId" value="${user.userId}"/></div>
 <br>
    <br>
    제목 : <input type="text" id="postTitle"		name="postTitle"/>
    <br>
    <br>
   내용 :    <input type= "text" id="postContent"	name="postContent"/>
    <br>
     <br>
<!--   공개설정 :    <input type= "text" id="viewStatus"	name="viewStatus"/> -->
  공개설정 :    <input type= "radio" id="viewStatus"	name="viewStatus"	value="1"	checked/> 공개
    <input type= "radio" id="viewStatus"	name="viewStatus"	value="2"/> 비공개
  
  
  

<input type= "hidden" />${post.hitCount}
<input type= "hidden" />${post.likeCount}
<input type= "hidden" />${post.commentCount}
<input type= "hidden" />${post.postDate}
    <br> 
    <br> 
    <br> 
          
          
          
          
          
<%-- <div><input type= "hidden" id="hitCount"	name="hitCount"	value="${post.hitCount}"/>${post.hitCount}</div> --%>
<!--     <br> -->
<!--              <br> -->
<%-- <div><input type= "hidden" id="likeCount"	name="likeCount"	value="${post.likeCount}"/>${post.likeCount}</div> --%>
<!--     <br> -->
<!--                  <br> -->
<%-- <div><input type= "hidden" id="commentCount"	name="commentCount"	value="${post.commentCount}"/>${post.commentCount}</div> --%>
<!--     <br> -->
    
    
    
    </form>
      <button type="button" class="btn btn-primary"  >등 &nbsp;록</button>
    
<!--     <button onclick="parent.location.href='/user/addQuestions.jsp'">등록</button><br> -->
    <a href="javascript:history.go(-1)">뒤로</a>
    
</body>
</html>
