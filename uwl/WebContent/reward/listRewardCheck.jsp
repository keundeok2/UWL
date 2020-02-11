<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/fb8ae6e812.js" crossorigin="anonymous"></script>
	<!-- 나눔고딕 -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    
    <style>
        
        div.challDate{
        	text-align: right;
        }
        
        body{
	        font-family: 'Nanum Gothic', sans-serif;
			font-family: 'Noto Sans KR', sans-serif;
        }
        
       /*  div.top{
       		background-color: gray;
        }
        
        #v-pills-tabContent{
        	background-color: blue;
        } */
        /* 포인트들의 내용 */
        .tab-pane {
        	border: 1px solid grey;
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
        
        
        
        
        
    </style>
</head>
<body>
	<div class="container-md">
		
		<div class="col-5">
             <br>
              <h2><i class="fas fa-coins"></i>  포인트 조회</h2>
		</div>
		<div class="row">
		
			<div class="col-3" style="background-color: yellow">빈공간
			</div>
			<div class="col-7">
	             <br>
	             <h3 class="total" align="right" style="background-color: gray;"><i class="fas fa-coins"></i>  5000</h3>
			</div>
			<div class="col-2">
	            <br>
				<h3 class="total" align="right"><i class="fas fa-running"></i>  5000</h3>
			</div>
		</div>
		
		<div class="row">
		  <div class="col-3">
		    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
		      <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true"><i class="fas fa-coins"></i> 포인트 적립내역</a>
		      <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false"><i class="fas fa-credit-card"></i> 포인트 사용내역</a>
		      <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false"><i class="fas fa-running"></i> 활동점수 적립내역</a>
		    </div>
		  </div>
		  <div class="col-9">
		    <div class="tab-content" id="v-pills-tabContent">
		      <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">1</div>
		      <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">2</div>
		      <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">3</div>
		    </div>
		  </div>
		</div>
			
	</div>		
</body>
</html>