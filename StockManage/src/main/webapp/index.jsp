<%@page import="com.entity.Stock"%>
<%@page import="com.dao.StockDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Products"%>
<%@page import="com.conn.DBConnection"%>
<%@page import="com.dao.allProducts"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Stock Management</title>
<%@include file="headerLinks.jsp"%>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<%@include file="navbar.jsp"%>
		<%@include file="sidebar.jsp"%>
		<div class="content-wrapper">
			<section class="content">
				<div class="container-fluid">
					<div class="row mt-3">
						<%
						try {
							StockDAO dao = new StockDAO(DBConnection.getConnection());
							List<Stock> list = dao.getStockInfo();
							for (Stock p : list) {
						%>
						<div class="col-lg-3 col-6">
							<div class="small-box " style="background-color: #FFAB40;">
								<div class="inner">
									<div class="d-flex">
										<%
										StockDAO dao2 = new StockDAO(DBConnection.getConnection());
										List<Stock> st = dao2.getStockQty(p.getMaterialName());

										for (Stock o : st) {
										%>
										<h3 class=""><%=o.getQuantity()%></h3>
										<%
										}
										%>
										<p class="px-2">
											<small style="color: black;">Qty.</small>
										</p>
									</div>
									<h5
										style="white-space: nowrap; width: 100%; overflow: hidden; text-overflow: ellipsis;"><%=p.getMaterialName()%></h5>
								</div>
								<div class="icon">
									<i class="ion ion-bag"></i>
								</div>
								<a href="stockInfo.jsp?id=<%=p.getId()%>"
									class="small-box-footer">More info <i
									class="fas fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<%
						}
						} catch (Throwable t) {
						System.out.println(t);
						}
						%>
					</div>

					<p>
						<button class="btn text-white" type="button" style="background-color: #7B1FA2;"
							data-bs-toggle="collapse" data-bs-target="#collapseWidthExample"
							aria-expanded="false" aria-controls="collapseWidthExample">
							More Products</button>
					</p>
					<div style="min-height: 120px;">
						<div class="collapse collapse-horizontal"
							id="collapseWidthExample">
							<div class="card card-body" style="width: 100%;">
								<div class="row mt-3">
									<%
									try {
										StockDAO dao = new StockDAO(DBConnection.getConnection());
										List<Stock> list = dao.getAllStockInfo();
										for (Stock p : list) {
									%>
									<div class="col-lg-3 col-6">
										<div class="small-box" style="background-color: #C2185B;">
											<div class="inner">
												<div class="d-flex">
													<%
													StockDAO dao2 = new StockDAO(DBConnection.getConnection());
													List<Stock> st = dao2.getStockQty(p.getMaterialName());
													for (Stock o : st) {
													%>
													<h3 class="text-white"><%=o.getQuantity()%></h3>
													<%
													}
													%>
													<p class="px-2 text-white">
														<small>Qty.</small>
													</p>
												</div>
												<h5 style="
												color: white;
												 white-space: nowrap;
												 width: 100%; 
												 overflow: hidden;
												 text-overflow: ellipsis;"><%=p.getMaterialName()%></h5>
											</div>
											<div class="icon">
												<i class="ion ion-bag"></i>
											</div>
											<a href="stockInfo?id=<%=p.getId()%>"
												class="small-box-footer text-white">More info <i
												class="fas fa-arrow-circle-right"></i></a>
										</div>
									</div>
									<%
									}
									} catch (Throwable t) {
									System.out.println(t);
									}
									%>
								</div>


							</div>
						</div>
					</div>
				</div>
				
				<div class="card card-warning card-outline">
              <div class="card-header">
                <h3 class="card-title">
                  <i class="fas fa-edit"></i>
                  Toastr Examples
                </h3>
              </div>
              <div class="card-body">
                <button type="button" class="btn btn-success toastrDefaultSuccess">
                  Launch Success Toast
                </button>
                <button type="button" class="btn btn-info toastrDefaultInfo">
                  Launch Info Toast
                </button>
                <button type="button" class="btn btn-danger toastrDefaultError">
                  Launch Error Toast
                </button>
                <button type="button" class="btn btn-warning toastrDefaultWarning">
                  Launch Warning Toast
                </button>
                <div class="text-muted mt-3">
                  For more examples look at <a href="https://codeseven.github.io/toastr/">https://codeseven.github.io/toastr/</a>
                </div>
              </div>
              <!-- /.card -->
            </div>
			</section>
		</div>
	</div>

<%@include file="footerLinks.jsp"%>
</body>
</html>