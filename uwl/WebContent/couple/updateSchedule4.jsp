<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>


    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
            font: 16px;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;

        }

        div.updateSchedule {

            padding: 15px 10px;
        }

        div.updateSchedule table {

            width: 100%;

        }

        div.updateSchedule table tr {
            line-height: 30px;
        }

        div.updateSchedule table td:nth-child(1) {
            text-align: center;
            font-size: 19px;

        }

        div.updateSchedule table tr:nth-child(1) td:nth-child(2) {
            font-size: 25px;
            padding-right: 30px;
            padding-bottom: 20px;
        }

        div.updateSchedule table tr:nth-child(1) td:nth-child(2) input {
            width: 100%;

            border: none;
            border-bottom: 1px solid;
            line-height: 50px;
        }

        div.updateSchedule table tr:nth-child(n + 2) td:nth-child(2) {
            padding-right: 30px;
            padding-bottom: 8px;
        }

        div.updateSchedule table tr:nth-child(n + 2) td:nth-child(2) input {
            background-color: #eee;
            border: none;
            border-radius: 4px;
            padding: 0 8px;
            font-size: 13px;

        }

        div.updateSchedule table tr:nth-child(2) td:nth-child(2) input {
            background-color: #eee;
            padding: 0;
            text-indent: 8px;
            
        }

        div.updateSchedule table tr:nth-child(2) td:nth-child(2) div {
            display: inline-block;
            
        }

        div.updateSchedule table tr:nth-child(3) td:nth-child(2) input {
            width: 100%;
        }

        div.updateSchedule table tr:nth-child(4) td:nth-child(2) {

            font-size: 13px;

        }

        div.updateSchedule table tr:nth-child(1) td:nth-child(1) {
            vertical-align: baseline;
            line-height: 50px;
        }

        div.updateSchedule table tr:nth-child(n + 3) td:nth-child(1) {
            vertical-align: baseline;
        }

        div.updateSchedule table tr:nth-child(5) td:nth-child(2) textarea {
            width: 100%;
            resize: none;
            height: 200px;
            padding: 8px;
            font-size: 13px;
            background-color: #eee;
            border: none;
            border-radius: 4px;
        }

        div.updateSchedule table tr:nth-child(1) td:nth-child(3) a {
            display: inline-block;

            line-height: 35px;
            padding: 0 25px;
            border-radius: 5px;
            vertical-align: 25px;
            background-color: #EBAD7A;
            color: #fff;
            font-size: 15px;
        }

        div.updateSchedule table tr:nth-child(1) td:nth-child(3) a+a {
            margin-left: 8px;
            background-color: #eee;
            color: #000;
        }

        input:focus {
            outline: none;
        }
    </style>
    <script>
        $(function() {
            flexibleInputBox();

            function flexibleInputBox() {
                var value = $('div.updateSchedule table tr:nth-child(2) td:nth-child(2) input').val();
                $('div.updateSchedule table tr:nth-child(2) td:nth-child(2) div').append('<div id="virtual_dom">' + value + '</div>');
                //실제 코드에는 상위돔에 집어넣어주세요.

                var inputWidth = $('#virtual_dom').width(); // 글자 하나의 대략적인 크기 

                $('div.updateSchedule table tr:nth-child(2) td:nth-child(2) input').css('width', inputWidth);
                $('#virtual_dom').remove();
            }

            $('div.updateSchedule table tr:nth-child(2) td:nth-child(2) input').on('keydown', function(e) {
                flexibleInputBox();
            });

            $("#datepicker").datepicker({
                dateFormat: 'yy년 m월 d일',
                monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip 텍스트
                    ,
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 부분 텍스트
                    ,
                showMonthAfterYear: true,
                yearSuffix: "년"
            });

            

        });
    </script>
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
            width: 1500px;
            height: 100vh;

            margin: 0 auto;
            overflow: hidden;
        }

        div.leftToolbar2 {

            width: 300px;
            height: 100vh;
            float: left;
            background-color: #fff;
            border-right: 1px solid #eee;
        }

        div.work2 {

            width: 900px;
            height: 100vh;
            float: left;
            overflow: hidden;
            overflow-y: scroll;

        }

        div.rightToolbar2 {

            width: 300px;
            height: 100vh;
            float: left;
            background-color: #fff;
            border-left: 1px solid #eee;
        }
    </style>
</head>

<body>
    <div class="layoutWrap2">
        <div class="leftToolbar2">
            <jsp:include page="/layout/left.jsp" />
        </div>
        <div class="work2">
            <div class="updateSchedule">
                <table>
                    <colgroup>
                        <col width="5%">
                        <col width="70%">
                        <col width="25%">
                    </colgroup>
                    <tr>
                        <td><i class="fas fa-times"></i></td>
                        <td><input type="text" value="커플캘린더...우리그만하자..."></td>
                        <td>
                            <a href="#">저장</a>
                            <a href="#">삭제</a>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <div>

                                <input type="text" id="datepicker" value="2020년 2월 15일" readonly>
                            </div>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><i class="fas fa-map-marker-alt"></i></td>
                        <td><input type="text" value="투썸플레이스 구리돌다리점, 대한민국 경기도 구리시 인창동 경춘로 223 명동빌딩 1층-2층"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><i class="far fa-calendar-minus"></i></td>
                        <td>
                            wo2ek8@gmail.com

                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><i class="fas fa-align-left"></i></td>
                        <td>
                            <textarea name="" id="" cols="30" rows="10">위치추가 개쩌네 무슨 누가 스케줄 등록 메모를 썸노로 해 진짜</textarea>
                        </td>
                        <td>형진오빠는 재이에게 썸노를 달라!</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>
</body></html>

