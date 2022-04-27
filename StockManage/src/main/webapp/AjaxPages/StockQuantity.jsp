
<%@page import="java.util.List"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.conn.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%
JSONArray list = new JSONArray();



String MaterialName = request.getParameter("MaterialName");

try{
Connection conn = new DBConnection().getConnection();


	String sql = "select Quantity from stock where MaterialName=?";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, MaterialName);
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		String qty = rs.getString(1);
		
		System.out.println(qty);
	JSONObject obj = new JSONObject();

	obj.put("qty", qty);

	list.add(obj);
	}


}catch(Throwable e){
	System.out.println("Error while Selection " + e);
}
out.println(list.toJSONString());
out.flush();





%>