<%@page import="java.sql.*"%>
<%
String Firstname=request.getParameter("Firstname");
String Lastname=request.getParameter("Lastname");
String Phone=request.getParameter("Phone");
String Email=request.getParameter("Email");
String Password= request.getParameter("Password");

String BookName=request.getParameter("BookName");
String Cost=request.getParameter("Cost");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","pass@word1");
	Statement st=con.createStatement();
	st.executeUpdate("insert into reg(Firstname,Lastname,Phone,Email,Password) values('"+Firstname+"','"+Lastname+"','"+Phone+"', '"+Email+"','"+Password+"') ");
	response.sendRedirect("save.html");

	
}
catch(Exception e){
	
	System.out.println(e);
	response.sendRedirect("error.html");
}
%>