<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://kit.fontawesome.com/4b823cf630.js"	
	crossorigin="anonymous"></script>
	

<!--썸머노트 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<!--썸머노트 -->



<title>Insert title here</title>

	<style type="text/css">
	
	
		#inputPostTitle	{
			border: none;
			border-bottom: none solid;
			background: none;
			outline: none;
		}
		
		
		
		@import url(https://fonts.googleapis.com/css?family=Quicksand:300,400);
		
		*, *:before, *:after {
		    padding: 0;
		    margin: 0;
		    border: none;
		    outline: none;
		    -moz-box-sizing: border-box;
		    box-sizing: border-box
		    }
		
		body {
		  font-size: 100%;
		  font-family: 'Quicksand', sans-serif; 
		}
		
		p.heading {
		  line-height: 1.2;
		  font-size: 2em;
		  text-align: left;
		}
		
		.wrapper {
		  margin: 15px auto;
		  max-width:700px;
		}
		.dropdownbox {
		  margin: 0 auto;
		  width: 200px;
		  margin-top: 40px;
		  background: #FFFFFF;
		  color: #000000;
		  cursor: pointer;
		}
		
		.dropdownbox > p {
		  padding: 5px 10px;
		  font-size: 1.25em;
		  line-height: 1.4em;
		  user-select: none;
		  -moz-user-select:none;
		  /* Safari */
		  -khtml-user-select: none;
		}
		
		ul.menu {
		  position: relative;
		  margin: 0 -20px;
		  width: 200px;
		  overflow: hidden;
		  height: 0;
		  margin-top: 10px;
		     -webkit-transition: all 0.3s ease-in; 
		   -moz-transition: all 0.3s ease-in;
		     -o-transition: all 0.3s ease-in;
		        transition: all 0.3s ease-in;
		  /*-moz-transform:scale(0); */
		  background: #FFFFFF;
		  color: #000000;
		  cursor: pointer;
		  user-select: none;
		  -moz-user-select:none;
		  /* Safari */
		  -khtml-user-select: none;
		}
		
		ul.menu li {
		  padding: 2px 10px;
		    font-size: 1.25em;
		  line-height: 1.4em;
		       -webkit-transition: all 0.3s ease-in; 
		   -moz-transition: all 0.3s ease-in;
		     -o-transition: all 0.3s ease-in;
		        transition: all 0.3s ease-in;
		  border-bottom: 1px dotted #000000;
		}
		ul.menu li:hover {
		  padding-left: 20px;
		  color: #000000;
		  background: #FFFFFF;
		}
		
		.menu.showMenu {
		  /*-moz-transform:scale(1);*/
		  height: 200px;
		}
		
		body {
			overflow-y: scroll; 
		}

		.wrapper {
			text-align: left;
		}
		.dropdownbox {
			text-align: left;
			width: 100%;
			margin: -20px;
		}
		
	</style>
	
	
	<script type="text/javascript">
	
		
	function fncAddChallenge(){

		//Form 유효성 검증
		var challTitle = $("#challTitle").val();
		var challCategory = $("input[name='challCategory']").val();
		var challContent = $("input[name='challContent']").val();
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
		}else if(challReward.length >= 5 ){
			alert("점수가 너무커요! 최대 천단위까지 가능합니다. (^오^)/ ");
			return;
		}
	 
	    
	 	 $("form").attr("method","POST").attr("action","/challenge/addChallenge").submit(); 
	}
	
	
	var gatherCategoryNo = null;
	
	$(document).ready(function(){
		  $(".dropdownbox").click(function(){
			  $('#choiceCategory').removeClass();
		    $(".menu").toggleClass("showMenu");
		      $(".menu > li").click(function(){
		        $(".dropdownbox > p").html($(this).html());
		        $(".menu").removeClass("showMenu");
		      });
		  });
		});
	
	
	//썸머노트--------------------------------------------------------------------------------
	$(document).ready(function() {
			$('#summernote').summernote({
				height : 300,
				minHeight : 370,
				maxHeight : null,
				focus : true,
				toolbar: [
				    // [groupName, [list of button]]
				    ['toolbar', ['picture','video','bold']],	
				    ['size',['fontsize']],
				    ['color',['color']],
				    ['remove',['clear']]
				  ],
				placeholder : '내용을 입력하세요',
				lang : 'ko-KR',
				callbacks : {
					onImageUpload : function(files, editor, welEditable) {
						sendFile(files[0], editor, welEditable);
						//editor가 누군지 welEditable이 누군지 알아보자 ㅅㅂㅋㅋ
					}
				}
			});
		});
	function sendFile(file, editor, welEditable) {
				data = new FormData();
				data.append("file", file);
				$.ajax({
					data : data,
					url : '/challenge/rest/addSummerNoteFile',	//리턴을 url로 해줘야함 ㅋㅋ
					type : "POST",
					cache : false,
					contentType : false,
					enctype : 'multipart/form-data',
					processData : false,
					success : function(data) {
						var file = "/images/"+data;
						$('#summernote').summernote('insertImage',file);
					},
					error : function(){
						alert("에러냐 ㅋㅋ");
					}
				});
			}
	//썸머노트--------------------------------------------------------------------
	
	$(document).ready(function(){
		$('#complete').on('click',function(){
			
			/* //유효성체크
			var challTitle = $("#challTitle").val();
			var challCategory = $("input[name='challCategory']").val();
			var challContent = $("#summernote").val();
			var challReward = $("#challReward").val();
			console.log("challCategory : " + challCategory 
					+ "challTitle : " + challTitle +"challContent : " + challContent );
			
			if(challTitle == null || challTitle.length<1){
				alert("제목 입력하셈 (^오^)/ ");
				return;
			}
			
			if(challContent == null || challContent.length<1){
				alert("내용 입력하셈 (^오^)/ ");
				return;
			}
			
		 	if(challCategory == null || challCategory != 1 || challCategory != 2 || challCategory != 3){
				alert("내용 입력하셈 (^오^)/ ");
				return;
			} 
			
			if(challReward == null || challReward.length<1 ){
				alert("점수 입력하셈 (^오^)/ ");
				return;
			}else if(challReward.length >= 5 ){
				alert("점수가 너무커요! 최대 천단위까지 가능합니다. (^오^)/ ");
				return;
			} */
			
		 	$('form').attr('method','POST').attr('action','/challenge/addChallenge').submit(); 
		});
		
		 
		$('li').on('click',function(){
			gatherCategoryNo = $(this).val();
			$('#gatherCategoryNo').val(gatherCategoryNo);
		});	 
	});
	
	
	</script>
</head>


<body>
    <form enctype="multipart/form-data">
        <div class="row">
    <div class="col-xs-2 col-md-2"></div>
    <div class="col-xs-8 col-md-8">
    
           <br>
           <br>
            <h2>도전과제 작성
             	<span class="badge badge-danger">New</span>
             </h2>

             <br>
             
          <!-- 카테고리 -->
          <div class="row col-md-3">
             <select class="custom-select" name="challCategory"> 
			  <option selected>카테고리</option>
			  <option value="1">Map</option>
			  <option value="2">Vision</option>
			  <option value="3">게시판활동</option>
			</select>
			<br><br>
			<!-- 보상점수 -->
			<div class="input-group mb-4">
			  <div class="input-group-prepend">
			    <span class="input-group-text" style="width: 35px;"><i class="fas fa-coins"></i></span>
			  </div>
			  <input type="text" class="form-control" name="challReward">
			  <div class="input-group-append">
			    <span class="input-group-text" style="width: 35px; ">점</span>
			  </div>
			</div>
			
          </div> 
          <br>
			
	    <div class="table table-responsive">
	        <table class="table">	
	        <tr>
	            <th class="success">
	            <input type="text" name="challTitle" id="challTitle" placeholder="제목을 입력하세요" style="width:570px"/>
	            </th>
	        </tr>
	        <tr>
	            <td colspan="3"></td>
	        </tr>
	        </table>
	        <textarea id="summernote" name="challContent"></textarea>
	        <br>
	        
	        
	     </div>
	        
	        
	        
	        <div style="text-align:right;width:100%">
	        <div class="form-group">
	       		<button type="button" class="btn btn-outline-secondary" id="complete" style="width:150px">등록</button>
	       	</div>
	    </div>
    </div>
</div>
 </form>
</body>
</html>
