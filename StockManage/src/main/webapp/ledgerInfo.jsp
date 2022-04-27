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
	String name = request.getParameter("ledgerName");
	try{
	allLedgerDAO dao = new allLedgerDAO(DBConnection.getConnection());
	addLedger l= dao.getLedgerInfo(name);
	
	%>
	<div class="container-fluid">
		<div class="col-md-12 mt-3">
			<table class="table table-bordered">
			  <thead>
			    <tr>
			      <th class="bg-info" colspan="4">LEDGER INFORMATION</th>
			    </tr>
			    <tr>
			      <th>Name : </th>
			      <td><%= l.getLedgerName() %></td>
			      <th>Bank Name :</th>
			      <td><%= l.getBankName() %></td>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th>Contact : </th>
			      <td><%= l.getContactNo() %></td>
			      <th>Branch Name :</th>
			      <td><%= l.getBranchName() %></td>
			    </tr>
			    <tr>
			      <th>Email : </th>
			      <td><%= l.getEmail() %></td>
			      <th>Account Type :</th>
			      <td><%= l.getAccountType() %></td>
			    </tr>
			    <tr>
			      <th>GST NO : </th>
			      <td><%= l.getGstNo() %></td>
			      <th>Account Number :</th>
			      <td><%= l.getAccountNumber() %></td>
			    </tr>
			    <tr>
			      <th>Address : </th>
			      <td colspan="3"><%= l.getAddress() %></td>
			    </tr>
			  </tbody>
			</table>
		</div>
		
		<div class="col-md-12 mt-3">
		
			<table class="table table-bordered">
			  <thead>
			    <tr>
			      <th class="bg-info" colspan="11">PRODUCT INFORMATION</th>
			    </tr>
			    <tr>
			      <th scope="col">Sr.No</th>
			      <th scope="col">Material Name</th>
			      <th scope="col">HSN No</th>
			      <th scope="col">Rate</th>
			      <th scope="col">Quantity</th>
			      <th scope="col">Date</th>
			      <th scope="col">Total Amount</th>
			    </tr>
			  </thead>
			  <tbody>
			  <%
			  String name2 = request.getParameter("ledgerName");
			  	allProducts dao2 = new allProducts(DBConnection.getConnection());
			  	List<Products> list2 = dao2.getProductByLedgerName(name2);
			  	int i = 0;
			  	for(Products p:list2){
			  		i++;
			  		%>
				    <tr>
				      <th><%= i %></th>
				      <td><%= p.getMaterialName() %></td>
				      <td><%= p.getHsn() %></td>
				      <td><%= p.getRate() %></td>
				      <td><%= p.getQty() %></td>
				      <td><%= p.getDate() %></td>
				      <td><%= p.getTotal() %></td>
				    </tr>
			  		<%
			  	}
			  %>
			  
			  </tbody>
			</table>
		</div>
		
			<div class="col-md-12 m-4 d-flex">
				<div class="col-md-3">
					<a class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal" >INVOICE</a>
					<a class="btn btn-danger" href="allProduct.jsp">Go Back</a>
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
        <form action="invoice.jsp">
			<input class="form-control" name="ledgerName" type="hidden" value="<%= name %>">
			<input class="form-control" name="ledgerContact" type="hidden" value="<%= l.getContactNo() %>">
			
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