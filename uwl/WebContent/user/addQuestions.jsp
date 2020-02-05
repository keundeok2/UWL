<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="euc-kr">
		<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddQuestions();
			});
		});	
		
		
		function fncAddQuestions() {
			
			var postTitle = $("input[name='postTitle']").val();
			var postContent = $("input[name='postContent']").val();

			if(postTitle == null || postTitle.length <1){
				alert("������ �Է��ϼ���.");
				return;
			}
			if(postContent == null || postContent.length <1){
				alert("������ �Է��ϼ���.");
				return;
			}

			$("form").attr("method" , "POST").attr("action" , "/user/addQuestions").submit();
		}

</script>
</head>


<body>
<h1>���ǻ��� ���</h1>
    <hr>
    <form>
�� �� �� 
 <div>
${user.userId}
<input type="hidden" id="userId" name="userId" value="${user.userId}"/></div>
 <br>
    <br>
    ���� : <input type="text" id="postTitle"		name="postTitle"/>
    <br>
    <br>
   ���� :    <input type= "text" id="postContent"	name="postContent"/>
    <br>
     <br>
<!--   �������� :    <input type= "text" id="viewStatus"	name="viewStatus"/> -->
  �������� :    <input type= "radio" id="viewStatus"	name="viewStatus"	value="1"	checked/> ����
    <input type= "radio" id="viewStatus"	name="viewStatus"	value="2"/> �����
  
  
  
<input type= "hidden" />${post.hitCount}
<input type= "hidden" />${post.likeCount}
<input type= "hidden" />${post.commentCount}
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
      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
    
<!--     <button onclick="parent.location.href='/user/addQuestions.jsp'">���</button><br> -->
    <a href="javascript:history.go(-1)">�ڷ�</a>
    
</body>
</html>
