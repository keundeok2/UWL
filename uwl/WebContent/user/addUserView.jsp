<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! addUserView / 학교주소 찾기 / 정규표현식 !!!!!!!!!!!!! -->
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
<!-- 	<link rel="stylesheet" type="text/css" href="assets/css/main.css"> -->
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	
	
	
	
	<!--  ///////////////////////// Bootstrap 4.4, jQuery 3.1.1 CDN ////////////////////////// -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
			rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
			crossorigin="anonymous">
			<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
			<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<!--  ///////////////////////// datePicker ////////////////////////// -->
<!--  	<link rel="stylesheet" href="/resources/demos/style.css"> -->
	
 	
 	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!--  ///////////////////////// ajax ////////////////////////// -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/openlayers/4.6.5/ol-debug.js" ></script>
	
	
	
	
	
	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	
	
	
	
		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( '#signUp' ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
		function fncAddUser() {
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var name=$("input[name='name']").val();
			var nickname=$("input[name='nickname']").val();
			var gender=$("input[name='gender']").val();
			var birth=$("input[name='birth']").val();
			var schoolName=$("input[name='schoolName']").val();
			var mail=$("input[name='mail']").val();
			
			// 메일 인증 유무를 판단하기 위한 Flag 
// 			var mailValue = $("input[name='mailValue']").val();
		
// 			// 1일 때 메일 인증 완료이므로 그 외 혹은 메일 인증을 진행하지 않은 경우 바로 종료
// 			if ( mailValue == "" || mailValue != "1" ) { 
// 				$("h6").text("메일 인증을 진행해주세요.");
// 				return;
// 			}
				
			
			
			
			
// 			정규표현식 test ==========================================================
// 		$(document).ready(function(){
// 			var regType1 = /^[a-z0-9_]{4,20}$/;
// 			var isValid = regType1.test("@user");
// 			console.log(isValid);
// 				console.log(/^[a-z0-9_]{5,8}$/.test($('#userId')));
				
				var idReg = /^[a-z]+[a-z0-9]{5,9}$/g;
		        if( !idReg.test( $("input[name=userId]").val() ) ) {
		        	$('#idReg').remove();
	 				var view = "<span id='idReg' style='color:red'> 아이디는 영문자로 시작하는 6~10자 영문자 또는 숫자이어야 합니다. </span>";
	 				$('#userId').after(view);
	 				$('#userId').focus();
// 		            alert("아이디는 영문자로 시작하는 6~10자 영문자 또는 숫자이어야 합니다.");
	 				return;
		        }
// 		})
// 			정규표현식 test ==========================================================




			if(id == null || id.length <1){
				$('#not').remove();
				var view = "<span id='not' style='color:red'> 아이디는 반드시 입력하셔야 합니다.</span>";
				$('#userId').after(view);
				$('#userId').focus();
				return 0;
			}
			
			if(pw == null || pw.length <1){
				$('#not').remove();
				var view = "<span id='not' style='color:red'> 패스워드는 반드시 입력하셔야 합니다.</span>";
				$('#password').after(view);
				$('#password').focus();
				return 0;
			}
			
			if(pw_confirm == null || pw_confirm.length <1){
				$('#not').remove();
				var view = "<span id='not' style='color:red'> 패스워드 확인은  반드시 입력하셔야 합니다.</span>";
				$('#password2').after(view);
				$('#password2').focus();
				return 0;
			}
			
			if( pw != pw_confirm ) {	
				$('#not').remove();
				var view = "<span id='not' style='color:red'> 비밀번호가 일치하지 않습니다.</span>";
				$('#password2').after(view);
				$('#password2').focus();
				$("input:text[name='password2']").focus();
				return 0;
			}
			
			if(name == null || name.length <1){
				$('#not').remove();
				var view = "<span id='not' style='color:red'> 이름은 반드시 입력하셔야 합니다.</span>";
				$('#name').after(view);
				$('#name').focus();
				return 0;
			}
			
			if(nickname == null || nickname.length <1){
				$('#not').remove();
				var view = "<span id='not' style='color:red'> 닉네임은 반드시 입력하셔야 합니다.</span>";
				$('#nickname').after(view);
				$('#nickname').focus();
				return 0;
			}
			
			if(gender == null || gender.length <1){
				$('#not').remove();
				var view = "<span id='not' style='color:red'> 성별은 반드시 입력하셔야 합니다.</span>";
				$('#gender').after(view);
				$('#gender').focus();
				return 0;
			}
			
// 			if(schoolName == null || schoolName.length <1){
// 				$('#not').remove();
// 				var view = "<span id='not' style='color:red'> 학교는 반드시 입력하셔야 합니다.</span>";
// 				$('#schoolName').after(view);
// 				$('#schoolName').focus();
// 				return 0;
// 			}
			
			if(birth == null || birth.length <1){
				$('#not').remove();
				var view = "<span id='not' style='color:red'> 생일은 반드시 입력하셔야 합니다. </span>";
				$('#birth').after(view);
				$('#birth').focus();
				return 0;
			}
			
			if(mail == null || mail.length <1){
				$('#not').remove();
				var view = "<span id='not' style='color:red'> 메일은 반드시 입력하셔야 합니다.</span>";
				$('#mail').after(view);
				$('#mail').focus();
				return 0;
			}
			
			var value = "";	
			if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
				var value = $("option:selected").val() + "-" 
									+ $("input[name='phone2']").val() + "-" 
									+ $("input[name='phone3']").val();
			}

			$("input:hidden[name='phone']").val( value );
			
			$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
		

		//==>"이메일" 유효성Check  Event 처리 및 연결============================= 
		 $(function() {
			 $("input[name='mail']").on("change" , function() {
				 var mail=$("input[name='mail']").val();
				 if(mail != "" && (mail.indexOf('@') < 1 || mail.indexOf('.') == -1) ){
					 $('#not').remove();
					 var view = "<span id='not' class='mailNot' style='color:red'> 이메일 형식이 아닙니다.</span>";
					 $('#mail').after(view);
					 $('#mail').focus();
			     }
			});
		});	
		
		
	 	//==>"ID중복확인" Event 처리 및 연결
			var checkId = 0;
		    //아이디 체크하여 가입버튼 비활성화, 중복확인.
		    function checkDuplicationUserId() {
		        var inputed = $('#userId').val();
		        console.log(inputed);
		        $.ajax({
		            data : {
		                userId : inputed
		            },
		            url : "/user/rest/checkDuplicationUserId",
		            method : 'GET',
		            success : function(data) {
		                if(data == true) {
		                    $("#userId").css("background-color", "#B0F6AC"); //초록
		                    $(".btn btn-outline-info btn-lg").prop("disabled", true);
	                         $(".btn btn-outline-info btn-lg").css("background-color", "#4CAF50"); //초록
		                    checkId = true;
		                }else {
		                    $("#userId").css("background-color", "#FFCECE"); //빨강
		                    $(".btn btn-outline-info btn-lg").prop("disabled", false);
		                    $(".btn btn-outline-info btn-lg").css("background-color", "#aaaaaa"); //회색
		                    checkId = false;
	                         signupCheck();
		                }
		            },
		            error : function(){
		            	alert("실패");
		            }
		        });
		    }		
		    
		    
		    
		  //==>"Nickname 중복확인" Event 처리 및 연결
		    var checkNick = 0;
		    // 체크하여 가입버튼 비활성화, 중복확인.
		    function checkDuplicationNickname() {
		        var inputed = $('#nickname').val();
		        console.log(inputed);
		        $.ajax({
		            data : {
		            	nickname : inputed
		            },
		            url : "/user/rest/checkDuplicationNickname",
		            method : 'GET',
		            success : function(data) {
		                if(data == true) {
		                    $("#nickname").css("background-color", "#B0F6AC"); //초록
		                    $(".btn btn-outline-info btn-lg").prop("disabled", true);
	                         $(".btn btn-outline-info btn-lg").css("background-color", "#4CAF50"); //초록
		                    checkId = true;
		                }else {
		                    $("#nickname").css("background-color", "#FFCECE"); //빨강
		                    $(".btn btn-outline-info btn-lg").prop("disabled", false);
		                    $(".btn btn-outline-info btn-lg").css("background-color", "#aaaaaa"); //회색
		                    checkId = false;
	                         signupCheck();
		                }
		            },
		            error : function(){
		            	alert("실패");
		            }
		        });
		    }		
		    
		    
		  //==>"mail 중복확인" Event 처리 및 연결
		    var mail = 0;
		    // 체크하여 가입버튼 비활성화, 중복확인.
		    function checkDuplicationMail() {
		        var inputed = $('#mail').val();
		        console.log(inputed);
		        $.ajax({
		            data : {
		            	mail : inputed
		            },
		            url : "/user/rest/checkDuplicationMail",
		            method : 'GET',
		            success : function(data) {
		                if(data == true) {
		                    $("#mail").css("background-color", "#B0F6AC"); //초록
		                    $(".btn btn-outline-info btn-lg").prop("disabled", true);
	                         $(".btn btn-outline-info btn-lg").css("background-color", "#4CAF50"); //초록
		                    checkId = true;
		                }else {
		                    $("#mail").css("background-color", "#FFCECE"); //빨강
		                    $(".btn btn-outline-info btn-lg").prop("disabled", false);
		                    $(".btn btn-outline-info btn-lg").css("background-color", "#aaaaaa"); //회색
		                    checkId = false;
	                         signupCheck();
		                }
		            },
		            error : function(){
		            	alert("실패");
		            }
		        });
		    }		
		    
		
		//==>"학교 주소찾기" Event 처리 및 연결  test================================ Error Error Error Error Error Error Error Error Error
//  		$(document).ready(function(){ 
// 			$("button#checkSchool").on("click" , function() {
// 				console.log(1);
// 				var schoolLevel = $("#schoolLevel").val();
// 				var schoolName = $("#schoolName").val();
// 				console.log(schoolLevel)
// 				console.log(schoolName)
// 				if(schoolName == "" || schoolName == null){
// 				console.log(2);
// 					alert('학교이름을 입력해주세요');
// 					$('#not').remove();
// 					var view = "<span id='not' style='color:red'> 학교이름을 입력해주세요.</span>";
// 					$('#schoolName').after(view);
// 					$('#schoolName').focus();
// 				}else{
// 					var url = "http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=0e5ab738c07aa5a4e219e84f907db889&svcType=api&svcCode=SCHOOL&contentType=json&gubun="+schoolLevel+"&searchSchulNm="+schoolName;
// 					ajaxCall(url,callback,error);			
// 					console.log(3);
// 				}
// 			});
//  		});
				
// 		function ajaxCall(url,callback){
// 			$.ajax({
// 				url : url,
// 				async : true,
// 				type : "GET",
// 				dataType : 'json',
// 				success : callback,
// 				error : error
// 			});
// 		}
		
// 		function callback(json){
// 			var total = json.dataSearch.content.length;
// 			var firstView = "검색어 <strong>"+$("input[type=text]").val()+"</strong> 에 대한 검색결과 총 <span>"+total+"</span>건입니다<hr/>"; 
// 			$("#append").append(firstView);
// 			for(var i=0; i<total; i++){
// 				var schoolName = json.dataSearch.content[i].schoolName;
// 				var adres = "     ,"+json.dataSearch.content[i].adres;
// 				var seq = "     ,"+json.dataSearch.content[i].seq;
// 				//이렇게 DB에 저장하면 될듯..?
// 				var secondView = "<span>"+schoolName+adres+seq+"<span><br/><br/>"
// 				$("#append2").append(secondView);
// 			}
// 		}
		
// 		function error(){
// 			alert("에러발생! 에러발생!");
// 		}
		
		
// 		//==>"학교 주소찾기" Event 처리 및 연결 test================================ Error Error Error Error Error Error Error Error Error
// 		 $(function() {
// 			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
// 			 $("button#checkSchool").on("click" , function() {
// 				popWin 
// 				= window.open("/user/checkDuplicationNickname.jsp",
// 											"popWin", 
// 											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
// 											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
// 			});
// 		});	
		
		 	
		 	
		 	
// 		//==>"Modal 학교 주소찾기" Event 처리 및 연결 test================================ Error Error Error Error Error Error Error Error Error

	 	$(function() {
				console.log('왜안와');
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
// 			$("button#checkSchool").on("click", function() {
			$(document).ready(function(){ 
	 			$("button#checkSchool").on("click" , function() {
	 				console.log(1);
	 				var schoolLevel = $('input[name=school]:checked').val();
	 				var schoolName = $("#schoolName").val();
	 				console.log(schoolLevel)
	 				console.log(schoolName)
	 				if(schoolName == "" || schoolName == null){
	 				console.log(2);
	 					$('#not').remove();
	 					var view = "<span id='not' style='color:red'> 학교이름을 입력해주세요.</span>";
	 					$('#schoolName').after(view);
	 					$('#schoolName').focus();
	 				}else{
	 					$('#school2').remove();
	 					var url = "http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=0e5ab738c07aa5a4e219e84f907db889&svcType=api&svcCode=SCHOOL&contentType=json&gubun="+schoolLevel+"&searchSchulNm="+schoolName;
	 					ajaxCall(url,callback,error);			
	 					console.log(3);
	 				}
	 			});
	  		});
			console.log(4);
	 		function ajaxCall(url,callback){
	 			$.ajax({
	 				url : url,
	 				async : true,
	 				type : "GET",
	 				dataType : 'json',
	 				success : callback,
	 				error : error
	 			});
	 		}
	 		console.log(5);
	 		function callback(json){
	 			console.log(6);
	 			var total = json.dataSearch.content.length;
	 			$('#school1').remove();
	 			var firstView = "<span id='school1'>검색어 <strong>"+$("input[type=text]").val()+"</strong> 에 대한 검색결과 총 <span>"+total+"</span>건입니다<hr/></span>"; 
	 			$("#append").append(firstView);
	 			console.log(7);
	 			
	 			// ERROR !!!!!!!!!!!!!! 초등학교만 안됨 !!!!!!!!!!! $('#school2').remove();
	 			$('#school2').remove();
	 			for(var i=0; i<total; i++){
	 				console.log(8);
	 				var schoolName = json.dataSearch.content[i].schoolName;
	 				var adres = "     ,"+json.dataSearch.content[i].adres;
	 				var seq = "     ,"+json.dataSearch.content[i].seq;
	 				//이렇게 DB에 저장하면 될듯..?
	 				var secondView = "<span id='school2'><span>"+schoolName+adres+seq+"</span><br/><br/></span>"
	 				$("#append2").append(secondView);
	 				console.log(9);
	 				console.log($("#school1"));
	 				console.log($("#school2"));
	 			}console.log(10);
	 		}
	 		
	 		
	 		$(function(){
	 			$(document).on('click', 'span#school2', function() {
// 	 				alert("문장이 클릭되었습니다.");
// 	 				alert($(this).text());
	 				$("input[name='schoolName']").val($(this).text());
	 				$('#schoolModal').modal('hide');
		 		});
	 		});
	 		
			
	 		function error(){
	 			alert("에러발생! 에러발생!");
	 		}	
				
		});	
		 	
		
		
		//==>"phone 본인인증" Event 처리 및 연결  ================================
				 $(function() {
			 $("button#checkPhone").on("click" , function() {
				 var phone = $('#phone').val();
				 if(isNaN(phone) || phone==''){
					 console.log('번호를 제대로 입력해줘!');
				 }else{
					 $('#phoneNumberCheckBox').remove();
					var view=
							"<div class='form-group' id='phoneNumberCheckBox'>"
							+ "<label for='phone' class='col-md-offset-1 col-md-3 control-label'>인증번호 입력</label>"
							+ "<div class='col-sm-4'>"
							+ "<input type='text' class='form-control' id='code' name='code' placeholder='인증번호를 입력해주세요.'>"
							+ "</div>"
							+ "<div class='col-sm-3'>"
							+ "<button type='button' class='btn btn-outline-warning' id='codeNumberCheck'>인증완료</button>"
							+ "</div>"
							+ "</div>";
						$('#phoneCheckAppend').after(view);
						$.ajax({
							url : "/user/rest/sendSms",
							dataType : 'json',
							data : {receiver : phone},
							success : function(data){
								$('#phone').attr('readonly' ,true);
							},
							error : function(){
								console.log('error');
							}
						});
				 }
			});
		});
			 $(document).on("click",'#codeNumberCheck', function(){
				 var code = $('#code').val();
				 $.ajax({
						url : "/user/rest/smsCheck",
						data : {code : code},
						success : function(data){
							if(data == true){
								//인증완료 시
								var view = "<h1><span>인증이 완료되었습니다</span></h1>"
								$('body').after(view);
							}else{
								//인증 틀릴시 누님이 이쁘게 틀렸다고 알려주세요! 
								$('#not').remove();
								var view = "<span id='not' style='color:red'> 인증번호를 다시 확인해주세요.</span>";
								$('body').after(view);
							}
						},
						error : function(){
							console.log('error');
						}
					});
			 });

		
		//==>"mail 본인인증" Event 처리 및 연결  ================================시작
		$(function() {
			// 이메일 입력 시 인증번호확인 버튼이 보이지 않도록 hide 
			$("button:contains('인증번호확인')").hide();
			$("button:contains('인증완료')").hide();
		})
		
		
		$(document).on("click" ,"button#sendMail", function() {
			var mail = $("input[name='mail']").val();
			console.log(mail);
			
			$.ajax(
					{
						url : "/user/rest/checkMail" , 
						method : "post" , 
						dataType : "JSON" , 
						headers : {
							"Accept" : "application/json" , 
							"Content-Type" : "application/json" 
						} , 
						data : JSON.stringify({
							mail : mail
						}) , 
						// beforeSend :: request 실행 전에 동작하는 call back function 
						beforeSend : function() {
							$("h6").text("메일 발송 중입니다... 잠시만 기다려 주세요.");
						} , 
						success : function( JSONData, Status ) {
							// 메일을 성공적으로 보냈을 시 returnMap.put("result", "done");
							if ( JSONData.result == "done" ) {
								// 이메일 입력 칸을 인증번호입력칸으로 바꾸므로 입력한 이메일을 백업하는 input type hidden 설정 구간 
								$("input[name='userMail']").val($("input[name='mail']").val());
								 
								$("input[name='mail']").val("");
								$("#mail").text("인증번호입력");
								
								// 본인인증할 state를 returnMap.put("mailCheck", state);로 반환했으므로 해당 값을 input type hidden에 백업
								$("input[name='mailCheck']").val(JSONData.mailCheck);
								
								// 없는 이메일로 메일 발송 자체는 가능하므로 이에 대한 추가적인 Business Logic이 필요함 
								$("h6").text("메일 발송이 완료되었습니다.");
								
								$("button#sendMail").remove();
								$("button:contains('인증번호확인')").show();
								$("input[name='mail']").attr("placeholder", "인증번호 입력");
								$("input[name='mail']").removeAttr("name");
								
							} 
						}
					}
			)
		});
		
		$(document).on("click" ,"button:contains('인증번호확인')", function() {
			var mailValue = $("input#mail").val();
			var mailCheck = $("input[name='mailCheck']").val();
			console.log("비교대상 값 : " + mailCheck);
			console.log("입력 값 : " + mailValue);
			
			// mailCheck는 이메일 인증 문자열 state이며 
			// mailValue는 이메일 인증 유무를 판단하는 Flag이다 
			
			// mailCheck의 default는 null String이므로 
			if ( mailCheck == "" ) {
				$("h6").text("메일이 발송되지 않았습니다.");
			}
			
			if ( mailCheck != "" ) {
				if ( mailCheck == mailValue ) {
					$("span.mailNot").remove();
					$("input[name='mailValue']").val("1");
					$("h6").text("인증되었습니다.");
					$("input[name='mail']").attr("readonly", true);
					$("button:contains('인증번호확인')").remove();
					$("button:contains('인증완료')").show();
				}
				
				if ( mailCheck != mailValue ) {
					$("h6").text("인증 문자가 틀렸습니다. 다시 확인해주세요.");
				}
			}
		});
	
	$(function() {
		 $( "a[href='#']" ).on("click" , function() {
			$("form")[0].reset();
		});
	});	
	
	//==>"mail 본인인증" Event 처리 및 연결  ================================ 끝				
				
    
    <!--  ///////////////////////// datePicer ////////////////////////// -->
  $( function() {
    $( "#birth" ).datepicker({
      changeMonth: true,
      changeYear: true,
      yearRange: "2000:2020",
      dateFormat: "yy-mm-dd"
    });
  });
  
  
  
//   사진 첨부 ===============================================================================
 	$(document).ready(function(){
		 $("#fileInput").on('change', function(){  // 값이 변경되면
			 if(window.FileReader){  // modern browser
				var profileName = $(this)[0].files[0].name;
			 }else {  // old IE
		 		var profileName = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
			 }

		 // 추출한 파일명 삽입
			 $("#userfile").val(profileName);
		 });
	});
 	
 	
  </script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default" id="top">
        	<a class="navbar-brand" href="/index.jsp" ><h3>어'울림</h3></a>
<!--         	<img src="./images/twitter_header_photo_1.jpg"> -->
<!-- 이미지 추가 -->
   	</div>	
   	<!-- ToolBar End /////////////////////////////////////-->	


	<!--  화면구성 div Start /////////////////////////////////////-->
<!-- 	<div class="container"> -->
<!-- 		<h1 class="bg-primary text-center">회 원 가 입</h1> -->
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		<div class="form-group">
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label" >* 아 이 디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" oninput="checkDuplicationUserId()">
		      <span id = "checkMsg"></span> 
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label" >* 비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">* 비밀번호 확인</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="name" class="col-sm-offset-1 col-sm-3 control-label" >* 이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="name" name="name" placeholder="회원 이름">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="nickname" class="col-sm-offset-1 col-sm-3 control-label" >* 닉네임</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickname" name="nickname" oninput="checkDuplicationNickname()">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="schoolName" class="col-sm-offset-1 col-sm-3 control-label"  >* 학교</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control"  readonly="readonly" name="schoolName" data-toggle="modal" data-target="#schoolModal">
<%-- 		      <input type="text" class="form-control" id="schoolName" name="schoolName" value="${user.schoolNo}" readonly="readonly"> --%>
<!-- 			    <input type="radio" id="schoolLevel" name="school" value="elem_list"/>초등학교 -->
<!-- 				<input type="radio" id="schoolLevel" name="school" value="midd_list"/>중학교 -->
<!-- 				<input type="radio" id="schoolLevel" name="school" value="high_list"/>고등학교 -->
<!-- 				<input type="radio" id="schoolLevel" name="school" value="univ_list"/>대학교 -->
		    </div>
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-outline-warning" data-toggle="modal" data-target="#schoolModal">주소찾기</button>
		    </div>
		  </div>
		  
			
		  
		  
		  
		  <div class="form-group" id="phoneCheckAppend">
		    <label for="phone" class="col-md-offset-1 col-md-3 control-label">휴대전화번호</label>
		     <div class="col-sm-4">
		      	<input type="text" class="form-control" id="phone" name="phone" placeholder="- 는 제외하고 입력해주세요.">
		    </div>
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-outline-warning" id="checkPhone">본인인증</button>
		    </div>
		  </div>
		  
		  
		  
		  <div class="form-group">
		    <label for="birth" class="col-sm-offset-1 col-sm-3 control-label" >* 생일</label>
		    <div class="col-sm-4">
		      <input type="text"  class="form-control" id="birth" name="birth"  placeholder="생일을 달력에서 선택하세요.">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="gender" class="col-sm-offset-1 col-sm-3 control-label" >* 성별</label>
		    <div class="col-sm-4">
		    <input type="radio" name="gender" value="1"> 여자 &nbsp;
		    <input type="radio" name="gender" value="2"> 남자
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="mail" class="col-sm-offset-1 col-sm-3 control-label">* 이메일</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="mail" name="mail"  oninput="checkDuplicationMail()" >
		      <h6></h6>
		    </div>
		    
		    <div class="col-sm-3">
		    	<button type="button" class="btn btn-outline-warning" id="sendMail">메일전송</button>
		    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    	<button type="button" class="btn btn-outline-warning">인증번호확인</button>
		    	<button type="button" class="btn btn-warning">인증완료</button>
		    	<input type="hidden" name="mailValue" value="">
		    	<input type="hidden" name="mailCheck" value="">
		    	<input type="hidden" name="mail1" value="">
		    </div>
		    
		    <div class="form-group" >
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		    <label for="profileName" class="col-sm-offset-1 col-sm-3 control-label" > 사 진</label>
		    <div class="col-sm-4">
		     	<input name="file" id="fileInput"  type="file" data-class-button="btn btn-default" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
					<div class="bootstrap-filestyle input-group">
						<input type="text" id="userfile" class="form-control" name="userfile" disabled="">
						<span class="group-span-filestyle input-group-btn" tabindex="0">
							<label for="fileInput" class="btn btn-default ">
								<span class="glyphicon fa fa-upload"></span>
							</label>
						</span>
					</div>
		    	</div>
		     </div>
		    

		  </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		     <button type="button" id="signUp"	class="btn btn-outline-info btn-lg" >가&nbsp;입</button>
			  <button type="button" class="btn btn-outline-info btn-lg btn" href="#">취&nbsp;소</button>
		    </div>
		  </div>
		  </div>
		  
		  
		  
		  <!-- Modal 학교 주소 찾기 -->
		  
		<div class="modal fade" id="schoolModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">학교 찾기</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
<!-- 		       <div class="form-group"> -->
<!-- 					<label for="userId">ID</label> -->
<%-- 						<input type="text" name="userId" id="userId" class="form-control" readonly="readonly" value="${user.userId }"> --%>
<!-- 				</div>					 -->
				<div class="form-group">
					<label for="schoolName">학교</label>
<!-- 						<input name="schoolName" id="schoolName" class="form-control" type="text"> -->
<%-- 			     	<input type="text" class="form-control" id="schoolName" name="schoolName" value="${user.schoolNo}" readonly="readonly"> --%>
			     	<input type="text" class="form-control" id="schoolName" name="schoolName">
<!-- 			     	<input type="submit" class="form-control" id="searchSchool" href="/user/addUserView.jsp"> -->
				</div>	
				
				<div >
				    <input type="radio" id="school" name="school" value="elem_list" checked />초등학교
					<input type="radio" id="school" name="school" value="midd_list"/>중학교
					<input type="radio" id="school" name="school" value="high_list"/>고등학교
					<input type="radio" id="school" name="school" value="univ_list"/>대학교
		   		</div>
				
				<div id="append"></div>
				
				<br/><br/>
				<div id="append2"></div>
		  		
								
			</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="checkSchool">확인</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
		  
		  
		
		  
		</form>
		
		<!-- form Start /////////////////////////////////////-->
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>