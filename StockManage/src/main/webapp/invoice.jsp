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
    }
    table th, table td
    {
        padding: 5px;
        border: 1px solid #ccc;
    }
</style>
</head>
<body>
	<div class="container-fluid">
		<%
		int gstPercent = Integer.parseInt(request.getParameter("gst"));
		String ledgerN = request.getParameter("ledgerName");
		%>
		<div class="col-md-6 offset-3">
			<input class="form-control" id="gstPercent" type="hidden"
				value="<%=gstPercent%>">
			<input class="form-control" id="lName" type="hidden"
				value="<%=ledgerN%>">
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
						<th style="padding: 3px; margin: 0;" colspan="4">
							<p style="padding: 3px; margin: 0;">GST NO. 27CMXPB5713N1ZF</p>
						</th>
						<th style="padding: 3px; margin: 0;" colspan="4">
							<p style="padding: 3px; margin: 0;">GST NO. 27CMXPB5713N1ZF</p>
						</th>
					</tr>
					<tr>
						<th style="padding: 3px; margin: 0;" colspan="8">
							<p style="padding: 3px; margin: 0; font-size: 20px;"
								class="text-center">GST INVOICE</p>
						</th>
					</tr>
					<tr>
						<td colspan="8"><h6 style="padding: 3px; margin: 0;">Bill
								To:</h6></td>
					</tr>
					<%
					LocalDate date = LocalDate.now();

					try {
						String ledgerNameF = request.getParameter("ledgerName");
						String ledgerContact = request.getParameter("ledgerContact");
						allProducts daoF = new allProducts(DBConnection.getConnection());
						addLedger pF = daoF.getLedgerNameAndConatct(ledgerNameF, ledgerContact);
					%>
					<tr>
						<td class="" colspan="4"><strong>NAME:</strong> <%=pF.getLedgerName()%></td>
						<td class="" colspan="4"><strong>BILL NO:</strong> <%=pF.getId() + 100%></td>
					</tr>
					<tr>
						<td class="" colspan="4"><strong>ADDRESS:</strong> <%=pF.getAddress()%></td>
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
					} catch (Throwable tF) {
					System.out.println(tF);
					}
					%>
				</thead>
				<tbody>
					<%
					try {
						String date2 = request.getParameter("date");
						String ledgerName2 = request.getParameter("ledgerName");

						allProducts dao = new allProducts(DBConnection.getConnection());
						List<Products> list = dao.getProductByLedgerDateAndName(date2, ledgerName2);
						int i = 0;
						double total = 0.0;
						double productAmount = 0.0;
						double grossAmount = 0.0;
						for (Products p : list) {
							i++;
							total = total + p.getTotal();
							productAmount = (p.getQty() * p.getRate());
					%>
					<tr>
						<th class="text-center" scope="row"><%=i%></th>
						<td class="text-center"><%=p.getMaterialName()%></td>
						<td class="text-center"><%=p.getHsn()%></td>
						<td class="text-center"><%=p.getQty()%></td>
						<td class="text-center"><%=p.getRate()%></td>
						<td class="text-center"><%=p.getUnit()%></td>
						<td class="text-center"><%=productAmount%></td>
					</tr>

					<%
					grossAmount = grossAmount + (p.getQty() * p.getRate());
					}
					%>
					<%
					String ledgerName3 = request.getParameter("ledgerName");
					allLedgerDAO dao3 = new allLedgerDAO(DBConnection.getConnection());
					addLedger ld = dao3.getLedgerInfo(ledgerName3);
					%>
					<tr>
						<th class="text-center" colspan="4"></th>
						<th class="text-center" colspan="2">GROSS Amount :</th>
						<td class="text-center" colspan="2"><%=grossAmount%></td>
					</tr>
					<tr>
						<th class="text-center" colspan="4"></th>
						<th class="text-center" colspan="2">Net Amount :</th>
						<td class="text-center" colspan="2"><p
								style="padding: 0; margin: 0;" id="netAmo"></p></td>
					</tr>
					<tr>
						<td class="" colspan="4"><strong>Bank Name:</strong> <%=ld.getBankName()%></td>

						<th class="text-center" colspan="2">
							<p style="display: inline-flex; padding: 0; margin: 0;"
								class="px-2">SGST:</p>
							<p style="display: inline-flex; padding: 0; margin: 0;" id="SGST"></p>%
						</th>
						<td class="text-center" colspan="2"><p
								style="padding: 0; margin: 0;" id="sgstAm"></p></td>
					</tr>
					<tr>
						<td class="" colspan="4"><strong>Account Number:</strong> <%=ld.getAccountNumber()%></td>

						<th class="text-center" colspan="2">
							<p style="display: inline-flex; padding: 0; margin: 0;"
								class="px-2">CGST:</p>
							<p style="display: inline-flex; padding: 0; margin: 0;" id="CGST"></p>%
						</th>

						<td class="text-center" colspan="2"><p
								style="padding: 0; margin: 0;" id="cgstAm"></p></td>
					</tr>
					<tr>
						<td class="" colspan="4"><strong>Bank IFSC Code: </strong> <%=ld.getIfcsCode()%></td>

						<th class="text-center" colspan="2">TOTAL AMOUNT:</th>
						<td class="text-center" colspan="2"><%=total%></td>
					</tr>



				</tbody>
			</table>
		</div>
			<div class="col-md-12 mb-3">
				<button id="printBtn" onclick="PrintTable()"  class="btn btn-info">PRINT</button>
				<a class="btn btn-success" href="allProduct.jsp">Go Back</a>
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
</body>
</html>