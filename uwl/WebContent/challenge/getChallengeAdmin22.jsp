<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
     
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/fb8ae6e812.js" crossorigin="anonymous"></script>
	<!-- 나눔고딕 -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    
    
    <!-- 재이가 사용하던 폰트 -->
   <!--  <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet"> -->
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
            font-size: 12px;
            color: #333;
            font-family: 'Roboto', sans-serif;
font-family: 'Nanum Gothic', sans-serif;
        }
        div.wrap {
            
            margin: 50px auto;
            width: 1050px;
        }
        div.navigation {
            
            margin-bottom: 5px;
            text-align: right;
            margin-right: 30px;
        }
        
        div.navigation span:nth-child(2) {
            
            font-weight: bold;
        }
        div.noticeTop {
            
            margin-bottom: 50px;
        }
        div.noticeTop span:nth-child(1) {
            
            font-size: 23px;
            font-weight: bold;
            margin-right: 10px;
        }
        
        
        div.notice table {
            
            border-top: 2px solid #EBAD7A;
            border-bottom: 2px solid #EBAD7A;
            width: 100%;
            border-collapse: collapse;
        }
        div.notice table tr {
            
            line-height: 45px;
            border-bottom: 1px solid #eee;
        }
        div.notice table tr:nth-child(1) td:nth-child(1),
        div.notice table tr:nth-child(2) td:nth-child(1),
        div.notice table tr:nth-child(3) td:nth-child(1),
        div.notice table tr:nth-child(3) td:nth-child(3) {
            background-color: #fdfdfd;
            
            font-weight: bold;
        }
        div.notice table tr td {
            
            padding-left: 15px;
        }
        div.notice table tr:nth-child(4) td {
            padding: 0;
            padding: 10px;
        }
        div.notice table tr td img {
            vertical-align: middle;
            
        }
        div.notice div.list {
            text-align: right;
        }
        div.notice div.list a {
            background-color: #EBAD7A;
            display: inline-block;
            line-height: 40px;
            padding: 0 65px;
            color: #fff;
            font-weight: bold;
            margin: 20px 0;
            
        }
        
        div.wrap > div:nth-child(4) table {
            
            border-top: 2px solid #EBAD7A;
            border-bottom: 2px solid #EBAD7A;
            width: 100%;
            border-collapse: collapse;
        }
        div.wrap > div:nth-child(4) table tr {
            
            line-height: 35px;
            border-bottom: 1px solid #eee;
        }
        
        
        div.wrap > div:nth-child(4) table tr td:nth-child(1) {
            width: 70px;
            text-align: center;
            border-right: 1px solid #eee;
            background-color: #fdfdfd;
        }
        div.wrap > div:nth-child(4) table tr td:nth-child(2) {
            padding-left: 30px;
        }
        
        
    </style>
</head>
<body>
    <div class="wrap">
       <div class="navigation">
           <span>홈 > 고객행복센터 ></span>
           <span>공지사항</span>
       </div>
        <div class="noticeTop">
            <span>공지사항</span>
            <span>어울림의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
        </div>
        <div class="notice">
            <table>
               <colgroup>
                   <col width="10%">
                   <col width="40%">
                   <col width="10%">
                   <col width="40%">
               </colgroup>
                <tr>
                    <td>제목</td>
                    <td colspan="3">[어울림]구적립금 전환 사전 안내</td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td colspan="3">admin재이</td>
                </tr>
                <tr>
                    <td>작성일</td>
                    <td>2020-02-10</td>
                    <td>조회수</td>
                    <td>147</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <img src="img/e7b99206a6a2d1e0.webp" alt="">
                    </td>
                </tr>
            </table>
            <div class="list">
                <a href="#">목록</a>
            </div>
        </div>
        <div>
            <table>
                <tr>
                    <td>이전글</td>
                    <td><a href="#">[어울림]이용약관 및 개인정보처리방침 개정 내용 사전안내</a></td>
                </tr>
                <tr>
                    <td>다음글</td>
                    <td><a href="#">[가격인상공지] [홍반장] 토종 순대국 (2020 2. 14 ~)</a></td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>