<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품등록</title>

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />


<!-- 버튼변경을 위해 아래 2개 추가 & jQuery 리팩때 추가했던것-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<!-- 버튼변경을 위해 아래 2개 추가 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="../javascript/calendar.js">
</script>
<style type="text/css">

	.widget{
	  background-color: #000000;
	  color: skyblue;
	  float: right;
	  padding: 5px;
	  border-radius: 10px;
	  -moz-border-radius: 10px;
	  -webkit-border-radius: 10px;
	}
	
</style>


<script type="text/javascript">

 $( function() {
    
		    
	
    $( ".widget button" ).button();
    $("button:contains('수정')").on('click', function(){
    	fncUpdateChallenge();
    } );
    
    $("input[name=challContent]").keydown(function(key){
    	if(key.keyCode == 13){
    		fncUpdateChallenge();
    	}
    } );
    	
  } ); 
 
 $( function() {
	//들어오자마자 포커스를 첫번째 상품명 적는곳으로 위치
	$("input[name='challTitle']").focus();
 	
    $( ".widget button" ).button();
    
    $("a[href='#']").on('click', function(){
   		/* on = bind와 같은 효과의 펑션 */
   		//alert("취소");
   			$("form")[0].reset();
    } );
  } ); 

function fncUpdateChallenge(){

	//Form 유효성 검증
 	var challNo = $("input[name='challNo']").val();
	var challTitle = $("#challTitle").val();
	var challCategory = $("input[name='challCategory']").val();
	var challContent = $("#challContent").val();
	var challReward = $("#challReward").val();
	
	console.log("challNo : " + challNo + "challCategory : " + challCategory 
				+ "challTitle : " + challTitle +"challContent : " + challContent );

	if(challTitle == null || challTitle.length<1){
		alert("제목 입력하셈 (^오^)/ ");
		return;
	}
	
	if(challContent == null || challContent.length<1){
		alert("내용 입력하셈 (^오^)/ ");
		return;
	}
	
	if(challReward == null || challReward.length<1 ){
		alert("점수 입력하셈 (^오^)/ ");
		return;
	}
 
    
 	  $("form").attr("method","POST").attr("action","/challenge/updateChallenge").submit();  
}



</script>
</head>

<body>

	

	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">업데이트들어간다</a>
   		</div>
   	</div>

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">주간 도전과제 업데이트</h1>
		<br/><br/>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		  <div class="form-group">
		   <input type="hidden" name="challNo" value="${challenge.challNo}" />
		    <label for="challTitle" class="col-sm-offset-1 col-sm-3 control-label">제 목</label>
		    <div class="col-sm-4">
		       <input type="text" class="form-control" id="challTitle" name="challTitle" value="${challenge.challTitle}">
		  	</div>
		  	
		    <label for="challReward" class="col-sm-offset-1 col-sm-3 control-label">보 상 점 수</label>
		    <div class="col-sm-4">
		       <input type="text" class="form-control" id="challReward" name="challReward" value="${challenge.challReward}">
		  	</div>
		  	
		  	<br>
		  	<div class="col-sm-2">
			  	<select class="custom-select" name="challCategory">
			  		
				 <%--  <option value="1" ${!empty searchCondition && searchCondition == "1" ? "selected" : ""} >Map</option> --%>
				  <option value="1" ${!empty challenge.challCategory && challenge.challCategory  == "1" ? "selected" : ""} >Map</option>
				 
				  <option value="2" ${!empty challenge.challCategory && challenge.challCategory  == "2" ? "selected" : ""}>Vision</option>
				 
				  <option value="3" ${!empty challenge.challCategory && challenge.challCategory  == "3" ? "selected" : ""}>게시판활동</option>
				
				</select>
			</div>
			
	    </div>
		   <div class="mb-3">
		    <label for="challContent">내용</label>
		    <textarea class="form-control is-invalid" id="challContent" name="challContent" >${challenge.challContent}</textarea>
		  </div>
		  
		  <div class="form-group">
		    <label for="fileImage" class="col-sm-offset-1 col-sm-3 control-label">상품이미지&emsp;&emsp;&emsp;</label>
		   	 <input multiple="multiple" type="file" id="fileImage" name="fileImage" />
		    <p class="help-block">5MB 이하만 업로드 가능합니다.</p>
		  </div>

		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>
</html>