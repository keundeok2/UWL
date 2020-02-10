<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 수 정 중 !!!!!!!!!!!!! -->
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	
<!-- 	<link rel="stylesheet" type="text/css" href="assets/css/main.css"> -->
	
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// datePicker ////////////////////////// -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--  	<link rel="stylesheet" href="/resources/demos/style.css"> -->
 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
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
			var schoolNo=$("input[name='schoolNo']").val();
			var mail=$("input[name='mail']").val();
			// 메일 인증 유무를 판단하기 위한 Flag 
// 			var mailValue = $("input[name='mailValue']").val();
		
// 			// 1일 때 메일 인증 완료이므로 그 외 혹은 메일 인증을 진행하지 않은 경우 바로 종료
// 			if ( mailValue == "" || mailValue != "1" ) { 
// 				$("h6").text("메일 인증을 진행해주세요.");
// 				return;
// 			}
			
			if(id == null || id.length <1){
				alert("아이디는 반드시 입력하셔야 합니다.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("패스워드는  반드시 입력하셔야 합니다.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("패스워드 확인은  반드시 입력하셔야 합니다.");
				return;
			}
			if(name == null || name.length <1){
				alert("이름은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if(nickname == null || nickname.length <1){
				alert("닉네임은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if(gender == null || gender.length <1){
				alert("성별은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if(birth == null || birth.length <1){
				alert("생일은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if(schoolNo == null || schoolNo.length <1){
				alert("학교는  반드시 입력하셔야 합니다.");
				return;
			}
			
			if(mail == null || mail.length <1){
				alert("메일은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("비밀번호 확인이 일치하지 않습니다.");
				$("input:text[name='password2']").focus();
				return;
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
		

		//==>"이메일" 유효성Check  Event 처리 및 연결=============================안됨!!!!!!!!!!!!!!!!!!!!!!!!!!
		 $(function() {
			 
			 $("input[name='mail']").on("change" , function() {
				
				 var mail=$("input[name='mail']").val();
			    
				 if(mail != "" && (mail.indexOf('@') < 1 || mail.indexOf('.') == -1) ){
			    	alert("이메일 형식이 아닙니다.");
			     }
			});
		});	
		
		
	 	//==>"ID중복확인" Event 처리 및 연결
			var checkId = 0;
// 		    var checkPw = 0;
// 		    var checkNick = 0;
		    //아이디 체크하여 가입버튼 비활성화, 중복확인.
		    function checkDuplicationUserId() {
		        var inputed = $('#userId').val();
		        console.log(inputed);
		        $.ajax({
		            data : {
		                userId : inputed
		            },
		            url : "/user/rest/checkDuplicationUserId",
		            method : 'get',
		            success : function(data) {
		                if(data == true) {
		                    $("#userId").css("background-color", "#B0F6AC"); //초록
		                    $(".signupbtn").prop("disabled", true);
	                         $(".signupbtn").css("background-color", "#4CAF50"); //초록
		                    checkId = true;
		                }else {
		                    $("#userId").css("background-color", "#FFCECE"); //빨강
		                    $(".signupbtn").prop("disabled", false);
		                    $(".signupbtn").css("background-color", "#aaaaaa"); //회색
		                    checkId = false;
// 	                         signupCheck();
		                }
		            },
		            error : function(){
		            	alert("실패");
		            }
		        });
		    }		
		
		 
// 		//==>"ID중복확인" Event 처리 및 연결
// 		 $(function() {
// 			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
// 			 $("button#checkId").on("click" , function() {
// 				popWin 
// 				= window.open("/user/checkDuplicationUserId.jsp",
// 											"popWin", 
// 											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
// 											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
// 			});
// 		});	
		
 		//==>"Nickname중복확인" Event 처리 및 연결
 		 $(function() {
 			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
 			 $("button#checkNick").on("click" , function() {
 				popWin 
 				= window.open("/user/checkDuplicationNickname.jsp",
 											"popWin", 
 											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
 											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
 			});
 		});	
		
		//==>"학교 주소찾기" Event 처리 및 연결
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $("button#checkSchool").on("click" , function() {
				popWin 
				= window.open("/user/checkDuplicationUserId.jsp",
											"popWin", 
											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
			});
		});	
		
		//==>"phone 본인인증" Event 처리 및 연결
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $("button#checkPhone").on("click" , function() {
				popWin 
				= window.open("/user/checkDuplicationUserId.jsp",
											"popWin", 
											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
			});
		});	
		
		//==>"mail 중복체크" Event 처리 및 연결
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $("button#checkMail").on("click" , function() {
				popWin 
				= window.open("/user/checkDuplicationMail.jsp",
											"popWin", 
											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
			});
		});	
		
		//==>"mail 본인인증" Event 처리 및 연결 =====
		$(function() {
		// 이메일 입력 시 인증번호확인 버튼이 보이지 않도록 hide 
		$( "button.btn.btn-primary:contains('인증번호확인')" ).hide();
		
// 		$( "button.btn.btn-primary:contains('가입')" ).on("click" , function() {
// 			fncAddUser();
// 		});
		
		
// 		$( "button.btn.btn-primary:contains('메일전송')" ).on("click" , function() {
		$( "button#sendMail").on("click" , function() {
			var mail = $("input[name='mail']").val();
			console.log(mail);
			
			
			$.ajax(
					{
						url : "/user/rest/checkMail" , 
						method : "post" , 
						dataType : "rest" , 
						headers : {
							"Accept" : "application/rest" , 
							"Content-Type" : "application/rest" 
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
								$("input[name='mail']").val($("input[name='mail']").val());
								 
								$("input[name='mail']").val("");
								$("#mail").text("인증번호입력");
								
								// 본인인증할 state를 returnMap.put("mailCheck", state);로 반환했으므로 해당 값을 input type hidden에 백업
								$("input[name='mailCheck']").val(JSONData.mailCheck);
								
								// 없는 이메일로 메일 발송 자체는 가능하므로 이에 대한 추가적인 Business Logic이 필요함 
								$("h6").text("메일 발송이 완료되었습니다. 메일을 확인해 주세요. 메일이 없을 시 다시 발송 버튼을 입력해주세요.");
								
								$("button#sendMail").remove();
								$("button.btn.btn-primary:contains('인증번호확인')").show(); 
								$("input[name='mail']").attr("placeholder", "인증번호 입력");
							} 
						}
					}
			)
		});
		
		$( "button.btn.btn-primary:contains('인증번호확인')" ).on("click" , function() {
			var mailValue = $("input[name='mail']").val();
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
					$("input[name='mailValue']").val("1");
					$("h6").text("인증되었습니다.");
					$("input[name='mail']").attr("readonly", true);
				}
				
				if ( mailCheck != mailValue ) {
					$("h6").text("인증 문자가 틀렸습니다. 다시 확인해주세요.");
				}
			}
		});
	});	
	
	$(function() {
		 $( "a[href='#']" ).on("click" , function() {
			$("form")[0].reset();
		});
	});	
	//==>"mail 본인인증" Event 처리 및 연결 =====				
				
				
		
		

	</script>		
    
    <!--  ///////////////////////// datePicer ////////////////////////// -->
  <script>
  $( function() {
    $( "#birth" ).datepicker({
      changeMonth: true,
      changeYear: true,
      yearRange: "2000:2020"
    });
  } );
  </script>
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">어'울림</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">회 원 가 입</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">* 아 이 디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" oninput="checkDuplicationUserId()"	placeholder="중복확인하세요">
		      <span id = "checkMsg"></span> 
		      
<!-- 		      	<strong class="text-danger">입력전 중복확인 부터..</strong> -->
		    </div>
<!-- 		    <div class="col-sm-3"> -->
<!-- 		      <button type="button" class="btn btn-info" id="checkId">중복확인</button> -->
<!-- 		    </div> -->
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">* 비밀번호</label>
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
		    <label for="name" class="col-sm-offset-1 col-sm-3 control-label">* 이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="name" name="name" placeholder="회원이름">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="nickname" class="col-sm-offset-1 col-sm-3 control-label">* 닉네임</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickname" name="nickname" placeholder="중복확인하세요" readonly>
		    </div>
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-info" id="checkNick">중복확인</button>
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="schoolNo" class="col-sm-offset-1 col-sm-3 control-label">* 학교</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="schoolNo" name="schoolNo" placeholder="학교">
		    </div>
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-info" id="checkSchool">주소찾기</button>
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">휴대전화번호</label>
		     <div class="col-sm-2">
		      <select class="form-control" name="phone1" id="phone1">
				  	<option value="010" >010</option>
					<option value="012" >012</option>
				</select>
		    </div>
		    <div class="col-sm-1">
		      <input type="text" class="form-control" id="phone2" name="phone2" placeholder="번호">
		    </div>
		    <div class="col-sm-1">
		      <input type="text" class="form-control" id="phone3" name="phone3" placeholder="번호">
		    </div>
		    <input type="hidden" name="phone"  />
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-info" id="checkPhone">본인인증</button>
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="birth" class="col-sm-offset-1 col-sm-3 control-label">* 생일</label>
		    <div class="col-sm-4">
		      <input type="text"  class="form-control" id="birth" name="birth"  placeholder="생일을 달력에서 선택하세요.">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="gender" class="col-sm-offset-1 col-sm-3 control-label">* 성별</label>
		    <div class="col-sm-4">
		    <input type="radio" name="gender" value="1"> 여자 &nbsp;
		    <input type="radio" name="gender" value="2"> 남자
		    </div>
		  </div>
		  
		  
		   <div class="form-group">
		    <label for="mail" class="col-sm-offset-1 col-sm-3 control-label">이메일</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="mail" name="mail"  placeholder="중복확인하세요" readonly >
		    </div>
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-info" id="checkMail">중복확인</button>
		    </div>
		    
		    <div class="form-group">
		    <label for="profileName" class="col-sm-offset-1 col-sm-3 control-label"> 사 진</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="profileName" name="profileName" placeholder="사진">
		    </div>
		    </div>

		    
			<!-- 		    메일로 인증번호 전송 -->
		    <div class="col-sm-3">
		    	<button type="button" class="btn btn-info" id="sendMail">메일전송</button>
		    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    	<button type="button" class="btn btn-info">인증번호확인</button>
		    	<input type="hidden" name="mailValue" value="">
		    	<input type="hidden" name="mailCheck" value="">
		    	<input type="hidden" name="mail1" value="">
		    </div>
		    <!-- 		    메일로 인증번호 전송 -->
		    
		  </div>
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		     <button type="submit" class="signupbtn" disabled="disabled">Sign Up</button>
<!-- 		      <button type="button" class="btn btn-primary"  >가 &nbsp;입</button> -->
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>