<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Start Up</title>

    <style type="text/css">
        .img_wrap {
            width: 300px;
            margin-top: 50px;
        }

        .img_wrap img {
            max-width: 100%;
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
                    alert("Ȯ���ڴ� �̹��� Ȯ���ڸ� �����մϴ�.");
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
    <form action="/couple/addCoupleTimelinePost2" method="post">
        <h3>Ŀ�� Ÿ�Ӷ��� �Խñ� ���</h3>

        <input type="text" name="userId" value="${user.userId }"><br>


        <div>
            <h2><b>�̹��� �̸�����</b></h2>
            <p class="title">�̹��� ���ε�</p>
            <input type="file" id="input_img" name="uploadFileName"/>
        </div>

        <div>
            <div class="img_wrap">
                <img id="img" />
            </div>
        </div>


        uploadFileName : <br>
        place : <input type="text" name="place"><br>
        postTitle : <input type="text" name="postTitle"><br>
        postContent : <input type="text" name="postContent"><br>

        <button type="submit">���</button>

    </form>
</body></html>