<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <!-- 참조 : http://getbootstrap.com/css/   참조 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>




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
    <script>
var answer = '';

 $(document).on("click", ".questionBox", function() {
	 
		var postNo = $(this).children().find('#anserPostNo').val();
		console.log("postNo", postNo);
		
		
		$.ajax({
			url : "/user/rest/getAnswer",
			method : "POST",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				
				postNo : postNo
			}),
			success : function(d) {
				//console.log(d.post.postContent);
				answer = d.post.postContent
				console.log(answer);
				
				//추가
				
				
				//추가끝
				
                
			}
		})
		
		
	})
	
 

 
        $(function() {
            $(document).on('click', 'a[href="#"]', function(e) {
                e.preventDefault();
            });

            
            $('div.noticeList table tr:nth-child(n + 2) td:nth-child(2)').on('click', function() {
                
                $('div.noticeList table').find('.admin').parent().remove();
                var displayValue = '<tr>' +
                '<td colspan="1" class="admin" style="text-align: right;">' +
                '<span>A</span>' +
                ' <i class="fas fa-angle-right"></i>' +
                '</td>' +
                '<td colspan="2" class="answer" style="text-align: left">' +
               	answer+
                '</td>' +
                '</tr>';
                $(this).parent().after(displayValue);
                
            });
        }); 
 
          
    </script>
    <style>
        td.admin {

            vertical-align: top;
            line-height: 1;
            padding-right: 10px;
            padding-top: 25px;
            padding-bottom: 25px;
        }

        td.admin span {
            display: inline-block;

            background-color: rgb(255, 108, 104);
            padding: 3px 5px;
            font-size: 1px;
            color: #fff;
            font-weight: bold;
            border-radius: 5px;
        }

        td.admin i {
            vertical-align: middle;
            color: rgb(255, 108, 104);
        }

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

        div.noticeList div.addNotice button {
            background-color: #EBAD7A;
            display: inline-block;
            line-height: 25px;
            padding: 0 40px;
            color: #fff;
            font-weight: bold;
            margin: 20px 0;

        }




        div.noticeList table {

            border-top: 3px solid #EBAD7A;
            border-bottom: 3px solid #EBAD7A;
            border-collapse: collapse;
            width: 100%;
        }

        div.noticeList table tr {

            border-bottom: 2px solid #ddd;
            line-height: 40px;
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
    </style>

    <style>
        div.layoutWrap {

            width: 100%;
            min-height: 200vh;
            padding: 0 20%;
            position: relative;
        }

        div.leftToolbar {
            width: 20%;
            height: 100vh;

            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            background: #fff;
            border-right: 1px solid #eee;
        }

        div.rightToolbar {
            width: 20%;
            height: 100vh;

            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            background: #fff;
            border-left: 1px solid #eee;
        }
    </style>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
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

        a:hover,
        a:focus {
            text-decoration: none;
            color: inherit;
        }

        body {
            color: #333;
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;

        }

        div.layoutWrap2 {
            width: 1500px;
            height: 100vh;

            margin: 0 auto;
            overflow: hidden;
        }

        div.leftToolbar2 {

            width: 300px;
            height: 100vh;
            float: left;
            background-color: #fff;
            border-right: 1px solid #eee;
        }

        div.work2 {

            width: 900px;
            height: 100vh;
            float: left;
            overflow: hidden;
            overflow-y: scroll;

        }

        div.rightToolbar2 {

            width: 300px;
            height: 100vh;
            float: left;
            background-color: #fff;
            border-left: 1px solid #eee;
        }
        
        div.wrap nav {

            padding: 15px 0;
            border-bottom: 1px solid #EBAD7A;
            margin-top: 50px;
            text-align: center;
            
        }


        div.wrap nav ul li a {

            padding: 10px 15px;
            color: #333;
            font-weight: bold;
            
        }

        div.wrap nav ul li.on a {
            background-color: #eee;
            

            color: #e9a064;

        }

        div.wrap nav ul li a:hover {
            background-color: #eee;
            

            color: #e9a064;
        }

        div.wrap nav ul li a:hover i {
            background-color: #eee;

            color: #333;
        }
    </style>
</head>

<body>
    <div class="layoutWrap2">
        <div class="leftToolbar2">
            <jsp:include page="/layout/left.jsp" />
        </div>
        <div class="work2">
            <div class="wrap">

                <div class="main">
                    <div class="mainHeader">
                        <span>내가올린 문의사항</span>
                        <span></span>
                    </div>
                    <div class="noticeList">
                        <table>

                            <div class="addNotice">
                                <c:if test="${user.role eq '4' }">
                                    <button onclick="location.href='/user/getUserQuestionsList'">문의사항 전체목록</button>
                                </c:if>
                                <a href="/user/addQuestions">문의사항 등록</a>
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
                            <c:if test="${notice.postTitle ne '문의사항답변등록'}">
                                <tr class="questionBox">
                                    <td>${notice.postNo }</td>
	                                    <td><a href="/user/getQuestions?postNo=${notice.postNo }">${notice.postTitle }</a>
	                                    <input type="hidden" id="anserPostNo" name="anserPostNo" value="${notice.replyPostNo}"/>
                                    </td>
                                    <td>${notice.postDate }</td>
                                    <c:if test="${notice.questionStatus eq '1' or notice.questionStatus == null}">
                                        <td>처리중</td>
                                    </c:if>
                                    <c:if test="${notice.questionStatus eq '2'}">
                                        <td>처리 완료</td>
                                    </c:if>
                                </tr>
                                </c:if>
                            </c:forEach>

                        </table>
                    </div>
                </div>
            <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item">
                            <a class="page-link" href="#"><i class="fas fa-angle-double-left"></i></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#"><i class="fas fa-angle-left"></i></a>
                        </li>
                        <li class="page-item on"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#"><i class="fas fa-angle-right"></i></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#"><i class="fas fa-angle-double-right"></i></a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>
</body></html>
