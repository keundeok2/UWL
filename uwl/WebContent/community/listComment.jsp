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
	    
	    <!-- 모달용 -->
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	    
	    <script type="text/javascript">
	    	
	    	var postNo = null;
	    	var commentContent = null;
	    	var commentNo = null;
	    	var content = null;
	    	var userId = null;
	    	var reportCategoryNo = null;
	    	var reportContent = null;
	    
	    	$(document).ready(function(){
	    		$('#addComment').on("click", function(){
	    			postNo = ${post.postNo}
	    			commentContent = $('#commentContent').val();
	    			$.ajax({
	    				url : "/community/rest/addComment",
	    				method : "POST",
	    				dataType : "json",
	    				data : JSON.stringify({
	    					postNo : postNo,
	    					commentContent : commentContent
	    				}),
	    				headers : {
		    				"Accept" : "application/json",
		    				"content-Type" : "application/json"
		    			},
	    				success : function(data){
	    					var userId = data.userId;
	    					var commentDate = data.commentDate;
	    					var commentContent = data.commentContent;
	    					var likeCount = data.likeCount;
	    					var commentNo = data.commentNo;
	    					$('#commentContent').val("");
	    					view =
	    							"<div class="+commentNo+">"
	    						+		"<span>"+userId+"</span> / <span>"+commentDate+"</span>"
	    						+		"<br>"
	    						+		"<span id="+commentNo+">"+commentContent+"</span>"
	    						+		"&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;"
	    						+		"<span class='j'>"
	    						+			"<span id='forCommentAppend'></span>"
		    					+			"<button type='button' class='btn btn-primary'>좋아요</button>"
		    					+			"<span>"+likeCount+"(좋아요 개수 출력)</span>"
	    						+			"<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#updateCommentModal'>수정</button>"
    						   	+			"<input type='button' value='삭제'><!--본인 일때-->"
    						    +			"<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#myModalComment'>신고</button>"
    					    	+			"<input type='hidden' value='"+commentNo+"' class='commentNo'>"
    					    	+			"<input type='hidden' value='"+userId+"' class='userId'>"
    					    	+			"<input type='hidden' value='"+commentContent+"' class='commentContent'>"
	    						+		"</span>"
	    						+		"<hr>"
	    						+	"</div>";
	    					$('#forAppend').append(view);
	    				},
	    				error : function(){
	    					alert('에러 ㅋㅋ');
	    				}
	    			});
	    		});
	    	});
	    	
	    	$(document).ready(function(){
	    		
	    	
		    	$(document).on("click", ".j button:nth-child(2)", function(){	//좋아요
		    		var buttonView = "<button type='button' class='btn btn-primary'>좋아요</button>";
		    		commentNo = $(this).parent().find(".commentNo").val();
		    		postNo = ${post.postNo}
		    		
		    		$.ajax({
		    			url : "/community/rest/addCommentLike",
		    			method : "POST",
		    			dataType : 'json',
		    			data : JSON.stringify({
		    				refCommentNo : commentNo,
		    				refPostNo : postNo
		    			}),
		    			headers : {
		    				"Accept" : "application/json",
		    				"content-Type" : "application/json"
		    			},
		    			success : function(data){
		    				if(data == true){
		    					$("#"+commentNo+"").parent().find("button:nth-child(2)").remove();
		    					var view = "<button type='button' class='btn btn-danger'>좋아요 취소</button>";
		    					$("#"+commentNo+"").parent().find("#forCommentAppend").after(view);
		    				}else{
		    					$.ajax({
		    						url : "/community/rest/deleteLike",
		    						method : "POST",
		    						dataType : 'json',
		    						data : JSON.stringify({
		    							refCommentNo : commentNo,
		    							refPostNo : postNo
		    						}),
		    						headers : {
		    		    				"Accept" : "application/json",
		    		    				"content-Type" : "application/json"
		    		    			},
		    		    			success : function(data){
		    		    				$("#"+commentNo+"").parent().find("button:nth-child(2)").remove();
		    		    				var view = "<button type='button' class='btn btn-primary'>좋아요</button>";
		    		    				$("#"+commentNo+"").parent().find("#forCommentAppend").after(view);
		    		    			},
		    		    			error : function(){
		    		    				alert('code='+request.status+' message='+request.responseText+' error='+error);
		    		    			}
		    					});
		    				}
		    			},
		    			error : function(request, status, error){
		    				alert('code='+request.status+' message='+request.responseText+' error='+error);
		    			}
		    		});
		    	});
		    	
		    	
		    	
		    	$(document).on("click", ".j button:nth-child(4)", function(){	//수정
		    		commentNo = $(this).parent().find(".commentNo").val();
		    		content = $("#"+commentNo+"").text();
		    		$("textarea#updateCommentContent").val("");
		    		$("textarea#updateCommentContent").val(""+content);
		    	});
		   
	    		$(document).on("click", "#updateComment", function(){	//진짜 수정
	    			content = $("textarea#updateCommentContent").val();
	    			$.ajax({
	    				url : "/community/rest/updateComment",
	    				method : "POST",
	    				data : JSON.stringify({
	    					commentNo : commentNo,
	    					commentContent : content
	    				}),
	    				headers : {
		    				"Accept" : "application/json",
		    				"content-Type" : "application/json"
		    			},
		    			success : function(data){
		    				$("#"+commentNo+"").html("");
		    				var view = data.commentContent;
		    				$("#"+commentNo+"").html(view);
		    				$("textarea#updateCommentContent").val("");
		    			},
		    			error : function(){
		    				
		    			}
	    			});
	    		});
		    	
		    	
		    	
		    	
		    	$(document).on("click", ".j input:nth-child(5)", function() {	//삭제
		    		commentNo = $(this).parent().find(".commentNo").val();
		    		postNo = ${post.postNo}
		    		$.ajax({
		    			url : "/community/rest/deleteComment",
		    			method : "POST",
		    			data : JSON.stringify({
		    				commentNo : commentNo,
		    				postNo : postNo
		    			}),
		    			headers : {
		    				"Accept" : "application/json",
		    				"content-Type" : "application/json"
		    			},
		    			success : function(){
		    				$("."+commentNo+"").remove();
		    			},
		    			error : function(){
		    				alert("실패");
		    			}
		    		});
		    	});
		    	
		    	$(document).on("click", ".j button:nth-child(6)", function(){	//신고
		    		commentNo = $(this).parent().find(".commentNo").val();
		    		userId = $(this).parent().find(".userId").val();
		    	});	
		    	
		    		
	    		$(document).on("click", "#realReport", function(){	//진짜 신고하기 눌렀을 때
		    		var postNo = ${post.postNo};
		    		var reportCategoryNo = $("#reportCategoryNo").val();
		    		var reportContent = $("#reportcontent").val();
		    		$.ajax({
		    			url : "/report/rest/addReportComment",
		    			method : "POST",
		    			data : JSON.stringify({
		    				refPostNo : postNo,
		    				refCommentNo : commentNo,
		    				userId02 : userId,
		    				reportCategoryNo : reportCategoryNo,
		    				reportContent : reportContent
		    			}),
		    			headers : {
		    				"Accept" : "application/json",
		    				"content-Type" : "application/json"
		    			},
		    			success : function(){
		    				$("textarea#reportcontent").val("");
		    			},
		    			error : function(){
		    			}
		    		});
	    		});
    		
	    	});
	    </script>
	    
	<title>Insert title here</title>
</head>

<body>
    <form method="POST" action="community/rest/addComment">
	    <!--for문 돌릴것-->
	    <h3>${resultPage.totalCount }(댓글 수 출력)</h3>
	    <c:forEach var="comment" items="${list }">
			<div class='${comment.commentNo }'>
			    <span>${comment.userId }</span> / <span>${comment.commentDate }</span>
			    <br>
			    <span id='${comment.commentNo }'>${comment.commentContent }</span>
			    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			    <span class="j">
			    	<span id="forCommentAppend"></span>
			    	<c:if test="${comment.likeStatus eq '0'}">
					    <button type='button' class='btn btn-primary'>좋아요</button>
			    	</c:if>
				    <c:if test="${comment.likeStatus ne '0' }">
				    	<button type='button' class='btn btn-danger'>좋아요 취소</button>
				    </c:if>
				    <span>${comment.likeCount }(좋아요 개수 출력)</span>
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateCommentModal">수정</button>
				    <input type="button" value="삭제"><!--본인 일때-->
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalComment">신고</button>
					<input type="hidden" value="${comment.commentContent }" class="commentContent">
			    	<input type="hidden" value="${comment.commentNo }" class="commentNo">
			    	<input type="hidden" value="${comment.userId }" class="userId">
			    </span>
			    <hr>
			</div>
	    </c:forEach>
	    <div id="forAppend"></div>
	    <textarea rows="3" cols="85" name="commentContent" id="commentContent"></textarea>
	    <input type="button" id="addComment" value="등록">
	    
    </form>
    
    <form>
      <div class="container">
		 			<div class="modal fade" id="myModalComment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			            <div class="modal-dialog" role="document">
			                <div class="modal-content">
			                    <div class="modal-header">
			                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			                        <h4 class="modal-title" id="myModalLabel"></h4>
			                    </div>
		                    <div class="modal-body">
		                        	<h1>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;댓글 신고하기</h1>
		                    </div>
		                    <div class="modal-footer">
		                        <select class="form-control" name="reportCategoryNo" id="reportCategoryNo">
		                        	  <option value=1>부적절한 댓글</option>
									  <option value=2>음란성 댓글</option>
									  <option value=3>명예훼손/저작권 침해</option>
									  <option value=4>기타</option>
								</select>
								<br>
								<textarea cols="75" rows="10" placeholder="내용입력" name="reportContent" id="reportcontent"></textarea>
								<br>
								<span>
		                        
		                        <button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close" id="realReport"><span aria-hidden="true">신고하기</span></button>
		                        </span>
		                    </div>
		                </div>
		            </div>
		        </div>
		 	</div>
		</form>
		
	<!-- 수정 모달 -->
	<form>
      
      <div class="container">
		 			<div class="modal fade" id="updateCommentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			            <div class="modal-dialog" role="document">
			                <div class="modal-content">
			                    <div class="modal-header">
			                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			                        <h4 class="modal-title" id="myModalLabel"></h4>
			                    </div>
		                    <div class="modal-body">
		                        	<h1>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;댓글 수정</h1>
		                    </div>
		                    <div class="modal-footer">
								<textarea cols="75" rows="10" name="updateCommentContent" id="updateCommentContent"></textarea>
								<br>
								<span>
								<button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close" id="updateComment"><span aria-hidden="true">수정</span></button>
		                        </span>
		                    </div>
		                </div>
		            </div>
		        </div>
		 	</div>
      
      
	</form>
    
   
 	
 	
 	
</body>
</html>