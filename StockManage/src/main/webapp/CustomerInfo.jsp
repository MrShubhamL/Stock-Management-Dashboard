  <%@page import="com.entity.SaleProduct"%>
<%@page import="com.dao.SellingDAO"%>
<%@page import="com.entity.Products"%>
<%@page import="com.dao.allProducts"%>
<%@page import="com.entity.addLedger"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnection"%>
<%@page import="com.dao.allLedgerDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="headerLinks.jsp" %>
<style type="text/css">
	a{
		font-size: 16px;
		font-style: normal;
		}
</style>
</head>
<body>
	<%
	String name = request.getParameter("CutsomerName");
	String custContact = request.getParameter("Contact");
	System.out.println(custContact);
	try{
	SellingDAO dao = new SellingDAO(DBConnection.getConnection());
	SaleProduct l= dao.getSaleProductInfo(name, custContact);
	if(l==null){
		HttpSession session2 = request.getSession();
		session2.setAttribute("Invalid_Contact", "Invalid customer Contact");
		response.sendRedirect("allSellingList.jsp");
	}
	%>
	<div class="container-fluid">
		<div class="col-md-12 mt-3">
			<table class="table table-bordered">
			  <thead>
			    <tr>
			      <th class="bg-info" colspan="4">CUSTOMER INFORMATION</th>
			    </tr>
			    <tr>
			      <th>Name : </th>
			      <td><%= l.getCustomerName() %></td>
			      <th>Contact :</th>
			      <td><%= l.getCutContact() %></td>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th>Email : </th>
			      <td><%= l.getCutEmial() %></td>
			      <th>Address :</th>
			      <td><%= l.getCutAddress() %></td>
			    </tr>
			    <tr>
			      <th>Payment Mode : </th>
			      <td><%= l.getPayMode() %></td>
			    </tr>
			  </tbody>
			</table>
		</div>
		
		<div class="col-md-12 mt-3">
			<div class="table-responsive">
			<table class="table table-bordered">
			  <thead>
			    <tr>
			      <th class="bg-info" colspan="11">PRODUCT INFORMATION</th>
			    </tr>
			    <tr>
			      <th scope="col">Sr.No</th>
			      <th scope="col">Material Name</th>
			      <th scope="col">HSN No</th>
			      <th scope="col">Quantity</th>
			      <th scope="col">Total Amount</th>
			      <th scope="col">Date</th>
			      <th scope="col">Time</th>
			    </tr>
			  </thead>
			  <tbody>
			  <%
			 	SellingDAO dao2 = new SellingDAO(DBConnection.getConnection());
			  	List<SaleProduct> list2 = dao2.getSoldProductInfo(name, custContact);
			  	int i = 0;
			  	for(SaleProduct p:list2){
			  		i++;
			  		%>
				    <tr>
				      <th>
					    <%= i %>
				      </th>
				      <td><%= p.getMaterialName() %></td>
				      <td><%= p.getHsn() %></td>
				      <td><%= p.getQty() %></td>
				      <td><%= p.getTotal() %></td>
				      <td><%= p.getDate() %></td>
				      <td><%= p.getTime() %></td>
				    </tr>
			  		<%
			  	}
			  %>
			  
			  </tbody>
			</table>
			</div>
		</div>
		
			<div class="col-md-12 m-4 d-flex">
				<div class="col-md-12">
					<a class="btn btn-success" data-bs-toggle="modal" 
					data-bs-target="#exampleModal" >INVOICE</a>
					<a class="btn btn-danger" href="allSellingList.jsp">Go Back</a>
					<a class=" nav-link" style="padding: 0; margin: 0;">
					(<strong>Note: </strong>
						Download customer invoice before sending final invoice.)
					</a>
				</div>
			</div>
	</div>
	
	<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">PRINT INVOICE</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="Customer_invoice.jsp">
			<input class="form-control" name="CustomerName" type="hidden" value="<%= name %>">
			<input class="form-control" name="CustomerContact" type="hidden" value="<%= l.getCutContact() %>">
			
			<div class="col-md-12 row">
				<div class="col-md-4">
				<label class="form-label">GST</label>
					<select class="form-select select2" name="gst" aria-label="Default select example">
					  <option selected>Select GST</option>
					  <option value="0">0</option>
					  <option value="5">5%</option>
					  <option value="12">12%</option>
					  <option value="18">18%</option>
					</select>
				</div>
				<div class="col-md-8">
				<label class="form-label">Select Purchase Date</label>
					<div class="input-group mb-3">
						<button class="btn btn-success" id="button-addon1" type="submit">Invoice</button>
							<input type="date" name="date" class="form-control" 
							placeholder="Select Date" 
							aria-label="Example text with button addon" 
							aria-describedby="button-addon1" required="required">
					</div>
				</div>
				
			</div>
		</form>
      </div>
    </div>
  </div>
</div>

	
	<%
	}catch(Throwable t){
		System.out.println(t);
	}
	%>
	<%@include file="footerLinks.jsp" %>


</body>
</html>