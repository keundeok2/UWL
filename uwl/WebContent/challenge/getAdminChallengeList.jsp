<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
    <!-- Bootstrap Dropdown Hover JS -->
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method","POST").attr("action","/challenge/getAdminChallengeList").submit();
		}
		
		
		//============= "�˻�"  Event  ó�� =============	
		 $(function() {
			 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 
			 $("input[name=searchKeyword]").focus();
			 	
				$("input[name=searchKeyword]").keydown(function(key){
			    	if(key.keyCode == 13){
		    			fncGetList(1);
			    	}
			    } );
			 $( ".btn-default:contains('�˻�')" ).on("click" , function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
					fncGetList(1);
				});
			 
			 $( "a:contains('����')" ).on("click" , function() {
				 var prodNo = $(this).parents(".caption").children("input:hidden").val();
				 //alert("���⿩�� " + prodNo );
				 self.location = "/purchase/addPurchase?prodNo=" + prodNo;
			});
			 
		 });
		
		
		//============= userId �� ȸ����������  Event  ó��(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "a:contains('������')" ).on("click" , function() {
				var prodNo = $(this).parents(".caption").children("input:hidden").val();
				//alert("prodNo : "+ prodNo);
				console.log("prodNo : "+ prodNo); 
			});
			
						
		});	
		
		
		//============= userId �� ȸ����������  Event  ó�� (double Click)=============
		 $(function() {
			 
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(  "td:nth-child(5) > i" ).on("click" , function() {

				var prodNo = $(this).parent().children("input:hidden").val();
				//alert("prodNo : " + prodNo);
				$.ajax(
						{
							url: "/product/json/getProduct/" + prodNo,
							method : "GET",
							dataType : "json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status){
								
								//Debug...
								//alert(status);
								//Debug...
								//alert("JSONData : \n"+JSONData);
								
								var displayValue = "<h6>"
															+"��ǰ��ȣ : "+JSONData.prodNo+"<br/>"
															+"��ǰ�� : "+JSONData.prodName+"<br/>"
															+"��ǰ�̹��� : "+JSONData.fileName+"<br/>"
															+"��ǰ������ : "+JSONData.prodDetail+"<br/>"
															+"�������� : "+JSONData.manuDate+"<br/>"
															+"���� : "+JSONData.price+"<br/>"
															+"�������� : "+JSONData.regDate+"<br/>"
															+"</h3>";
								//Debug...									
								//alert(displayValue);
								$("h6").remove();
								$( "#"+prodNo+"" ).html(displayValue);
								
							}
					
				});
					 console.log("prodNo : "+ prodNo); 
			});
			
			//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			//==> �Ʒ��� ���� ������ ������ ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
	
	</script>
	
</head>

<body>
	
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
		<!-- role�� ���� admin user �з� �Ұ� -->
			<h2>�������� ����Ʈ</h2>
		<%-- <c:if test="${param.menu == 'manage'}">
	       <h3>��ǰ ����</h3>
       </c:if> --%>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    	
		    	
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="1" ${!empty searchCondition && searchCondition == "1" ? "selected" : ""} >����</option>
						
						<option value="2" ${!empty searchCondition && searchCondition == "2" ? "selected" : ""} >���� + ����</option>
					
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  <br/>
				  <br/>
				  <br/>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
		<tbody>
			
		
		<div class="container">
		<div class="row">
			<tr class="ct_list_pop">
						<td align="center">��ȣ</td>
						<td></td>
	
						<td align="left">����</td>
						<td></td>
						<td align="left">ī�װ�</td>
						<td></td>
						<td align="left">����</td>
						<td></td>
						<td align="left">��������</td>
						<td></td>
						<td align="left">��¥</td>
						<td align="left">
							</td>
					</tr>
					<tr>
						<td colspan="12" bgcolor="D6D7D6" height="1"></td>
					</tr>
		   <c:set var="i" value="0" />
				<c:forEach var="challenge" items="${list}">
					<c:set var="i" value="${i + 1}" />
						
						<tr class="ct_list_pop">
						<td align="center">${i}</td>
						<td></td>
	
						<td align="left">${challenge.challTitle}</td>
					
						<td></td>
						<c:if test="${challenge.challCategory == '1'}">
							<td align="left">Map</td>
						</c:if>
						<c:if test="${challenge.challCategory == '2'}">
							<td align="left">Vision</td>
						</c:if>
						<c:if test="${challenge.challCategory == '3'}">
							<td align="left">�Խ���Ȱ��</td>
						</c:if>
						<td></td>
						<td align="left">${challenge.challContent}</td>
						<td></td>
						<td align="left">${challenge.challReward}</td>
						<td></td>
						<td align="left">${challenge.challDate}</td>
						<td align="left">
						

					</td>
				</tr>
				<tr>
					<td colspan="12" bgcolor="D6D7D6" height="1"></td>
				</tr>
			</c:forEach>
		</div>
		</div>
			
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>