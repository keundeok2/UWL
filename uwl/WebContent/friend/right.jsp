<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어울림</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<!--  jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- jQuery Redirect CDN     https://github.com/mgalante/jquery.redirect  -->
<script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>


<script type="text/javascript">
	$(function() {
		var sessionId = "${user.userId}";
		
		$.ajax({
			url : "/friend/rest/getFriendListForSearch",
			method : "POST",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				userId : sessionId,
			}),
			success : function(d) {
				for (var i = 0; i < d.list.length; i++) {
					var html = "<li class='list-group-item rigthFriendList'>"
								+"<img class='profileNameRight' src='/images/"+d.list[i].profileName+"'/>"+d.list[i].name+""
								+"<div>"
								+"<img class='profileNameRightPopup' src='/images/"+d.list[i].profileName+"'/>"+d.list[i].name+""
								+"<input type='hidden' value='"+d.list[i].userId+"'>"
								+"<button class='btn btn-primary btn-sm rightProfileBtn'>프로필</button>"
								+"<button class='btn btn-primary btn-sm rightchatBtn'>1:1 채팅</button>"
								+"</div></li>"
					$(".list-group").append(html);
					$(".list-group").append(html);
					$(".list-group").append(html);
					$(".list-group").append(html);
				}
			}
		})
	})
	
	// rigth toolbar mouseenter
	$(document).on("mouseenter", "li.list-group-item", function() {
		$(this).addClass('on');
	});
	
	$(document).on("mouseleave", "li.list-group-item", function() {
		$(this).removeClass('on');
        $(this).children().find('div').on('mouseenter', function() {
            $(this).parent().addClass('on');
        });
        $(this).children().find('div').on('mouseleave', function() {
            $(this).parent().removeClass('on');
        });
	});
	//////////
	
	// 프로필버튼 EVENT
	var targetUserId = null;
	$(document).on("click", ".rightProfileBtn", function() {
		targetUserId = $(this).prev().val();
		console.log(targetUserId);
		$.redirect("/user/getProfile/"+targetUserId+"",{}, "GET");
	})
	
	// 채팅버튼 EVENT 구현해야함 /////////////////////////////////////////////////
	
</script>

<style type="text/css">

	.profileNameRight {
		width : 55px;
		height : 55px;
		margin-right: 10px;
	}
	
	.profileNameRightPopup {
		width : 100px;
		height : 100px;
		border-radius : 20px;
		margin-right: 10px;
	}
	
	li.list-group-item {
		position: relative;
	}
	
	li.list-group-item > div{
		background-color: lemonchiffon;
		position: absolute;
		border: 1px solid gray;
        top: 0;
        left: -350px;
        width: 350px;
        display: none;
	}
	
	li.list-group-item > div:after {
            content: '';
            display: block;
            width: 20px;
            height: 20px;
            position: absolute;
            right: -11px;
            top: 20px;
            transform: rotate(45deg);
            border-top: 1px solid;
            border-right: 1px solid;
            background: #fff;
        }
	
	li.list-group-item.on > div {
		display: block;
    }
    
    .rightProfileBtn {
    	margin-right: 10px;
    	margin-left: 10px;
    }
    
    
</style>

</head>
<body>
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8"></div>
			<div class='col-2'>
				<ul class="list-group rightToolbarUl">
				</ul>
			</div>
		</div>
		
</body>
</html>