
<%@page import="com.entity.Products"%>
<%@page import="com.dao.allProducts"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.conn.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%
JSONArray list = new JSONArray();


Connection conn;
PreparedStatement ps;
ResultSet rs;

String LedgerName = request.getParameter("LedgerName");
System.out.println(LedgerName);
try{
	%>
		<option></option>
	<%
	
	allProducts dao = new allProducts(DBConnection.getConnection());
	List<Products> list1 = dao.getProductByLedgerName2(LedgerName);
	 for(Products p:list1){
		%>
     <option ><%= p.getMaterialName() %></option>
		<%
	 }

}catch(Throwable e){
	System.out.println("Error while Selection " + e);
}

out.println(list.toJSONString());
out.flush();




%>