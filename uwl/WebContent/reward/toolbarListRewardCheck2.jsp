<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
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
        .fa-running {
        	color: #28aa10;
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
    <script>
        $(function() {
            $('div.leftNavigation li a').on('click', function() {
                $('div.leftNavigation li').removeClass('on');
                $(this).parent().addClass('on');
                var index = $(this).parent().index();
                
                
                $('div.updateUser > div').removeClass('on');
                $('div.updateUser > div').eq(index + 1).addClass('on');
            });
        });
    </script>
</head>

<body>
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
	        <!-- 카테고리 분류  -->
			<div class="row">
				<div class="row">
				
				</div>
	   			<div class="col-3" ></div>
	   			
	   			<div class="col-2" style="text-align: center;"><h4>카테고리</h4></div>
	   			<div class="col-3" style="text-align: center;"><h4>포인트</h4></div>
	   			<div class="col-2" style="text-align: center;"><h4>누적점수</h4></div>
	   			<div class="col-2" style="text-align: center;"><h4>날짜</h4></div>
	   		</div>
             <c:forEach var="reward" items="${list}">
				    		<br>
				    		<div class="row">
				    		<!-- 카테고리가 Map 일 때 -->
				    		<c:if test="${reward.challenge.challCategory eq '1'}">
				    			<i class="fas fa-map-marked-alt col-sm-2" style="font-size: 25px; text-align: center;"></i> 
				    		</c:if>
				    		
				    		<!-- 카테고리가 Vsion 일 때 -->
				    		<c:if test="${reward.challenge.challCategory eq '2'}">
				    			<i class="fas fa-camera col-sm-2" style="font-size: 25px; text-align: center;"></i>
				    		</c:if>
				    		
				    		<!-- 카테고리가 게시판활동 일 때 -->
				    		<c:if test="${reward.challenge.challCategory eq '3'}">
				    			<i class="far fa-clipboard col-sm-2" style="font-size: 25px; text-align: center;"></i> 
				    		</c:if>
				    		
					    		<i class="fas fa-coins col-sm-4" style="font-size: 25px; text-align: center;" ><font size="4px" color="black"> + ${reward.variablePoint} &emsp;<i class="fas fa-running" ></i> + ${reward.variableActivityPoint} </font></i> 
					    		
					    		<i class="fas fa-piggy-bank col-sm-3"  style="font-size: 25px; text-align: center;"><font size="4px"; color="black"; > ${reward.totalPoint}</font></i>  
					    		<i class="far fa-calendar-check col-sm-3"  style="font-size: 25px; text-align: left;"><font size="3px"; color="black"; > ${reward.variableDate}</font></i>  
				    		</div>
				    </c:forEach>
        </div>
        
        
        <!--두번째 탭에 나오는 부분-->
        <div class="updatePassword">
	        <!-- 카테고리 분류  -->
			<div class="row">
				<div class="row">
				
				</div>
	   			<div class="col-3" ></div>
	   			
	   			<div class="col-2" style="text-align: center;"><h4>카테고리</h4></div>
	   			<div class="col-3" style="text-align: center;"><h4>포인트</h4></div>
	   			<div class="col-2" style="text-align: center;"><h4>누적점수</h4></div>
	   			<div class="col-2" style="text-align: center;"><h4>날짜</h4></div>
	   		</div>
             <c:forEach var="purchase" items="${purchaseList}">
			    		<br>
				    		<div class="row">
				    		<!-- 카테고리가 Map 일 때 -->
				    		<c:if test="${purchase.purchaseItem.itemCategory eq '1'}">
					    		<div class="col-sm-3">
					    			<img  src="../images/spear.png" style="width: 50px; height: 50px; align-content: right;" >
					    		</div>
				    		</c:if>
				    		
				    		<!-- 카테고리가 Vsion 일 때 -->
				    		<c:if test="${purchase.purchaseItem.itemCategory eq '2'}">
					    		<div class="col-sm-3">
					    			<img  src="../images/shield.png" style="width: 50px; height: 50px; align-content: right;" >
					    		</div>
				    		</c:if>
				    		
				    		
					    		<i class="fas fa-coins col-sm-3" style="font-size: 25px; text-align: center;" ><font size="4px" color="black">  ${purchase.variablePoint}</font></i> 
					    		
					    		<i class="fas fa-piggy-bank col-sm-3"  style="font-size: 25px; text-align: center;"><font size="4px"; color="black"; > ${purchase.totalPoint}</font></i>  
					    		<i class="far fa-calendar-check col-sm-3"  style="font-size: 25px; text-align: left;"><font size="3px"; color="black"; > ${purchase.variableDate}</font></i>  
				    		</div>
			    	</c:forEach>
        </div>
        
        <div class="publicStatus">
            <!--세번째 탭에 나오는 부분-->
        </div>
    </div>
</body></html>