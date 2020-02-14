<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
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

        

        section#left {
            
            height: 100vh;
            width: 250px;
            float: left;
            border-right: 1px solid #eee;
        }

        section#work {
            background-color: lemonchiffon;
            width: calc(100% - 600px);
            float: left;
            height: 100vh;
            overflow-y: scroll;
        }

        section#right {
            
            height: 100vh;
            width: 350px;
            float: right;
            overflow-y: scroll;
            border-right: 1px solid #eee;
        }
    </style>
</head>

<body>
<!--  여기서부터 챗봇  -->
<div id="frogue-container" class="position-right-bottom" data-chatbot="4626e9e6-320e-4c99-afe8-c196f85db573" data-user="akxorb1234" data-init-key="value"></div>


<script>
(function(d, s, id){
var js, fjs = d.getElementsByTagName(s)[0];
if (d.getElementById(id)) {return;}
js = d.createElement(s); js.id = id;
js.src = "https:\/\/danbee.ai/js/plugins/frogue-embed/frogue-embed.min.js";
fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'frogue-embed'));
</script> 
<!--   여기까지 ㅋㅋ  -->

    <main>
        <section id="left">
			<jsp:include page="left.jsp" />
        </section>
        <section id="work">

        </section>
        <section id="right">
			<jsp:include page="right.jsp" />
        </section>
    </main>
</body></html>