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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
     <style>
        div {
            
            max-height: 0;
            background-color: aliceblue;
            transition: all 0.1s;
            overflow: hidden;
        }
        div.on {
        	transition : all 1s;
            max-height: 500px;
        }
    </style>
    <script>
        $(document).ready(function() {
            $('#a').on('click', function() {
                $('#aa').toggleClass('on');
            });
        });
        $(document).ready(function() {
            $('#b').on('click', function() {
                $('#bb').toggleClass('on');
            });
        });
        $(document).ready(function() {
            $('#c').on('click', function() {
                $('#cc').toggleClass('on');
            });
        });
        $(document).ready(function() {
            $('#d').on('click', function() {
                $('#dd').toggleClass('on');
            });
        });
    </script>
</head>
<body>
	<a id="a" href="#">관리자↓</a>
    <div id="aa">
        <ul>
            <li>
                <a href="#">전체회원 목록</a><br>
            </li>
            <li>
                <a href="#">도전과제 관리</a><br>
            </li>
        </ul>
    </div>
    
    <a href="#">홈</a>
    <br>
    
    <a href="#">내프로필</a>
    <br>
    
    <a id="b" href="#">커뮤니티↓</a>
    <div id="bb">
        <ul>
            <li>
                <a href="/post/listBoard?gatherCategoryNo=201">진학상담</a><br>
            </li>
            <li>
                <a href="/post/listBoard?gatherCategoryNo=202">사랑과 이별</a><br>
            </li>
            <li>
                <a href="/post/listBoard?gatherCategoryNo=203">남자끼리</a><br>
            </li>
            <li>
                <a href="/post/listBoard?gatherCategoryNo=204">여자끼리</a><br>
            </li>
            <li>
                <a href="/post/listBoard?gatherCategoryNo=205">데이트자랑</a><br>
            </li>
            <li>
                <a href="/post/listBoard?gatherCategoryNo=206">대나무 숲</a><br>
            </li>
        </ul>
    </div>
  
  	<a id="c" href="#">도전과제↓</a>
    <div id="cc">
        <ul>
            <li>
                <a href="#">진행중인 도전과제</a><br>
            </li>
            <li>
                <a href="#">완료한 도전과제</a><br>
            </li>
            <li>
                <a href="#">학교별 랭킹</a><br>
            </li>
        </ul>
    </div>
    
    <a id="d" href="#">더보기↓</a>
    <div id="dd">
        <ul>
            <li>
                <a href="#">공지사항</a><br>
            </li>
            <li>
                <a href="#">문의사항</a><br>
            </li>
        </ul>
    </div>
    
</body>

</html>