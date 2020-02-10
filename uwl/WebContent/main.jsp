<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
	
<head>
	<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
        body {
           text-align:center; position: relative; padding-top : 70px;
        }
      
        #container{
			height:5000px;
		}
		#content{
			color:gray;
			height:5000px;
		}
		#log{
			position:fixed;
			top:0;
			left:0;
		 	right:0;
			margin:0;
			height:200px;	
			background-color:rgba(0,0,0,0.7);	
			text-align:center;
			line-height:50px;
		}
		#container span{
			color:white;
		}
		#b{
			display:none;
		}
   	</style>
   	<script type="text/javascript">
   	$(window).on("scroll", function() {
   		var scrollHeight = $(document).height();
   		var scrollPosition = $(window).height() + $(window).scrollTop();		

   		$("#scrollHeight").text(scrollHeight);
   		$("#scrollPosition").text(scrollPosition);
   		$("#bottom").text(scrollHeight - scrollPosition);

   		if (scrollPosition > scrollHeight - 500) {			
   			//todo
   			$("body").append('<div id="content"></div>');
   		}
   	});
   	
   	
   	
   	$( function() {
		$("a[href='#' ]:contains('로그인')").on("click" , function() {
			self.location = "/user/loginView.jsp"
		});
	});
   	
   	
	$( function() {
		$("a[href='#' ]:contains('문의사항')").on("click" , function() {
			self.location = "/user/addQuestions"
		});
	});
	
	
	$( function() {
		$("a[href='#' ]:contains('회원가입')").on("click" , function() {
			self.location = "/user/addUser"
		});
	});
	
	$( function() {
		$("a[href='#' ]:contains('PW찾기')").on("click" , function() {
			self.location = "/user/rest/findPw"
		});
	});
	
	
// 	$(function() {
// 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
// 		$("button").on("click", function() {
// // 			self.location = "/user/getUser?userId=${user.userId}"
// 			$("#findPw").attr("method" , "POST").attr("action" , "/user/rest/findPw").submit();
// 		});
// 	});
	
   	</script>
</head>
	
<body>
<a class="btn btn-info btn-lg" href="#" role="button">로그인</a>
<a class="btn btn-info btn-lg" href="#" role="button">문의사항</a>
<a class="btn btn-info btn-lg" href="#" role="button">회원가입</a>
<!-- <button type="button" id="findPw">PW찾기</button> -->

</body>

</html>