<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!--  jQuery CDN -->	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- bootstrap 4.4 CDN -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" >	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<!-- jQuery Redirect CDN     https://github.com/mgalante/jquery.redirect  -->
	<script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
	<!-- Modal Alert https://github.com/PureOpenSource/pureAlert  -->
	<script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
	
	
<style type="text/css">
ul.timeline {
    list-style-type: none;
    position: relative;
}
ul.timeline:before {
    content: ' ';
    background: #d4d9df;
    display: inline-block;
    position: absolute;
    left: 29px;
    width: 2px;
    height: 100%;
    z-index: 400;
}
ul.timeline > li {
    margin: 20px 0;
    padding-left: 20px;
}
ul.timeline > li:before {
    content: ' ';
    background: white;
    display: inline-block;
    position: absolute;
    border-radius: 50%;
    border: 3px solid #22c0e8;
    left: 20px;
    width: 20px;
    height: 20px;
    z-index: 400;
}	

.viewStatus {
	width : 110px;
}
		
</style>
<title>Insert title here</title>
</head>
<body>

<div class="container mt-5 mb-5">
	<div class="row">
		<div class="col-md-6 offset-md-3">
			<h4>Timeline</h4>
			<form id="addTimelineForm">
				<div class="input-group">
					<textarea class="form-control" name="postContent" style="height:100px" placeholder="게시글을 등록하세요"></textarea>
				</div>
		            <div class="float-right" >
						<button class="btn btn-primary btn-rt " id="addTimeline">등록</button>
		            </div>
				<input type="hidden" name="userId" value="${user.userId}">
		           	<select class="custom-select float-right viewStatus" name="viewStatus">
		              <option value="1" selected="selected">전체공개</option>
		              <option value="2">나만보기</option>
		            </select>
			</form>
			<ul class="timeline">
				<li>
					<a href="#" class="float-left">21 March, 2014</a><br/>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque scelerisque diam non nisi semper, et elementum lorem ornare. Maecenas placerat facilisis mollis. Duis sagittis ligula in sodales vehicula....</p>
				</li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>