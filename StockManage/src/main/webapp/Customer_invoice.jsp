<%@page import="com.entity.SaleProduct"%>
<%@page import="com.dao.SellingDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="com.entity.addLedger"%>
<%@page import="com.dao.allLedgerDAO"%>
<%@page import="com.entity.Products"%>
<%@page import="com.conn.DBConnection"%>
<%@page import="com.dao.allProducts"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="headerLinks.jsp"%>
<style type="text/css">
.invoice {
	font-size: 28px;
}

</style>
<style id="table_style" type="text/css">
   
    table
    {
        border: 1px solid #ccc;
        border-collapse: collapse;
    }
    table th
    {
        background-color: #F7F7F7;
        color: #333;
        font-weight: bold;
        margin-left: 0;
        padding-left: 0;
    }
    table th, table td
    {
        border: 1px solid #ccc;
    }
</style>
</head>
<body>
	<div class="container-fluid">
		<%
		int gstPercent = Integer.parseInt(request.getParameter("gst"));
		String CustomerName = request.getParameter("CustomerName");
		String CustomerContact = request.getParameter("CustomerContact");
		%>
		<div class="col-md-6 offset-3">
			<input class="form-control" id="gstPercent" type="hidden"
				value="<%=gstPercent%>">
			<input class="form-control" id="lName" type="hidden"
				value="<%=CustomerName%>">
		</div>
		<div id="dvContents" class="col-md-8 offset-2 ">
			<table class="table table-bordered mt-3">
				<thead>
					<tr>
						<th class="text-center" colspan="8">
							<p class="text-center"
								style="font-size: 2rem; padding: 0; margin: 0;">Arman
								Trader's</p>
							<p class="text-center" style="padding: 0; margin: 0;">Near By
								Nagar Parishad, Malkapur. Tal. Shahuvadi, Dist Kolhapur- 415101
							</p>
							<p class="text-center" style="padding: 0; margin: 0;">Contact
								No. +919420970909</p>
						</th>
					</tr>
					<tr>
						<td style="padding: 3px; margin: 0;" colspan="3">
							<p style="padding: 3px; margin: 0;"><strong>GST NO. 27CMXPB5713N1ZF</strong></p>
						</td>
						<td style="padding: 3px; margin: 0;" colspan="8">
							<p style="padding: 3px; margin: 0;"><strong>FSSAI No :</strong></p>
						</td>
					</tr>
					<tr>
						<th style="padding: 3px; margin: 0;" colspan="8">
							<p style="padding: 3px; margin: 0; font-size: 20px;"
								class="text-center">GST INVOICE</p>
						</th>
					</tr>
					<tr style="padding: 0; margin: 0;"><td colspan="8" style="padding: 3px; margin: 0;">
					
					<h5 style="padding: 2px; margin: 0;">Bill To:</h5>
					
					</td></tr>
					<%
					LocalDate date = LocalDate.now();

				
						SellingDAO daoF = new SellingDAO(DBConnection.getConnection());
						SaleProduct pF = daoF.getSaleProductInfo(CustomerName, CustomerContact);
					%>
					<tr>
						<td class="" colspan="4"><strong>NAME:</strong> <%=pF.getCustomerName()%></td>
						<td class="" colspan="4"><strong>BILL NO:</strong> <%=pF.getId() + 100%></td>
					</tr>
					<tr>
						<td class="" colspan="4"><strong>ADDRESS:</strong> <%=pF.getCutAddress()%></td>
						<td class="" colspan="4"><strong>DATE:</strong> <%=date%></td>
					</tr>
					<tr>
						<th scope="col">Sr.No</th>
						<th scope="col">Material Name</th>
						<th scope="col">HSN NO</th>
						<th scope="col">Quantity</th>
						<th scope="col">Rate</th>
						<th scope="col">Per/Kg</th>
						<th scope="col">Total Amount</th>
					</tr>
					<%
					%>
				</thead>
				<tbody>
					<%
					try {
						String date2 = request.getParameter("date");

						SellingDAO dao = new SellingDAO(DBConnection.getConnection());
						List<SaleProduct> list = dao.getSoldProductInfoByDateAndCustomerName(date2, CustomerName);
						int i = 0;
						double total = 0.0;
						double productAmount = 0.0;
						double grossAmount = 0.0;
						for (SaleProduct p : list) {
							i++;
							
							productAmount = (p.getQty() * p.getTotal());
					%>
					<tr>
						<th class="text-center" scope="row"><%=i%></th>
						<td class="text-center"><%=p.getMaterialName()%></td>
						<td class="text-center"><%=p.getHsn()%></td>
						<td class="text-center"><%=p.getQty()%></td>
						<td class="text-center"><%=p.getTotal()%></td>
						<td class="text-center"><%= p.getUnit() %></td>
						<td class="text-center"><%=productAmount%></td>
					</tr>

					<%
					grossAmount = grossAmount + (productAmount);
					total = total + (productAmount);
					}
					%>
					<tr>
						<td class="text-center" colspan="4"></td>
						<th class="text-center" colspan="2">GROSS Amount :</th>
						<th style="font-weight:bold;" class="text-center" colspan="2"><%=grossAmount%></th>
					</tr>
					<tr>
						<td class="text-center" colspan="4"></td>
						<th class="text-center" colspan="2">Net Amount :</th>
						<td class="text-center" colspan="2"><p
								style="padding: 0; margin: 0; font-weight:bold;" id="netAmo"></p></td>
					</tr>
					<tr>
						<td class="text-center" colspan="4"></td>
						<th class="text-center" colspan="2">
							<p style="display: inline-flex; padding: 0; margin: 0;"
								class="px-2">SGST:</p>
							<p style="display: inline-flex; font-weight:bold; padding: 0; margin: 0;" id="SGST"></p>%
						</th>
						<td class="text-center" colspan="2"><p
								style="padding: 0; margin: 0; font-weight:bold;" id="sgstAm"></p></td>
					</tr>
					<tr>
					<td class="text-center" colspan="4"></td>
						<th class="text-center" colspan="2">
							<p style="display: inline-flex; padding: 0; margin: 0;"
								class="px-2">CGST:</p>
							<p style="display: inline-flex; font-weight:bold; padding: 0; margin: 0;" id="CGST"></p>%
						</th>

						<td class="text-center" colspan="2"><p
								style="padding: 0; margin: 0; font-weight:bold;" id="cgstAm"></p></td>
					</tr>
					<tr>
					<td class="text-center" colspan="4"></td>
						<th class="text-center" colspan="2">TOTAL AMOUNT:</th>
						<th class="text-center" colspan="2"><%=total%></th>
					</tr>



				</tbody>
			</table>
		</div>
			<div class="col-md-12 mb-3">
				<!-- <button id="printBtn"  class="btn btn-info">PRINT</button> -->
				<a class="btn btn-success" onclick="PrintTable()"  
				data-bs-toggle="modal" data-bs-target="#exampleModal1" >INVOICE</a>
				<a class="btn btn-danger" href="allSellingList.jsp">Go Back</a>
			</div>
		<input type="hidden" id="TotalAmount" value="<%=total%>">
		<%
		
		} catch (Throwable t) {
		System.out.println(t);
		}
		%>
	</div>
	<%@include file="footerLinks.jsp"%>
	<script language="Javascript" src="Bill_Generator.js"></script>
<script type="text/javascript">
    function PrintTable() {
        var printWindow = window.open('', '', 'height=768,width=1366');
        var custName = document.getElementById("lName").value;
        printWindow.document.write('<html><head><title></title>');
 
        //Print the Table CSS.
        var table_style = document.getElementById("table_style").innerHTML;
        printWindow.document.write('<style type = "text/css">');
        printWindow.document.write(table_style);
        printWindow.document.write('</style>');
        printWindow.document.write('</head>');
 
        //Print the DIV contents i.e. the HTML Table.
        printWindow.document.write('<body>');
        var divContents = document.getElementById("dvContents").innerHTML;
        printWindow.document.write(divContents);
        printWindow.document.write('</body>');
 
        printWindow.document.write('</html>');
        printWindow.document.close();
        printWindow.print();
        
    }

</script>

	<!-- Modal -->
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header bg-info">
        <h5 class="modal-title" id="exampleModalLabel">SEND INVOICE</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form class="" action="sendInvoice" method="post" enctype="multipart/form-data">
			<div class="col-md-12 row g-3">
				<div class="col-md-6">
					<label class="form-label">Send To</label>
					<input class="form-control" value="<%=pF.getCutEmial() %>" name="To" type="text">
				</div>
				<div class="col-md-6">
					<label class="form-label">Send From</label>
					<input class="form-control" value="shubhmechanics952@gmail.com" name="From" type="text">
				</div>
				<div class="col-md-6">
					<label class="form-label">Subject</label>
					<input class="form-control" value="Arman Traders | Tea Shop" name="Subject" type="text">
				</div>
				<div class="col-md-6">
					<label class="form-label">Message</label>
					<textarea class="form-control" name="Message" 
					>Hello <%=pF.getCustomerName() %>, 
					Thanks for visiting our store. We have attached invoice please check out, If any problem related your payments then kindly contact us.
					Thank You.</textarea>
				</div>
				<div class="col-md-6">
					<div class="mb-3">
					  <label for="formFile" class="form-label">Attachment</label>
					  <input class="form-control" name="Attachment" type="file" 
					  id="formFile" required="required">
					</div>
				</div>
				<div class="col-md-6">
					<label class="form-label">Password</label>
					<input class="form-control" name="Password" value="shubh96S@" type="text">
				</div>
				<div class="col-md-12">
					<button class="btn btn-primary" type="submit">SEND</button>
				</div>
			</div>
		</form>
      </div>
    </div>
  </div>
</div>
</body>
</html>