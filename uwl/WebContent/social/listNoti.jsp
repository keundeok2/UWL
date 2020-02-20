<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--  CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
	<script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>    
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
  	<script src="https://kit.fontawesome.com/4b823cf630.js" crossorigin="anonymous"></script>
  	
  	<script type="text/javascript">
  	
  	$(document).on("click", "button#notiDeleteAll", function() {
  		console.log("sessionUserId", sessionUserId);
  		$.ajax({
            url: "/social/rest/deleteNotiAll",
            method: "POST",
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
            },
            data: JSON.stringify({
            	userId : sessionUserId
            }),
            success : function() {
				$(".tracking-item").remove();
			}
            });
	});
  	
  	$(document).on("click", "button#deleteNoti", function() {
  		var notiNo = $(this).next().val();
  		console.log("notiNo", notiNo);
  		$.ajax({
            url: "/social/rest/deleteNoti",
            method: "POST",
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
            },
            data: JSON.stringify({
            	notiNo : notiNo
            }),
            success : function() {
				$("."+notiNo+"").remove();
			}
            });
	});
  	
  	</script>
  	
    <title>Document</title>
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
        
        .card-header, .card-footer {
        	background-color: #fbebde;
        }
        
        
.tracking-detail {
 padding:3rem 0
}
#tracking {
 margin-bottom:1rem
}
[class*=tracking-status-] p {
 margin:0;
 font-size:1.5rem;
 text-transform:uppercase;
 text-align:center
}
[class*=tracking-status-] {
 padding:1.6rem 0
}
.tracking-status-intransit {
 background-color:#fbebde
}
.tracking-status-outfordelivery {
 background-color:#f5a551
}
.tracking-status-deliveryoffice {
 background-color:#f7dc6f
}
.tracking-status-delivered {
 background-color:#4cbb87
}
.tracking-status-attemptfail {
 background-color:#b789c7
}
.tracking-status-error,.tracking-status-exception {
 background-color:#d26759
}
.tracking-status-expired {
 background-color:#616e7d
}
.tracking-status-pending {
 background-color:#ccc
}
.tracking-status-inforeceived {
 background-color:#214977
}
.tracking-list {
 border:1px solid #e5e5e5
}
.tracking-item {
 border-left:1px solid #e5e5e5;
 position:relative;
 padding:2rem 1.5rem .5rem 2.5rem;
 font-size:.9rem;
 margin-left:3rem;
 min-height:5rem
}
.tracking-item:last-child {
 padding-bottom:4rem
}
.tracking-item .tracking-date {
 margin-bottom:.5rem
}
.tracking-item .tracking-date span {
 color:#888;
 font-size:100%;
 padding-left:.4rem
}
.tracking-item .tracking-content {
 padding:.5rem .8rem;
 background-color:#f4f4f4;
 border-radius:.5rem;
 font-size: 130%
}
.tracking-item .tracking-content span {
 display:block;
 color:#888;
 font-size:85%
}
.tracking-item .tracking-icon {
 line-height:2.6rem;
 position:absolute;
 left:-1.3rem;
 width:2.6rem;
 height:2.6rem;
 text-align:center;
 border-radius:50%;
 font-size:1.1rem;
 background-color:#fff;
 color:#fff
}
.tracking-item .tracking-icon.status-sponsored {
 background-color:#f68
}
.tracking-item .tracking-icon.status-delivered {
 background-color:#4cbb87
}
.tracking-item .tracking-icon.status-outfordelivery {
 background-color:#f5a551
}
.tracking-item .tracking-icon.status-deliveryoffice {
 background-color:#f7dc6f
}
.tracking-item .tracking-icon.status-attemptfail {
 background-color:#b789c7
}
.tracking-item .tracking-icon.status-exception {
 background-color:#d26759
}
.tracking-item .tracking-icon.status-inforeceived {
 background-color:#214977
}
.tracking-item .tracking-icon.status-intransit {
 color:#e5e5e5;
 border:1px solid #e5e5e5;
 font-size:.6rem
}
@media(min-width:992px) {
 .tracking-item {
  margin-left:10rem
 }
 .tracking-item .tracking-date {
  position:absolute;
  left:-10rem;
  width:7.5rem;
  text-align:right
 }
 .tracking-item .tracking-date span {
  display:block
 }
 .tracking-item .tracking-content {
  padding:0;
  background-color:transparent
 }
}

.tracking-icon img {
 width:2.7rem;
 height:2.7rem;
 border-radius:50%;
}

#deleteNoti {
	display: inline-block;
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
			<jsp:include page="/layout/left.jsp" />
        </section>
        <section id="work">
			   <div class="row">
			      <div class="col-md-12 col-lg-12">
			         <div id="tracking">
			            <div class="text-center tracking-status-intransit">
			               <p class="tracking-status text-tight">알림</p>
			               <button class="btn btn-outline-secondary btn-sm" id="notiDeleteAll" style="float: right;">알림 모두 삭제</button>
			            </div>
			            <div class="tracking-list">
			            <c:forEach items="${map.list}" var="noti">
			               <div class="tracking-item ${noti.notiNo}">
			                  <div class="tracking-icon status-intransit">
			                  <img src="/images/${noti.sender.profileName}">
			                  </div>
			                  <div class="tracking-date"><span>${noti.notiDate}</span></div>
			                  <c:if test="${noti.notiOrigin eq 1 }">
			                  	<c:if test="${noti.notiCode eq 1}">
			                  		<div class="tracking-content">${noti.sender.name}님이 게시글에 댓글을 등록했습니다.<span><a href="/post/getBoard?postNo=${noti.postNo}">해당 게시글로 이동</a></span></div>
			                  	</c:if>
			                  </c:if>
			                  <c:if test="${noti.notiOrigin eq 2 }">
			                  	<c:if test="${noti.notiCode eq 5 }">
			                  		<div class="tracking-content">${noti.sender.name}님이 Ask에 답변을 등록했습니다.<span><a href="/social/getAskList/${noti.senderId}">${noti.sender.name}님의 ask로 이동</a></span></div>
			                  	</c:if>
			                  </c:if>
			                  <c:if test="${noti.notiOrigin eq 3 }">
			                  	<c:if test="${noti.notiCode eq 1 }">
			                  		<div class="tracking-content">${noti.sender.name}님이 타임라인에 댓글을 등록했습니다.<span><a href="/user/getProfile/${noti.senderId}">${noti.sender.name}님의 타임라인으로 이동</a></span></div>
			                  	</c:if>
			                  </c:if>
			                  <c:if test="${noti.notiOrigin eq 4 }">
			                  	<c:if test="${noti.notiCode eq 3 }">
			                  		<div class="tracking-content">${noti.sender.name}님이 친구 요청을 보냈습니다.<span><a href="/user/getProfile/${noti.senderId}">${noti.sender.name}님의 프로필로 이동</a></span></div>
			                  	</c:if>
			                  	<c:if test="${noti.notiCode eq 4 }">
			                  		<div class="tracking-content">${noti.sender.name}님이 친구 요청을 수락했습니다.<span><a href="/user/getProfile/${noti.senderId}">${noti.sender.name}님의 프로필로 이동</a></span></div>
			                  	</c:if>
			                  </c:if>
			                  <c:if test="${noti.notiOrigin eq 5 }">
			                  	<c:if test="${noti.notiCode eq 2 }">
			                  		<div class="tracking-content">1:1 문의사항의 답변이 완료되었습니다.<span><a href="/user/getUserQuestions/${noti.senderId}">내 문의사항으로 이동</a></span></div>
			                  	</c:if>
			                  </c:if>
			                  <button class="btn btn-outline-secondary btn-sm" id="deleteNoti">삭제</button>
			                  <input type="hidden" value="${noti.notiNo}"/>
			               </div>
			            </c:forEach>   
			            </div>
			         </div>
			      </div>
			   </div>
        </section>
        <section id="right">
			<jsp:include page="/layout/right.jsp" />
        </section>
    </main>
</body></html>