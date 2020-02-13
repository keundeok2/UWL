<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!--  jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- bootstrap 4.4 CDN -->
	<link
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		rel="stylesheet">
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<!-- jQuery Redirect CDN     https://github.com/mgalante/jquery.redirect  -->
	<script
		src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
	<!-- Modal Alert https://github.com/PureOpenSource/pureAlert  -->
	<script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
    
    <link rel="stylesheet" href="/css/jaeiCommon.css">
        <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    
    <script type="text/javascript">
    	var sessionUserId = "${user.userId}";
    	
    	$(function() {
    		rightLoad();
    	})
    	
    	//	우측툴바 load 
    	function rightLoad() {
    		$.ajax({
    			url : "/friend/rest/getFriendListForSearch",
    			method : "POST",
    			headers : {
    				"Accept" : "application/json",
    				"Content-Type" : "application/json"
    			},
    			data : JSON.stringify({
    				userId : sessionUserId
    			}),
    			success : function(d) {
    				for (var i = 0; i < d.list.length; i++) {
    					var html = "<li><a href='#'><img src='/images/"+d.list[i].profileName+"'>"+d.list[i].name+"<span></span></a>"
    					+"<input type='hidden' value='"+d.list[i].userId+"'></li>";
    					$(html).appendTo("div.friendList ul");
    				}
    			}
    		})
		}
    	
    	
    	//	우측툴바 프로필 이동 event
    	$(document).on("click", "div.friendList ul li a", function() {
			var targetUserId = $(this).next().val();
			console.log("targetUserId", targetUserId);
			
			$.redirect("/userrr/getProfile/"+targetUserId+"",{}, "GET");
		});
		
		//	우측툴바 검색 event
		$(document).on("keypress", "div.search2 input", function(e) {
			var searchKeyword = $(this).val();
			var searchCondition = $(this).next().val();
			if (e.which == 13) {
				console.log("searchKeyword", searchKeyword);
				if (searchKeyword == null || searchKeyword.length < 1 ) {
					alert("검색어를 입력해주세요");
					return;
				}
				
				$.redirect("/friend/getSearchFriendList", {searchCondition : searchCondition, searchKeyword : searchKeyword, userId : sessionUserId})
				
			}
		});
		
		$(document).on("click", "div.friendList ul i", function() {
			$("div#askedFriendModal").modal();
			
			$.ajax({
				url : "/friend/rest/getAskedList",
				method : "POST",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					
				}),
				success : function(d) {
					$("div.addAskedFriendData").remove();
					for (var i = 0; i < d.list.length; i++) {
					var addData = "<div id='"+d.list[i].userId+"' class='row addAskedFriendData'>"+
										"<div class='col-sm-1'><img src='../../images/"+d.list[i].profileName+"'/></div>"+
										 "<div class='col-sm-7'> &nbsp; "+d.list[i].name+" &nbsp; "+d.list[i].schoolName+" &nbsp;</div>"+
										 "<div class='col-sm-4 addTarget"+d.list[i].userId+"'><button type='button' class='btn btn-primary btn"+d.list[i].userId+"' id='acceptModalButton'>수락</button>"+
										 "<button type='button' class='btn btn-danger btn"+d.list[i].userId+"' id='deleteModalButton'>거절</button></div>"+
										 "<input type='hidden' value='"+d.list[i].userId+"'/>"+
									"</div>";
					
					$(addData).appendTo("div.addAskedFriendTarget");
					}
				}
		});
		})
		
		$(document).on("click", "#acceptModalButton", function() {
			var userId = $(this).parent().next().val();
			console.log("userId", userId);
			
			$.ajax({
				url : "/friend/rest/acceptFriend",
				method : "POST",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					firstUserId : sessionUserId,
					secondUserId : userId
				}),
				success : function() {
					var html = "<button type='button' class='btn btn-success'>친구</button>";
					$(html).appendTo("div.addTarget"+userId+"");
					$(".btn"+userId+"").remove();
					$("div.friendList ul").html("");
					
					var li = "<li>친구 목록<i class='fas fa-cog'></i></li>";
					$(li).appendTo("div.friendList ul");
					rightLoad();
					
				}
			})
		});
		
		
		$(document).on("click", "#deleteModalButton", function() {
			var userId = $(this).parent().next().val();
			
			$.ajax({
				url : "/friend/rest/deleteFriend",
				method : "POST",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					firstUserId : sessionUserId,
					secondUserId : userId
				}),
				success : function() {
					var html = "<button type='button' class='btn btn-secondary'>거절됨</button>";
					$(html).appendTo("div.addTarget"+userId+"");
					$(".btn"+userId+"").remove();
					
				}
			})
		
		});
		
		
    	
    </script>
    
    
    
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
        
        div.friendList li img {
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
        div.addAskedFriendData img {
        	width : 60px;
        	height : 60px;
        	border-radius: 30px;
        }
        
        div.addAskedFriendData div {
        	text-align: center;
        	line-height: 70px;
        }
        div.modal-content {
        	width: 510px;
        }
        div.modal-body {
        	max-height: 500px;
            overflow-y: auto;
            /* prevent horizontal scrollbar */
            overflow-x: hidden;
            /* add padding to account for vertical scrollbar */
            padding-right: 20px;
        }
    </style>
    

<title>어울림</title>
</head>
<body>
    <div class="wrap">
        <div class="left">
            <div class="leftHeader">
                <img src="/images/twitter_header_photo_1-removebg-preview.png" width="100px" alt="">
            </div>
            <ul>
                <li><a href="#"><i class="fas fa-home"></i>홈</a></li>
                <li><a href="#"><i class="fas fa-hashtag"></i>탐색하기</a></li>
                <li><a href="#"><i class="far fa-bell"></i>알림</a></li>
                <li><a href="#"><i class="far fa-envelope"></i>쪽지</a></li>
                <li><a href="#"><i class="far fa-bookmark"></i>북마크</a></li>
                <li><a href="#"><i class="far fa-list-alt"></i>리스트</a></li>
                <li><a href="#"><i><img src="/images/53065670_571595999990071_7493030765286916096_o.jpg" width="40px" alt=""></i>프로필</a></li>
                <li><a href="#"><i class="fas fa-ellipsis-h"></i>더보기</a></li>
            </ul>
            <a href="#">게시글 등록</a>
        </div>
        <div class="main">
            <div class="mainHeader">
                <div class="left2">
                    홈
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
                <div class="post">
                    <a href="#">
                        <div class="uploadFile">
                            <img src="" alt="">
                        </div>
                        <div>
                            <div class="postTop">
                                <div class="postTitle">
                                    <p>제목제목제목</p>
                                    <p>주형진</p>
                                </div>
                                <div class="postCategory">
                                    <p>남자들끼리만</p>
                                    <p>3분전</p>
                                </div>
                            </div>
                            <div class="postContent">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat facilis doloremque, minima, adipisci eius perferendis alias ipsam commodi inventore quasi nemo corporis repellendus sequi officiis, excepturi rerum unde sapiente. Sequi.
                            </div>
                            <div>
                                <p><i class="far fa-comment"></i> 댓글수</p>
                                <p><i class="far fa-eye"></i> 조회수</p>
                                <p><i class="far fa-heart"></i> 좋아요수</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="post">
                    <a href="#">
                        <div class="uploadFile">
                            <img src="/images/20191231507059.jpg" alt="">
                        </div>
                        <div>
                            <div class="postTop">
                                <div class="postTitle">
                                    <p>제목제목제목제목제목제목제목제목제목제목제목제목제목제목</p>
                                    <p>주형진</p>
                                </div>
                                <div class="postCategory">
                                    <p>남자들끼리만</p>
                                    <p>3분전</p>
                                </div>
                            </div>
                            <div class="postContent">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat facilis doloremque, minima, adipisci eius perferendis alias ipsam commodi inventore quasi nemo corporis repellendus sequi officiis, excepturi rerum unde sapiente. Sequi.
                            </div>
                            <div>
                                <p><i class="far fa-comment"></i> 댓글수</p>
                                <p><i class="far fa-eye"></i> 조회수</p>
                                <p><i class="far fa-heart"></i> 좋아요수</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="post">
                    <a href="#">
                        <div class="uploadFile">
                            <img src="" alt="">
                        </div>
                        <div>
                            <div class="postTop">
                                <div class="postTitle">
                                    <p>제목제목제목</p>
                                    <p>주형진</p>
                                </div>
                                <div class="postCategory">
                                    <p>남자들끼리만</p>
                                    <p>3분전</p>
                                </div>
                            </div>
                            <div class="postContent">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat facilis doloremque, minima, adipisci eius perferendis alias ipsam commodi inventore quasi nemo corporis repellendus sequi officiis, excepturi rerum unde sapiente. Sequi.
                            </div>
                            <div>
                                <p><i class="far fa-comment"></i> 댓글수</p>
                                <p><i class="far fa-eye"></i> 조회수</p>
                                <p><i class="far fa-heart"></i> 좋아요수</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="post">
                    <a href="#">
                        <div class="uploadFile">
                            <img src="" alt="">
                        </div>
                        <div>
                            <div class="postTop">
                                <div class="postTitle">
                                    <p>제목제목제목</p>
                                    <p>주형진</p>
                                </div>
                                <div class="postCategory">
                                    <p>남자들끼리만</p>
                                    <p>3분전</p>
                                </div>
                            </div>
                            <div class="postContent">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat facilis doloremque, minima, adipisci eius perferendis alias ipsam commodi inventore quasi nemo corporis repellendus sequi officiis, excepturi rerum unde sapiente. Sequi.
                            </div>
                            <div>
                                <p><i class="far fa-comment"></i> 댓글수</p>
                                <p><i class="far fa-eye"></i> 조회수</p>
                                <p><i class="far fa-heart"></i> 좋아요수</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="post">
                    <a href="#">
                        <div class="uploadFile">
                            <img src="" alt="">
                        </div>
                        <div>
                            <div class="postTop">
                                <div class="postTitle">
                                    <p>제목제목제목</p>
                                    <p>주형진</p>
                                </div>
                                <div class="postCategory">
                                    <p>남자들끼리만</p>
                                    <p>3분전</p>
                                </div>
                            </div>
                            <div class="postContent">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat facilis doloremque, minima, adipisci eius perferendis alias ipsam commodi inventore quasi nemo corporis repellendus sequi officiis, excepturi rerum unde sapiente. Sequi.
                            </div>
                            <div>
                                <p><i class="far fa-comment"></i> 댓글수</p>
                                <p><i class="far fa-eye"></i> 조회수</p>
                                <p><i class="far fa-heart"></i> 좋아요수</p>
                            </div>
                        </div>
                    </a>
                </div>

            </div>
        </div>
        <div class="right">
            <div class="search2">
                <i class="fas fa-search"></i><input type="text" placeholder="이름으로 검색">
                <select class="custom-select mr-sm-2" id="inlineFormCustomSelect" name="searchCondition">
			        <option value="0" ${search.searchCondition == 0 ? "selected" : "" }>아이디</option>
			        <option value="1" ${search.searchCondition == 1 ? "selected" : "" }>이름</option>
			        <option value="2" ${search.searchCondition == 2 ? "selected" : "" }>학교명</option>
				</select>
            </div>
            <div class="friendList">
                <ul>
                    <li>친구 목록<i class="fas fa-cog"></i></li>
                </ul>
            </div>
        </div>
    </div>
    
<!-- Right AskedFriend Modal -->
<div class="modal fade" id="askedFriendModal" tabindex="-1" role="dialog" aria-labelledby="askedFriendModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <p class="modal-title" id="askedFriendModalLabel">친구 요청</p>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="row">
      	<div class="col-sm-12 addAskedFriendTarget">
      	
        </div>
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
    
    
    
</body></html>