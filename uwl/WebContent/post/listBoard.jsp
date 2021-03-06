<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
	
<!-- sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
	
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://kit.fontawesome.com/4b823cf630.js"
	crossorigin="anonymous"></script>
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

        body {
            color: #898989;
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;
        }

        img {
            vertical-align: middle;
        }

        i {
            vertical-align: middle;
        }

        input {
            vertical-align: middle;
        }

        select {
            vertical-align: middle;
        }

        a:hover,
        a:focus {
            text-decoration: none;
        }

        div.wrap {

            width: 1250px;
            margin: 0 auto;
        }

        /*left*/
        div.left {

            width: 270px;
            float: left;
            padding-right: 45px;

        }

        /*left에 로고*/
        div.leftHeader {

            line-height: 55px;
            padding-left: 20px
        }

        /*left에 카테고리*/
        div.left ul {

            font-size: 20px;
            font-weight: bold;
            line-height: 50px;
            padding-left: 15px;
        }

        /*left 카테고리에 아이콘*/
        div.left ul li a i {
            width: 40px;
            text-align: center;

            display: inline-block;
        }

        /*프로필 사진*/
        div.left ul li a i img {
            border-radius: 50%;
            width: 25px;
        }

        div.left>a {
            background-color: #898989;
            display: block;
            line-height: 50px;
            text-align: center;
            font-weight: bold;
            color: #fff;
            border-radius: 30px;
            margin-top: 10px;
        }

        /*main*/
        div.main {
            border-right: 1px solid #ebebeb;
            border-left: 1px solid #ebebeb;
            float: left;
            width: 710px;
            background: rgb(230, 236, 240);
        }

        /*right*/
        div.right {
            float: left;
            width: 270px;
        }

        /*main에 홈*/
        div.mainHeader {

            line-height: 55px;
            font-weight: bold;
            padding-left: 15px;
            padding-right: 15px;
            font-size: 20px;
            width: 100%;
            overflow: hidden;
            border-bottom: 1px solid #ebebeb;
            background-color: #fff;
        }

        div.mainHeader div.left2 {
            width: 50%;
            float: left;
        }

        div.mainHeader div.right2 {
            text-align: right;
            width: 50%;
            float: right;
        }

        div.mainHeader div.right2 i {
            vertical-align: baseline;
        }

        /*정렬, 검색*/
        div.mainTop {

            overflow: hidden;
            padding: 5px 10px 5px;

            background-color: #fff;
            margin-bottom: 10px;
        }

        div.mainTop ul {

            width: 50%;
            float: left;
        }

        div.mainTop ul li {
            float: left;
            margin-right: 15px;
            line-height: 30px;
        }

        div.search {
            width: 50%;
            float: right;

            text-align: right;
        }

        div.search select {

            line-height: 30px;
            height: 30px;
        }

        div.search input {

            border: none;
            border: 1px solid #898989;
            line-height: 30px;
            height: 30px;
            text-indent: 5px;
        }

        div.search a {

            display: inline-block;
            height: 30px;
            line-height: 30px;
            padding: 0 10px;
            border: 1px solid;
            vertical-align: middle;
        }



        div.right {

            padding-left: 20px;
        }

        /*right에 검색*/
        div.search2 {

            position: relative;
            line-height: 55px;
            height: 55px;
        }

        div.search2 input {
            line-height: 40px;
            width: calc(100% - 45px);
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            right: 0;
            background-color: rgb(230, 236, 240);
            border: none;
            border-radius: 0 15px 15px 0;
        }

        div.search2 i {
            position: absolute;
            z-index: 1;
            top: 50%;
            transform: translateY(-50%);
            width: 45px;
            text-align: center;
            background-color: rgb(230, 236, 240);
            height: 40px;
            line-height: 40px;
            border-radius: 15px 0 0 15px;
            left: 0;
        }

        /*right에 친구 목록*/
        div.friendList {
            background-color: rgb(245, 248, 250);
            border-radius: 15px;
            padding: 10px 0 5px;
        }

        div.friendList li:first-child {
            line-height: 30px;
            padding: 0 10px 5px;
            font-weight: bold;
            font-size: 18px;
        }

        div.friendList li:first-child i {

            position: absolute;
            top: 40%;
            transform: translateY(-56%);
            right: 10px;
        }

        div.friendList li {
            line-height: 50px;
            border-bottom: 1px solid rgb(238, 238, 238);
            position: relative;
            font-weight: bold;
        }

        div.friendList li:last-child {
            border: none;
        }

        div.friendList li span:nth-child(1) {
            display: inline-block;
            width: 40px;
            height: 40px;
            vertical-align: middle;
            background-color: lightgray;
            border-radius: 50%;
            margin-right: 10px;
            margin-left: 10px;
        }

        div.friendList li span:nth-child(2) {
            display: inline-block;
            width: 10px;
            height: 10px;
            background-color: lightgreen;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            right: 15px;
            border-radius: 50%;
            
        }

        div.postList {
            padding: 5px;
        }

        div.postList div.post {
            background-color: #fff;
            overflow: hidden;
            
            padding: 10px;
            margin-bottom: 10px;
            box-shadow: 3px 3px 3px #b1b1b1;
            border-radius: 15px;
        }

        div.uploadFile {
            
            width: 30%;
            float: left;
            padding-right: 10px;
            height: 190px;
            overflow: hidden;
        }

        div.uploadFile img {
            width: 100%;
            
        }

        div.post>a>div:nth-child(2) {
            
            width: 70%;
            float: right;
        }

        div.postTop {
            
            overflow: hidden;
            margin-bottom: 10px;
        }

        div.postTop div.postTitle {
            
            width: 80%;
            float: left;
        }

        div.postTitle p {
            display: inline-block;
        }

        div.postTitle p:nth-child(1) {
            font-size: 20px;
            font-weight: bold;
            margin-right: 10px;
            width: 80%;
        }
        div.postTitle p:nth-child(2) {
            vertical-align: top;
        }

        div.postCategory {
            
            display: inline-block;
            float: right;
            width: 20%;
            text-align: right;
        }

        div.postContent {
            
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            /* 라인수 */
            -webkit-box-orient: vertical;
            word-wrap: break-word;
            line-height: 1.2em;
            height: 3.6em;
            /* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
            margin-bottom: 10px;
            
        }
        div.postContent img {
        	display: none;
        }
        
        div.post>a>div:nth-child(2) > div:nth-child(3) p {
            margin-right: 40px;
            display: inline-block;
        }
        div.post > a > div:nth-child(2) {
            
            height: 190px;
            position: relative;
        }
        div.post > a > div:nth-child(2) > div:nth-child(3)  {
            
            position: absolute;
            bottom: 0;
        }
        
        div.wrap{
        	position : relative;
        	
        }
        div.a {
        	width : 60px;
        	height : 60px;
        	background-color: red;
        	border-radius: 50%;
        	position: fixed;
        	bottom: 40px;
        	left : 600px;
        	box-shadow: 3px 3px 5px #868686; 
        	font-size: 30px;
        	text-align: center;
        	line-height: 50px
        }
        
    </style>
<script type="text/javascript">
	    $(document).ready(function(){
	    	
	    	var userId = "${user.userId}";
	    	var gatherCategoryNo = "${gatherCategoryNo}";
	    	var postChallenge = "${postChallenge}";

		 	//도전과제 수행하고 충족시키기 위한 조건 넘기는 부분
		     $.ajax({
				url : "/challenge/rest/completePostChallenge",
				method : "POST",
				dataType : "json",
				// postCategoryNo 는 사실 challenge 판단이었던거임 ㅋㅋ 1이면 레프트에서 2면 add에서
				data : JSON.stringify({
					userId: userId,
					gatherCategoryNo : gatherCategoryNo,
					postCategoryNo : postChallenge
				}),
				headers : {
    				"Accept" : "application/json",
    				"content-Type" : "application/json"
    			},
    			success : function(data){
    				
    				var challReward = data.challenge.challReward;
    				completeResult = data.completeResult;
    				//alert("ajax가동중")
    				if (postChallenge == '2') {
	    				if (completeResult == true) {
		    							Swal.fire({
			    						  title: '축하합니다! ' + challReward + " 점 획득!",
			    						  width: 600,
			    						  padding: '3em',
			    						  backdrop: `
			    						    rgba(0,0,123,0.4)
			    						    url("/images/Congratulation-cat.gif")
			    						    center top
			    						    no-repeat
			    						  `
			    						})
						}
					}
    				
    				
    			},
    			error : function(){
    				//alert("에러가 발생");
    				//alert("님아 에러임 ㅋㅋuserID : " + userId+ "gatherCategoryNo : " + gatherCategoryNo+" postChallenge: " + postChallenge);
    			}
					
			}) //challenge   
	    	
	    	$('.a').on("click", function(){
	    		var gatherCategoryNo = ${gatherCategoryNo};
	    		self.location = "/post/addBoard?gatherCategoryNo="+gatherCategoryNo + "&postChallenge=2";
	    	});
	    	
	    	$('.post').on("click", function(){
	    		var postNo = $(this).children().find('.postNo').val();
	    		self.location = "/post/getBoard?postNo="+postNo;
	    	});
	    });
    </script>

</head>
<body>
<form>
	
	<div class="mainHeader">
                <div class="left2" style="color: #d75e0f;">
                    <c:if test="${gatherCategoryNo eq '201' }">
    					<h1><i class="fas fa-graduation-cap"></i> 진학상담</h1>
    				</c:if>
				    <c:if test="${gatherCategoryNo eq '202' }">
				    	<h1><i class="fas fa-heart"></i> 사랑과 이별 <i class="fas fa-heart-broken"></i></h1>
				    </c:if>
				    <c:if test="${gatherCategoryNo eq '203' }">
				    	<h1><i class="fas fa-male"></i> 남자끼리</h1>
				    </c:if>
				    <c:if test="${gatherCategoryNo eq '204' }">
				    	<h1><i class="fas fa-female"></i> 여자끼리</h1>
				    </c:if>
				    <c:if test="${gatherCategoryNo eq '205' }">
				    	<h1><i class="far fa-kiss-wink-heart"></i>데이트 자랑</h1>
				    </c:if>
				    <c:if test="${gatherCategoryNo eq '206' }">
				    	<h1><i class="fas fa-bullhorn"></i> 대나무 숲</h1>
				    </c:if>
                </div>
                <div class="right2">
                    <a href="#"><i class="far fa-star"></i></a>
                </div>
            </div>
            <div class="mainTop">
                <ul>
                    <li><a href="#">조회수 <i class="fas fa-arrow-up"></i></a></li>
                    <li><a href="#">좋아요 <i class="fas fa-arrow-up"></i></a></li>
                    <li><a href="#">작성일 <i class="fas fa-arrow-up"></i></a></li>
                </ul>
                <div class="search">
                    <select name="" id="">
                        <option value="">내용</option>
                        <option value="">제목</option>
                        <option value="">제목 + 내용</option>
                        <option value="">작성자</option>
                    </select>
                    <input type="text" placeholder="내용을 입력해주세요">
                    <a href="#">검색</a>
                </div>
            </div>
            
            <div class="postList">
            
            <c:forEach var="post" items="${list }">
                <div class="post">
                <a href="#">
                        <div class="uploadFile">
                        	<img src="/images/${post.uploadFileName}" alt="" style='border-radius: 10px;'>
                        </div>
                        <div>
                            <div class="postTop">
                                <div class="postTitle">
                                    <p>${post.postTitle }</p>
                                    <p>${post.user.nickname }</p>
                                </div>
                                <div class="postCategory">
                                     <c:if test="${gatherCategoryNo eq '201' }">
    									<i class="fas fa-graduation-cap"></i> 진학상담
    								</c:if>
								    <c:if test="${gatherCategoryNo eq '202' }">
								    	<i class="fas fa-heart"></i> 사랑과 이별 <i class="fas fa-heart-broken"></i>
								    </c:if>
								    <c:if test="${gatherCategoryNo eq '203' }">
								    	<i class="fas fa-male"></i> 남자끼리
								    </c:if>
								    <c:if test="${gatherCategoryNo eq '204' }">
								    	<i class="fas fa-female"></i> 여자끼리
								    </c:if>
								    <c:if test="${gatherCategoryNo eq '205' }">
								    	<i class="far fa-kiss-wink-heart"></i>데이트 자랑
								    </c:if>
								    <c:if test="${gatherCategoryNo eq '206' }">
								    	<i class="fas fa-bullhorn"></i> 대나무 숲
								    </c:if>
                                    <p>${post.postDate }</p>
                                </div>
                            </div>
                            <div class="postContent">
                                ${post.postContent }
                            </div>
                            <div>
                                <p><i class="far fa-comment"></i> ${post.commentCount }</p>
                                <p><i class="far fa-eye"></i> ${post.hitCount }</p>
                                <p><i class="far fa-heart"></i> ${post.likeCount }</p>
                            </div>
                        </div>
                        <input type="hidden" class="postNo" value="${post.postNo }">
                        </a>
                </div>
             </c:forEach>
                </div>
                
                
            <div class="a"><i class="fas fa-pencil-alt"></i></div>
            </div>
            
            
            
    </form>
</body>
</html>