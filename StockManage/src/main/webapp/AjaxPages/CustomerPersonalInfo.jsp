
<%@page import="java.util.List"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.conn.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%
JSONArray list = new JSONArray();



String CutomerContact = request.getParameter("CutomerContact");

try{
Connection conn = new DBConnection().getConnection();


	String sql = "select CustomerName, CustomerContact, CustomerEmail, CustomerAddress"+
	" from salling_stock where CustomerContact=?";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, CutomerContact);
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		String custName = rs.getString(1);
		String custContact = rs.getString(2);
		String custEmail = rs.getString(3);
		String custAddress = rs.getString(4);
	JSONObject obj = new JSONObject();

	obj.put("custName", custName);
 	obj.put("custContact", custContact);
 	obj.put("custEmail", custEmail);
 	obj.put("custAddress", custAddress);

	list.add(obj);
	}


}catch(Throwable e){
	System.out.println("Error while Selection " + e);
}
out.println(list.toJSONString());
out.flush();





%>