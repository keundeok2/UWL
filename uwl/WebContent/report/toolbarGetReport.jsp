<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/4b823cf630.js" crossorigin="anonymous"></script>
    <title>Insert title here</title>

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

        a:hover {
            text-decoration: none;
            color: inherit;
        }

        body {
            color: #333;
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;

        }

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
            width: 1280px;
            height: 100vh;

            margin: 0 auto;
            overflow: hidden;
        }

        div.leftToolbar2 {

            width: 240px;
            height: 100vh;
            float: left;
            background-color: #fff;
            border-right: 1px solid #eee;
            padding: 15px 0 0 15px;
        }

        div.work2 {

            width: 770px;
            height: 100vh;
            float: left;
            
            position: relative;
			
        }

        div.rightToolbar2 {

            width: 270px;
            height: 100vh;
            float: left;
            background-color: #fff;
            border-left: 1px solid #eee;
            padding: 15px 15px 0 15px;
        }
        
        
    </style>

</head>

<body>
    <div class="layoutWrap2">
        <div class="leftToolbar2">
            <jsp:include page="/layout/left.jsp" />
        </div>
        <div class="work2" id="wrapper">
        <ul>
            <form method="POST" action="/report/updateReport">
                <div>
                    <div></div>
                    <div>
                        <br>
                        <h2 class="text-center">신고 조회</h2>
                        <p>&nbsp;</p>
                        <div class="table table-responsive">
                            <table class="table">
                                <tr>
                                    <th class="success">신고 날짜</th>
                                    <td>${report.reportDate }</td>

                                    <th class="success">신고 카테고리</th>
                                    <c:if test="${report.reportCategoryNo == '1' }">
                                        <td>부적절한 게시글</td>
                                    </c:if>
                                    <c:if test="${report.reportCategoryNo == '2' }">
                                        <td>음란성 게시글</td>
                                    </c:if>
                                    <c:if test="${report.reportCategoryNo == '3' }">
                                        <td>명예훼손 / 저작권 침해</td>
                                    </c:if>
                                    <c:if test="${report.reportCategoryNo == '4' }">
                                        <td>기타</td>
                                    </c:if>
                                </tr>


                                <tr>
                                    <th class="success">신고한 회원</th>
                                    <td>${report.userId01 }</td>
                                    <th class="success">신고 당한 회원</th>
                                    <td>${report.userId02 }</td>
                                </tr>

                                <tr>
                                    <th class="success">신고 사유</th>
                                    <td colspan="3">${report.reportContent }</td>
                                </tr>

                                <c:if test="${post.postTitle ne null }">
                                    <tr>
                                        <th class="success">게시글 제목</th>
                                        <td colspan="3">${post.postTitle }</td>
                                    </tr>

                                    <tr>
                                        <th class="success">게시글 내용</th>
                                        <td colspan="3">${post.postContent }</td>
                                    </tr>
                                </c:if>
                                <c:if test="${comment.commentContent ne null}">
                                    <tr>
                                        <th class="success">댓글 내용</th>
                                        <td colspan="3">${comment.commentContent }</td>
                                    </tr>
                                </c:if>

                            </table>
                        </div>

                    </div>
                </div>
                <c:if test="${report.reportStatus eq '1' }">

                    <div style="text-align:center">
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">
                            <i class="fas fa-skull-crossbones"></i>&nbsp;제재하기
                        </button>
                        <input type="hidden" name="reportNo" value="${report.reportNo }">
                        <button type="submit" class="btn btn-primary"><i class="fas fa-arrow-right"></i>&nbsp;건너띄기</button>
                    </div>

                    <div class="container">
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel"></h4>
                                    </div>
                                    <div class="modal-body">
                                        <h1>&emsp;&emsp;&emsp;제재처리하기</h1>
                                    </div>
                                    <div class="modal-footer">
                                        <select class="form-control" name="plusStopDate">
                                            <option value=0>몇일줄래?</option>
                                            <option value=1>1일 정지</option>
                                            <option value=3>3일 정지</option>
                                            <option value=7>7일 정지</option>
                                            <option value=30>30일 정지</option>
                                            <option value=999>영구 정지</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-danger" style="margin:0 auto"><i class="fas fa-pause-circle"></i>&nbsp;처리</button>
                                    <br>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${report.reportStatus eq '2' }">
                    <input type="hidden" name="reportNo" value="${report.reportNo }">
                    <input type="hidden" name="plusStopDate" value="-999">
                    <div style="text-align:center">
                        <button type="submit" class="btn btn-primary"><i class="fas fa-hands-helping"></i>&nbsp;용서하기</button>
                    </div>
                </c:if>

            </form>
            </ul>
        </div>
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>
</body></html>