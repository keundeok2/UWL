<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/4b823cf630.js" crossorigin="anonymous"></script>
    

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
            color: inherit;
            text-decoration: none;
        }
        body {
            color: #333;
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
font-family: 'Nanum Gothic', sans-serif;
        }
        div.leftLayout {
            
            margin-top: 20px;
            margin-left: 20px
        }
        div.leftLayout h4 {
            
            font-size: 20px;
            font-weight: bold;
        }
        div.leftLayout h4 a {
            
            display: inline-block;
            line-height: 45px;
            border-radius: 20px;
            padding: 0 10px;
            transition: all 0.1s;
        }
        div.leftLayout h4 a:hover {
            background-color: rgba(235, 173, 122, 0.1);
            color: #EBAD7A;
        }
        div.leftLayout h4 a i {
            font-size: 25px;
            vertical-align: -2px;
            
            display: inline-block;
            width: 30px;
            text-align: center;
            margin-right: 10px;
        }
        
        div.leftLayout h4 a i:nth-child(3) {
            
            font-size: 20px;
            vertical-align: baseline;
            
            width: auto;
        }
        div.leftLayout > div:nth-child(1) {
            padding: 0 0 15px;
            position: relative;
        }
        div.leftLayout > div:nth-child(1) > img {
            
        }
        div.leftLayout > div:nth-child(1) a img {
            position: absolute;
            top: 0;
            left: 0;
            transition: all 0.3s;
        }
        div.leftLayout > div:nth-child(1) a:hover img {
            transform: scale(1.2);
            opacity: 0.3;
        }
        
        div.leftLayout > div:nth-child(n + 2) {
            
            text-indent: 55px;
            max-height: 0;
            overflow: hidden;
            font-weight: bold;
            transition: all 0.1s;
        }
        div.leftLayout > div.on {
            transition : all 1s;
            max-height: 500px;
        }
        div.leftLayout > div ul li h6 a {
            font-weight: bold;
            transition: all 0.1s;
        }
        div.leftLayout > div ul li h6 a:hover {
            color: #EBAD7A;
        }
        a#myProfile img {
            
            width: 30px;
            margin-right: 10px
        }
    </style>

    <script>
        $(document).ready(function() {


            //밑으로 내려오는 이벤트들
            $('#master').on('mouseenter', function() {
                $('#goMaster').addClass('on');
                $('#master').find('i:nth-child(2)').removeClass('fa-caret-down').addClass('fa-caret-up');
            });
            $('#master').on('mouseleave', function() {
                $('#goMaster').removeClass('on');
                $('#master').find('i:nth-child(2)').removeClass('fa-caret-up').addClass('fa-caret-down');
                $('#goMaster').on('mouseenter', function() {
                    $('#goMaster').addClass('on');
                    $('#master').find('i:nth-child(2)').removeClass('fa-caret-down').addClass('fa-caret-up');
                });
                $('#goMaster').on('mouseleave', function() {
                    $('#goMaster').removeClass('on');
                    $('#master').find('i:nth-child(2)').removeClass('fa-caret-up').addClass('fa-caret-down');
                });
            });
            $('#community').on('mouseenter', function() {
                $('#goCommunity').addClass('on');
                $('#community').find('i:nth-child(2)').removeClass('fa-caret-down').addClass('fa-caret-up');
            });
            $('#community').on('mouseleave', function() {
                $('#goCommunity').removeClass('on');
                $('#community').find('i:nth-child(2)').removeClass('fa-caret-up').addClass('fa-caret-down');
                $('#goCommunity').on('mouseenter', function() {
                    $('#goCommunity').addClass('on');
                    $('#community').find('i:nth-child(2)').removeClass('fa-caret-down').addClass('fa-caret-up');
                });
                $('#goCommunity').on('mouseleave', function() {
                    $('#goCommunity').removeClass('on');
                    $('#community').find('i:nth-child(2)').removeClass('fa-caret-up').addClass('fa-caret-down');
                });
            });
            $('#challenge').on('mouseenter', function() {
                $('#goChallenge').addClass('on');
                $('#challenge').find('i:nth-child(2)').removeClass('fa-caret-down').addClass('fa-caret-up');
            });
            $('#challenge').on('mouseleave', function() {
                $('#goChallenge').removeClass('on');
                $('#challenge').find('i:nth-child(2)').removeClass('fa-caret-up').addClass('fa-caret-down');
                $('#goChallenge').on('mouseenter', function() {
                    $('#goChallenge').addClass('on');
                    $('#challenge').find('i:nth-child(2)').removeClass('fa-caret-down').addClass('fa-caret-up');
                });
                $('#goChallenge').on('mouseleave', function() {
                    $('#goChallenge').removeClass('on');
                    $('#challenge').find('i:nth-child(2)').removeClass('fa-caret-up').addClass('fa-caret-down');
                });
            });
            $('#more').on('mouseenter', function() {
                $('#goMore').addClass('on');
                $('#more').find('i:nth-child(2)').removeClass('fa-caret-down').addClass('fa-caret-up');
            });
            $('#more').on('mouseleave', function() {
                $('#goMore').removeClass('on');
                $('#more').find('i:nth-child(2)').removeClass('fa-caret-up').addClass('fa-caret-down');
                $('#goMore').on('mouseenter', function() {
                    $('#goMore').addClass('on');
                    $('#more').find('i:nth-child(2)').removeClass('fa-caret-down').addClass('fa-caret-up');
                });
                $('#goMore').on('mouseleave', function() {
                    $('#goMore').removeClass('on');
                    $('#more').find('i:nth-child(2)').removeClass('fa-caret-up').addClass('fa-caret-down');
                });
            });
        });


        $(document).ready(function() {
            //마우스가 엔터되는 모든 것들

            /*	$('#master').on("mouseenter", function(){
        		console.log('들어왔다.')
        	});
        	$('#master').on('mouseleave', function(){
        		console.log('나왔다')
        	});
        	
        	$('#home').on("mouseenter", function(){
        		console.log('들어왔다')
        	});
        	$('#home').on('mouseleave', function(){
        		console.log('나왔다')
        	});
        	
        	$('#myProfile').on("mouseenter", function(){
        		console.log('들어왔다')
        	});
        	$('#myProfile').on('mouseleave', function(){
        		console.log('나왔다')
        	});
        	
        	$('#community').on("mouseenter", function(){
        		console.log('들어왔다')
        	});
        	$('#community').on('mouseleave', function(){
        		console.log('나왔다')
        	});
        	
        	$('#challenge').on("mouseenter", function(){
        		console.log('들어왔다')
        	});
        	$('#challenge').on('mouseleave', function(){
        		console.log('나왔다')
        	});
        	
        	$('#more').on("mouseenter", function(){
        		console.log('들어왔다')
        	});
        	$('#more').on('mouseleave', function(){
        		console.log('나왔다')
        	}); */


            //실제로 들어갈 수 있는 경로
            $("#userList").on("click", function() { //전체 회원 목록
                $(location).attr('href', "#");
            });

            $("#challengeControl").on("click", function() { //도전과제 관리
                $(location).attr('href', "#");
            });

            $("#reportList").on("click", function() { //신고목록
                $(location).attr('href', "/report/listReport");
            });

            $("#home").on("click", function() { // 홈
                $(location).attr('href', "#");
            });

            $("#myProfile").on("click", function() { //내 프로필
                $(location).attr('href', "#");
            });

            $("#201").on("click", function() { //진학상담
                $(location).attr('href', "/post/listBoard?gatherCategoryNo=201");
            });
            $("#202").on("click", function() { //사랑과 이별
                $(location).attr('href', "/post/listBoard?gatherCategoryNo=202");
            });
            $("#203").on("click", function() { //남자끼리
                $(location).attr('href', "/post/listBoard?gatherCategoryNo=203");
            });
            $("#204").on("click", function() { //여자끼리
                $(location).attr('href', "/post/listBoard?gatherCategoryNo=204");
            });
            $("#205").on("click", function() { //데이트 자랑
                $(location).attr('href', "/post/listBoard?gatherCategoryNo=205");
            });
            $("#206").on("click", function() { //대나무 숲
                $(location).attr('href', "/post/listBoard?gatherCategoryNo=206");
            });
            $("#doChallenge").on("click", function() { //진행중인 도전과제
                $(location).attr('href', "#");
            });
            $("#completeChallenge").on("click", function() { //완료한 도전과제
                $(location).attr('href', "#");
            });
            $("#checkSchoolRanking").on("click", function() { //학교별 랭킹
                $(location).attr('href', "#");
            });
            $("#notice").on("click", function() { //공지사항
                $(location).attr('href', "/post/listNotice");
            });
            $("#question").on("click", function() { //문의사항
                $(location).attr('href', "#");
            });
        });

    </script>
</head>

<body>

    <div class="leftLayout">
       <div class="logo">
          <img src="/images/twitter_header_photo_1-removebg-preview.png" width="100px" class="hiddenLogo" alt="">
           <a href="#">
           <img src="/images/twitter_header_photo_1-removebg-preview.png" width="100px" alt="">
           </a>
       </div>
        <h4>
            <a id="master" href="#">
                <i class="fas fa-crown"></i>
                <span>관리자</span>
                <i class="fas fa-caret-down"></i>
            </a>
        </h4>
        <div id="goMaster">
            <ul>
                <li>
                    <h6>
                        <a href="#" id="userList">전체회원 목록</a>
                    </h6>
                </li>
                <li>
                    <h6>
                        <a href="#" id="challengeControl">도전과제 관리</a>
                    </h6>
                </li>
                <li>
                    <h6>
                        <a href="#" id="reportList">신고목록 확인</a>
                    </h6>
                </li>
            </ul>
        </div>
        
        
        
        <h4>
            <a id="home" href="#">
                <i class="fas fa-home"></i>
                <span>홈</span>
            </a>
        </h4>
        
        
        
        <h4 class="img">
            <a id="myProfile" href="#">
                <c:if test="${user.profileName eq null}">
                    <img src='/images/82910903_472735640087912_4282852221812207623_n(1).jpg' style='border-radius: 50%;' width='35px'  />
                </c:if>
                <c:if test="${user.profileName ne null}">
                    <img src='/images/${user.profileName }' style='border-radius: 50%;' width='35px' height='35px' />
                </c:if>
                <span>내 프로필</span>
            </a>
        </h4>
        
        
        
        <h4>
            <a id="community" href="#">
                <i class="far fa-list-alt"></i>
                <span>커뮤니티</span>
                <i class="fas fa-caret-down"></i>
            </a>
        </h4>
        <div id="goCommunity">
            <ul>
                <li>
                    <h6>
                        <a href="#" id="201">진학상담</a>
                    </h6>
                </li>
                <li>
                    <h6>
                        <a href="#" id="202">사랑과 이별</a>
                    </h6>
                </li>
                <li>
                    <h6>
                        <a href="#" id="203">남자끼리</a>
                    </h6>
                </li>
                <li>
                    <h6>
                        <a href="#" id="204">여자끼리</a>
                    </h6>
                </li>
                <li>
                    <h6>
                        <a href="#" id="205">데이트자랑</a>
                    </h6>
                </li>
                <li>
                    <h6>
                        <a href="#" id="206">대나무 숲</a>
                    </h6>
                </li>
            </ul>
        </div>
        
        
        
        <h4><a id="challenge" href="#">
                <i class="fas fa-running"></i>
                <span>도전과제</span>
                <i class="fas fa-caret-down"></i>
            </a>
        </h4>
        <div id="goChallenge">
            <ul>
                <li>
                    <h6>
                        <a href="#" id="doChallenge">진행중인 도전과제</a>
                    </h6>
                </li>
                <li>
                    <h6>
                        <a href="#" id="completeChallenge">완료한 도전과제</a>
                    </h6>
                </li>
                <li>
                    <h6>
                        <a href="#" id="checkSchoolRanking">학교별 랭킹</a>
                    </h6>
                </li>
            </ul>
        </div>
        
        
        
        <h4>
            <a id="more" href="#">
                <i class="fas fa-plus"></i>
                <span>더보기</span>
                <i class="fas fa-caret-down"></i>
            </a>
        </h4>
        <div id="goMore">
            <ul>
                <li>
                    <h6>
                        <a href="#" id="notice">공지사항</a>
                    </h6>
                </li>
                <li>
                    <h6>
                        <a href="#" id="question">문의사항</a>
                    </h6>
                </li>
            </ul>
        </div>
    </div>

</body>

</html>
