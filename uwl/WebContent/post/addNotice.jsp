
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/mainMain.css">
    <!-- <link rel="stylesheet" href="/css/mainLeft.css"> -->
    <link rel="stylesheet" href="/css/mainRight.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
    <!-- Modal Alert https://github.com/PureOpenSource/pureAlert  -->
    
    <script src="/javascript/common.js"></script>
    <script src="/javascript/mainLeft.js"></script>
    <script src="/javascript/mainRight.js"></script>
    
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
            line-height: 25px;
            padding: 0 40px;
            color: #fff;
            font-weight: bold;
            margin: 20px 0;
            
        }
        div.notice div.list input {
            background-color: #EBAD7A;
            display: inline-block;
            line-height: 25px;
            padding: 0 40px;
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
        <div class="left">
            <jsp:include page="/mainTest/mainLeft.jsp" />
        </div>
        <div class="main">
        	<body>

 <!-- 썸네일 등록-->
  <form method="post" action="/post/addNotice">   <!--if문 넣어서 selected 지정해주기-->
  
  <input type="hidden" name="userId" value="user13">
  
  <div class="wrap">
       <div class="navigation">
           <span>홈 > 고객행복센터 ></span>
           <span>공지사항 등록</span>
       </div>
        <div class="noticeTop">
            <span>공지사항 등록</span>
            <span>공지사항을 등록해 보아요 </span>
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
                    <td><input type="text" name="postTitle" placeholder="제목 입력"style="line-height : 1" ></td>
                    <td>카테고리</td>
                    <td><select name="gatherCategoryNo">
					        <option value="101">매칭</option>
					        <option value="102">아이템</option>
					        <option value="103">도전과제</option>
					        <option value="104">결제</option>
					        <option value="105">친구</option>
					        <option value="106">타임라인</option>        
					        <option value="107">ASK</option>        
					        <option value="108">계정</option>        
					        <option value="109">알림</option>        
					        <option value="110">위치</option>        
					        <option value="111">기타</option>        
   						 </select></td>
                </tr>
                
               <%--  <tr>
                    <td>작성일</td>
                    <td>${post.postDate }</td>
                    
                </tr> --%>
                <td colspan="4">
        		 <br>
        <!--  내용  -->
        
        <div><textarea cols="50" rows="10" placeholder="내용입력" name="postContent" style="resize:none ; width:100% ">${post.postContent }</textarea></div>
        <br>
         </td>
                <tr>
                    
                 </tr>
               </table>
            
            
        </div>
        <div class="notice">
            <table>
                <tr>
                    
                </tr>
                
            </table>
            <div class="list">
                <a href="/post/listNotice">목록</a>
        <a href="javascript:history.go(-1)">뒤로</a>
        <input type="submit" value="등록">
    	</div>
            
        </div>
        
    </div>
    </form>
</body>
        </div>
        <div class="right">
            <jsp:include page="/mainTest/mainRight.jsp" />
        </div>
    </div>
</body>

</html>
