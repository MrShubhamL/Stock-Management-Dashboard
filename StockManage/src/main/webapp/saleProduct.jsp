<%@page import="com.entity.SaleProduct"%>
<%@page import="com.dao.SellingDAO"%>
<%@page import="com.entity.Stock"%>
<%@page import="com.dao.StockDAO"%>
<%@page import="com.dao.allLedgerDAO"%>
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
					<form class="" method="post" action="NewProductSale">
						<div class="row">
							<div class="col-md-12">
								<div class="card mt-4">
									<div class="card-header bg-info">
										<h6 class="">
											<i class="nav-icon fa-solid fa-circle-info"></i> CUSTOMER
											INFO
										</h6>
									</div>

									<div class="card-body">
										<div class="col-md-12 row g-3">
											<div class="col-md-4">
												<label>Search By Customer Contact</label> <select
													class="form-control select2" style="width: 100%;"
													onchange="getCustomerInfoByContact()" id="CutomerContact"
													name="CutsomerContact">
													<option selected="selected">Search Contact</option>

													<%
													try {
														SellingDAO dao2 = new SellingDAO(DBConnection.getConnection());
														List<SaleProduct> list2 = dao2.getSaleCustomerbyContact();
														for (SaleProduct ad2 : list2) {
													%>
													<option><%=ad2.getCutContact()%></option>

													<%
													}
													} catch (Throwable t) {
													System.out.println(t);
													}
													%>

												</select>
											</div>
											<div class="col-md-4">
												<label>Customer Name</label> <input id="name"
													class="form-control" type="text" name="custName"
													required="required">
											</div>

											<div class="col-md-4">
												<label>Customer Contact</label> <input min="0" max="10"
													maxlength="10" id="LContact" class="form-control"
													type="text" name="custContact" required>
											</div>
											<div class="col-md-4">
												<label>Customer Email</label> <input id="email"
													class="form-control" type="email" name="custEmail" required>
											</div>
											<div class="col-md-4">
												<label>Address</label> <input id="address"
													class="form-control" type="text" name="custAddress"
													required>
											</div>
											<div class="col-md-4">
												<label>Payment Mode</label> <select name="payMode"
													class="form-control select2">
													<option>Select Mode</option>
													<option>Cash</option>
													<option>Online</option>
													<option>Credit</option>
													<option>Debite</option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<%
						String s = (String) session.getAttribute("Successfull");
						String ZeroAmount = (String) session.getAttribute("ZeroAmount");
						String ProductSaled = (String) session.getAttribute("ProductSaled");
						String Updated = (String) session.getAttribute("Updated");

						if (ProductSaled != null) {
						%>
						<script type="text/javascript">
								Swal.fire(
										  'Product Sold!',
										  'Product Successfully sold out.',
										  'success'
										)
								</script>

						<%
						session.removeAttribute("ProductSaled");
						}
						if (ZeroAmount != null) {
						%>
						<!-- Modal -->
						<script type="text/javascript">
								Swal.fire(
										  'Insufficient Stock',
										  'You have insufficient stock! \n Please purchase new stock for this product first',
										  'error'
										)
								</script>
						<%
						session.removeAttribute("ZeroAmount");
						}
						if (Updated != null) {
						%>
						<!-- Modal -->
						<script type="text/javascript">
								Swal.fire(
										  'Update Stock',
										  'Stock Updated Successfully!.',
										  'success'
										)
								</script>
						<%
						session.removeAttribute("Updated");
						}
						%>
						<div class="row">
							<div class="col-md-12">
								<div class="card mt-4">
									<div class="card-header bg-info d-flex">
										<h6 class="">
											<i class="nav-icon fa-brands fa-product-hunt"></i> PRODUCTS
											DETAILS
										</h6>
										<h6 class="text-white ml-auto d-flex">
											<a class=" text-white" data-bs-toggle="modal"
												data-bs-target="#exampleModal"
												style="cursor: pointer; padding: 0; margin: 0;">
												<i class="fa-solid fa-arrow-left"></i>
												Return Product
											</a>
										</h6>
									</div>

									<div class="card-body">
										<div class="col-md-12 row g-3">

											<div class="col-md-4">
												<label>Material Name</label> <select id="materialName"
													name="materialName" onchange="MaterialFun()"
													class="form-control select2">
													<option>Select Product</option>
													<%
													try {
														StockDAO dao = new StockDAO(DBConnection.getConnection());
														List<Stock> st = dao.getStockInfo2();
														for (Stock l : st) {
													%>
													<option><%=l.getMaterialName()%></option>
													<%
													}
													} catch (Throwable t) {
													System.out.println(t);
													}
													%>

												</select>
											</div>

											<div class="col-md-4">
												<label for="qty" class="form-label">Qty</label> <input
													onkeyup="QtyFun()" type="text" class="form-control"
													name="qty" id="qty" required>
											</div>
											<div class="col-md-4">
												<label for="rate" class="form-label">UNIT</label> <input
													class="form-control" name="unit" type="text" id="unit">
											</div>
											<div class="col-md-4">
												<label for="validationDefault02" class="form-label">HSN
													NO</label> <input type="text" name="hsn" class="form-control"
													id="hsn" value="" required>
											</div>
											<div class="col-md-4">
												<label for="rate" class="form-label">Rate/Kg</label> <input
													type="text" name="rate" oninput="calculator()"
													class="form-control" id="rate" required>
											</div>
												<input type="hidden"
													class="form-control" id="qty1" required>
											
											<div class="col-md-4">
												<label for="tamount" class="form-label">Total</label> <input
													type="text" name="tAmount" class="form-control"
													id="tamount" required>
											</div>
											<div class="col-md-4">
												<label for="f" class="form-label"> <small>Make
														sure you have sufficient stock before selling.</small>
												</label>
												<button class="btn btn-primary" type="submit">
												<i class="fa-solid fa-circle-check"></i> SALE PRODUCT</button>
												<button onclick="location.reload();"
													class="btn btn-secondary" type="reset">
													<i class="fa-solid fa-arrow-rotate-left"></i> Reset</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</section>
		</div>
	</div>
	
		<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">
                <i class="nav-icon fa-solid fa-boxes-stacked"></i> Update Stock</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="col-md-12">
						<form action="updateStock" method="POST" class="row g-3">
							<div class="col-md-6">
								<label>Material Name</label> <select id="materialName2"
									name="materialName2" onchange="MaterialFun2()"
									class="form-control select2">
									<option>Select Product</option>
									<%
									try {
										StockDAO dao = new StockDAO(DBConnection.getConnection());
										List<Stock> st = dao.getStockInfo2();
										for (Stock l : st) {
									%>
									<option><%=l.getMaterialName()%></option>
									<%
									}
									} catch (Throwable t) {
									System.out.println(t);
									}
									%>

								</select>
							</div>

							<div class="col-md-6">
								<label for="qty" class="form-label">Qty</label> <input
									onkeyup="QtyFun2()" type="text" class="form-control" name="qty"
									id="qty2" required>
							</div>
							<div class="col-md-4">
								<label for="validationDefault02" class="form-label">HSN
									NO</label> <input type="text" name="hsn" class="form-control" id="hsn2"
									value="" required readonly="readonly">
							</div>
							<div class="col-md-4">
								<label for="rate" class="form-label">Rate/Kg</label> <input
									type="text" name="rate" oninput="calculator()"
									class="form-control" id="rate2" required readonly="readonly">
							</div>


							<div class="col-md-4">
								<label for="tamount" class="form-label">Total</label> <input
									type="text"  class="form-control" id="tamount2"
									required readonly="readonly">
							</div>
							<div class="col-md-4">
							<input type="hidden" name="tAmount" class="form-control" id="tamount3"
								id="tamount3"	required>
							</div>
							<div class="col-md-12">
								<button type="submit" class="btn btn-primary">
								<i class="fa-solid fa-certificate"></i> Update Stock</button>
							</div>
						</form>
					</div>
				</div>
			</div>
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
		var bb = Number(document.getElementById("qty1").value);
		var cc = Number(document.getElementById("qty").value);
		var rr = Number(bb-cc);
		if(rr<0)
		{
		toastr.error('Sorry! Your available stock is '+'<strong style="font-size: 50px;">'+bb+'</strong>')
		}

	}
	
	function QtyFun2() {
		var rate = parseFloat(document.getElementById("rate2").value);
		var qty = parseFloat(document.getElementById("qty2").value);
		var result4 =  parseFloat(rate*qty);
		document.getElementById("tamount2").value = result4;
		document.getElementById("tamount3").value = result4;
		

	}
	
	function ChekedFun1(){
		var b = document.getElementById("IGST1");
			if(b.checked == true){
				document.getElementById("SGST1").disabled = true;
				document.getElementById("CGST1").disabled = true;
				var a = Number(0);
				document.getElementById("SGST2").value = a;
				document.getElementById("CGST2").value = a;
				
				var rate = parseFloat(document.getElementById("Namount").value);
				
				var result2 = parseFloat((rate * 5)/100);

				document.getElementById("IGST2").value = result2;
				var IGST = parseFloat(document.getElementById("IGST2").value);
				var result3 = parseFloat(IGST + rate);
				document.getElementById("tamount").value = result3;
				
				
			}else{
				document.getElementById("SGST1").disabled = false;
				document.getElementById("CGST1").disabled = false;
				document.getElementById("IGST2").value = 0;
				document.getElementById("tamount").value = 0;
			}
	}
	
	
	function CheckedFun2(){
		var a = document.getElementById("SGST1");
		if(a.checked == true){
			document.getElementById("IGST1").disabled = true;
			document.getElementById("CGST1").checked = true;
			
			var rate = parseFloat(document.getElementById("Namount").value);
			var result2 = parseFloat((rate * 5)/100)/2;
			document.getElementById("CGST2").value = result2;
			document.getElementById("SGST2").value = result2;
			
			var c = parseFloat(document.getElementById("CGST2").value);
			var d = parseFloat(document.getElementById("SGST2").value);
			var TotalAmount = parseFloat(c + d + rate);
			document.getElementById("tamount").value = TotalAmount;
			
		}else{
		document.getElementById("IGST1").disabled = false;
		document.getElementById("CGST1").checked = false;
		}
	}
	function MaterialFun(){
		var g = document.getElementById("materialName").value;
				$.ajax({
					 type: "POST",
				     url: "AjaxPages/AllMaterial.jsp",
				     data: { "MaterialName": g },
				     
				     success: function(data) {
				            isNew = false;
				            var obj = JSON.parse(data);
				            LedgerName = obj[0].g
				            $('#hsn').val(obj[0].hsn)
				            $('#rate').val(obj[0].Rate)
				            $('#unit').val(obj[0].Unit)
				        }
				})
				$.ajax({
					 type: "POST",
				     url: "AjaxPages/StockQuantity.jsp",
				     data: { "MaterialName": g },
				     
				     success: function(data) {
				            isNew = false;
				            var obj = JSON.parse(data);
				            LedgerName = obj[0].g
				            $('#qty1').val(obj[0].qty)
				        }
				})
				
				
				
				
	}

	function MaterialFun2(){
		var xh = document.getElementById("materialName2").value;
				$.ajax({
					 type: "POST",
				     url: "AjaxPages/AllMaterial.jsp",
				     data: { "MaterialName": xh },
				     
				     success: function(data) {
				            isNew = false;
				            var obj = JSON.parse(data);
				            LedgerName = obj[0].xh
				            $('#hsn2').val(obj[0].hsn)
				            $('#rate2').val(obj[0].Rate)
				            $('#unit2').val(obj[0].Unit)
				        }
				})
	}
	function getCustomerInfoByContact(){
		var h = document.getElementById("CutomerContact").value;
				$.ajax({
					 type: "POST",
				     url: "AjaxPages/CustomerPersonalInfo.jsp",
				     data: { "CutomerContact": h },
				     
				     success: function(data) {
				            isNew = false;
				            var obj = JSON.parse(data);
				            LedgerName = obj[0].h
				            $('#name').val(obj[0].custName)
				            $('#LContact').val(obj[0].custContact)
				            $('#email').val(obj[0].custEmail)
				            $('#address').val(obj[0].custAddress)
				        }
				})
	}
	</script>



</body>
</html>