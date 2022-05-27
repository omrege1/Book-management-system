<%@page import="java.sql.*"%>
<%
int Bookid=Integer.parseInt(request.getParameter("Bookid"));
String BookName=request.getParameter("BookName");
int Cost;
Cost=Integer.parseInt(request.getParameter("Cost"));
int NoOfBooks=Integer.parseInt(request.getParameter("NoOfBooks"));
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","pass@word1");
	Statement st=con.createStatement();
	st.executeUpdate("insert into books(BookName,Cost,NoOfBooks) values('"+BookName+"','"+Cost+"','"+NoOfBooks+"') ");
	st.execute("select * from books");
	response.sendRedirect("save.html");
	
	ResultSet rs=st.executeQuery("select Bookid from books where Bookid=Bookid");
	rs.next();
	int roll=rs.getInt("id");
	String name=rs.getString("name");
	
	System.out.println(roll+ " " + name);
	st.close();
	con.close();
}
catch(Exception e){
	
	System.out.println(e);
	response.sendRedirect("error.html");
}
%>