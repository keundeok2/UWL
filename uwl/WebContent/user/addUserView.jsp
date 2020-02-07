<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! �� �� �� !!!!!!!!!!!!! -->
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	
<!-- 	<link rel="stylesheet" type="text/css" href="assets/css/main.css"> -->
	
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
	
		//============= "����"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
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
			// ���� ���� ������ �Ǵ��ϱ� ���� Flag 
// 			var mailValue = $("input[name='mailValue']").val();
		
// 			// 1�� �� ���� ���� �Ϸ��̹Ƿ� �� �� Ȥ�� ���� ������ �������� ���� ��� �ٷ� ����
// 			if ( mailValue == "" || mailValue != "1" ) { 
// 				$("h6").text("���� ������ �������ּ���.");
// 				return;
// 			}
			
			if(id == null || id.length <1){
				alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("�н������  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("�н����� Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(name == null || name.length <1){
				alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if(nickname == null || nickname.length <1){
				alert("�г�����  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if(gender == null || gender.length <1){
				alert("������  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if(birth == null || birth.length <1){
				alert("������  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if(schoolNo == null || schoolNo.length <1){
				alert("�б���  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if(mail == null || mail.length <1){
				alert("������  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
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
		

		//==>"�̸���" ��ȿ��Check  Event ó�� �� ����=============================�ȵ�!!!!!!!!!!!!!!!!!!!!!!!!!!
		 $(function() {
			 
			 $("input[name='mail']").on("change" , function() {
				
				 var mail=$("input[name='mail']").val();
			    
				 if(mail != "" && (mail.indexOf('@') < 1 || mail.indexOf('.') == -1) ){
			    	alert("�̸��� ������ �ƴմϴ�.");
			     }
			});
		});	
		
		
		
// 		/////////test///////
// 	var checkId = 0;
//     var checkPw = 0;
//     //���̵� üũ�Ͽ� ���Թ�ư ��Ȱ��ȭ, �ߺ�Ȯ��.
//     function checkDuplicationUserId() {
//         var inputed = $('#userId').val();
//         $.ajax({
//             data : {
//                 id : inputed
//             },
//             url : "/user/checkDuplicationUserId",
//             success : function(data) {
//                 if(inputed=="" && data=='0') {
//                     $(".signupbtn").prop("disabled", true);
//                     $(".signupbtn").css("background-color", "#aaaaaa");
//                     $("#userId").css("background-color", "#FFCECE");
//                     checkId = 0;
//                 } else if (data == '0') {
//                     $("#userId").css("background-color", "#B0F6AC");
//                     checkId = 1;
//                     if(checkId==1 && checkPw == 1) {
//                         $(".signupbtn").prop("disabled", false);
//                         $(".signupbtn").css("background-color", "#4CAF50");
//                         signupCheck();
//                     } 
//                 } else if (data == '1') {
//                     $(".signupbtn").prop("disabled", true);
//                     $(".signupbtn").css("background-color", "#aaaaaa");
//                     $("#userId").css("background-color", "#FFCECE");
//                     checkId = 0;
//                 } 
//             }
//         });
//     }

		
// 		 ////////test
//     $(function() {

//         $("button#checkId").on('click', function(){

//             $.ajax({
//                 type: 'POST',
//                 url: '/user/checkDuplicationUserId',
//                 data: {
//                     "userId" : $('#userId').val()
//                 },
//                 success: function(data){
//                     if($.trim(data) == 0){
//                         $('#checkMsg').html('<p style="color:blue">��밡��</p>');
//                     }
//                     else{
//                         $('#checkMsg').html('<p style="color:red">���Ұ���</p>');
//                     }
//                 }
//             });    //end ajax    
//         });    //end on    
//     });

		///////////////
		
		
		
		
		
		
		 
		//==>"ID�ߺ�Ȯ��" Event ó�� �� ����
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $("button#checkId").on("click" , function() {
				popWin 
				= window.open("/user/checkDuplicationUserId.jsp",
											"popWin", 
											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
			});
		});	
		
 		//==>"Nickname�ߺ�Ȯ��" Event ó�� �� ����
 		 $(function() {
 			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
 			 $("button#checkNick").on("click" , function() {
 				popWin 
 				= window.open("/user/checkDuplicationNickname.jsp",
 											"popWin", 
 											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
 											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
 			});
 		});	
		
		//==>"�б� �ּ�ã��" Event ó�� �� ����
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $("button#checkSchool").on("click" , function() {
				popWin 
				= window.open("/user/checkDuplicationUserId.jsp",
											"popWin", 
											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
			});
		});	
		
		//==>"phone ��������" Event ó�� �� ����
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $("button#checkPhone").on("click" , function() {
				popWin 
				= window.open("/user/checkDuplicationUserId.jsp",
											"popWin", 
											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
			});
		});	
		
		//==>"mail �ߺ�üũ" Event ó�� �� ����
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $("button#checkMail").on("click" , function() {
				popWin 
				= window.open("/user/checkDuplicationMail.jsp",
											"popWin", 
											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
			});
		});	
		
		//==>"mail ��������" Event ó�� �� ���� =====
		$(function() {
		// �̸��� �Է� �� ������ȣȮ�� ��ư�� ������ �ʵ��� hide 
		$( "button.btn.btn-primary:contains('������ȣȮ��')" ).hide();
		
// 		$( "button.btn.btn-primary:contains('����')" ).on("click" , function() {
// 			fncAddUser();
// 		});
		
		
// 		$( "button.btn.btn-primary:contains('��������')" ).on("click" , function() {
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
						// beforeSend :: request ���� ���� �����ϴ� call back function 
						beforeSend : function() {
							$("h6").text("���� �߼� ���Դϴ�... ��ø� ��ٷ� �ּ���.");
						} , 
						success : function( JSONData, Status ) {
							// ������ ���������� ������ �� returnMap.put("result", "done");
							if ( JSONData.result == "done" ) {
								// �̸��� �Է� ĭ�� ������ȣ�Է�ĭ���� �ٲٹǷ� �Է��� �̸����� ����ϴ� input type hidden ���� ���� 
								$("input[name='mail']").val($("input[name='mail']").val());
								 
								$("input[name='mail']").val("");
								$("#mail").text("������ȣ�Է�");
								
								// ���������� state�� returnMap.put("mailCheck", state);�� ��ȯ�����Ƿ� �ش� ���� input type hidden�� ���
								$("input[name='mailCheck']").val(JSONData.mailCheck);
								
								// ���� �̸��Ϸ� ���� �߼� ��ü�� �����ϹǷ� �̿� ���� �߰����� Business Logic�� �ʿ��� 
								$("h6").text("���� �߼��� �Ϸ�Ǿ����ϴ�. ������ Ȯ���� �ּ���. ������ ���� �� �ٽ� �߼� ��ư�� �Է����ּ���.");
								
								$("button#sendMail").remove();
								$("button.btn.btn-primary:contains('������ȣȮ��')").show(); 
								$("input[name='mail']").attr("placeholder", "������ȣ �Է�");
							} 
						}
					}
			)
		});
		
		$( "button.btn.btn-primary:contains('������ȣȮ��')" ).on("click" , function() {
			var mailValue = $("input[name='mail']").val();
			var mailCheck = $("input[name='mailCheck']").val();
			
			console.log("�񱳴�� �� : " + mailCheck);
			console.log("�Է� �� : " + mailValue);
			
			// mailCheck�� �̸��� ���� ���ڿ� state�̸� 
			// mailValue�� �̸��� ���� ������ �Ǵ��ϴ� Flag�̴� 
			
			// mailCheck�� default�� null String�̹Ƿ� 
			if ( mailCheck == "" ) {
				$("h6").text("������ �߼۵��� �ʾҽ��ϴ�.");
			}
			
			
			if ( mailCheck != "" ) {
				if ( mailCheck == mailValue ) {
					$("input[name='mailValue']").val("1");
					$("h6").text("�����Ǿ����ϴ�.");
					$("input[name='mail']").attr("readonly", true);
				}
				
				if ( mailCheck != mailValue ) {
					$("h6").text("���� ���ڰ� Ʋ�Ƚ��ϴ�. �ٽ� Ȯ�����ּ���.");
				}
			}
		});
	});	
	
	$(function() {
		 $( "a[href='#']" ).on("click" , function() {
			$("form")[0].reset();
		});
	});	
	//==>"mail ��������" Event ó�� �� ���� =====				
				
				
		
		

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
        	<a class="navbar-brand" href="/index.jsp">��'�︲</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">ȸ �� �� ��</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">* �� �� ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" oninput="checkDuplicationUserId()"	placeholder="�ߺ�Ȯ���ϼ���">
		      <span id = "checkMsg"></span> 
		      
		      	<strong class="text-danger">�Է��� �ߺ�Ȯ�� ����..</strong>
		    </div>
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-info" id="checkId">�ߺ�Ȯ��</button>
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">* ��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="��й�ȣ">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">* ��й�ȣ Ȯ��</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="��й�ȣ Ȯ��">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="name" class="col-sm-offset-1 col-sm-3 control-label">* �̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="name" name="name" placeholder="ȸ���̸�">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="nickname" class="col-sm-offset-1 col-sm-3 control-label">* �г���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickname" name="nickname" placeholder="�ߺ�Ȯ���ϼ���" readonly>
		    </div>
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-info" id="checkNick">�ߺ�Ȯ��</button>
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="schoolNo" class="col-sm-offset-1 col-sm-3 control-label">* �б�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="schoolNo" name="schoolNo" placeholder="�б�">
		    </div>
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-info" id="checkSchool">�ּ�ã��</button>
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">�޴���ȭ��ȣ</label>
		     <div class="col-sm-2">
		      <select class="form-control" name="phone1" id="phone1">
				  	<option value="010" >010</option>
					<option value="012" >012</option>
				</select>
		    </div>
		    <div class="col-sm-1">
		      <input type="text" class="form-control" id="phone2" name="phone2" placeholder="��ȣ">
		    </div>
		    <div class="col-sm-1">
		      <input type="text" class="form-control" id="phone3" name="phone3" placeholder="��ȣ">
		    </div>
		    <input type="hidden" name="phone"  />
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-info" id="checkPhone">��������</button>
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="birth" class="col-sm-offset-1 col-sm-3 control-label">* ����</label>
		    <div class="col-sm-4">
		      <input type="text"  class="form-control" id="birth" name="birth"  placeholder="������ �޷¿��� �����ϼ���.">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="gender" class="col-sm-offset-1 col-sm-3 control-label">* ����</label>
		    <div class="col-sm-4">
		    <input type="radio" name="gender" value="1"> ���� &nbsp;
		    <input type="radio" name="gender" value="2"> ����
		    </div>
		  </div>
		  
		  
		   <div class="form-group">
		    <label for="mail" class="col-sm-offset-1 col-sm-3 control-label">�̸���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="mail" name="mail"  placeholder="�ߺ�Ȯ���ϼ���" readonly >
		    </div>
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-info" id="checkMail">�ߺ�Ȯ��</button>
		    </div>
		    
		    <div class="form-group">
		    <label for="profileName" class="col-sm-offset-1 col-sm-3 control-label"> �� ��</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="profileName" name="profileName" placeholder="����">
		    </div>
		    </div>

		    
			<!-- 		    ���Ϸ� ������ȣ ���� -->
		    <div class="col-sm-3">
		    	<button type="button" class="btn btn-info" id="sendMail">��������</button>
		    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    	<button type="button" class="btn btn-info">������ȣȮ��</button>
		    	<input type="hidden" name="mailValue" value="">
		    	<input type="hidden" name="mailCheck" value="">
		    	<input type="hidden" name="mail1" value="">
		    </div>
		    <!-- 		    ���Ϸ� ������ȣ ���� -->
		    
		  </div>
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		     <button type="submit" class="signupbtn" disabled="disabled">Sign Up</button>
<!-- 		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button> -->
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>

</html>