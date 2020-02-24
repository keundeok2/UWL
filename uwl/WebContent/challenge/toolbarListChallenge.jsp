<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/fb8ae6e812.js" crossorigin="anonymous"></script>
    <!-- 나눔고딕 -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="/javascript/iscroll.js"></script>
	<script type="text/javascript">
	var myScroll = null;
	
    
    $(function() {
    	
        myScroll = new IScroll('#wrapper', {
            mouseWheel: true,
            scrollbars: true
        });
        
        setTimeout(function() {
    		myScroll.refresh();
    		}, 0);
	});
	</script>
    <style>
        div.challDate {
            text-align: right;
        }

        div.alert {
            background-color: #f4cdad;
            border-color: #f4cdad;
        }

        div.card-body {
            border-color: #ebad7a;
            border: medium;
        }

        div.card-footer {
            background-color: #ebad7a;
            border-color: #ebad7a;
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
        
        /* 도전과제 탭 접근시 초록색으로 변함 */
        .fa-running {
            color: #28aa10;
        }
        
        .out{
        	width: 96%;
        	text-align: center;
        	border: 1px solid black;
        	padding: 20px;
        	margin: 15px;
        }
        
        .in{
        	display: inline-block;
        	width: 80%;
        	border: 1px solid red;
        	height: 300px;
        }
        
        
       .imageOut{
        	width: 96%;
        	text-align: center;
        	border: 1px solid black;
        	padding: 20px;
        	margin: 15px;
        }
        
        .imageIn{
        	display: inline-block;
        	width: 80%;
        	border: 1px solid red;
        	height: 100px;
        } */
        
        
    </style>
</head>

<body>
    <div class="layoutWrap2">
        <div class="leftToolbar2">
            <jsp:include page="/layout/left.jsp" />
        </div>
        <div class="work2" id="wrapper">
        	<ul>
        	<div class="header out">
			    <div class="header in" style="position:relative;">
			        	<h3 style="position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);">김명민김명민김명민김명민김명민김명민김명민김명민김명민</h3> 
			    </div>
			</div>
			
			<div class="header out">
			    <div class="header in">
			        
			    </div>
			</div>
			
        	<div class="header imageOut">
			    <div class="header imageIn">
			        
			    </div>
			</div>
			
			<br>
			<br>
            </ul>
        </div>
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>
</body></html>