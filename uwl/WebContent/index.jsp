<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<!--  jQuery CDN -->	
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- jQuery Redirect CDN     https://github.com/mgalante/jquery.redirect  -->
<script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>

<meta charset="UTF-8">

<script type="text/javascript">


$(function() {
	$("button").on("click", function() {
		$.redirect("/user/addQuestions", {userId : "user01"});
	})
})

</script>
<title>Insert title here</title>
</head>
<body>
	<h1>Hello 어'울림! index.jsp</h1>
	<br>
	<br>
	<br>
	
	<a href="/user/login" role="button">로그인</a>
	<br/><br/>
	<a href="/user/getUser?userId=${user.userId}" role="button">회원정보</a>
	<br/>
	<br/>
	<button>문의사항</button>
	<br/>
	<br/>
	<ul>
			<h2>도전과제</h2>
			<a href="/challenge/addChallenge" role="button">도전과제 등록</a>
			
			<br>
			<br>
			
			
			<a href="/challenge/getAdminChallengeList" role="button">도전과제리스트 (관리자용)</a>
			
			<br>
			<br>
			
			<a href="/challenge/getCompleteChallengeList/{userId}"  role="button">완료된 도전과제리스트 (유저용)</a>
			
			<br>
			<br>
			
			<a href="/challenge/getChallengeList/"  role="button">주간 도전과제리스트 (유저용/3개)</a>
		
			
			
			
	</ul>
	<br><hr><br>
	<ul>
		<h2>보상</h2>
		<br>
		<br>
			
		<a href="/reward/getUserBothPointList/{userId}"  role="button"> 내 포인트 사용내역조회 </a>
	
	
	</ul>
	
	</ul>
	<br><hr><br>
	<ul>
		<h2>학교랭킹</h2>
		<br>
		<br>
			
		<a href="/schoolRank/getSchoolRankingList/"  role="button"> 학교랭킹</a>
	
	
	</ul>
	<br><hr><br>
	<ul>
		<h2>친구모듈</h2>
		<br>
		<br>
			
		<a href="/friend/friendIndex.jsp"  role="button">친구모듈</a>
	
	
	</ul>
	<ul>
		<h2>LEFT</h2>
		<br>
		<br>
			
		<a href="/post/left.jsp"  role="button">LEFT</a>
	
	
	</ul>
	<ul>
		<h2>구매</h2>
		<br>
		<br>
			
		<a href="/purchase/addPurchase.jsp"  role="button">addPurchase</a><br/>
		<a href="/purchase/listPurchase"  role="button">listPurchase</a><br/>
		
	
	
	</ul>
	
	
	<ul>
		<h2>채팅</h2>
		<br>
		<br>
			
		<a href="http://192.168.0.19:7777"  role="button">채팅1</a>
	
	
	</ul>
	
	<ul>
		
		<br>
		<br>
			
		<a href="http://192.168.0.19:5000"  role="button">채팅2</a>
	
	
	</ul>
</body>
</html>