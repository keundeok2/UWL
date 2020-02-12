<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <!-- 내가정한 css 공통  -->
    <link rel="stylesheet" href="sandoCss/sandoCommon.css">
    
    <!-- bootstrap, jquery  -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/fb8ae6e812.js" crossorigin="anonymous"></script>
	<!-- 나눔고딕 -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    
    <style>
        body {
            background-color: rgb(250, 250, 250);
        }
        div.wrap {
            width: 900px;
            margin: 0 auto;
        }
        div.profileHeader {
            
            width: 100%;
            overflow: hidden;
            padding: 50px 0;
        }
        div.profileImage {
            
            width: 35%;
            text-align: center;
            float: left;
        }
        div.profileImage a {
            
            display: inline-block;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            overflow: hidden;
        }
        div.profileImage a img {
            width: 100%;
        }
        div.profile {
            
            width: 65%;
            float: right;
        }
        
        div.user {
            
            font-size: 26px;
            display: inline-block;
            vertical-align: bottom;
            margin-right: 10px;
        }
        div.profileUpdate,
        div.addFriend,
        div.sendFlower,
        div.useSpear {
            
            display: inline-block;
        }
        div.profileUpdate a,
        div.addFriend a,
        div.sendFlower a,
        div.useSpear a {
            
            line-height: 27px;
            display: inline-block;
            padding: 0 10px;
            border: 1px solid #c6c6c6;
            border-radius: 5px;
            font-weight: bold;
            vertical-align: middle;
            margin-right: 5px;
            font-size: 14px;
        }
        div.setting {
            
            display: inline-block;
            
        }
        div.setting a {
            
            font-size: 25px;
            display: inline-block;
            line-height: 30px;
            vertical-align: middle;
            padding: 0 3px;
        }
        div.setting a i {
            vertical-align: 0;
        }
        div.post {
            
            margin-top: 15px;
            font-size: 14px;
        }
        div.totalFlower {
            
            display: inline-block;
            margin-right: 35px;
        }
        div.totalFlower span {
            font-weight: bold;
        }
        div.activityPoint {
            
            display: inline-block;
            margin-right: 35px;
        }
        div.activityPoint span {
            font-weight: bold;
        }
        div.totalItem {
            
            display: inline-block;
            margin-right: 35px;
        }
        div.totalItem span {
            font-weight: bold;
        }
        div.totalItem2 {
            
            display: inline-block;
        }
        div.totalItem2 span {
            font-weight: bold;
        }
        div.name {
            
            margin-top: 15px;
            line-height: 1.5;
        }
        div.userName {
            
            font-weight: bold;
            font-size: 16px;
        }
        
        div.introduction a {
            color: rgb(0, 53, 105);
            font-weight: bold;
        }
        
        div.innerSection {
            
            border-top: 1px solid #dddddd;
            
        }
        div.section ul {
            
            width: 55%;
            margin: 0 auto;
            
            
            
        }
        div.section ul li {
            
            float: left;
            width: 25%;
            text-align: center;
            line-height: 50px;
            font-size: 12px;
            color: #898989;
            font-weight: bold;
        }
        div.section ul li.on {
            color: #333;
        }
        div.section ul li a {
            
            display: block;
            position: relative;
            
        }
        div.section ul li a:after {
            content: '';
            width: 45%;
            height: 1px;
            background-color: #333;
            
            position: absolute;
            top: -1px;
            left: 50%;
            transform: translateX(-50%);
            display: none;
            
        }
        div.section ul li.on a:after {
            display: block;
        }
        div.section ul li a i {
            
            margin-right: 3px;
        }
        section > div.list1 {
            background-color: lightblue;
        }
        section > div.list2 {
            background-color: lightcoral;
        }
        section > div.list3 {
            background-color: lightcyan;
        }
        section > div.list4 {
            background-color: lightgray;
        }
        section > div {
            display: none;
            height: 300px;
        }
        section > div.on {
            display: block;
        }
        section {
            clear: both;
        }
        
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
        /* .tab-pane {
        	border: 1px solid grey;
        } */
        
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
    </style>
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function() {
            $('div.section ul li a').on('click', function() {
                
                var i = $(this).parent().index();
                $('div.section ul li').removeClass('on');
                $('div.section ul li').eq(i).addClass('on');
                $('section > div').removeClass('on');
                $('section > div').eq(i).addClass('on');
                
            });
        });
    </script>
</head>

<body>
    <div class="wrap">
        <div class="profileHeader">
            <div class="profileImage">
                <a href="#"><img src="img/76890066_451523408887092_6939749509098373120_n.jpg" width="100px" alt=""></a>
            </div>
            <div class="profile">
                <div class="userId">
                    <div class="user">sonjaei_</div>
                    <div class="profileUpdate"><a href="#">프로필 편집</a></div>
                    <div class="setting"><a href="#"><i class="fas fa-cog"></i></a></div>
                    <div class="addFriend"><a href="#">친구추가</a></div>
                    <div class="sendFlower"><a href="#">꽃보내기</a></div>
                    <div class="useSpear"><a href="#">찔러보기</a></div>
                </div>
                <div class="post">
                    <div class="totalFlower">
                        <img src="img/love-and-romance.png" width="30px" alt=""> <span>32</span>
                    </div>
                    <div class="activityPoint">
                        활동점수 <span>170</span>
                    </div>
                    <div class="totalItem">
                        <img src="img/spear.png" width="30px" alt=""> <span>329</span>
                    </div>
                    <div class="totalItem2">
                        <img src="img/shield.png" width="30px" alt=""> <span>329</span>
                    </div>
                </div>
                <div class="name">
                    <div class="userName">
                        손재이
                    </div>
                    <div class="introduction">
                        [VLOG]제주도민의 가평 캠프통 아일랜드 우당탕 정복기 feat.건대 막걸리🍶<br>
                        <a href="#">youtu.be/UEDvqL-zVDA</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="section">
            <div class="innerSection">
                <ul>
                    <li class="on"><a class="nav-link active" href="#"><i class="fas fa-coins"></i> 포인트 적립내역</a></li>
                    <li><a href="#"><i class="fas fa-tv"></i> IGTV</a></li>
                    <li><a href="#"><i class="far fa-bookmark"></i> 저장됨</a></li>
                    <li><a href="#"><i class="fas fa-user-tag"></i> 태그됨</a></li>
                </ul>
            </div>
            <section>
                <div class="list1 on">
                    게시물ㅋㅋ
                </div>
                <div class="list2">
                    IGTVㅋㅋ
                </div>
                <div class="list3">
                    저장됨ㅋㅋ
                </div>
                <div class="list4">
                    태그됨ㅋㅋ
                </div>
            </section>
        </div>
    </div>
</body>

</html>
