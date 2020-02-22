<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	        
    </script>
    <style type="text/css">
    	div.updateUser {
            overflow: hidden;
            
        }
        div.leftNavigation {
            
            width: 30%;
            float: left;
        }
        div.leftNavigation ul li a {
            
            line-height: 45px;
            display: block;
            padding: 0 30px;
            border-left: 3px solid transparent;
        }
        div.updateProfile,
        div.updatePassword {
            padding-top: 20px;
            width: 70%;
            float: right;
            border-left: 1px solid #eee;
            min-height: 100vh;
        }
        
        
        div.publicStatus {
            
            width: 70%;
            float: right;
            border-left: 1px solid #eee;
            min-height: 100vh;
        }
        
        div.updateProfile {
            display: none;
        }
        div.updatePassword {
            display: none;
        }
        div.publicStatus {
            display: none;
        }
        div.updateProfile.on {
            display: block;
        }
        div.updatePassword.on {
            display: block;
        }
        div.publicStatus.on {
            display: block;
        }
        p {
            margin: 0;
            padding: 0;
        }
        div.leftNavigation li.on a {
            border-left: 3px solid;
        }
        
        /* 아이콘 색 지정*/
        .fa-coins {
        	color: #ffc811;
        }
        
        .fa-credit-card {
        	color: #1e291b;
        }
        .fa-calendar-check {
        	color: #a72644;
        }
        .fa-map-marked-alt {
        	color: #168641;
        }
        .fa-piggy-bank {
        	color: #ffb8c6;
        }
        .fa-camera {
        	color: rgb(12, 98, 183);
        }
        .fa-clipboard {
        	color: rgb(4, 4, 5);
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
	       	 	 <div class="updateUser">
        <div class="leftNavigation">
            <ul>
                <li class="on"><a href="#"><i class="fas fa-coins"></i> 포인트 적립내역</a></li>
                <li><a href="#"><i class="fas fa-credit-card"></i> 포인트 사용내역</a></li>
                <li><a href="#">구매내역</a></li>
            </ul>
        </div>
        
        
        
        
        <!--첫번째 탭에 나오는 부분-->
        <div class="updateProfile on">
        	<div class="row">
				<div class="col-2" >
				</div>
				<div class="col-6">
		             <br>
		             <h3 class="total" align="right" ><i class="fas fa-coins"></i>  ${reward.recentlyTotalPoint}  </h3>
				</div>
				<div class="col-2">
		            <br>
					<h3 class="total" align="right"><i class="fas fa-running" style="color: #28aa10;"></i>  ${reward.recentlyTotalActivityPoint}</h3>
				</div>
			</div>
			<br>
		
             <!-- 카드모양으로 바꿔봄 -->
             <div class="row">
             <c:forEach var="reward" items="${list}">
			  <div class="col-sm-5">
			    <div class="card">
	            
			      <div class="card-body">
			        <h5 class="card-title">
			        	<!-- 카테고리가 Map 일 때 -->
			    		<c:if test="${reward.challenge.challCategory eq '1'}">
			    			<h4><i class="fas fa-map-marked-alt col-sm-2" style="font-size: 25px;"></i></h4>
			    		</c:if>
			    		
			    		<!-- 카테고리가 Vsion 일 때 -->
			    		<c:if test="${reward.challenge.challCategory eq '2'}">
			    			<h4><i class="fas fa-camera col-sm-2" style="font-size: 25px;"></i></h4>
			    		</c:if>
			    		<!-- 카테고리가 게시판활동 일 때 -->
			    		<c:if test="${reward.challenge.challCategory eq '3'}">
			    			<h4><i class="far fa-clipboard" style="font-size: 25px;"></i> 게시판활동</h4>
			    		</c:if>
			    		<br>
			        </h5>
			        <p class="card-text">
			        	<h6 class="col-sm-10"><b> 제목 : ${reward.challenge.challTitle}</b></h6>
			        	<i class="fas fa-coins col-sm-4" style="font-size: 25px; text-align: center;" ><font size="4px" color="black">&emsp;${reward.variableActivityPoint} </font></i> 
			    		<i class="fas fa-piggy-bank col-sm-4"  style="font-size: 25px; text-align: center;"><font size="4px"; color="black"; > ${reward.totalPoint}</font></i>  
			        </p>
			        <p class="card-text" style="text-align: right;">
			    		<i class="far fa-calendar-check col-sm-4"  style="font-size: 25px; text-align: left;"><font size="3px"; color="black"; > 
			    		<fmt:formatDate var="variableDate" value="${reward.variableDate}" pattern="yy-MM-dd"/>${variableDate}</font></i>  
			        </p>
			      </div>
			    </div>
			    
			<br>
			  </div> <!-- end of card -->
		    </c:forEach>
        </div>
        </div>
        
        
        <!--두번째 탭에 나오는 부분-->
        <div class="updatePassword">
        	<div class="row">
				<div class="col-2" >
				</div>
				<div class="col-6">
		             <br>
		             <h3 class="total" align="right" ><i class="fas fa-coins"></i>  ${reward.recentlyTotalPoint}  </h3>
				</div>
				<div class="col-2">
		            <br>
					<h3 class="total" align="right"><i class="fas fa-running"></i>  ${reward.recentlyTotalActivityPoint}</h3>
				</div>
			</div>
			<br>
		
             <!-- 카드모양으로 바꿔봄 -->
             <div class="row">
             <c:forEach var="purchase" items="${purchaseList}">
			  <div class="col-sm-5">
			    <div class="card">
	            
			      <div class="card-body">
			        <h5 class="card-title">
			        	<!-- 카테고리가 Map 일 때 -->
			    		<c:if test="${purchase.purchaseItem.itemCategory eq '1'}">
				    		<div class="col-sm-9">
				    			사용아이템 : <img  src="../images/spear.png" style="width: 50px; height: 50px; align-content: right;" >
				    		</div>
			    		</c:if>
			    		
			    		<!-- 카테고리가 Vsion 일 때 -->
			    		<c:if test="${purchase.purchaseItem.itemCategory eq '2'}">
				    		<div class="col-sm-9">
				    			사용아이템 : <img  src="../images/shield.png" style="width: 50px; height: 50px; align-content: right;" >
				    		</div>
			    		</c:if>
			    		<br>
			        </h5>
			        <p class="card-text">
			        	<i class="fas fa-coins col-sm-4" style="font-size: 25px; text-align: center;" ><font size="4px" color="black">  ${purchase.variablePoint}</font></i> 
			    		<i class="fas fa-piggy-bank col-sm-4"  style="font-size: 25px; text-align: center;"><font size="4px"; color="black"; > ${purchase.totalPoint}</font></i>  
			        </p>
			        <p class="card-text" style="text-align: right;">
			    		<i class="far fa-calendar-check col-sm-4"  style="font-size: 25px; text-align: left;"><font size="3px"; color="black"; > 
			    		<fmt:formatDate var="variableDate" value="${purchase.variableDate}" pattern="yy-MM-dd"/>${variableDate}</font></i>  
			        </p>
			      </div>
			    </div>
			    
			<br>
			  </div> <!-- end of card -->
			    </c:forEach>
			    </div>
	        </div>
	        
	        <div class="publicStatus">
	            <!--세번째 탭에 나오는 부분-->
	        </div>
	    </div>
	       	 </ul>
	        </div>
	        <div class="rightToolbar2">
	            <jsp:include page="/layout/right.jsp" />
	        </div>
	    </div>
	    
	    
	</body>
</html>