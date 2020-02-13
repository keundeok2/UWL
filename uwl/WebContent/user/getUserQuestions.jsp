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

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">

// 	$(function() {
// 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
// 		$("button").on("click", function() {
// 			self.location = "/user/updateUser?userId=${user.userId}";
// 		});
// 	});
	
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
            font-size: 12px;
            color: #333;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;
        }

        div.wrap {

            margin: 50px auto;
            width: 1065px;
            overflow: hidden;
        }

        div.leftNav {

            width: 205px;
            float: left;
        }

        div.navHeader {

            font-size: 25px;
            font-weight: bold;
            margin-bottom: 30px;
        }

        div.nav {

            margin-bottom: 15px;
        }

        div.nav ul {

            border: 1px solid #ddd;
        }

        div.nav ul li {

            line-height: 45px;
        }

        
        

        div.nav ul li.on {
            background-color: #eee;
            color: #e59b5e;
            font-weight: bold;
        }

        div.nav ul li+li {
            border-top: 1px solid #ddd;
        }

        div.nav ul li a {

            display: block;
            padding-left: 17px;
        }

        div.nav ul li a:hover {
            background-color: #eee;
            color: #e59b5e;
            font-weight: bold;
        }
        div.navFooter {
            background-color: #eee;
            padding: 10px 0;
        }

        div.navFooter a {

            display: block;
            line-height: 1.6;
            padding-left: 17px;
        }

        div.navFooter a p:nth-child(1) {

            font-weight: bold;
            font-size: 15px;
        }

        div.navFooter a p:nth-child(2) {

            font-size: 11px;
        }

        div.main {

            width: 830px;
            float: right;
        }

        div.mainHeader {

            margin-bottom: 30px;
            padding-top: 2px;
        }

        div.mainHeader span:nth-child(1) {

            font-size: 23px;
            font-weight: bold;
            margin-right: 10px;
        }
        
        
		div.noticeList div.addNotice {
            text-align: right;
        }
        div.noticeList div.addNotice a {
            background-color: #EBAD7A;
            display: inline-block;
            line-height: 25px;
            padding: 0 40px;
            color: #fff;
            font-weight: bold;
            margin: 20px 0;
            
        }




        div.noticeList table {

            border-top: 2px solid #EBAD7A;
            border-bottom: 2px solid #EBAD7A;
            border-collapse: collapse;
            width: 100%;
        }

        div.noticeList table tr {

            border-bottom: 1px solid #ddd;
            line-height: 50px;
        }

        div.noticeList table tr:nth-child(1) {
            font-weight: bold;
            background-color: #fdfdfd;
        }

        div.noticeList table tr td {

            text-align: center;
        }

        div.noticeList table tr td:nth-child(4),
        div.noticeList table tr td:nth-child(5) {
            color: #898989;
        }

        div.noticeList table tr:nth-child(n + 2) td:nth-child(2) {
            text-align: left;
        }
        nav {
            background-color: lavender;
        }
        
        
    </style>
    
    
</head>


<body>

<div class="wrap">
        
        <div class="main">
            <div class="mainHeader">
                <span>내가올린 문의사항</span>
                <span>${user.userId } 꺼임</span>
            </div>
            <div class="noticeList">
                <table>
                
                <div class="addNotice">
                <button onclick="location.href='/user/getUserQuestionsList'">전체목록</button><br>
                <a href="/user/addQuestions">문의사항 등록</a>
                <!--  뒤로는 나중에 빼야될듯 ?  -->
                  <a href="javascript:history.go(-1)">뒤로 ( 임시임 )</a>
                </div>
                    <colgroup>
                        <col width="15%">
                        <col width="60%">
                        <col width="10%">
                        <col width="15%">
                    </colgroup>
                    <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>작성일</td>
                        <td>처리여부</td>
                    </tr>
                    <c:forEach var="notice" items="${list }">
                    <tr>
                        <td>${notice.postNo }</td>
                        <td><a href="/user/getQuestions?postNo=${notice.postNo }">${notice.postTitle }</a></td>
                        <td>${notice.postDate }</td>
                         <c:if test="${post.questionStatus eq '1' or post.questionStatus == null}">
							<td>처리중</td>
							</c:if>
							<c:if test="${post.questionStatus eq '2'}">
							<td>처리 완료</td>
							</c:if>
		                     </tr>
                    </c:forEach>
                   
                </table>
            </div>
        </div>
    </div>
    
    
    
</body>
</html>
