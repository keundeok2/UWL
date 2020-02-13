<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    
    <link rel="stylesheet" href="/css/jaeiCommon.css">
        <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <script type="text/javascript">
    
    </script>
    
    
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        li {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        body {
            font-size: 16px;
            color: #333;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;
        }

        a:hover,
        a:focus {
            color: inherit;
            text-decoration: none;

        }

        input:focus {
            outline: none;
        }

        img,
        i,
        input {
            vertical-align: middle;
        }

        div.wrap {

            width: 540px;
            margin: 0 auto;
            text-align: center;
        }

        div.logo {

            padding: 20px 0;
        }

        div.logo img {
            width: 100px;
        }

        .wrap>div:nth-child(2) {

            font-size: 22px;
            font-weight: bold;
            padding: 5px 0 20px;
        }


        div.loginForm div.id p:nth-child(1),
        div.loginForm div.password p:nth-child(1) {
            text-indent: 8px;
            padding-top: 5px;
            text-align: left;
            background-color: #f0f0f0;
            font-size: 15px;
        }

        div.loginForm div.id input,
        div.loginForm div.password input {
            background-color: #f0f0f0;
            border: none;
            border-bottom: 2px solid;
            width: 100%;
            line-height: 30px;
            padding: 0 10px 2px;
            margin-bottom: 20px;
            
            
            
            
            
            font-size: 19px;
            
        }

        div.loginForm a {
            background-color: #EBAD7A;
            display: block;
            line-height: 45px;
            border-radius: 30px;
            text-align: center;
            font-weight: bold;
            margin-bottom: 30px;
            color: #fff;
            font-size: 14px;
        }
        div.wrap > div:nth-child(4) {
            font-size: 14px;
            
        }
        div.wrap > div:nth-child(4) a {
            color: #EBAD7A;
        }
    </style>
    <script type="text/javascript">
    	$(document).ready(function(){
    		$('#login').on("click",function(){
    			$("form").attr("method","POST").attr("action","/user/login").submit();	
    		});
    	});
    </script>

<title>어울림</title>
</head>
<body>
<form>
    <div class="wrap">
        <div class="logo">
            <img src="../img/twitter_header_photo_1-removebg-preview.png" alt="">
        </div>
        <div>어울림 로그인</div>
        <div class="loginForm">
            <div class="id">
                <p>휴대폰, 이메일, 사용자 아이디</p>
                <p><input type="text" name="userId"></p>
            </div>
            <div class="password">
                <p>비밀번호</p>
                <p><input type="password" name="password"></p>
            </div>
            <div>
                <a href="#" id="login">로그인</a>
            </div>
        </div>
        <div>
            <a href="#">비밀번호를 잊으셨나요?</a> · <a href="#">어울림 가입</a>
        </div>
    </div>
  </form>
</body></html>