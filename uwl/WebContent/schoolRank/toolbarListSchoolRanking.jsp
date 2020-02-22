<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>어울림</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="/javascript/iscroll.js"></script>
   
   	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
    <script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
    
    <script>
    
    function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		/* alert("currPage"+currentPage); */
		$("form").attr("method","POST").attr("action","/challenge/listAdminChallenge").submit();
	}
    
		var myScroll = null;
    
	    $(function() {
	    	
	        myScroll = new IScroll('#wrapper', {
	            mouseWheel: true,
	            scrollbars: true
	        });
	        
	        setTimeout(function() {
        		myScroll.refresh();
        	}, 0)
	    });
	    
	  //document가 열린다면
		$(document).ready(function(){

			$(':button').on("click",function(){
				
				//self.location = "/schoolRank/getSchoolRankingList"
				$('form').attr("method","POST").attr("action", "/schoolRank/listSchoolRanking").submit();
					
			});
			
		});
		
	        
    </script>
    
    <style type="text/css">
	.fa-running {
            color: #28aa10;
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
	       	 	<form class="form-signin" name="testForm">
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<div class="panel panel-default">

						<div class="panel panel-primary">

							<br />
							<br />
							<div class="text-center">
								<h3 style="color: #2C3E50"><i class="fas fa-school"></i> Ranking List</h3>
								
										<!-- <input type="radio" name="searchCondition" value="1" checked="checked"/>학교랭킹
										<input type="radio" name="searchCondition" value="2"/>개인랭킹
										 &emsp; -->
										 
										<c:if test="${search.searchCondition eq 1 }">
											<input type="radio" name="searchCondition" value="1" checked="checked"/>학교랭킹
											<input type="radio" name="searchCondition" value="2"/>개인랭킹
										</c:if>
										<c:if test="${search.searchCondition eq 2 }">
											<input type="radio" name="searchCondition" value="1"/>학교랭킹
											<input type="radio" name="searchCondition" value="2" checked="checked"/>개인랭킹
										</c:if>		
										 &emsp;
									<br>
									<br>
								<button type="button" class="btn btn-danger btn-lg btn3d" style="padding: 5px 30px" >
									<i class="fas fa-search"></i>
								</button>
							</div>
							<c:if test="${search.searchCondition eq 1 }">
								<h5 style="text-align: right;">
									<label>
										<i class="fas fa-school"></i> ${mySchool.schoolName} 
										<i class="fas fa-running"></i> 
									<fmt:formatNumber value="${mySchool.recentlyTotalActivityPoint}" pattern="#,###" />점
									
									</label>
								</h5>
							<br />
							<div class="panel-body">

								<table class="table table-striped table-condensed">
									<thead>
										<tr>
											<th class="text-center" width="70px"><i class="fas fa-medal"></i> Rank</th>
											<th class="text-center" width="100px"><i class="fas fa-school"></i> 학교이름</th>
											<th class="text-center" width="150px"><i class="fas fa-map-marker-alt"></i> 주소</th>
											<th class="text-center" width="90px">총 점수</th>
										</tr>
									</thead>
									<tbody>

										<c:if test="${search.searchCondition == 1}">
											<c:set var="i" value="0" />
											<c:forEach var="schoolRank" items="${list}">
												<c:set var="i" value="${i+1 }" />
												<tr>
														
													<td class="text-center" width="70px">
														<c:if test="${schoolRank.ranking == 1}">
															<i class="fas fa-medal" style="color: #ffd700;"></i>
														</c:if>
														<c:if test="${schoolRank.ranking == 2}">
															<i class="fas fa-medal" style="color: #c0c0c0;"></i>
														</c:if>
														<c:if test="${schoolRank.ranking == 3}">
															<i class="fas fa-medal" style="color: #800000;"></i>
														</c:if>
														${schoolRank.ranking}
													</td> 
													<td class="text-center" width="100px"> ${schoolRank.schoolName}</td>
													<td class="text-center" width="150px">${schoolRank.schoolAddress}</td>
													<td class="text-center" width="90px"> <i class="fas fa-running"></i>
														<fmt:formatNumber value="${schoolRank.totalActivityPoint}" pattern="#,###" /> 점
	
													</td>
												</tr>
											</c:forEach>
										</c:if>
										
									</tbody>
								</table>
								<!-- 이제부터 무한스크롤 구현 -->
							</c:if>	<!-- end of search eq 1 -->
							
							<c:if test="${search.searchCondition eq 2 }">
								<h5 style="text-align: right;">
									<label>
										<!-- 내 점수 : <i class="fas fa-running"></i> --> 
									<%-- <fmt:formatNumber value="${reward.recentlyTotalActivityPoint}" pattern="#,###" />점 --%>
									
									</label>
								</h5>
							<br />
							<div class="panel-body">

								<table class="table table-striped table-condensed">
									<thead>
										<tr>
											<th class="text-center" width="70px"><i class="fas fa-medal"></i> Rank</th>
											<th class="text-center" width="100px"><i class="fas fa-school"></i> 유저아이디</th>
											<th class="text-center" width="150px"><i class="fas fa-map-marker-alt"></i> 소속학교</th>
											<th class="text-center" width="90px">총 점수</th>
										</tr>
									</thead>
									<tbody>

										<c:if test="${search.searchCondition == 2}">
											<c:set var="i" value="0" />
											<c:forEach var="schoolRank" items="${individualRank}">
												<c:set var="i" value="${i+1 }" />
												<tr>
														
													<td class="text-center" width="70px">
														<c:if test="${schoolRank.ranking eq '1'}">
															<i class="fas fa-medal" style="color: #ffd700;"></i>
														</c:if>
														<c:if test="${schoolRank.ranking eq '2'}">
															<i class="fas fa-medal" style="color: #c0c0c0;"></i>
														</c:if>
														<c:if test="${schoolRank.ranking eq '3'}">
															<i class="fas fa-medal" style="color: #800000;"></i>
														</c:if>
														${schoolRank.ranking}
													</td> 
													<td class="text-center" width="100px"> ${schoolRank.userId}</td>
													<td class="text-center" width="150px">${schoolRank.schoolName}</td>
													<td class="text-center" width="90px"><i class="fas fa-running"></i>
														<fmt:formatNumber value="${schoolRank.recentlyTotalActivityPoint}" pattern="#,###" /> 점
	
													</td>
												</tr>
											</c:forEach>
										</c:if>
										
									</tbody>
								</table>
								<!-- 이제부터 무한스크롤 구현 -->
							</c:if>	<!-- end of search eq 2 -->
							
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
						
	       	 </ul>
	        </div>
	        <div class="rightToolbar2">
	            <jsp:include page="/layout/right.jsp" />
	        </div>
	    </div>
	    
	    
	</body>
</html>