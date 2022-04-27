
<%@page import="java.util.List"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.conn.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%
JSONArray list = new JSONArray();

String LedgerEmail = request.getParameter("LedgerEmail");
System.out.println(LedgerEmail);
try {
	Connection conn = new DBConnection().getConnection();
	String sql = "select * from products where email=?";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, LedgerEmail);
	ResultSet rs = ps.executeQuery();

	while (rs.next()) {
		String BrandName = rs.getString("BrandName");
		String HSNNo = rs.getString("HSNNo");
		String Rate = rs.getString("Rate");
		String Quantity = rs.getString("Quantity");
		String Unit = rs.getString("Unit");
		String Date = rs.getString("Date");
		String Time = rs.getString("Time");
		String TotalAmount = rs.getString("TotalAmount");

		JSONObject obj = new JSONObject();
		obj.put("BrandName", BrandName);
		obj.put("HSNNo", HSNNo);
		obj.put("Rate", Rate);
		obj.put("Quantity", Quantity);
		obj.put("Unit", Unit);
		obj.put("Date", Date);
		obj.put("Time", Time);
		obj.put("TotalAmount", TotalAmount);

		list.add(obj);

	}

} catch (Throwable e) {
	System.out.println("Error while Insertion " + e);
}
out.println(list.toJSONString());
out.flush();
%>