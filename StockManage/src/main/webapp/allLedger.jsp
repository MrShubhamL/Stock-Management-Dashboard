
<%@page import="com.entity.addLedger"%>
<%@page import="com.dao.allLedgerDAO"%>
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
								<div class="card-header bg-info">
									<h6 class="">
									<i class="nav-icon fa-solid fa-circle-info px-2"></i>
									All LEDGERS INFO</h6>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<div class="table-responsive">
									<table class="table table-sm table-bordered table-striped">
										<thead class="bg-info p-2">
											<tr class="p-4">
												<th>Sr.No</th>
												<th>Name</th>
												<th>Contact</th>
												<th>Email</th>
												<th>GST NO</th>
												<th>Address</th>
												<th>Bank Name</th>
												<th>Account No</th>
												
											</tr>
										</thead>
										<tbody>
											<%
											try {

												allLedgerDAO dao = new allLedgerDAO(DBConnection.getConnection());
												List<addLedger> list = dao.getLedger();
												int i = 0;
												for (addLedger pd : list) {
													i++;
												%>
												<tr>
													<td><%= i %></td>
													<td><%= pd.getLedgerName() %></td>
													<td><%= pd.getContactNo() %></td>
													<td><%= pd.getEmail() %></td>
													<td><%= pd.getGstNo() %></td>
													<td><%= pd.getAddress() %></td>
													<td><%= pd.getBankName() %></td>
													<td><%= pd.getAccountNumber() %></td>
												</tr>
												<%
											}

											} catch (Throwable e) {
											System.out.println(e);
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
	<script>
		$(function() {
			$("#example1").DataTable(
					{
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print",
								"colvis" ]
					}).buttons().container().appendTo(
					'#example1_wrapper .col-md-6:eq(0)');
			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false,
				"responsive" : true,
			});
		});

		function closemodal() {
			var x = document.getElementById("exampleModal");
			x.classList.remove("show");
			x.setAttribute("aria-modal","false");
			x.style.display = null;
		}
	</script>


</body>
</html>