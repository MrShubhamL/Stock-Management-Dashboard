
<%@page import="java.sql.Time"%>
<%@page import="java.util.Date"%>
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

String CutsomerName = request.getParameter("CutsomerName");
try{
conn = new DBConnection().getConnection();
String sql = "select * from salling_stock where CustomerName=?";
ps = conn.prepareStatement(sql);
ps.setString(1, CutsomerName);
rs = ps.executeQuery();

while(rs.next()){

String BrandName = rs.getString("MaterialName");
String HSNNo = rs.getString("HSN");
String Quantity = rs.getString("Quantity");
String TotalAmount = rs.getString("Total");
String Date = rs.getString("Date");
String Time = rs.getString("Time");
String Name = rs.getString("CustomerName");
String Contact = rs.getString("CustomerContact");


JSONObject obj = new JSONObject();
obj.put("MaterialName", BrandName);
obj.put("HSN", HSNNo);
obj.put("Quantity", Quantity);
obj.put("Total", TotalAmount);
obj.put("Date", Date);
obj.put("Time", Time);
obj.put("CustomerName", Name);
obj.put("CustomerContact", Contact);

list.add(obj);

}


}catch(Throwable e){
	System.out.println("Error while Insertion " + e);
}

out.println(list.toJSONString());
out.flush();




%>