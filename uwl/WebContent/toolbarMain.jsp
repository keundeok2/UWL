<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="shortcut icon" href="/images/favicon1.ico" type="image/x-icon">
    <link rel="icon" href="/images/favicon1.ico" type="image/x-icon">
    <title>어울림</title>
    <style type="text/css">
    	@font-face { font-family: 'GmarketSansMedium'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff'); font-weight: normal; font-style: normal; }
    	* {
            font-family: 'GmarketSansMedium';
        }
    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--  CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
    <script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/4b823cf630.js" crossorigin="anonymous"></script>
    <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-messaging.js"></script>
    
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










        /* --------------------------------------------------------------형진 추가 css---------------------------------------- */
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



        /*left*/


        /*left에 로고*/


        /*left에 카테고리*/


        /*left 카테고리에 아이콘*/


        /*프로필 사진*/




        /*main*/


        /*right*/


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





        /*right에 검색*/






        /*right에 친구 목록*/














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

        div.post>a>div:nth-child(2)>div:nth-child(3) p {
            margin-right: 40px;
            display: inline-block;
        }

        div.post>a>div:nth-child(2) {

            height: 190px;
            position: relative;
        }

        div.post>a>div:nth-child(2)>div:nth-child(3) {

            position: absolute;
            bottom: 0;
        }

        div.wrap {
            position: relative;

        }

        div.a {
            width: 60px;
            height: 60px;
            background-color: red;
            border-radius: 50%;
            position: fixed;
            bottom: 40px;
            left: 600px;
            box-shadow: 3px 3px 5px #868686;
            font-size: 30px;
            text-align: center;
            line-height: 50px
        }

        /* --------------------------------------------------------------형진 추가 css---------------------------------------- */

    </style>

    <script type="text/javascript">
    var myScroll = null;
    var myScroll2 = null;
    
    $(function() {
    	
        myScroll = new IScroll('#wrapper', {
            mouseWheel: true,
            scrollbars: true
        });
        
        setTimeout(function() {
    		myScroll.refresh();
    	}, 0);
        
        myScroll2 = new IScroll('#wrapper2', {
            mouseWheel: true,
            scrollbars: true
        });
        
        setTimeout(function() {
        	console.log("myScroll2 refresh");
    		myScroll2.refresh();
    	}, 0);
    });
    
    
    	
	//////////////// FCM /////////////////
	const firebaseModule = (function () {
	    async function init() {
	        // Your web app's Firebase configuration
	        if ('serviceWorker' in navigator) {
	            window.addEventListener('load', function() {
	                navigator.serviceWorker.register('/javascript/firebase-messaging-sw.js')
	                    .then(registration => {
	                        var firebaseConfig = {
	                        		apiKey: "AIzaSyCP7-9lifICjBrXx38qVaYolWTYChiy9nU",
	                        	    authDomain: "webuwl.firebaseapp.com",
	                        	    databaseURL: "https://webuwl.firebaseio.com",
	                        	    projectId: "webuwl",
	                        	    storageBucket: "webuwl.appspot.com",
	                        	    messagingSenderId: "379855395449",
	                        	    appId: "1:379855395449:web:ef47774cfc1627f914d2a8",
	                        	    measurementId: "G-YJ4JNNVF8T"
	                        };
	                        // Initialize Firebase
	                        firebase.initializeApp(firebaseConfig);


	                        // Show Notificaiton Dialog
	                        const messaging = firebase.messaging();
	                        messaging.requestPermission()
	                        .then(function() {
	                        	console.log('Have permission.');
	                            return messaging.getToken();
	                        })
	                        .then(async function(token) {
	                            await fetch('/user/rest/register', { method: 'post', body: token })
	                            messaging.onMessage(payload => {
	                                const title = payload.notification.title
	                                const options = {
	                                    body : payload.notification.body
	                                }
	                                navigator.serviceWorker.ready.then(registration => {
	                                    registration.showNotification(title, options);
	                                })
	                            })
	                        })
	                        .catch(function(err) {
	                            console.log("Error Occured");
	                        })
	                        
	                    })
	            })
	        }
	    }      

	    return {
	        init: function () {
	            init()
	        }
	    }
	})()

	firebaseModule.init();
    
        $(document).ready(function() {
            $('.post').on("click", function() {
                var postNo = $(this).children().find('.postNo').val();
                self.location = "/post/getBoard?postNo=" + postNo;
            });
        });

    </script>

    <style>
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
            border: 1px solid #eee;
            background: #fff;
        }
        
        a#home {
        	color: #EBAD7A;
        }

        div.rightToolbar {
            width: 20%;
            height: 100vh;

            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            border: 1px solid #eee;
            background: #fff;
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
            <form>
                <div class="mainHeader">
                    <div class="left2">
                        홈
                    </div>
                    <div class="right2">
                        <a href="#"><i class="far fa-star"></i></a>
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
            </form>
            </ul>
        </div>
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>
</body>

</html>
