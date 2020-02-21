<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
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

        div.listCoupleTimelinePost {
            padding-top: 10px;
            width: 740px;
            margin: 0 auto;
        }

        div.listCoupleTimelinePost div.coupleTimelineHeader {

            position: relative;
            width: 100%;
            height: 90px;
        }

        div.coupleTimelineHeader div.firstUser {

            position: absolute;
            top: 0;
            left: 10px;
        }

        div.coupleTimelineHeader div.dDay {

            font-weight: bold;
            display: inline-block;
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        div.coupleTimelineHeader div.dDay div:nth-child(2) {
            font-size: 20px;

        }

        div.coupleTimelineHeader div.dDay div:nth-child(3) {
            font-size: 13px;
        }

        div.coupleTimelineHeader div.dDay div:nth-child(3) i {
            color: #dd2d2d;
            margin: 0 5px;
        }

        div.coupleTimelineHeader div.secondUser {

            position: absolute;
            right: 10px;
            top: 0;
        }

        div.coupleTimelineHeader div.userProfileImage {

            overflow: hidden;
            width: 90px;
            height: 90px;
            border-radius: 50%;
            position: relative;
            display: inline-block;
            vertical-align: middle;
        }

        div.coupleTimelineHeader div.userProfileImage img {
            height: 100%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        div.coupleTimelineHeader div.weather {

            font-size: 30px;
            display: inline-block;
            width: 50px;
            text-align: center;
            display: inline-block;
            vertical-align: middle;

        }

        div.coupleTimelineMain {

            overflow: hidden;
        }

        div.coupleTimelineMain div.coupleTimelinePost {

            overflow: hidden;
            width: calc(33.3333% - 10px);
            float: left;
            height: calc(710px / 3);
            vertical-align: middle;
            margin-right: 15px;
            margin-top: 15px;
            position: relative;
        }

        div.coupleTimelineMain div.coupleTimelinePost:nth-child(3n) {
            margin-right: 0;
        }

        div.coupleTimelinePost div.uploadImage img {
            width: 100%;
        }

        div.coupleTimelinePost div.imageHover {
            background-color: rgba(0, 0, 0, 0.5);

            position: absolute;
            width: 100%;
            height: 100%;

            top: 0;
            left: 0;
            opacity: 0;
            transition: all 0.1s;
        }

        div.coupleTimelinePost div.imageHover:hover {
            opacity: 1;
        }

        div.coupleTimelinePost div.imageHover div.uploadDate {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 100%;
            text-align: center;
            color: #fff;
        }

        

        

        div.getCoupleTimelinePost div.coupleTimelinePost {

            overflow: hidden;

            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 1;
            background: #fff;
            width: 935px;
            height: calc(935px * 0.6);
        }

        div.getCoupleTimelinePost div.coupleTimelinePost div.addCoupleTimelineComment {

            position: absolute;
            bottom: 0;
            right: 0;
            width: 40%;
        }

        div.addCoupleTimelineComment div.postDate {
            line-height: 35px;
            padding-left: 15px;

        }

        div.addCoupleTimelineComment div.commentForm {

            line-height: 55px;

            overflow: hidden;
            border-top: 1px solid #eee;
        }

        div.addCoupleTimelineComment textarea {
            border: none;
            width: 87%;
            float: left;
            height: 55px;
            resize: none;
            padding-left: 15px;
            line-height: 1.2;
            font-size: 14px;
            vertical-align: middle;
            padding-top: 18px;

        }

        div.addCoupleTimelineComment textarea:focus {
            outline: none;
        }

        div.addCoupleTimelineComment a {

            width: 13%;
            float: left;

            font-size: 14px;
            font-weight: bold;
            color: #EBAD7A;

        }

        div.getCoupleTimelinePost div.coupleTimelinePost div.coupleTimelinePostImage {

            overflow: hidden;
            width: 60%;
            float: left;
        }

        div.getCoupleTimelinePost div.coupleTimelinePost div.coupleTimelinePostImage img {
            width: 100%;
        }

        div.getCoupleTimelinePost div.coupleTimelinePost>div:nth-child(2) {

            width: 40%;
            float: right;

        }

        div.coupleTimelinePostUser {

            position: relative;
            height: 70px;
            border-bottom: 1px solid #eee;

        }

        div.getCoupleTimelinePost div.postUserProfileImage {

            overflow: hidden;
            width: 35px;
            height: 35px;
            border-radius: 50%;
            position: relative;
            display: inline-block;
            vertical-align: middle;
            margin-right: 15px;
        }

        div.getCoupleTimelinePost div.postUserProfileImage img {
            height: 100%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        div.getCoupleTimelinePost div.coupleTimelineUserId {
            font-weight: bold;
            font-size: 13px;
            display: inline-block;
            vertical-align: middle;
        }

        div.getCoupleTimelinePost div.postContent {
            font-size: 14px;
        }

        div.getCoupleTimelinePost div.postDate {
            font-size: 12px;
            color: #898989;
        }

        div.getCoupleTimelinePost div.coupleTimelinePostUser>div:nth-child(1) {
            position: absolute;
            top: 50%;
            left: 15px;
            transform: translateY(-50%);
        }

        div.getCoupleTimelinePost div.coupleTimelinePostUser>div:nth-child(2) {
            position: absolute;
            top: 50%;
            right: 15px;
            transform: translateY(-50%);
            color: #898989;
        }

        div.getCoupleTimelinePost div.coupleTimelinePostContent>div.postUserProfileImage,
        div.getCoupleTimelinePost div.coupleTimelinePostContent>div>div:nth-child(2) {
            display: inline-block;
            vertical-align: middle;

        }

        div.getCoupleTimelinePost div.coupleTimelinePostContent>div.postUserProfileImage {
            margin-right: 15px;

        }

        div.getCoupleTimelinePost div.coupleTimelinePostContent {
            padding-left: 15px;
            height: 70px;
            position: relative;
        }

        div.getCoupleTimelinePost div.coupleTimelinePostContent>div {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            left: 15px;
        }



        div.coupleTimelineComment {

            position: relative;
            height: 70px;
        }



        div.coupleTimelineComment:nth-child(2) {

            height: 70px;
        }

        div.coupleTimelineComment>div>div {
            display: inline-block;
            vertical-align: middle;
        }

        div.coupleTimelineComment>div:nth-child(1) {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
        }

        div.coupleTimelineComment>div:nth-child(2) {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #898989;
        }

        div.coupleTimelineUserId,
        div.coupleTimelinePostContent div.postContent,
        div.coupleTimelineComment div.postContent {
            display: inline-block;

        }

        div.backgroundOverlay {
            width: 100%;
            height: 100vh;
            background-color: rgba(0, 0, 0, 0.4);
            position: fixed;
            top: 0;
            right: 0;
            left: 0;
            bottom: 0;
            display: none;
        }
        div.backgroundOverlay.on {
        	display: block;
        }
        div.listCoupleTimelineComment {
            background-color: lavender;
            height: calc((935px * 0.6) - 230px);
            overflow-y: scroll;
        }
    </style>
    <script>
        $(function() {
            var userId = $('input[name="userId"]').val();

            

            $(document).on('click', 'div.coupleTimelineMain div.coupleTimelinePost a') {
                alert('클릭ㅋㅋ');
                $('div.backgroundOverlay').addClass('on');
                var postNo = $(this).find('input[name="postNo"]').val();
                $.ajax({
                    url: '/couple/rest/getCoupleTimelinePost/' + userId + '/' + postNo,
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
                        appendCoupleTimelinePost(data);
                    }
                })
            }

            function appendCoupleTimelinePost(post) {
                var postNo = post.postNo;
                var userId = post.userId;
                var uploadFileName = post.uploadFileName;
                var postDate = post.postDate;
                var place = post.place;
                var postTitle = post.postTitle;
                var postContent = post.postContent;

                var post = '<div class="coupleTimelinePost">' +
                    '<a href="#">' +
                    '<input type="hidden" name="postNo" value="' + postNo + '">' +
                    '<div class="uploadImage">' +
                    '<img src="img/81289090_165505291382436_7785460071330541719_n(1).jpg" alt="">' +
                    '</div>' +
                    '<div class="imageHover">' +
                    '<div class="uploadDate">' +
                    '<div>' + postDate + '</div>' +
                    '<div>' + place + '</div>' +
                    '</div>' +
                    '</div>' +
                    '</a>' +
                    '</div>';

                $('div.coupleTimelineMain').prepend(post);
            }

            $('div.backgroundOverlay').on('click', function() {
                alert('클릭클릭ㅋㅋ');
                $('div.getCoupleTimelinePost').remove();
                $('div.backgroundOverlay').removeClass('on');
            });

            $(document).ready(function() {

                alert('userId : ' + userId);
                $.ajax({
                    url: '/couple/rest/getCoupleTimelinePostList/' + userId,
                    method: 'GET',
                    dataType: 'json',
                    data: JSON.stringify({
                        userId: userId
                    }),
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    success: function(data) {
                        for (var i = 0; i < data.list.length; i++) {
                            prependCoupleTimelinePost(data.list[i]);
                        }
                    },
                    error: function(request, status, error) {
                        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });

            function prependCoupleTimelinePost(post) {
                var postNo = post.postNo;
                var userId = post.userId;
                var uploadFileName = post.uploadFileName;
                var postDate = post.postDate;
                var place = post.place;
                var postTitle = post.postTitle;
                var postContent = post.postContent;

                var post = '<div class="getCoupleTimelinePost">' +
                    '<div class="coupleTimelinePost">' +
                    '<input type="hidden" name="postNo" value="' + postNo + '"' +
                    '<div class="coupleTimelinePostImage">' +
                    '<img src="img/81289090_165505291382436_7785460071330541719_n(1).jpg" alt="">' +
                    '</div>' +
                    '<div>' +
                    '<div class="coupleTimelinePostUser">' +
                    '<div>' +
                    '<div class="postUserProfileImage">' +
                    '<img src="img/bonobono.jpg" alt="">' +
                    '</div>' +
                    '<div class="coupleTimelineUserId">' + userId + '</div>' +
                    '</div>' +
                    '<div><i class="fas fa-ellipsis-h"></i></div>' +
                    '</div>' +
                    '<div class="coupleTimelinePostContent">' +
                    '<div>' +
                    '<div class="postUserProfileImage">' +
                    '<img src="img/bonobono.jpg" alt="">' +
                    '</div>' +
                    '<div>' +
                    '<div class="coupleTimelineUserId">' + userId + '</div>' +
                    '<div class="postContent">' +
                    postContent +
                    '</div>' +
                    '<div class="postDate">' +
                    '5주' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '<div class="listCoupleTimelineComment">' +
                    '<div class="coupleTimelineComment">' +
                    '<div>' +
                    '<div class="postUserProfileImage">' +
                    '<img src="img/bonobono.jpg" alt="">' +
                    '</div>' +
                    '<div>' +
                    '<div class="coupleTimelineUserId">hyomindung</div>' +
                    '<div class="postContent">' +
                    '예쁘당' +
                    '</div>' +
                    '<div class="postDate">' +
                    '5주' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '<div class="deleteBtn">' +
                    '<i class="fas fa-times"></i>' +
                    '</div>' +
                    '</div>' +
                    '<div class="coupleTimelineComment">' +
                    '<div>' +
                    '<div class="postUserProfileImage">' +
                    '<img src="img/bonobono.jpg" alt="">' +
                    '</div>' +
                    '<div>' +
                    '<div class="coupleTimelineUserId">hyomindung</div>' +
                    '<div class="postContent">' +
                    '예쁘당' +
                    '</div>' +
                    '<div class="postDate">' +
                    '5주' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '<div class="deleteBtn">' +
                    '<i class="fas fa-times"></i>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '<div class="addCoupleTimelineComment">' +
                    '<div class="postDate">' + postDate + '</div>' +
                    '<div class="commentForm">' +
                    '<textarea name="" id="" cols="30" rows="10" placeholder="댓글 달기..."></textarea>' +
                    '<a href="#">게시</a>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>';

                $('div.listCoupleTimelinePost').after(post);
            }


        });
    </script>
</head>

<body>
    <input type="hidden" name="userId" value="${user.userId}">
    <div class="listCoupleTimelinePost">
        <div class="coupleTimelineHeader">
            <div class="firstUser">
                <div class="userProfileImage">
                    <img src="img/bonobono.jpg" alt="">
                </div>
                <div class="weather">
                    <i class="fas fa-smog"></i>
                </div>
            </div>
            <div class="dDay">
                <div>처음 만난 날</div>
                <div>172일째</div>
                <div>
                    <span class="firstUserName">김근덕</span><i class="fas fa-heart"></i><span class="secondUserName">주형진</span>
                </div>
            </div>
            <div class="secondUser">
                <div class="weather">

                    <i class="fas fa-sun"></i>
                </div>
                <div class="userProfileImage">
                    <img src="img/bonobono.jpg" alt="">
                </div>
            </div>
        </div>
        <div class="coupleTimelineMain">
            <div class="coupleTimelinePost">
                <a href="#">
                    <div class="uploadImage">
                        <img src="img/81289090_165505291382436_7785460071330541719_n(1).jpg" alt="">
                    </div>
                    <div class="imageHover">
                        <div class="uploadDate">
                            <div>2020년 2월 4일 (화)</div>
                            <div>강남구</div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="coupleTimelinePost">
                <a href="#">
                    <div class="uploadImage">
                        <img src="img/75586249_215873686083699_2609154030926987378_n.jpg" alt="">
                    </div>
                    <div class="imageHover">
                        <div class="uploadDate">
                            <div>2020년 2월 4일 (화)</div>
                            <div>강남구</div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="coupleTimelinePost">
                <a href="#">
                    <div class="uploadImage">
                        <img src="img/79366246_186468522524707_4331720126046688510_n.jpg" alt="">
                    </div>
                    <div class="imageHover">
                        <div class="uploadDate">
                            <div>2020년 2월 4일 (화)</div>
                            <div>강남구</div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="coupleTimelinePost">
                <a href="#">
                    <div class="uploadImage">
                        <img src="img/80338524_165631637981527_6322626174459999431_n.jpg" alt="">
                    </div>
                    <div class="imageHover">
                        <div class="uploadDate">
                            <div>2020년 2월 4일 (화)</div>
                            <div>강남구</div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="coupleTimelinePost">
                <a href="#">
                    <div class="uploadImage">
                        <img src="img/80639752_2566781766943900_7436097228326880724_n.jpg" alt="">
                    </div>
                    <div class="imageHover">
                        <div class="uploadDate">
                            <div>2020년 2월 4일 (화)</div>
                            <div>강남구</div>
                        </div>
                    </div>
                </a>
            </div>
        </div>

    </div>

    
    <div class="backgroundOverlay"></div>
</body></html>

