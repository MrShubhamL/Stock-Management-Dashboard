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
		<%@ include file="navbar.jsp"%>
		<%@ include file="sidebar.jsp"%>
		<div class="content-wrapper">
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card mt-4">





								
								<div class="card-header">
									<h5 class="text-center">ADD NEW PRODUCTS</h5>
								</div>

								<div class="card-body">
									<div class="col-md-12">

										<form class="row g-3" method="post" action="EditProduct">

											<%
											try {
												int id = Integer.parseInt(request.getParameter("id"));
												allProducts dao = new allProducts(DBConnection.getConnection());
												List<Products> list = dao.editProduct(id);
												for (Products pd : list) {
											%>
											<div class="col-md-6">
											<input type="text" name="id" value="<%=pd.getId() %>">
												<label for="validationDefault01" class="form-label">Material
													Name</label> <input type="text" class="form-control"
													id="materialName" name="materialName" value="<%= pd.getMaterialName() %>" required>
											</div> 
											<div class="col-md-6">
												<label for="validationDefault02" class="form-label">HSN
													NO</label> <input type="text" name="hsn" class="form-control"
													id="hsn" value="<%= pd.getHsn() %>" required>
											</div>
											<div class="col-md-6">
												<label for="validationDefault02" class="form-label">Weight</label>
												 <input type="text" name="weight" class="form-control"
													 value="<%= pd.getWeight() %>" required>
											</div>
											<div class="col-md-6">
												<label for="gst" class="form-label">GST</label> <select
													id="GST" name="gst"  class="form-select"
													aria-label="Default select example">
													<option selected><%= pd.getGst() %></option>
													<option value="2.5">2.5%</option>
													<option value="5.5">5.5%</option>
													<option value="8.5">8.5%</option>
												</select>
											</div>
											<div class="col-md-6">
												<label for="gst" class="form-label">CGST</label> <select
													 name="cgst"  class="form-select"
													aria-label="Default select example">
													<option selected><%= pd.getCgst() %></option>
													<option value="2.5">2.5%</option>
													<option value="5.5">5.5%</option>
													<option value="8.5">8.5%</option>
												</select>
											</div>
											<div class="col-md-6">
												<label for="qty" class="form-label">Qty</label> <input
													type="text" class="form-control" name="qty" id="qty" value="<%= pd.getQty() %>"
													required>

											</div>
											<div class="col-md-6">
												<label for="rate" class="form-label">Rate</label> <input
													type="text" name="rate" onkeyup="calculator()"
													class="form-control" id="rate" value="<%=pd.getRate() %>" required>
											</div>
											<div class="col-md-6">
												<label for="tamount" class="form-label">Total</label> <input
													type="text" name="total" class="form-control" id="tamount" value="<%=pd.getTotal() %>"
													required>
											</div>
											<div class="col-12">
												<button class="btn btn-primary" type="submit">Update
													</button>
											</div>

											<%
											}

											} catch (Throwable e) {
											System.out.print(e);
											}
											%>




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