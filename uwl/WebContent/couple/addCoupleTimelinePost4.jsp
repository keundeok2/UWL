<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <script src="js/iscroll.js"></script>
    <script>

    </script>

    <title>Start Up</title>

    <style type="text/css">
        /*.img_wrap {
            width: 300px;
            margin-top: 50px;
        }*/

        /*.img_wrap img {
            max-width: 100%;
        }*/

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
            color: inherit;
            text-decoration: none;
        }

        p {
            margin: 0;
        }

        body {
            color: #333;
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;

        }

        div.addCoupleTimelinePost {
            width: 740px;
            margin: 0 auto;

            overflow: hidden;
        }

        a.uploadFileName {
            display: block;
            position: relative;
            width: 370px;
            overflow: hidden;
            float: left;
            height: 370px;
        }

        a.uploadFileName img {
            width: 100%;
        }

        a.uploadFileName>div {
            width: 100%;
            background-color: rgba(0, 0, 0, 0.3);
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            color: #fff;
        }

        div.addCoupleTimelinePost>div {
            float: right;
            width: 370px;
            padding-left: 10px;
        }

        div.addCoupleTimelinePost a.uploadFileName div.postDate div {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
        }

        div.addCoupleTimelinePost div.postContent textarea {
            width: 100%;
            margin: 0;
            padding: 0;
            vertical-align: middle;
            resize: none;
            border: none;
            border: 1px solid #eee;
        }

        p {
            margin: 0;
            padding: 0;
        }

        div.addCoupleTimelinePost div.place {
            margin-top: 10px;


        }

        div.addCoupleTimelinePost div.place i {
            display: inline-block;
            padding: 0 10px;
            background-color: #fff;
            line-height: 30px;
            float: left;
            vertical-align: middle;
            border-top: 1px solid #eee;
            border-left: 1px solid #eee;
            border-bottom: 1px solid #eee;
        }

        div.addCoupleTimelinePost div.place input {
            line-height: 30px;
            float: left;
            vertical-align: middle;
            border: none;
            border-top: 1px solid #eee;
            border-right: 1px solid #eee;
            border-bottom: 1px solid #eee;
            margin-bottom: 10px;
        }

        div.addCoupleTimelinePost div.postDate input {
            margin-top: 10px;
            line-height: 30px;
            border: none;
            border: 1px solid #eee;
        }

        div.layoutWrap2 {
            width: 1280px;
            height: 100vh;

            margin: 0 auto;
            overflow: hidden;

        }

        div.leftToolbar2 {

            width: 270px;
            height: 100vh;
            float: left;
            background-color: #fff;
            border-right: 1px solid #eee;


            padding-left: 15px;
            padding-top: 10px;
        }

        div.work2 {

            width: 740px;
            height: 100vh;
            float: left;




        }

        div.rightToolbar2 {

            width: 270px;
            height: 100vh;
            float: left;
            background-color: #fff;
            border-left: 1px solid #eee;


            padding-right: 15px;
            padding-top: 10px;
            padding-left: 15px;
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

    <script type="text/javascript">
        var sel_file;

        $(document).ready(function() {
            $("#input_img").on("change", handleImgFileSelect);
        });

        function handleImgFileSelect(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);

            filesArr.forEach(function(f) {
                if (!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }

                sel_file = f;

                var reader = new FileReader();
                reader.onload = function(e) {
                    $("#img").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
            });
        }
    </script>
</head>

<body>







    <div class="layoutWrap2">
        <div class="leftToolbar2">
            <jsp:include page="/layout/left.jsp" />
        </div>
        <div class="work2">

            <form action="/couple/addCoupleTimelinePost2" method="post">
                <div>
                    <h2><b>이미지 미리보기</b></h2>
                    <p class="title">이미지 업로드</p>
                    <input type="file" id="input_img" name="uploadFileName" />
                </div>









                <div class="addCoupleTimelinePost">
                    <a href="#" class="uploadFileName">


                        <img id="img" height="100%"/>



                        <!--<img src="img/81289090_165505291382436_7785460071330541719_n(1).jpg" alt="" height="100%">-->

                        <div class="postDate">
                            <div>
                                <p>2020년 2월 20일</p>
                                <p>강남구</p>
                            </div>
                        </div>
                    </a>
                    <div>

                        <div class="postDate">
                            <input type="text" value="2020년 2월 22일" name="postDate">
                        </div>
                        <div class="place">
                            <p>위치 추가</p>
                            <p>
                                <i class="fas fa-map-marker-alt"></i>
                                <input type="text" value="강남구" name="place">
                            </p>
                        </div>
                        <div class="postContent">

                            <textarea name="" id="" cols="30" rows="10" placeholder="문구 입력...">달이 땡글해!🌕</textarea>
                        </div>
                    </div>
                </div>



                <button type="submit">공유</button>
            </form>
        </div>
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>
</body></html>
