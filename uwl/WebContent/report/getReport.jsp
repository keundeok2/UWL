<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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


</head>
<body>
    <form method="POST" action="/report/updateReport">
        <h1>신고 조회</h1>
        <br>
        <hr>
        <div>신고날짜 : ${report.reportDate }</div>
        <br>
        <c:if test="${report.reportCategoryNo == '1' }">
        	<div>신고 카테고리 : 부적적한 게시글 갸아아아아아아아아앜</div>
        </c:if>
        <c:if test="${report.reportCategoryNo == '2' }">
        	<div>신고 카테고리 : 음란성 게시글</div>
        </c:if>
        <c:if test="${report.reportCategoryNo == '3' }">
        	<div>신고 카테고리 : 명예훼손 / 저작권 침해</div>
        </c:if>
        <c:if test="${report.reportCategoryNo == '4' }">
        	<div>신고 카테고리 : 기타</div>	
        </c:if>
        <br>
        <div>신고자 : ${report.userId01 }</div>
        <div>신고대상자 : ${report.userId02 }</div>
        <br>
        <div>신고 내용 : ${report.reportContent }</div>
        <br>
        <div>신고당한 제목 : ${post.postTitle }</div>
        <br>
        <div>신고당한 내용 : ${post.postContent }</div>
        <br>
        <br>
        <div>신고당한 댓글 내용 : ${comment.commentContent }</div>
        <br>
        
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
  			제재하기
		</button>
		<input type="hidden" name="reportNo" value="${report.reportNo }">
				
		
        <button type="submit" class="btn btn-primary">건너띄기</button>
        <a href="javascript:history.go(-1)">뒤로</a>
        <!--if 문으로 본인 게시판일 때만 출력되도록 설정-->
        <br><br>
    
    
    
    <div class="container">
 			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	            <div class="modal-dialog" role="document">
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	                        <h4 class="modal-title" id="myModalLabel"></h4>
	                    </div>
                    <div class="modal-body">
                        	<h1>&emsp;&emsp;&emsp;&emsp;&emsp;제재처리하기</h1>
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
                        <button type="submit" class="btn btn-primary">처리</button>
                    </div>
                </div>
            </div>
        </div>
 	</div>
 	
 	
 	</form>
</body>
</html>