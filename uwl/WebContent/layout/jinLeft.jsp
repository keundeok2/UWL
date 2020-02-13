<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    

    <style>
        div {
            max-height: 0;
            background-color: aliceblue;
            transition: all 0.1s;
            overflow: hidden;
        }

        div.on {
            transition: all 1s;
            max-height: 500px;
        }

        .img {
            margin: -5px;
        }

        a:hover {
            text-decoration: none;
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
    <br>
    <h4><a id="master" href="#">&nbsp;<i class="fas fa-crown"></i>&nbsp;&nbsp;관리자<i class="fas fa-caret-down"></i></a></h4>
    <div id="goMaster">
        <ul>
            <li>
                <h6><a href="#" id="userList">전체회원 목록</a></h6>
            </li>
            <li>
                <h6><a href="#" id="challengeControl">도전과제 관리</a></h6>
            </li>
            <li>
                <h6><a href="#" id="reportList">신고목록 확인</a></h6>
            </li>
        </ul>
    </div>

    <br><br>

    <h4><a id="home" href="#">&nbsp;<i class="fas fa-home"></i>&nbsp;&nbsp;홈</a></h4>

    <br><br>

    <h4 class="img"><a id="myProfile" href="#">&nbsp;
            <%-- <c:if test="${user.profileName eq null}">
                <img src='/images/defaultProfile.png' style='border-radius: 50%;' width='35px' height='35px' />
            </c:if>
            <c:if test="${user.profileName ne null}">
                <img src='/images/${user.profileName }' style='border-radius: 50%;' width='35px' height='35px' />
            </c:if> --%>
            내 프로필
        </a></h4>


    <br><br>
    <h4><a id="community" href="#">&nbsp;<i class="far fa-list-alt"></i>&nbsp;&nbsp;커뮤니티<i class="fas fa-caret-down"></i></a></h4>
    <div id="goCommunity">
        <ul>
            <li>
                <h6><a href="#" id="201">진학상담</a></h6>
            </li>
            <li>
                <h6><a href="#" id="202">사랑과 이별</a></h6>
            </li>
            <li>
                <h6><a href="#" id="203">남자끼리</a></h6>
            </li>
            <li>
                <h6><a href="#" id="204">여자끼리</a></h6>
            </li>
            <li>
                <h6><a href="#" id="205">데이트자랑</a></h6>
            </li>
            <li>
                <h6><a href="#" id="206">대나무 숲</a></h6>
            </li>
        </ul>
    </div>

    <br><br>

    <h4><a id="challenge" href="#">&nbsp;<i class="fas fa-running"></i>&nbsp;&nbsp;도전과제<i class="fas fa-caret-down"></i></a></h4>
    <div id="goChallenge">
        <ul>
            <li>
                <h6><a href="#" id="doChallenge">진행중인 도전과제</a></h6>
            </li>
            <li>
                <h6><a href="#" id="completeChallenge">완료한 도전과제</a></h6>
            </li>
            <li>
                <h6><a href="#" id="checkSchoolRanking">학교별 랭킹</a></h6>
            </li>
        </ul>
    </div>

    <br><br>

    <h4><a id="more" href="#">&nbsp;<i class="fas fa-plus"></i>&nbsp;&nbsp;더보기<i class="fas fa-caret-down"></i></a></h4>
    <div id="goMore">
        <ul>
            <li>
                <h6><a href="#" id="notice">공지사항</a></h6>
            </li>
            <li>
                <h6><a href="#" id="question">문의사항</a></h6>
            </li>
        </ul>
    </div>

</body>

</html>
