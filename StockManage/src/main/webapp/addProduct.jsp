<%@page import="com.entity.MyProducts"%>
<%@page import="com.dao.NewMaterial"%>
<%@page import="com.entity.Products"%>
<%@page import="com.dao.allProducts"%>
<%@page import="com.conn.DBConnection"%>
<%@page import="com.entity.addLedger"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.NewLedgerDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Stick Management | ADD PRODUCT</title>
<%@include file="headerLinks.jsp"%>

</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<%@include file="navbar.jsp"%>
		<%@include file="sidebar.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<section class="content">
				<div class="container-fluid">
				<form class="" method="post" action="NewProductAdded">
					<div class="row">
						<div class="col-md-12">
								<div class="card mt-4">
									<div class="card-header bg-info">
										<h6 class="">
										<i class="nav-icon fa-solid fa-circle-info"></i>
										LEDGER DETAILS</h6>
									</div>

									<div class="card-body">
										<div class="col-md-12 row g-3">

											<div class="col-md-4">
												<label>Search By Ledger Name</label> <select
													class="form-control select2" style="width: 100%;"
													onchange="myFunction1()" id="ledgerName" required
													>
													<option>Search Name</option>

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
												<label> Search By Contact No </label> <select
													class="form-control select2" style="width: 100%;"
													onchange="myFunction2()" id="ledgerContact"
													>
													<option selected="selected">Search Contact</option>
													<%
													try{
													NewLedgerDAO dao3 = new NewLedgerDAO(DBConnection.getConnection());
													List<addLedger> list3 = dao3.listLedger();
													for (addLedger ad3 : list3) {
													%>
													<option><%=ad3.getContactNo()%></option>

													<%
													}
													}catch(Throwable t2){
														System.out.println(t2);
													}
													%>
												</select>
											</div>
											<div class="col-md-4">
												<label> Search By Ledger Email</label> <select
													class="form-control select2" style="width: 100%;"
													onchange="myFunction3()" id="legerEmail"
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
												<label>Ledger Name</label>
												<input id="LName" class="form-control" type="text" 
												name="ledgerName" required="required">
											</div>
											<div class="col-md-4">
												<label>Ledger Contact</label>
												<input id="LContact" class="form-control" type="text" 
												name="contactNo" required>
											</div>
											<div class="col-md-4">
												<label>Ledger Email</label>
												<input id="LEmail" class="form-control" type="text"name="email" required>
											</div>
											<div class="col-md-4">
												<input id="LregiId" class="form-control" type="hidden"name="LregiId">
											</div>

										</div>
									</div>
								</div>
						</div>
					</div>	
							<%
							String s = (String) session.getAttribute("Successfull");
							String Failed = (String) session.getAttribute("Failed");
							if (s != null) {
							%>

							<script type="text/javascript">
							Swal.fire(
									  'Product Added!',
									  'New product added successfully!',
									  'success'
									)
							</script>

							<%
							session.removeAttribute("Successfull");
							}
							if (Failed != null) {
							%>
								<script type="text/javascript">

								Swal.fire({
									  icon: 'error',
									  title: 'Prduct Already Exist!',
									  text: 'Please delete this product from your stock list.',
									  
									})
								</script>

							<%
							session.removeAttribute("Failed");
							}
							%>
						<div>	
						 <div class="card mt-4">
							<div class="card-header bg-info d-flex">
								<h6 class="">
								<i class="nav-icon fa-brands fa-product-hunt"></i>
								PRODUCTS DETAILS</h6>
								<h6 class="text-white ml-auto">
									<a class=" text-white" 
									 data-bs-toggle="modal" 
									 data-bs-target="#exampleModal12"
									style="cursor: pointer; padding: 0; margin: 0;">
										<i class="nav-icon fa-solid fa-circle-plus"></i>
									</a>
								</h6>
							</div>

							<div class="card-body">
								<div class="col-md-12 row g-3">
								
									<div class="col-md-4">
										<label>Material Name</label> 
										<select id="materialName" name="materialName" onchange="MaterialFun()"
										 class="form-control select2">
											<option value="ILAICHI TEA" selected="selected">Select Product</option>
												<%
													try{
													NewMaterial dao4 = new NewMaterial(DBConnection.getConnection());
													List<MyProducts> list4 = dao4.getMaterialName();
													for (MyProducts ad4 : list4) {
													%>
													<option><%=ad4.getMaterialName()%></option>
	
													<%
													}
													}catch(Throwable t3){
													System.out.println(t3);
													}
												%>
										</select>
									</div>
									<div class="col-md-4">
										<label for="qty" class="form-label">Qty</label> 
										<input onkeyup="QtyFun()"
											type="text" class="form-control" name="qty" id="qty"
											 required >
									</div>
									
									<div class="col-md-4">
										<label for="rate" class="form-label">UNIT</label>
										<input class="form-control" name="UnitName" id="UnitName" type="text" required="required">
									</div>
									
									<div class="col-md-4">
										<label for="validationDefault02" class="form-label">HSN
											NO</label> 
											<input type="text" name="hsn" class="form-control"
											id="hsn" required>
									</div>
									
									
									<div class="col-md-4">
										<label for="rate" class="form-label">Rate/Kg</label> <input
											type="text" name="rate" oninput="calculator()"
											class="form-control" id="rate" required >
									</div>
									
									<div class="col-md-4">
										<label for="tamount" class="form-label">Total</label> <input
											type="text" name="total" class="form-control" id="tamount"
											required >
									</div>
									
									<div class="col-12 mt-2 row">
										<div class="col-md-9">
											<button class="btn btn-primary" type="submit">
											<i class="nav-icon fa-solid fa-plus"></i> ADD PRODUCT</button>
											<button onclick="location.reload();" class="btn btn-secondary" type="reset">Reset</button>
										</div>
									</div>
									
								</div>
							</div>
						</div>
					</div>
						</form>

<!-- Modal -->
							<div class="modal fade" id="exampleModal12" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">
							        <i class="nav-icon fa-solid fa-circle-plus"></i> Add New Product</h5>
							      </div>
							      <div class="modal-body">
							        <div class="col-md-12">
							        	<form action="addNewMaterial" method="POST" class="row g-3">
							        		<div class="col-md-6">
												<label>Material Name</label> 
												<input class="form-control" type="text" name="materialName">
											</div>
											<div class="col-md-6">
												<label for="validationDefault02" class="form-label">HSN
													NO</label> <input type="text" name="hsn" class="form-control"
													id="hsn" value="" required>
											</div>
											<div class="col-md-6">
												<label for="rate" class="form-label">Rate/Kg</label> <input
													type="text" name="rate" oninput="calculator()"
													class="form-control" id="rate" required >
											</div>
											
											<div class="col-md-6">
												<label for="rate" class="form-label">UNIT</label>
												<select name="UnitName" class="form-control select2">
													<option>KG</option>
													<option>GM</option>
													<option>PACK</option>
													<option>BOX</option>
														
												</select>
											</div>
											
											<div class="col-md-12 ml-auto">
										        <button type="submit" class="btn btn-primary">
										        <i class="nav-icon fa-solid fa-plus"></i>
										        ADD</button>
										        <button type="button" class="btn btn-secondary" 
										        data-bs-dismiss="modal">Close</button>
											</div>
							        	</form>
							        </div>
							      </div>
							      
							    </div>
							  </div>
							</div>



				</div>
		</section>
		</div>
	</div>
	<%@include file="footerLinks.jsp"%>
	<script type="text/javascript" src="Ajax.js"></script>
	<script type="text/javascript" src="Bill_Generator.js"></script>
	
	<script type="text/javascript">
	function closemodal() {
		var x= document.getElementById("exampleModal");
		x.classList.remove("show");
		x.setAttribute("aria-modal","false");
		x.style.display = null;
	}
	function QtyFun() {
		var rate = parseFloat(document.getElementById("rate").value);
		var qty = parseFloat(document.getElementById("qty").value);
		var result4 =  parseFloat(rate*qty);
		document.getElementById("tamount").value = result4;
		

	}
	var LedgerName = null;
	function MaterialFun(){
		var d = document.getElementById("materialName").value;
				$.ajax({
					 type: "POST",
				     url: "AjaxPages/AllMaterial.jsp",
				     data: { "MaterialName": d },
				     
				     success: function(data) {
				            isNew = false;
				            var obj = JSON.parse(data);
				            LedgerName = obj[0].d
				            $('#hsn').val(obj[0].hsn)
				            $('#rate').val(obj[0].Rate)
				            $('#UnitName').val(obj[0].Unit)
				        }
				})
	}
	
	</script>
</body>
</html>