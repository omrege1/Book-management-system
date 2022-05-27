<%@page import="java.sql.*"%>
<%
int Bookid=Integer.parseInt(request.getParameter("Bookid"));
int NoOfBooks=Integer.parseInt(request.getParameter("NoOfBooks"));
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","pass@word1");
	Statement st=con.createStatement();
	st.executeUpdate("UPDATE books SET NoOfBooks=NoOfBooks+1 where Bookid=Bookid");
	response.sendRedirect("save.html");
}
catch(Exception e){
	
	System.out.println(e);
	response.sendRedirect("error.html");
}
%>