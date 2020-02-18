<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

    <title>Insert title here</title>

    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
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


            overflow: hidden;
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

        div.mainHeader div {

            font-size: 14px;
            font-weight: bold;
            margin-right: 10px;
            text-align: right;
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



        div.searchpoint {
            text-align: center;
        }

        div.work div.ul {
            text-align: center;
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
                        <span>공지사항</span>
                        <span>어울림의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
                        <div>
                            검색 창 들어갈곳 </div>
                        <div style="text-align: left">
                            <select name="gatherCategoryNo">
                                <option>선택 이거 왼쪽으로 보내줭..</option>
                                <option value="101" ${post.gatherCategoryNo eq '101' ? "selected" : "" }>매칭</option>
                                <option value="102" ${post.gatherCategoryNo eq '102' ? "selected" : "" }>아이템</option>
                                <option value="103" ${post.gatherCategoryNo eq '103' ? "selected" : "" }>도전과제</option>
                                <option value="104" ${post.gatherCategoryNo eq '104' ? "selected" : "" }>결제</option>
                                <option value="105" ${post.gatherCategoryNo eq '105' ? "selected" : "" }>친구</option>
                                <option value="106" ${post.gatherCategoryNo eq '106' ? "selected" : "" }>타임라인</option>
                                <option value="107" ${post.gatherCategoryNo eq '107' ? "selected" : "" }>ASK</option>
                                <option value="108" ${post.gatherCategoryNo eq '108' ? "selected" : "" }>계정</option>
                                <option value="109" ${post.gatherCategoryNo eq '109' ? "selected" : "" }>알림</option>
                                <option value="110" ${post.gatherCategoryNo eq '110' ? "selected" : "" }>위치</option>
                                <option value="111" ${post.gatherCategoryNo eq '111' ? "selected" : "" }>기타</option>
                                <!-- 기존 카테고리 selected-->
                            </select></div>
                    </div>
                    <div class="noticeList">
                        <table>

                            <div class="addNotice">
                                <c:if test="${user.role eq '4' }">
                                    <a href="/post/addNotice">공지사항 등록</a>
                                </c:if>
                            </div>
                            <colgroup>
                                <col width="10%">
                                <col width="10%">
                                <col width="50%">
                                <col width="10%">
                                <col width="10%">
                                <col width="10%">
                            </colgroup>
                            <tr>
                                <td>번호</td>
                                <td>카테고리</td>
                                <td>제목</td>
                                <td>작성자</td>
                                <td>작성일</td>
                                <td>조회</td>
                            </tr>
                            <c:forEach var="notice" items="${list }">
                                <tr>
                                    <td>${notice.postNo }</td>
                                    <!--<c:if test="${notice.gatherCategoryNo == '101'}">-->
                                    <td>매칭</td>
                                    <!--</c:if>
                                    <c:if test="${notice.gatherCategoryNo == '102'}">
                                        <td>아이템</td>
                                    </c:if>
                                    <c:if test="${notice.gatherCategoryNo == '103'}">
                                        <td>도전과제</td>
                                    </c:if>
                                    <c:if test="${notice.gatherCategoryNo == '104'}">
                                        <td>결제</td>
                                    </c:if>
                                    <c:if test="${notice.gatherCategoryNo == '105'}">
                                        <td>친구</td>
                                    </c:if>
                                    <c:if test="${notice.gatherCategoryNo == '106'}">
                                        <td>타임라인</td>
                                    </c:if>
                                    <c:if test="${notice.gatherCategoryNo == '107'}">
                                        <td>ASK</td>
                                    </c:if>
                                    <c:if test="${notice.gatherCategoryNo == '108'}">
                                        <td>계정</td>
                                    </c:if>
                                    <c:if test="${notice.gatherCategoryNo == '109'}">
                                        <td>알림</td>
                                    </c:if>
                                    <c:if test="${notice.gatherCategoryNo == '110'}">
                                        <td>위치</td>
                                    </c:if>
                                    <c:if test="${notice.gatherCategoryNo == '111'}">
                                        <td>기타</td>
                                    </c:if>-->
                                    <td><a href="/post/getNotice?postNo=${notice.postNo }">${notice.postTitle }</a></td>
                                    <td>${user.userId }</td>
                                    <td>${notice.postDate }</td>
                                    <td>${notice.hitCount }</td>
                                </tr>
                            </c:forEach>

                        </table>
                        <br>

                        <div class="searchpoint">
                            검색창 들어갈곳</div>
                        <br>

                    </div>
                    가운데로 보내줘..
                    <nav aria-label="Page navigation example" style="text-align: center">
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




            </form>
        </div>
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>
</body></html>