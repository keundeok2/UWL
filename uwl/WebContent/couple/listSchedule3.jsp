<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/css/jquery-ui.css">
    <script src="/javascript/jquery-ui.js"></script>
    <script>
        $(function() {
            $("#datepicker").datepicker({
                dateFormat: 'yy년 mm월 dd일',
                monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip 텍스트
                    ,
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 부분 텍스트
                    ,
                showMonthAfterYear: true,
                yearSuffix: "년"
            });
1
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
            font-size: 16px;
            color: #333;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;
        }

        .cal_top {

            height: 70px;
            position: relative;
            background: #fff;
        }

        #cal_tab {

            height: calc(100vh - 70px);
            background: #fff;
            
        }

        #cal_tab table {

            width: 100%;
            height: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        #cal_tab td {
            border: 1px solid #f0f0f0;
            font-size: 11px;
            color: #333;
            position: relative;
            width: calc(100% / 7);
        }
        #cal_tab td:nth-child(1),
        #cal_tab td:nth-child(7) {
        	border-right: none;
        	border-left: none;
        }

        #cal_tab tr:nth-child(7) td {
            border-bottom: none;

        }

        #cal_tab tr:nth-child(1) {

            height: 20px;
            vertical-align: bottom;

        }
        #cal_tab tr:nth-child(n + 2) {
            height: calc(100% / 7);
        }

        #cal_tab tr:nth-child(1) td {
            border-bottom: none;
        }

        #cal_tab tr:nth-child(2) td {
            border-top: none;
        }

        #cal_tab tr:nth-child(n + 2) {

            vertical-align: top;
            font-weight: bold;
        }

        #cal_tab tr:nth-child(n + 2) td {
            padding-top: 5px;
        }

        .cal_top>div {
            position: absolute;

            top: 50%;
            transform: translateY(-50%);
            left: 30px;
        }

        .cal_top div div {

            display: inline-block;
        }

        .cal_top div div:nth-child(1) a {
            padding: 0 10px;
            display: block;
            border: 1px solid #f0f0f0;
            border-radius: 5px;
            font-size: 14px;
            margin-right: 15px;
            transition: all 0.1s;
            line-height: 35px;
        }

        .cal_top div div:nth-child(2) a {
            display: inline-block;
            padding: 10px 15px;
            border-radius: 50%;

            font-weight: bold;
            transition: all 0.1s;
        }

        .cal_top div div a:hover {
            background-color: #f0f0f0;
        }

        .cal_top div div:nth-child(3) {
            font-size: 19px;
            font-weight: bold;
            margin-left: 15px;
            vertical-align: -3px;
            padding: 0 5px;
            border-radius: 3px;
            transition: all 0.1s;
            line-height: 35px;
        }

        .cal_top div div:nth-child(3):hover {
            background-color: #f0f0f0;
        }

        .addSchedule {
            font-size: 40px;
            font-weight: bold;
            border-radius: 50%;
            padding: 7px 17px;
            display: block;
            background-color: rgba(255, 255, 255, 0.5);
            box-shadow: 3px 3px 3px rgba(137, 137, 137, 0.63);
            position: absolute;
            top: 75px;
            left: 25px;
            border: 1px solid #eee;
            transition: all 0.2s;
            color: #EBAD7A;

        }

        .addSchedule:hover {
            box-shadow: 3px 3px 30px rgba(137, 137, 137, 0.63);
            background-color: lavender;
        }

        .cal_top div div:nth-child(4) a:hover {
            box-shadow: 1px 1px 10px #898989;
            background-color: lavender;
        }

        /*.wrap {
            background-color: #fff;
            width: 400px;
            padding: 10px 20px 15px 10px;

            border-radius: 5px;
            box-shadow: 0px 0px 20px rgba(137, 137, 137, 0.56);
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: none;
            z-index: 2;
        }*/

        td .wrap.right {
            background-color: #fff;
            width: 400px;
            padding: 10px 20px 15px 10px;
			border: 1px solid #eee;
            border-radius: 5px;
            box-shadow: 1px 1px 1px #eee;
            position: absolute;
            top: 50%;
            left: 50px;
            transform: translateY(-50%);
            opacity: 0;
            z-index: 2;
            transition: all 0.3s;
            font-size: 13px;
        }

        td .wrap.left {
            background-color: #fff;
            width: 400px;
            padding: 10px 20px 15px 10px;
			border: 1px solid #eee;
            border-radius: 5px;
            box-shadow: 1px 1px 1px #eee;
            position: absolute;
            top: 50%;
            right: 50px;
            transform: translateY(-50%);
            opacity: 0;
            z-index: 2;
            transition: all 0.3s;
            font-size: 13px;
        }

        td .wrap.right.on {
            left: 90px;
            opacity: 1;
            
        }

        td .wrap.left.on {
            right: 90px;
            opacity: 1;
        }

        td .wrap div:nth-child(1) {
            text-align: right;
        }

        td .wrap div:nth-child(n + 2) {


            width: 100%;
            overflow: hidden;
        }

        td .wrap div:nth-child(n + 2) i {
            width: 10%;
            float: left;
            text-align: center;
            line-height: 34px;
        }

        td .wrap div:nth-child(n + 2) input {
            width: 90%;
            float: right;

            border: none;
            line-height: 34px;
        }

        td .wrap div:nth-child(6) {

            text-align: right;
            padding-top: 10px;
        }

        td .wrap div:nth-child(2) input {

            font-size: 20px;
            border-bottom: 1px solid;
            margin-bottom: 15px;
        }

        td .wrap div:nth-child(6) a {
            display: inline-block;
            background: #EBAD7A;

            border-radius: 5px;
            margin-bottom: 3px;
            transition: all 0.1s;
            color: #fff;

            line-height: 35px;
            padding: 0 20px;
        }

        td .wrap div:nth-child(6) a:hover {
            background-color: rgba(235, 173, 122, 0.9);
        }

        td .wrap div:nth-child(3) input {
            color: #000;
            width: auto;

            border-radius: 5px;
            float: left;
            width: 125px;
            text-align: center
        }

        td .wrap div:nth-child(n + 3) input {
            border-radius: 5px;
            transition: all 0.2s;
        }

        td .wrap div:nth-child(n + 3) input {
            padding: 0 8px;

        }

        td .wrap div:nth-child(n + 3) input:hover,
        td .wrap div:nth-child(n + 3) input:focus {
            background-color: rgba(235, 173, 122, 0.3);

        }

        td .wrap div:nth-child(2) {
            position: relative;
        }

        td .wrap div:nth-child(2) span {
            display: block;
            background-color: #EBAD7A;
            width: 0%;
            height: 3px;
            position: absolute;
            right: 47%;
            bottom: 14px;
            transition: width 0.8s, right 0.8s;
        }


        td .wrap div:nth-child(2).on span {
            width: 90%;
            right: 0;
        }

        td .wrap div:nth-child(3) {
            position: relative;
        }

        td .wrap div:nth-child(3) span {
            display: block;
            background-color: #EBAD7A;
            width: 0%;
            height: 2px;
            position: absolute;
            left: 26%;
            bottom: 0;
            transition: width 0.5s, left 0.5s;
        }

        td .wrap div:nth-child(3).on span {
            width: 33.7%;
            left: 10%;
        }

        td .wrap div:nth-child(4),
        td .wrap div:nth-child(5) {
            position: relative;
        }

        td .wrap div:nth-child(4) span,
        td .wrap div:nth-child(5) span {
            display: block;
            background-color: #EBAD7A;
            width: 0%;
            height: 2px;
            position: absolute;
            right: 45%;
            bottom: 0;
            transition: width 0.5s, right 0.5s;
        }

        td .wrap div:nth-child(4).on span,
        td .wrap div:nth-child(5).on span {
            width: 90%;
            right: 0;
        }

        .overlay {
            width: 100%;
            height: 100vh;

            position: absolute;
            top: 0;
            left: 0;
            z-index: 1;
            display: none;

        }

        .cal-day {


            display: inline-block;
            line-height: 25px;
            border-radius: 50%;
            width: 25px;
            height: 25px;

        }



        input:focus {
            outline: none;
        }

        td .wrap div:nth-child(1) a {
            display: inline-block;
            width: 25px;
            height: 25px;
            line-height: 25px;
            border-radius: 50%;
            text-align: center;
            transition: all 0.3s;


        }

        td .wrap div:nth-child(1) a:hover {
            background-color: rgba(235, 173, 122, 0.3);
        }

        div.cal-schedule {
            position: relative;
            text-align: left;
            white-space: normal;
            
        }

        div.cal-schedule > a {
            display: block;
            padding: 5px;
            margin-bottom: 2px;
            background-color: #EBAD7A;
            border-radius: 3px;
        }
        div.cal-schedule div.getScheduleModal {
            position: absolute;
            /*right: -310px;*/
            top: 50%;
            transform: translateY(-50%);
            z-index: 1;
            background-color: #fff;
            width: 300px;
            border: 1px solid;
            padding: 10px;
        }
        div.getScheduleModal a {
            border: 1px solid;
            line-height: 25px;
            display: inline-block;
            padding: 0 10px;
        }
        
        div.getSchedule {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            z-index: 9999;
            padding: 5px 20px 10px;
            width: 450px;
            background-color: #fff;
            border: 1px solid #c2c2c2;
            box-shadow: 1px 1px 1px #eee;
            border-radius: 5px;
        }
        div.getSchedule div.getScheduleHeader {
            
            font-size: 17px;
            text-align: right;
        }
        div.getSchedule div.getScheduleHeader a {
            
            display: inline-block;
            line-height: 35px;
            height: 35px;
            width: 35px;
            text-align: center;
            border-radius: 50%;
            
        }
        
        div.getSchedule div.getScheduleHeader a:hover {
            background-color: lightcoral;
        }
        div.getSchedule div.getScheduleHeader a + a {
            margin-left: 5px;
        }
        div.getSchedule div.getScheduleMain {
            
            padding-top: 10px;
        }
        div.getSchedule div.getScheduleMain div.postTitle {
            margin-bottom: 20px;
        }
        div.getSchedule div.getScheduleMain > div:nth-child(n + 2) {
            
            margin-bottom: 10px;
        }
        div.getSchedule div.getScheduleMain div.postTitle > div:nth-child(1) {
            width: 15px;
            height: 15px;
            background-color: rebeccapurple;
            border-radius: 3px;
            display: inline-block;
            vertical-align: 25px;
            margin-right: 15px;
        }
        div.getSchedule div.getScheduleMain div.postTitle > div:nth-child(2) div:nth-child(1) {
            font-size: 20px;
        }
        div.getSchedule div.getScheduleMain div.postTitle > div:nth-child(2) {
            
            display: inline-block;
        }
        div.getSchedule div.getScheduleMain div.postTitle div.postDate {
            font-size: 14px;
        }
        div.getSchedule div.getScheduleMain > div:nth-child(n + 2) > div:nth-child(1) {
            
            font-size: 17px;
            display: inline-block;
            vertical-align: middle;
            margin-right: 15px;
        }
        div.getSchedule div.getScheduleMain > div:nth-child(n + 2) > div:nth-child(2) {
            
            font-size: 14px;
            display: inline-block;
            vertical-align: middle;
        }
        div.getSchedule div.getScheduleMain div.postTitle div:nth-child()
        div.getSchedule div.getScheduleMain > div:nth-child(n + 2) > div:nth-child(2) a {
            font-weight: bold;
        }
        div.getSchedule div.getScheduleMain > div:nth-child(n + 2) > div:nth-child(2) a:hover {
            text-decoration: underline;
        }
    </style>





</head>

<body>
    <input type="hidden" name="userId" value="${user.userId}">
    <div class="overlay">

    </div>
    <!--<div class="wrap">

        <div>
            <a href="#"><i class="fas fa-times"></i></a>
        </div>
        <div>
            <input type="text" placeholder="제목 및 시간 추가">
            <span></span>
        </div>
        <div>
            <i class="far fa-clock"></i> <input id="datepicker" type="text" value="" readonly>
            <span></span>
        </div>
        <div>
            <i class="fas fa-map-marker-alt"></i> <input type="text" placeholder="위치 또는 회의 추가">
            <span></span>
        </div>
        <div>
            <i class="fas fa-align-left"></i> <input type="text" placeholder="설명 추가">
            <span></span>
        </div>
        <div>
            <a href="#">저장</a>
        </div>
    </div>-->

    <div class="cal_top">
        <div>
            <div>
                <a class="today" href="#">오늘</a>
            </div>

            <div>
                <a href="#" id="movePrevMonth">
                    <span id="prevMonth" class="cal_tit">
                        &lt;
                    </span>
                </a>
                <a href="#" id="moveNextMonth">
                    <span id="nextMonth" class="cal_t it">
                        &gt;
                    </span>
                </a>
            </div>

            <div>
                <span id="cal_top_year"></span><span>년</span>
                <span id="cal_top_month"></span><span>월</span>
                <i class="fas fa-caret-down"></i>
            </div>



        </div>

    </div>
    <!--<div>
        <a class="addSchedule" href="#">+</a>
    </div>-->
    <div id="cal_tab" class="cal">

    </div>


    <script type="text/javascript">
        var today = null;
        var year = null;
        var month = null;
        var firstDay = null;
        var lastDay = null;
        var $tdDay = null;
        var $tdSche = null;
        var day = null;

        $(document).ready(function() {
            drawCalendar();
            initDate();
            drawDays();
            $("#movePrevMonth").on("click", function() {
                movePrevMonth();
            });

            $("#moveNextMonth").on("click", function() {
                moveNextMonth();
            });
        });

        //calendar 그리기
        function drawCalendar() {
            var setTableHTML = "";
            setTableHTML += '<table class="calendar">';
            setTableHTML += '<tr><td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td></tr>';
            for (var i = 0; i < 6; i++) {
                setTableHTML += '<tr>';
                for (var j = 0; j < 7; j++) {
                    setTableHTML += '<td style="text-overflow:ellipsis;overflow:visible;white-space:nowrap">';

                    setTableHTML += '    <div class="cal-day"></div>';
                    setTableHTML += '    <div class="cal-schedule"></div>';
                    setTableHTML += '</td>';

                }
                setTableHTML += '</tr>';
            }
            setTableHTML += '</table>';
            $("#cal_tab").html(setTableHTML);
        }


        /*$(document).ready(function() {
            var dayday = $('div.cal_top_year').text() + '-' + $('div.cal_top_month').text() + '-01';
            alert('온로드ㅋㅋ');
            alert('userId : ' + sessionUserId);
            $.ajax({
                url: '/couple/rest/getCoupleTimelinePostList2/' + sessionUserId + '/' + dayday,
                method: 'GET',
                dataType: 'json',
                data: JSON.stringify({
                    userId: sessionUserId
                }),
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                success: function(data) {
                    alert('성공ㅋㅋ');
                    if(data != null) {
                        for(var i = 0; i < data.list[0].size(); i++) {
                            list[0].postDate
                        }
                    }
                    data.list.length()????
                    이렇게하면 사이즈 나옴
                    이렇게 돌려서
                    list[i].postDate
                    list[i].postTitle
                    var i 있지
                    그거를 for문 안에
                    그니까 data.list.listSize?
                        재밌네
                    아니다?
                    채팅... 당신... 채팅이야.... 당신 채팅이라구...
                    jsp... 넘기면.. 형진오빠가 다해줌!!!!!!
                    끝났네
                    다했당^0^
                        restcontroller 만들기
                    공유
                    뭔말인지알지
                    
                }
            })

            var scheduleList = '<c:forEach var="post" items="${list }">' +
                'postNo : <input type="text" name="postNo" value="${post.postNo }"><br>' +
                'secondUserId : <input type="text" name="secondUserId" value="${post.userId }"><br>' +
                'postDate : <input type="text" name="postDate" value="${post.postDate }"><br>' +
                'postTitle : <input type="text" name="postTitle" value="${post.postTitle }"><br>' +
                '<a href="/couple/getSchedule?userId=${userId }&postNo=${post.postNo }">보기</a><br>' +
                '</c:forEach>';
            var test = '커플캘린더끝내기';
            $('div.cal-schedule').append(scheduleList);
            $('div.cal-schedule').append(test);
        });

        $(document).ready(function() {
            getPostDate('2020-02-03');
        });*/
        
        function getThisMonthSchedule(year, month) {
        	var userId = $('input[name="userId"]').val();
        	var postDate = year + '-' + month + '-01';
        	
        	alert('userId : ' + userId);
        	alert('postDate : ' + postDate);
        	$.ajax({
        		url: '/couple/rest/getScheduleList2/' + userId + '/' + postDate,
        		method: 'GET',
        		dataType: 'json',
        		data: JSON.stringify({
        			userId: userId,
        			postDate: postDate
        		}),
        		headers: {
        			'Accept': 'application/json',
        			'Content-Type': 'application/json'
        		},
        		success: function(data) {
        			for(var i = 0; i < data.list.length; i++) {
        				alert('postDate : ' + data.list[i].postDate + ' postTitle : ' + data.list[i].postTitle);
        				getPostDateAndAddPostTitle(data.list[i].postDate, data.list[i].postTitle, data.list[i].postNo);
        			}
        		},
        		error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
        	});
        }
        
        $(document).ready(function() {
        	var userId = $('input[name="userId"]').val();
        	var postDate = $('#cal_top_year').text() + '-' + $('#cal_top_month').text() + '-01';
        	
        	//alert('userId : ' + userId);
        	//alert('postDate : ' + postDate);
        	$.ajax({
        		url: '/couple/rest/getScheduleList2/' + userId + '/' + postDate,
        		method: 'GET',
        		dataType: 'json',
        		data: JSON.stringify({
        			userId: userId,
        			postDate: postDate
        		}),
        		headers: {
        			'Accept': 'application/json',
        			'Content-Type': 'application/json'
        		},
        		success: function(data) {
        			for(var i = 0; i < data.list.length; i++) {
        				//alert('postDate : ' + data.list[i].postDate + ' postTitle : ' + data.list[i].postTitle);
        				getPostDateAndAddPostTitle(data.list[i].postDate, data.list[i].postTitle, data.list[i].postNo);
        			}
        		},
        		error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
        	});
        });
        
        
        $(document).ready(function() {
            //alert('온로드ㅋㅋ');
            getPostDateAndAddPostTitle('2020-02-15', '카페가서공부하기', '');
            getPostDateAndAddPostTitle('2020-02-16', '학원가서공부하기', '');
            getPostDateAndAddPostTitle('2020-02-17', '학원가서공부하기학원가서공부하기', '');
            getPostDateAndAddPostTitle('2020-02-17', '카페가서공부하기', '');
        });
        


        function getPostDateAndAddPostTitle(postDate, postTitle, postNo) {
            //alert('getPostDateAndAddPostTitle()');
            //alert('postDate : ' + postDate);
            //alert('postTitle : ' + postTitle);
            //alert('postDate.substring(8, 10) : ' + postDate.substring(8, 10));



            var calendarYear = $('#cal_top_year').text();
            var calendarMonth = $('#cal_top_month').text();

            //var postDay = postDate.substring(8, 10);

            for (var i = 0; i <= 45; i++) {

                if ($('div.cal-day').eq(i).text() == postDate.substring(8, 10) || '0' + $('div.cal-day').eq(i).text() == postDate.substring(8, 10)) {
                    
                    $('div.cal-day').eq(i).parent().find('div.cal-schedule').append('<a href="#" class="' + postNo + '">' 
                    		+ '<input type="hidden" class="postNo" value="' + postNo + '">' + postTitle + '</a>');
                }
            }


        }






        //날짜 초기화
        function initDate() {
            $tdDay = $("td div.cal-day")
            $tdSche = $("td div.cal-schedule")
            dayCount = 0;
            today = new Date();
            year = today.getFullYear();
            month = today.getMonth() + 1;
            month = month >= 10 ? month : '0' + month;
            
            



            firstDay = new Date(year, month - 1, 1);
            lastDay = new Date(year, month, 0);
        }

        //calendar 날짜표시
        function drawDays() {
            $("#cal_top_year").text(year);
            $("#cal_top_month").text(month);


            console.log($("#cal_top_year").text());
            console.log(today.getFullYear());
            console.log($("#cal_top_month").text());

            var a1 = today.getMonth() + 1
            a1 = a1 = a1 >= 10 ? a1 : '0' + a1;
            console.log(a1);

            console.log(today.getDate());


            for (var i = firstDay.getDay(); i < firstDay.getDay() + lastDay.getDate(); i++) {



                $tdDay.eq(i).text(++dayCount);

                if ($tdDay.eq(i).text() == today.getDate()) {
                    console.log($tdDay.eq(i).text());

                }




                /*if ($('#cal_top_year').text() == today.getFullYear()) {
                    console.log('성공');
                    $tdDay.eq(i).css({
                        'color': 'red'
                    });
                }*/

                /*if ($('#cal_top_month').text() == a1) {
                    console.log('성공');
                    $tdDay.eq(i).css({
                        'color': 'red'
                    });
                }*/

                /*if (today.getDate() == $tdDay.eq(i).text()) {
                    console.log('성공');
                    $tdDay.eq(i).css({
                        'color': 'red'
                    });
                }*/

                /*if($('#cal_top_year').text() == today.getFullYear() && $('#cal_top_month').text() == a1) {
                    console.log('성공');
                    $tdDay.eq(i).css({
                        'color': 'red'
                    });
                }*/

                if ($('#cal_top_year').text() == today.getFullYear() && $('#cal_top_month').text() == a1 && today.getDate() == $tdDay.eq(i).text()) {
                    console.log('성공');
                    $tdDay.eq(i).css({
                        'background': 'rgba(235, 173, 122, 0.5)'
                    });
                } else {
                    $tdDay.eq(i).css({
                        'background': 'none'
                    });
                }




            }


            for (var i = 0; i < 42; i += 7) {
                //일요일
                $tdDay.eq(i).css("color", "red");
            }
            for (var i = 1; i < 42; i += 7) {
                //월요일
            }
            for (var i = 2; i < 42; i += 7) {
                //화요일
            }
            for (var i = 3; i < 42; i += 7) {
                //수요일
            }
            for (var i = 4; i < 42; i += 7) {
                //목요일
            }
            for (var i = 5; i < 42; i += 7) {
                //금요일
            }
            for (var i = 6; i < 42; i += 7) {
                $tdDay.eq(i).css("color", "blue");
            }







        }


        //calendar 월 이동
        function movePrevMonth() {
            month--;
            if (month <= 0) {
                month = 12;
                year--;
            }
            if (month < 10) {
                month = String("0" + month);
            }
            getNewInfo();
            $('.cal-schedule').empty();
            getThisMonthSchedule(year, month);
        }

        function moveNextMonth() {
            month++;
            if (month > 12) {
                month = 1;
                year++;
            }
            if (month < 10) {
                month = String("0" + month);
            }
            getNewInfo();
            $('.cal-schedule').empty();
            getThisMonthSchedule(year, month);
        }


        function getNewInfo() {
            for (var i = 0; i < 42; i++) {
                $tdDay.eq(i).text("");

            }
            dayCount = 0;
            firstDay = new Date(year, month - 1, 1);
            lastDay = new Date(year, month, 0);
            drawDays();
        }
    </script>
    <script>
        $(document).ready(function() {

            /*$('td').on('click', function() {

                //alert($(this).find('div.cal-day').text());
                if ($(this).find('div.cal-day').text() != '') {

                    day = $(this).find('div.cal-day').text();
                    day = day >= 10 ? day : '0' + day;

                    //alert($(this).find('div.cal-day').text());
                    $('.overlay').css({
                        'display': 'block'
                    });
                    $('.wrap').css({
                        'display': 'block'
                    });


                    $('#datepicker').val(year + '년 ' + month + '월 ' + day + '일');



                }

                setTimeout(sayHi, 10);



            });*/

            
            
            
            $(document).on('click', 'td div.cal-schedule a', function(e) {
            
                e.stopPropagation();
                $('div.getSchedulel').remove();
                $('div.wrap').remove();
                if ($(this).parent().children().hasClass('getSchedulel')) {
                    alert('^0^');
                    $('div.getSchedulel').remove();
                } else {


                    
                    $('div.getSchedulel').remove();
					
                    var userId = $('input[name="userId"]').val();
                    var postNo = $(this).find('input.postNo').val();
                    alert('postNo : ' + postNo);
                    var getScheduleModal = '';
                    $.ajax({
                    	url: '/couple/rest/getSchedule/' + userId + '/' + postNo,
                    	method: 'GET',
                    	dataType: 'json',
                    	data: JSON.stringify({
                    		userId: userId,
                    		postNo: postNo
                    	}),
                    	headers: {
                    		'Accept': 'application/json',
                    		'Content-Type': 'application/json'
                    	},
                    	success: function(data) {
                    		
                    		
                    		var postTitle = data.post.postTitle;
                    		var postDate = data.post.postDate;
                    		var place = data.post.place;
                    		var postContent = data.post.postContent;
                    		
                    		
                    		
                    		
                    		getScheduleModal = '<div class="getScheduleModal">' +
                            '<h3>스케줄 보기</h3>' +
                            '<input type="text" name="sessionUserId" value="' + userId + '"><br>' +
                            'postNo : <input type="text" name="postNo" value="' + postNo + '"><br>' +
                            'postTitle : <input type="text" name="postTitle" value="' + postTitle + '"><br>' +
                            'postDate : <input type="text" name="postDate" value="' + postDate + '"><br>' +
                            'place : <input type="text" name="place" value="' + place + '"><br>' +
                            'postContent : <input type="text" name="postContent" value="' + postContent + '"><br>' +
                            'userId : <input type="text" name="userId" value="' + data.post.userId + '"><br>' +
                            '<a href="#">스케줄 수정</a> <a href="#">스케줄 삭제</a>' +
                            '</div>';
                            
                            var getSchedule = '<div class="getSchedule">' +
                            '<div class="getScheduleHeader">' +
                            '<a href="#"><i class="fas fa-pencil-alt"></i></a>' +
                            '<a href="#"><i class="far fa-trash-alt"></i></a>' +
                            '<a href="#"><i class="fas fa-times"></i></a>' +
                            '</div>' +
                            '<div class="getScheduleMain">' +
                            '<div class="postTitle">' +
                            '<div></div>' +
                            '<div>' +
                            '<div>' + postTitle + '</div>' +
                            '<div class="postDate">' + postDate + '</div>' +
                            '</div>' +
                            '</div>' +
                            '<div class="place">' +
                            '<div><i class="fas fa-map-marker-alt"></i></div>' +
                            '<div>' +
                            '<div><a href="#">' + place + '</a></div>' +
                            '<div>' + place + '</div>' +
                            '</div>' +
                            '</div>' +
                            '<div class="postContent">' +
                            '<div><i class="fas fa-align-left"></i></div>' +
                            '<div>' + postContent + '</div>' +
                            '</div>' +
                            '<div class="postUserName">' +
                            '<div><i class="far fa-calendar-minus"></i></div>' +
                            '<div>' + data.post.userId + '</div>' +
                            '</div>' +
                            '</div>' +
                            '</div>';
                            
                            //alert('getScheduleModal : ' + getScheduleModal);
                            
                    		
                            
                            
                            //alert('getScheduleModal : ' + getScheduleModal);
                                
                            
                            
                            $('a.' + postNo).parent().append(getSchedule);
                            if ($('a.' + postNo).parent().parent().index() == 0 || $('a.' + postNo).parent().parent().index() == 1 || $('a.' + postNo).parent().parent().index() == 2) {
                                $('div.getSchedule').css({
                                    'right': '-460px'
                                });
                            } else {
                                $('div.getSchedule').css({
                                    'left': '-460px'
                                });
                            }
                            
                            alert($('a.' + postNo).parent().parent().parent().index());
                            if($('a.' + postNo).parent().parent().parent().index() == 6) {
                            	$('div.getSchedule').css({
                            		'transform' : 'translateY(-100%)'
                            	});
                            }
                            
                            $('div.getSchedule').on('click', function(e) {
                                e.stopPropagation();
                            });


                            $('html').click(function(e) {
                                if ($('html').find('div').hasClass('getSchedule')) {
                                    if (!$(e.target).hasClass("getSchedule")) {
                                    	e.stopPropagation();
                                        alert('영역 밖입니다.');
                                        $('div.getSchedule').remove();
                                        $('div.wrap').remove();

                                    }
                                }

                            });

                        
                    	},
                    	error: function (request, status, error) {
		                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		                }
                    })
                    
                    
                    
                    //alert('getScheduleModal2 : ' + getScheduleModal);
                    //$(this).parent().append(getScheduleModal);

                    


                    
					
                    
                }



            });
            
            
            
            
            
            
            
            

            $('td:nth-child(-n + 3)').on('click', function() {

                if ($(this).find('div.cal-day').text() != '') {

                    if ($('td').children('div').hasClass('wrap')) {
                        $('td').find('.wrap').remove();
                    } else {
                        var wrap = '<div class="wrap right">'

                            +
                            '<div>' +
                            '<a href="#"><i class="fas fa-times"></i></a>' +
                            '</div>' +
                            '<div>' +
                            '<input type="text" placeholder="제목 및 시간 추가" name="postTitle">' +
                            '<span></span>' +
                            '</div>' +
                            '<div>' +
                            '<i class="far fa-clock"></i> <input id="datepicker" type="text" value="" readonly name="postDate">' +
                            '<span></span>' +
                            '</div>' +
                            '<div>' +
                            '<i class="fas fa-map-marker-alt"></i> <input type="text" placeholder="위치 또는 회의 추가" name="place">' +
                            '<span></span>' +
                            '</div>' +
                            '<div>' +
                            '<i class="fas fa-align-left"></i> <input type="text" placeholder="설명 추가" name="postContent">' +
                            '<span></span>' +
                            '</div>' +
                            '<div>' +
                            '<a href="#" class="addCoupleCalendarSchedule">저장</a>' +
                            '</div>' +
                            '</div>';
                        $(this).append(wrap);
                        day = $(this).find('div.cal-day').text();
                        day = day >= 10 ? day : '0' + day;





                        $('#datepicker').val(year + '년 ' + month + '월 ' + day + '일');
                        setTimeout(function() {
                            $('.wrap').addClass('on');
                        }, 100);
                        $('.wrap').on('click', function(e) {
                            e.stopPropagation();
                        });
                        /*여기에 닫기 버튼, 저장 버튼, datepicker 이벤트 가져다 놓기*/
                        $('.wrap div:nth-child(1) a').on('click', function(e) {
                            e.stopPropagation();
                            /*$('.overlay').css({
                                'display': 'none'
                            });
                            $('.wrap').css({
                                'display': 'none'
                            });
                            $('.wrap div:nth-child(2)').removeClass('on');

                            $('input').val('');*/
                            $('td').find('.wrap').remove();
                        });
                        $('.wrap div:nth-child(6) a').on('click', function(e) {
                            e.stopPropagation();
                            /*$('.overlay').css({
                                'display': 'none'
                            });
                            $('.wrap').css({
                                'display': 'none'
                            });
                            $('.wrap div:nth-child(2)').removeClass('on');*/
                            //$('td').find('.wrap').remove();
							alert('클릭ㅋㅋ');
							var userId = $('input[name="userId"]').val();
							var postTitle = $('input[name="postTitle"]').val();
							var postDate = $('input[name="postDate"]').val();
							
							postDate = postDate.substring(0, 4) + '-' + postDate.substring(6, 8) + '-' + postDate.substring(10, 12);
							
							var place = $('input[name="place"]').val();
							var postContent = $('input[name="postContent"]').val();
							
							console.log('userId : ' + userId);
							console.log('postTitle : ' + postTitle);
							console.log('postDate : ' + postDate);
							console.log('place : ' + place);
							console.log('postContent : ' + postContent);
							
							$.ajax({
								url: '/couple/rest/addSchedule2',
								method: 'POST',
								dataType: 'json',
								data: JSON.stringify({
									userId: userId,
									postTitle: postTitle,
									postDate: postDate,
									place: place,
									postContent: postContent
								}),
								headers: {
									'Accept': 'application/json',
									'Content-Type': 'application/json'
								},
								success: function(data) {
									alert('성공');
									getPostDateAndAddPostTitle(data.postDate, data.postTitle, data.postNo);
									$('td').find('.wrap').remove();
								},
								error: function (request, status, error) {
				                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				                }
							});


                        });
                        
                        
                        $('.wrap div:nth-child(2)').on('click', function(e) {
                            e.stopPropagation();
                            $('.wrap div span').css({
                                'opacity': '0'
                            });
                            $('.wrap div').removeClass('on');
                            $('.wrap div:nth-child(2) span').css({
                                'opacity': '1'
                            });
                            $('.wrap div:nth-child(2)').addClass('on');

                        });
                        $('.wrap div:nth-child(3) input').on('click', function(e) {
                            e.stopPropagation();
                            $('.wrap div span').css({
                                'opacity': '0'
                            });
                            $('.wrap div').removeClass('on');
                            $('.wrap div:nth-child(3) span').css({
                                'opacity': '1'
                            });
                            $('.wrap div:nth-child(3)').addClass('on');
                        });
                        $('.wrap div:nth-child(4)').on('click', function(e) {
                            e.stopPropagation();
                            $('.wrap div span').css({
                                'opacity': '0'
                            });
                            $('.wrap div').removeClass('on');
                            $('.wrap div:nth-child(4) span').css({
                                'opacity': '1'
                            });
                            $('.wrap div:nth-child(4)').addClass('on');
                        });
                        $('.wrap div:nth-child(5)').on('click', function(e) {
                            e.stopPropagation();
                            $('.wrap div span').css({
                                'opacity': '0'
                            });
                            $('.wrap div').removeClass('on');
                            $('.wrap div:nth-child(5) span').css({
                                'opacity': '1'
                            });
                            $('.wrap div:nth-child(5)').addClass('on');
                        });
                        $('.wrap div input').focusout(function(e) {
                            e.stopPropagation();
                            $('.wrap div span').css({
                                'opacity': '0'
                            });
                            $('.wrap div').removeClass('on');
                        });
                        $("#datepicker").datepicker({
                            dateFormat: 'yy년 mm월 dd일',
                            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip 텍스트
                                ,
                            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 부분 텍스트
                                ,
                            showMonthAfterYear: true,
                            yearSuffix: "년"
                        });

                    }
                } else {
                    $('td').find('.wrap').remove();
                }
                setTimeout(sayHi, 100);
            });
            $('td:nth-child(n + 4)').on('click', function() {

                if ($(this).find('div.cal-day').text() != '') {

                    if ($('td').children('div').hasClass('wrap')) {
                        $('td').find('.wrap').remove();
                    } else {
                        var wrap2 = '<div class="wrap left">'

                            +
                            '<div>' +
                            '<a href="#"><i class="fas fa-times"></i></a>' +
                            '</div>' +
                            '<div>' +
                            '<input type="text" placeholder="제목 및 시간 추가" name="postTitle">' +
                            '<span></span>' +
                            '</div>' +
                            '<div>' +
                            '<i class="far fa-clock"></i> <input id="datepicker" type="text" value="" readonly name="postDate">' +
                            '<span></span>' +
                            '</div>' +
                            '<div>' +
                            '<i class="fas fa-map-marker-alt"></i> <input type="text" placeholder="위치 또는 회의 추가" name="place">' +
                            '<span></span>' +
                            '</div>' +
                            '<div>' +
                            '<i class="fas fa-align-left"></i> <input type="text" placeholder="설명 추가" name="postContent">' +
                            '<span></span>' +
                            '</div>' +
                            '<div>' +
                            '<a href="#" class="addCoupleCalendarSchedule">저장</a>' +
                            '</div>' +
                            '</div>';
                        $(this).append(wrap2);
                        day = $(this).find('div.cal-day').text();
                        day = day >= 10 ? day : '0' + day;





                        $('#datepicker').val(year + '년 ' + month + '월 ' + day + '일');
                        setTimeout(function() {
                            $('.wrap').addClass('on');
                        }, 100);
                        $('.wrap').on('click', function(e) {
                            e.stopPropagation();
                        });
                        /*여기에 닫기 버튼, 저장 버튼, datepicker 이벤트 가져다 놓기*/
                        $('.wrap div:nth-child(1) a').on('click', function(e) {
                            e.stopPropagation();
                            /*$('.overlay').css({
                                'display': 'none'
                            });
                            $('.wrap').css({
                                'display': 'none'
                            });
                            $('.wrap div:nth-child(2)').removeClass('on');

                            $('input').val('');*/
                            $('td').find('.wrap').remove();
                        });
                        $('.wrap div:nth-child(6) a').on('click', function(e) {
                            e.stopPropagation();
                            /*$('.overlay').css({
                                'display': 'none'
                            });
                            $('.wrap').css({
                                'display': 'none'
                            });
                            $('.wrap div:nth-child(2)').removeClass('on');*/
                            //$('td').find('.wrap').remove();
                            alert('클릭ㅋㅋ');
							var userId = $('input[name="userId"]').val();
							var postTitle = $('input[name="postTitle"]').val();
							var postDate = $('input[name="postDate"]').val();
							
							postDate = postDate.substring(0, 4) + '-' + postDate.substring(6, 8) + '-' + postDate.substring(10, 12);
							
							var place = $('input[name="place"]').val();
							var postContent = $('input[name="postContent"]').val();
							
							console.log('userId : ' + userId);
							console.log('postTitle : ' + postTitle);
							console.log('postDate : ' + postDate);
							console.log('place : ' + place);
							console.log('postContent : ' + postContent);
							
							$.ajax({
								url: '/couple/rest/addSchedule2',
								method: 'POST',
								dataType: 'json',
								data: JSON.stringify({
									userId: userId,
									postTitle: postTitle,
									postDate: postDate,
									place: place,
									postContent: postContent
								}),
								headers: {
									'Accept': 'application/json',
									'Content-Type': 'application/json'
								},
								success: function(data) {
									alert('성공');
									getPostDateAndAddPostTitle(data.postDate, data.postTitle, data.postNo);
									$('td').find('.wrap').remove();
								},
								error: function (request, status, error) {
				                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				                }
							});



                        });
                        $('.wrap div:nth-child(2)').on('click', function(e) {
                            e.stopPropagation();
                            $('.wrap div span').css({
                                'opacity': '0'
                            });
                            $('.wrap div').removeClass('on');
                            $('.wrap div:nth-child(2) span').css({
                                'opacity': '1'
                            });
                            $('.wrap div:nth-child(2)').addClass('on');

                        });
                        $('.wrap div:nth-child(3) input').on('click', function(e) {
                            e.stopPropagation();
                            $('.wrap div span').css({
                                'opacity': '0'
                            });
                            $('.wrap div').removeClass('on');
                            $('.wrap div:nth-child(3) span').css({
                                'opacity': '1'
                            });
                            $('.wrap div:nth-child(3)').addClass('on');
                        });
                        $('.wrap div:nth-child(4)').on('click', function(e) {
                            e.stopPropagation();
                            $('.wrap div span').css({
                                'opacity': '0'
                            });
                            $('.wrap div').removeClass('on');
                            $('.wrap div:nth-child(4) span').css({
                                'opacity': '1'
                            });
                            $('.wrap div:nth-child(4)').addClass('on');
                        });
                        $('.wrap div:nth-child(5)').on('click', function(e) {
                            e.stopPropagation();
                            $('.wrap div span').css({
                                'opacity': '0'
                            });
                            $('.wrap div').removeClass('on');
                            $('.wrap div:nth-child(5) span').css({
                                'opacity': '1'
                            });
                            $('.wrap div:nth-child(5)').addClass('on');
                        });
                        $('.wrap div input').focusout(function(e) {
                            e.stopPropagation();
                            $('.wrap div span').css({
                                'opacity': '0'
                            });
                            $('.wrap div').removeClass('on');
                        });
                        $("#datepicker").datepicker({
                            dateFormat: 'yy년 mm월 dd일',
                            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip 텍스트
                                ,
                            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 부분 텍스트
                                ,
                            showMonthAfterYear: true,
                            yearSuffix: "년"
                        });
                    }
                } else {
                    $('td').find('.wrap').remove();
                }
                setTimeout(sayHi, 100);
            });



            /*$(document).on('click', function(e) {
                if ($('.overlay').is(e.target)) {
                    $('.overlay').css({
                        'display': 'none'
                    });
                    $('.wrap').css({
                        'display': 'none'
                    });
                    $('.wrap div:nth-child(2)').removeClass('on');

                    $('input').val('');
                }
            });*/

            /*$('.wrap div:nth-child(1) a').on('click', function() {
                $('.overlay').css({
                    'display': 'none'
                });
                $('.wrap').css({
                    'display': 'none'
                });
                $('.wrap div:nth-child(2)').removeClass('on');

                $('input').val('');
            });*/

            /*$('.wrap div:nth-child(6) a').on('click', function() {
                $('.overlay').css({
                    'display': 'none'
                });
                $('.wrap').css({
                    'display': 'none'
                });
                $('.wrap div:nth-child(2)').removeClass('on');




            });*/



            /*$('.addSchedule').on('click', function() {

                day = today.getDate();
                day = day >= 10 ? day : '0' + day;
                $('.overlay').css({
                    'display': 'block'
                });
                $('.wrap').css({
                    'display': 'block'
                });


                $('#datepicker').val(year + '년 ' + month + '월 ' + day + '일')
            });*/


            $('.today').on('click', function() {
                year = today.getFullYear();
                month = today.getMonth() + 1;

                if (month < 10) {
                    month = String("0" + month);
                }
                getNewInfo();
                $('.cal-schedule').empty();
                getThisMonthSchedule(year, month);
                
            });




            function sayHi() {
                $('.wrap div:nth-child(2) span').css({
                    'opacity': '1'
                });
                $('.wrap div:nth-child(2)').addClass('on');
                $('.wrap div:nth-child(2)').find('input').focus();
            }

            /*$('.wrap div:nth-child(2)').on('click', function() {
                $('.wrap div span').css({
                    'opacity': '0'
                });
                $('.wrap div').removeClass('on');
                $('.wrap div:nth-child(2) span').css({
                    'opacity': '1'
                });
                $('.wrap div:nth-child(2)').addClass('on');

            });*/

            /*$('.wrap div:nth-child(3) input').on('click', function() {
                $('.wrap div span').css({
                    'opacity': '0'
                });
                $('.wrap div').removeClass('on');
                $('.wrap div:nth-child(3) span').css({
                    'opacity': '1'
                });
                $('.wrap div:nth-child(3)').addClass('on');
            });*/


            /*$('.wrap div:nth-child(4)').on('click', function() {
                $('.wrap div span').css({
                    'opacity': '0'
                });
                $('.wrap div').removeClass('on');
                $('.wrap div:nth-child(4) span').css({
                    'opacity': '1'
                });
                $('.wrap div:nth-child(4)').addClass('on');
            });*/

            /*$('.wrap div:nth-child(5)').on('click', function() {
                $('.wrap div span').css({
                    'opacity': '0'
                });
                $('.wrap div').removeClass('on');
                $('.wrap div:nth-child(5) span').css({
                    'opacity': '1'
                });
                $('.wrap div:nth-child(5)').addClass('on');
            });*/


            /*$('.wrap div input').focusout(function() {
                $('.wrap div span').css({
                    'opacity': '0'
                });
                $('.wrap div').removeClass('on');
            });*/
            //var setSchedule = '';
            //setSchedule += '<p class="schedule">스케줄1</p>';
            //setSchedule += '<p class="schedule">스케줄2</p>';
            //setSchedule += '<p class="schedule">스케줄3</p>';
            //$('div.cal-schedule').html(setSchedule);



            $('td').on('click', function() {
                //alert($('#cal_top_year').text());
                //alert($('#cal_top_month').text());
                //alert($(this).find('div.cal-day').text());
                var thisday = $(this).find('div.cal-day').text();
                thisday = thisday >= 10 ? thisday : '0' + thisday;
                console.log($('#cal_top_year').text() + '년 ' + $('#cal_top_month').text() + '월 ' + thisday + '일');
            });

            $('.wrap div:nth-child(6) a').on('click', function() {
                console.log($('#datepicker').val());

                var date = $('#datepicker').val().charAt(10) + $('#datepicker').val().charAt(11);

                date = date.charAt(0) == 0 ? date.charAt(1) : date;

                console.log(date);







            });





        });
    </script>
</body></html>
