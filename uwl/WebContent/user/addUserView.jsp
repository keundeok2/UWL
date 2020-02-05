<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// datePicker ////////////////////////// -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 	<link rel="stylesheet" href="/resources/demos/style.css">
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
		

		//==>"�̸���" ��ȿ��Check  Event ó�� �� ����
		 $(function() {
			 
			 $("input[name='mail']").on("change" , function() {
				
				 var mail=$("input[name='mail']").val();
			    
				 if(mail != "" && (mail.indexOf('@') < 1 || mail.indexOf('.') == -1) ){
			    	alert("�̸��� ������ �ƴմϴ�.");
			     }
			});
			 
		});	
		
		 
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
		
		//==>"mail ��������" Event ó�� �� ���� =====???
		
		
		
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
		      <input type="text" class="form-control" id="userId" name="userId" placeholder="�ߺ�Ȯ���ϼ���"  readonly>
<!-- 		       <span id="helpBlock" class="help-block"> -->
		      	<strong class="text-danger">�Է��� �ߺ�Ȯ�� ����..</strong>
<!-- 		      </span> -->
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
		    <input type="radio" name="gender" > ���� &nbsp;
		    <input type="radio" name="gender" > ����
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
		  </div>
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		    
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>

</html>