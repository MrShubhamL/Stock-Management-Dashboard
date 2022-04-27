
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
	String s = (String) session.getAttribute("Successfull");
	String delete = (String) session.getAttribute("Deleted");
	if (s != null) {
	%>

	<!-- Modal -->
	<div class="modal fade show" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-modal="true"
		style="display: block;">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Successfull</h5>

				</div>
				<div class="modal-body">Product Updated Successfully</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal" onclick="closemodal()">Close</button>

				</div>
			</div>
		</div>
	</div>

	<%
	session.removeAttribute("Successfull");
	}

	if (delete != null) {
	%>

	<!-- Modal -->
	<div class="modal fade show" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-modal="true"
		style="display: block;">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Product Deleted</h5>

				</div>
				<div class="modal-body">Product Deleted Successfully</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal" onclick="closemodal()">Close</button>

				</div>
			</div>
		</div>
	</div>

	<%
	session.removeAttribute("Deleted");
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
									<form action="ledgerInfo.jsp" method="POST">
										<div class="col-md-12 row g-3">

											<div class="col-md-4">
												<label>Search By Ledger Name</label> <select
													class="form-control select2" style="width: 100%;"
													onchange="getLedgerInfoByName()" 
													id="ledgerName" name="ledgerName"
													>
													<option selected="selected">Search Name</option>

													<%
													try{
													NewLedgerDAO dao2 = new NewLedgerDAO(DBConnection.getConnection());
													List<addLedger> list2 = dao2.listLedger();
													for (addLedger ad2 : list2) {
													%>
													<option><%=ad2.getLedgerName()%></option>

													<%
													}
													}catch(Throwable t){
														System.out.println(t);
													}
													%>

												</select>
											</div>

											<div class="col-md-4">
							                  <label class="form-label">Search By Date:</label>
							                  <input onchange="myDateFun()" id="EntryDate" type="date" class="form-control"/>
									        </div>
									        
											<div class="col-md-4">
												<label> Search By Ledger Email</label> <select
													class="form-control select2" style="width: 100%;"
													onchange="myFunction3()" id="legerEmail" name="legerEmail"
													>
													<option selected="selected">Search Email</option>
													<%
													try{
													NewLedgerDAO dao4 = new NewLedgerDAO(DBConnection.getConnection());
													List<addLedger> list4 = dao4.listLedger();
													for (addLedger ad4 : list4) {
													%>
													<option><%=ad4.getEmail()%></option>

													<%
													}
													}catch(Throwable t3){
														System.out.println(t3);
													}
													%>
												</select>
											</div>
											<div class="col-md-4">
												<button onclick="location.reload();" class="btn btn-secondary" type="reset">
												<i class="fa-solid fa-arrow-rotate-right"></i> Reset</button>
												
												<button id="btSubmit" disabled class="btn btn-info" type="submit" >
												<i class="fa-solid fa-info"></i> Info</button>
											</div>
											
										</div>
										</form>
									</div>
								</div>
						
						
						
							<div class="card mt-4">
								<div class="card-header bg-info">
									<h6 class="">
									<i class="nav-icon fa-solid fa-circle-info px-2"></i>
									All Product Details</h6>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<table id="tbl-ledger" class="table table-bordered table-striped">
										<thead class="bg-info">
											<tr>
												<th>Material Name</th>
												<th>HSN No</th>
												<th>Rate</th>
												<th>Quantity</th>
												<th>Unit</th>
												<th>Date</th>
												<th>Time</th>
												<th>Total Amount</th>
											</tr>
										</thead>
										<tbody>
											<%
											try{
												allProducts dao = new allProducts(DBConnection.getConnection());
												List<Products> list = dao.getProduct();
												for(Products p:list){
													%>
													<tr>
														<td><%= p.getMaterialName() %></td>
														<td><%= p.getHsn() %></td>
														<td><%= p.getRate() %></td>
														<td><%= p.getQty() %></td>
														<td><%= p.getUnit() %></td>
														<td><%= p.getDate() %></td>
														<td><%= p.getTime() %></td>
														<td><%= p.getTotal() %></td>
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
		
		function getLedgerInfoByName(){
			const button = document.getElementById("btSubmit");
			button.disabled = false; 
			var f = document.getElementById("ledgerName").value;
				$('#tbl-ledger').dataTable().fnDestroy();
				$.ajax({
					type : "GET",
					url:"AjaxPages/AllLedgerInfo.jsp",
					data : { "LedgerName": f },
					dataType : "JSON",
					
					success:function(data)
					{
						$('#tbl-ledger').dataTable({
							"aaData":data,
							"scrollX":true,
							"aoColumns":
								[
									{"sTitle":"Material Name","mData": "BrandName"},
									{"sTitle":"HSN No","mData": "HSNNo"},
									{"sTitle":"Rate","mData": "Rate"},
									{"sTitle":"Quantity","mData": "Quantity"},
									{"sTitle":"Unit","mData": "Unit"},
									{"sTitle":"Date","mData": "Date"},
									{"sTitle":"Time","mData": "Time"},
									{"sTitle":"Total Amount","mData": "TotalAmount"},
								]
						
						
						
						})
					}
				});
			}	
		
		  function myDateFun(){
			  var k = document.getElementById("EntryDate").value;
						$('#tbl-ledger').dataTable().fnDestroy();
						$.ajax({
							type : "GET",
							url:"AjaxPages/RegisterDate.jsp",
							data : { "EntryDate": k },
							dataType : "JSON",
							
							success:function(data)
							{
								$('#tbl-ledger').dataTable({
									"aaData":data,
									"scrollX":true,
									"aoColumns":
										[
											{"sTitle":"Material Name","mData": "BrandName"},
											{"sTitle":"HSN No","mData": "HSNNo"},
											{"sTitle":"Rate","mData": "Rate"},
											{"sTitle":"Quantity","mData": "Quantity"},
											{"sTitle":"Unit","mData": "Unit"},
											{"sTitle":"Date","mData": "Date"},
											{"sTitle":"Time","mData": "Time"},
											{"sTitle":"Total Amount","mData": "TotalAmount"},
											
										]
								
								
								
								})
							}
						});
		  }	
		  
			function myFunction3(){
				var c = document.getElementById("legerEmail").value;
				$('#tbl-ledger').dataTable().fnDestroy();
				$.ajax({
					 type : "GET",
				     url: "AjaxPages/AllLedgerEmails.jsp",
				     data: { "LedgerEmail": c },
				     dataType : "JSON",
							success:function(data)
							{
								$('#tbl-ledger').dataTable({
									"aaData":data,
									"scrollX":true,
									"aoColumns":
										[
											{"sTitle":"Material Name","mData": "BrandName"},
											{"sTitle":"HSN No","mData": "HSNNo"},
											{"sTitle":"Rate","mData": "Rate"},
											{"sTitle":"Quantity","mData": "Quantity"},
											{"sTitle":"Unit","mData": "Unit"},
											{"sTitle":"Date","mData": "Date"},
											{"sTitle":"Time","mData": "Time"},
											{"sTitle":"Total Amount","mData": "TotalAmount"},
											
										]
								
								
								
								})
							}
						});
		  }	
	</script>


</body>
</html>