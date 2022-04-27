
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
	String delete = (String) session.getAttribute("Deleted");
	if (delete != null) {
	%>

	<script type="text/javascript">
		Swal.fire(
		'Product Deleted!',
		'Product deleted successfully!',
		'success'
		)
	</script>

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
									<h6 class=""><i class="fa-solid fa-boxes-stacked"></i> PRODUCTS IN STOCK</h6>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<div class="table-responsive">
									<table id="tbl-ledger" class="table table-sm table-bordered table-striped">
										<thead class="bg-info">
											<tr>
												<th>Sr.No</th>
												<th>Material Name</th>
												<th>HSN No</th>
												<th>Quantity</th>
												<th>Unit</th>
												<th>Total Amount(Rs)</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<%
											try{
												StockDAO dao = new StockDAO(DBConnection.getConnection());
												List<Stock> list = dao.getAllStockInfo();
												int i = 0;
												for(Stock p:list){
													i++;
													%>
													<tr class="text-center">
														<td><%= i %></td>
														<td><%= p.getMaterialName() %></td>
														<td><%= p.getHsn() %></td>
														<td><%= p.getQuantity() %></td>
														<td><%= p.getUnit() %></td>
														<td><%= p.getRate()%></td>
														<td class="">
														<div class="col-md-12 d-flex">
															<a class="btn btn-sm btn-danger container text-center" 
															href="deleteProduct?id=<%= p.getId()%>">
															 <i class="fa-solid fa-eraser text-white"></i> DELETE</a>
														</div>
														</td>
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
	</script>






</body>
</html>