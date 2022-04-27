
<%@page import="java.util.List"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.conn.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%
JSONArray list = new JSONArray();



String LedgerName = request.getParameter("LedgerName");

try{
Connection conn = new DBConnection().getConnection();


	String sql = "select Name,Contact,Email,LedgerId from ledger_info where Name=?";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, LedgerName);
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		String name = rs.getString(1);
		String contact = rs.getString(2);
		String email = rs.getString(3);
		String rigId = rs.getString(4);
	JSONObject obj = new JSONObject();

 	obj.put("ledgerName", name);
	obj.put("ledgerContact", contact);
	obj.put("ledgerEmail", email);
	obj.put("ledgerRegId", rigId);

	list.add(obj);
	}


}catch(Throwable e){
	System.out.println("Error while Selection " + e);
}
out.println(list.toJSONString());
out.flush();





%>