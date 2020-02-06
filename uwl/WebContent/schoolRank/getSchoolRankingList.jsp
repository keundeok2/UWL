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
			$("form").attr("method","POST").attr("action","/schoolRank/getSchoolRankingList").submit();
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
			 
			 $( ".page-header h2" ).on("click" , function() {
					//Debug..
					console.log("sds");
					self.location ="/schoolRank/getSchoolRankingList/";
				});
			 
			 
		 });
		
		
		
		//============= ���ѽ�ũ�� ó�� %pageũ�⸸ �޶����� ������ �����ų� ���� ����.(������ �������� �ѷ��ִ°� �������ϰ�����. )% =============
		var page = 1;
		
		$(function(){
			$(window).data('ajaxready', true).scroll(function(){
				var maxHeight = $(document).height();
				var currentScroll = $(window).scrollTop() + $(window).height();
				var searchCondition = $("select[name='searchCondition']").val();
				var searchKeyword = $("input[name='searchKeyword']").val();
				
				if($(window).data('ajaxready') == false) return;
				if(maxHeight <= currentScroll){
					if(page <= ${resultPage.maxPage}){
					$(window).data('ajaxready', false);
					page++;
					console.log('page : ' + page);
					
					$.ajax({
						url : "/schoolRank/rest/getSchoolRankingList",
						method : "POST",
						dataType : "json",
						data : JSON.stringify({
							searchCondition : searchCondition,
							searchKeyword : searchKeyword,
							currentPage : page
						}),
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(data){
							console.log(data);
							
							 for (var i = 0; i < data.list.length; i++) {
								console.log("�б��̸� : " + data.list[i].schoolName);
								
								var addData = "<td align='center'>" + ${schoolRank.ranking} + "</td>"
												+ "<td></td>"
												+ "<td align='left'><input type='hidden' value='" + ${schoolRank.schoolNo} + "'>" +  ${schoolRank.schoolName} + "</td>"
												+ "<td></td>"
												+ "<td align='left'>" + ${schoolRank.schoolAddress} + "</td>"
												+ "<td></td>"
												+ "<td align='left'>" + ${schoolRank.totalActivityPoint} + "</td>"
												+ "<td></td>";
								
								$(addData).appendTo("#loadList");
							} 
							
							$(window).data('ajaxready', true);
						}
					});
						
					}
				}
			})
			
		})
	</script>
	
</head>

<body>
	
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
		<!-- role�� ���� admin user �з� �Ұ� -->
			<h2>�б���ŷ ����Ʈ</h2>
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
						<option value="1" ${!empty searchCondition && searchCondition == "1" ? "selected" : ""} >�б��̸�</option>
						
						<option value="2" ${!empty searchCondition && searchCondition == "2" ? "selected" : ""} >�ּ�</option>
					
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻����Է��ϼ� ����"
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
						<td align="center">��ŷ</td>
						<td></td>
						<td align="left">�б��̸�</td>
						<td></td>
						<td align="left">�ּ�</td>
						<td></td>
						<td align="left">�� ����</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="12" bgcolor="D6D7D6" height="1"></td>
					</tr>
		   <c:set var="i" value="0" />
				<c:forEach var="schoolRank" items="${list}">
						
					<tr id="loadList" class="ct_list_pop">
						<td align="center">${schoolRank.ranking}</td>
						<td></td>
	
						<td align="left"><input type="hidden" value="${schoolRank.schoolNo}"> ${schoolRank.schoolName}</td>
					
						<td></td>
						<td align="left">${schoolRank.schoolAddress}</td>
						<td></td>
						<td align="left">${schoolRank.totalActivityPoint}</td>
						<td></td>
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
 	
 	
	
</body>

</html>