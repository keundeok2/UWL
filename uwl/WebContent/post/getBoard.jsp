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
	    
	    <script type="text/javascript">
	    	$(document).ready(function(){
	    		var refPostNo = ${post.postNo}
	    		$.ajax({
	    			url : "/community/rest/getLike",
	    			method : "POST",
	    			dataType : 'json',
	    			data : JSON.stringify({
	    				refPostNo : refPostNo
	    			}),
	    			headers : {
	    				"Accept" : "application/json",
	    				"content-Type" : "application/json"
	    			},
	    			success : function(data){
	    				if(data != true){	//좋아요를 안누른 게시글일때
	    					var view = "<button type='button' class='btn btn-primary' id='like'>좋아요</button>";
	    					$('.buttonAppend').append(view);
	    				}else{	//좋아요를 누른 게시글일때
	    					var view = "<button type='button' class='btn btn-danger' id='likeCancel'>좋아요 취소</button>";
	    					$('.buttonAppend').append(view);
	    				}
	    			},
	    			error : function(){
	    				alert('실패 ㅋㅋ');
	    			}
	    		});
	    	});
	    	
	    	$(document).on("click", "#like", function() {
	    		var refPostNo = ${post.postNo}
	    		$.ajax({
	    			url : "/community/rest/addPostLike",
	    			method : "POST",
	    			dataType : 'json',
	    			data : JSON.stringify({
	    				refPostNo : refPostNo
	    			}),
	    			headers : {
	    				"Accept" : "application/json",
	    				"content-Type" : "application/json"
	    			},
	    			success : function(data){
	    				if(data != true){	//좋아요를 안누른 게시글일때
	    					var view = "<button type='button' class='btn btn-primary' id='like'>좋아요</button>";
	    				}else{	//좋아요를 누른 게시글일때
	    					var view = "<button type='button' class='btn btn-danger' id='likeCancel'>좋아요 취소</button>";
	    					$('#like').remove();
	    					$('.buttonAppend').append(view);
	    				}
	    			},
	    			error : function(){
	    				alert('실패 ㅋㅋ');
	    			}
	    		});
			});
			
	    	
	    	$(document).on("click", "#likeCancel", function() {
	    		var refPostNo = ${post.postNo}
	    		$.ajax({
	    			url : "/community/rest/deleteLike",
	    			method : "POST",
	    			dataType : 'json',
	    			data : JSON.stringify({
	    				refPostNo : refPostNo
	    			}),
	    			headers : {
	    				"Accept" : "application/json",
	    				"content-Type" : "application/json"
	    			},
	    			success : function(data){
	    				if(data != true){	//좋아요를 안누른 게시글일때
	    					var view = "<button type='button' class='btn btn-primary' id='like'>좋아요</button>";
	    					$('#likeCancel').remove();
	    					$('.buttonAppend').append(view);
	    				}else{	//좋아요를 누른 게시글일때
	    					var view = "<button type='button' class='btn btn-danger' id='likeCancel'>좋아요 취소</button>";
	    					$('#like').remove();
	    					$('.buttonAppend').append(view);
	    				}
	    			},
	    			error : function(){
	    				alert('실패 ㅋㅋ');
	    			}
	    		});
			});
	    	
	    </script>
	    
		<title>Insert title here</title>
</head>

<body>
	<form>
		<h1>카테고리 이름</h1>
			<c:if test="${post.gatherCategoryNo eq '201' }">
				진학상담
			</c:if>
			<c:if test="${post.gatherCategoryNo eq '202' }">
				사랑과이별
			</c:if>
			<c:if test="${post.gatherCategoryNo eq '203' }">
				남자끼리
			</c:if>
			<c:if test="${post.gatherCategoryNo eq '204' }">
				여자끼리
			</c:if>
			<c:if test="${post.gatherCategoryNo eq '205' }">
				데이트자랑
			</c:if>
			<c:if test="${post.gatherCategoryNo eq '206' }">
				대나무 숲
			</c:if>
			
	
		<br>
		<div>
			제목
			${post.postTitle}
		</div>
        	<div>작성날짜 : ${post.postDate }</div>
		<br>
		<br>
		<div>
			${post.userId}
		</div>
		<br> 좋아요수${post.likeCount}&emsp;조회수${post.hitCount }&emsp;댓글수${post.commentCount} <br> <br>
		 
		<a href="/post/updateBoard?postNo=${post.postNo }">수정</a> 
		
		<input type="hidden" name="gatherCategoryNo" value="${post.gatherCategoryNo }">
		<a href="/post/deleteBoard?gatherCategoryNo=${post.gatherCategoryNo }&postNo=${post.postNo }">삭제</a>
		<!--if 문으로 본인 게시판일 때만 출력되도록 설정-->
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
  			신고하기
		</button>
		<!--신고 버튼 누르면 모달창 출력해야됨-->
		<br>
		<br>
		<hr>
		<div>
			내용
			${post.postContent }
		</div>
		
		<div class="buttonAppend"></div>
		<br> <br>
		<hr>
		<jsp:include page="../community/listComment.jsp"/>
		
		<br><br>
		<h1><a href="javascript:history.go(-1)">뒤로</a></h1>
		</form>
		
		<form method="POST" action="/report/addReport">
		<input type="hidden" name="refPostNo" value="${post.postNo }">
		<input type="hidden" name="userId02" value="${post.userId }">
		
		<div class="container">
 			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	            <div class="modal-dialog" role="document">
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	                        <h4 class="modal-title" id="myModalLabel"></h4>
	                    </div>
                    <div class="modal-body">
                        	<h1>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;게시글 신고하기</h1>
                    </div>
                    <div class="modal-footer">
                        <select class="form-control" name="reportCategoryNo">
                        	  <option value=1>부적절한 게시글</option>
							  <option value=2>음란성 게시글</option>
							  <option value=3>명예훼손/저작권 침해</option>
							  <option value=4>기타</option>
						</select>
						<br>
						<textarea cols="75" rows="10" placeholder="내용입력" name="reportContent"></textarea>
						<br>
						<span>
                        <button type="submit" class="btn btn-primary">신고하기</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
 	</div>
 	</form>
 	
</body>
</html>