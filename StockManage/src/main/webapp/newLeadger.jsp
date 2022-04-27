<%@page import="com.google.protobuf.Value"%>
<%@page import="com.entity.Products"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnection"%>
<%@page import="com.dao.allProducts"%>
<%@page import="com.mysql.cj.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="headerLinks.jsp"%>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<%@include file="navbar.jsp"%>
		<%@include file="sidebar.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
						<form  method="post" action="AddLedger"
											enctype="multipart/form-data">
							<div class="card mt-4">
								<%
								String s = (String) session.getAttribute("Successfull");
								if (s != null) {
								%>

								<!-- Modal -->
								<div class="modal fade show" id="exampleModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-modal="true"
									style="display: block;">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">
													Successfull</h5>

											</div>
											<div class="modal-body">New Ledger Added Successfully</div>
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
								%>

								<div class="card-header bg-info">
								
									<h6 class=""><i class="nav-icon fa-solid fa-circle-info">
									</i> LEDGER INFORMATION</h6>
								</div>

								<div class="card-body">
									<div class="col-md-12 row">
											<div class="col-md-4">
												<label for="validationDefault01" class="form-label">Ledger
													Name</label> <input type="text" class="form-control"
													id="materialName" name="ledgerName" value="" required>
											</div>
											<div class="col-md-4">
												<label for="validationDefault02" class="form-label">Contact
													No.</label> <input type="text" name="contactNo"
													class="form-control" id="hsn" value="" required>
											</div>
											<div class="col-md-4">
												<label for="validationDefault02" class="form-label">Email
												</label> <input type="text" name="email" class="form-control"
													id="hsn" value="" required>
											</div>
											<div class="col-md-4">
												<label for="validationDefault02" class="form-label">Address
												</label>
												<textarea class="form-control" name="address"
													required="required"></textarea>
											</div>
											<div class="col-md-4">
												<label for="validationDefault02" class="form-label">GST
													No.</label> <input type="text" name="gstno" class="form-control"
													id="hsn" value="" required>
											</div>
											<div class="col-md-4">
												<label for="formFile" class="form-label">Ledger
													Profile Image</label> 
													<input class="form-control" type="file"
													id="formFile" name="profile" value="">

											</div>
											
									</div>
								</div>
							</div>
							
							
							<div class="card mt-4">
								<div class="card-header bg-info">
									<h6 class="">
									<i class="nav-icon fa-solid fa-building-columns"></i>
									 BANK DETAILS</h6>
								</div>

								<div class="card-body">
									<div class="col-md-12 row">
											<div class="col-md-4">
												<label for="validationDefault02" class="form-label">Bank
													Name</label> <input type="text" name="bankName"
													class="form-control" id="hsn" value="" required>
											</div>
											<div class="col-md-4">
												<label for="validationDefault02" class="form-label">Bank
													IFSC Code</label> <input type="text" name="ifscCode"
													class="form-control" id="hsn" value="" required>
											</div>
											<div class="col-md-4">
												<label for="validationDefault02" class="form-label">Account
													Type </label> <select id="GST" name="accountType"
													class="form-control select2" aria-label="Default select example">
													<option value="Not Selected" selected>Select Account Type</option>
													<option value="Saving">Saving</option>
													<option value="Current">Current</option>

												</select>
											</div>
											<div class="col-md-4">
												<label for="validationDefault02" class="form-label">Account
													Number</label> <input type="text" name="accountNumber"
													class="form-control" id="hsn" value="" required>
											</div>
											<%
											String CFailed = (String) session.getAttribute("CFailed");
											if (CFailed != null) {
											%>
											<div class="col-md-4">
												<label style="color: red;" for="" class="form-label">Confirm
													Account Number</label> 
													<input type="text" name="" 
													class="form-control" id="" value="Confirm Account Number"  required style="color: red; border-color: red;">
											</div>

											<%
											session.removeAttribute("CFailed");
											}
											else{
												%>
												<div class="col-md-4">
													<label for="validationDefault02" class="form-label">Confirm
														Account Number</label> <input type="text" name="confirm"
														class="form-control" id="hsn" value="" required>
												</div>
												
												<%
											}
											%>


											<div class="col-md-4">
												<label for="validationDefault02" class="form-label">Branch
													Name</label> <input type="text" name="branchName"
													class="form-control" id="hsn" value="" required>
											</div>
										

											
									</div>
								</div>
							</div>
							<div class="col-12 mt-2" style="display: flex; justify-content: center;">
								<button class="btn btn-primary" type="submit">
								<i class="nav-icon fa-solid fa-plus"></i> ADD NEW LEDGER</button>
								<button class="btn btn-secondary mx-3" type="reset">Reset</button>
							</div>
							
							</form>
						</div>
						
					</div>

				</div>
		</section>
		</div>
	</div>

	<%@ include file="footerLinks.jsp"%>


	<script type="text/javascript">
		function calculator() {
			var a = parseFloat(document.getElementById("GST").value);
			var b = parseFloat(document.getElementById("qty").value);
			var c = parseFloat(document.getElementById("rate").value);

			var result1 = parseFloat((c * a) / 100);
			var result2 = parseFloat(result1 + c);
			var result3 = parseFloat(result2 * b);

			document.getElementById("tamount").value = result3;

		}

		function closemodal() {
			var x = document.getElementById("exampleModal");
			x.classList.remove("show");
			x.setAttribute("aria-modal","false");
			x.style.display = null;
		}
	</script>
</body>
</html>