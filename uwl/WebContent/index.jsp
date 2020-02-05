<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello 어'울림! index.jsp</h1>
	<br>
	<br>
	<br>
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
	
</body>
</html>