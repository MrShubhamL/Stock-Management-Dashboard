
<%@page import="com.entity.SaleProduct"%>
<%@page import="com.dao.SellingDAO"%>
<%@page import="com.entity.Stock"%>
<%@page import="com.dao.StockDAO"%>
<%@page import="com.entity.addLedger"%>
<%@page import="com.dao.NewLedgerDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.entity.Products"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.allProducts"%>
<%@page import="com.conn.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.cj.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product List</title>
<%@ include file="headerLinks.jsp"%>
</head>
<body class="hold-transition sidebar-mini layout-fixed sidebar-collapse">
<%
	String Invalid_Contact = (String) session.getAttribute("Invalid_Contact");
	String SendSuccessfully = (String) session.getAttribute("SendSuccessfully");
	if(Invalid_Contact!=null){
		%>
		<script type="text/javascript">
			Swal.fire(
				'Contact Not Matched!',
				'Please enter valid contact of same customer!',
				'error'
				)
		</script>
		
		<%
		session.removeAttribute("Invalid_Contact");
	}
	if(SendSuccessfully!=null){
		%>
		<script type="text/javascript">
			Swal.fire(
				'INVIOCE SEND',
				'Invoice sent successfully!',
				'success'
				)
		</script>
		
		<%
		session.removeAttribute("SendSuccessfully");
	}
%>
	<div class="wrapper">
		<%@ include file="navbar.jsp"%>
		<%@ include file="sidebar.jsp"%>
		<div class="content-wrapper">
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
						
						<div class="card mt-4">
									<div class="card-body">
									<form action="CustomerInfo.jsp" method="POST">
										<div class="col-md-12 row g-3">

											<div class="col-md-6">
												<label>Search By Customer Name</label> <select
													class="form-control select2" style="width: 100%;"
													onchange="getCustomerInfoByName()" 
													id="CutomerName" name="CutsomerName"
													required="required" >
													<option></option>
													<%
													try{
													SellingDAO dao2 = new SellingDAO(DBConnection.getConnection());
													List<SaleProduct> list2 = dao2.getSaleCustomer();
													for (SaleProduct ad2 : list2) {
													%>
													<option><%=ad2.getCustomerName()%></option>

													<%
													}
													}catch(Throwable t){
														System.out.println(t);
													}
													%>

												</select>
											</div>

											<div class="col-md-6">
												<label > Search By Customer Contact<small>(select contact of same customer)</small> </label> 
												<select
													class="form-control select2" style="width: 100%;"
													onchange="getCustomerInfoByContact()" id="custContact" 
													>
													<option></option>
													<%
													try{
													SellingDAO dao4 = new SellingDAO(DBConnection.getConnection());
													List<SaleProduct> list4 = dao4.getCustomerContact();
													for (SaleProduct ad4 : list4) {
													%>
													<option><%=ad4.getCutContact() %></option>

													<%
													}
													}catch(Throwable t3){
														System.out.println(t3);
													}
													%>
												</select>
											</div>
												<input name="Contact" class="form-control" id="contactNum" type="hidden">
										
										</div>
											<div class="col-md-4 mt-3">
												<button onclick="location.reload();" class="btn btn-secondary" type="reset">
												<i class="fa-solid fa-arrow-rotate-right"></i> Reset</button>
												
												<button id="btSubmit" disabled class="btn btn-info" type="submit" >
												<i class="fa-solid fa-info"></i> Info</button>
											</div>
										</form>
									</div>
								</div>
						
						
						
						
						
							<div class="card mt-4">
								<div class="card-header bg-info">
									<h6 class="">SOLD PRODUCT LIST</h6>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
								<div class="tabel-responsive">
									<table id="Customer_Table" class="table table-bordered table-striped">
										<thead class="bg-info">
											<tr>
												<th>Material</th>
												<th>HSN</th>
												<th>Quantity</th>
												<th>Total</th>
												<th>Date</th>
												<th>Time</th>
												<th>Name</th>
												<th>Contact</th>
											</tr>
										</thead>
										<tbody>
											<%
											try{
												SellingDAO dao = new SellingDAO(DBConnection.getConnection());
												List<SaleProduct> list = dao.getSaleProductInfo();
												for(SaleProduct p:list){
													%>
													<tr>
														<td><%= p.getMaterialName() %></td>
														<td><%= p.getHsn() %></td>
														<td><%= p.getQty() %></td>
														<td><%= p.getTotal()%></td>
														<td><%= p.getDate()%></td>
														<td><%= p.getTime()%></td>
														<td><%= p.getCustomerName()%></td>
														<td><%= p.getCutContact()%></td>
													</tr>
													
													<%
												}
											}catch(Throwable t){
												System.out.println(t);
											}
											%>
											
										</tbody>
									</table>
								  </div>
								</div>
								<!-- /.card-body -->
							</div>

						</div>


					</div>
				</div>
			</section>
		</div>


	</div>

	<%@ include file="footerLinks.jsp"%>
	<script type="text/javascript" src="Ajax.js"></script>

	<script>
		function closemodal() {
			var x = document.getElementById("exampleModal");
			x.classList.remove("show");
			x.setAttribute("aria-modal","false");
			x.style.display = null;
		}
		
		
		function getCustomerInfoByName(){
			const button = document.getElementById("btSubmit");
			button.disabled = false; 
			var f = document.getElementById("CutomerName").value;
				$('#Customer_Table').dataTable().fnDestroy();
				$.ajax({
					type : "GET",
					url:"AjaxPages/AllCustomerInfo.jsp",
					data : { "CutsomerName": f },
					dataType : "JSON",
					
					success:function(data)
					{
						$('#Customer_Table').dataTable({
							"aaData":data,
							"scrollX":true,
							"aoColumns":
								[
									{"sTitle":"Material","mData": "MaterialName"},
									{"sTitle":"HSN","mData": "HSN"},
									{"sTitle":"Quantity","mData": "Quantity"},
									{"sTitle":"Total","mData": "Total"},
									{"sTitle":"Date","mData": "Date"},
									{"sTitle":"Time","mData": "Time"},
									{"sTitle":"Name","mData": "CustomerName"},
									{"sTitle":"Contact","mData": "CustomerContact"},
								]
						
						
						
						})
					}
				});
				
				$.ajax({
					 type: "POST",
				     url: "AjaxPages/AllCustomerInfo.jsp",
				     data: { "CutsomerName": f },
				     
				     success: function(data) {
				            isNew = false;
				            var obj = JSON.parse(data);
				            LedgerName = obj[0].f
				            $('#contactNum').val(obj[0].CustomerContact)

				        }
				})
				
				
				
				
			}	
		
		function getCustomerInfoByContact(){
			const button = document.getElementById("btSubmit");
			button.disabled = false; 
			var dd = document.getElementById("custContact").value;
				$('#Customer_Table').dataTable().fnDestroy();
				$.ajax({
					type : "GET",
					url:"AjaxPages/AllCustomerContact.jsp",
					data : { "custContact": dd },
					dataType : "JSON",
					
					success:function(data)
					{
						$('#Customer_Table').dataTable({
							"aaData":data,
							"scrollX":true,
							"aoColumns":
								[
									{"sTitle":"Material","mData": "MaterialName"},
									{"sTitle":"HSN","mData": "HSN"},
									{"sTitle":"Quantity","mData": "Quantity"},
									{"sTitle":"Total","mData": "Total"},
									{"sTitle":"Date","mData": "Date"},
									{"sTitle":"Time","mData": "Time"},
									{"sTitle":"Name","mData": "CustomerName"},
									{"sTitle":"Contact","mData": "CustomerContact"},
								]
						
						
						
						})
					}
				});
			}	
	</script>


</body>
</html>