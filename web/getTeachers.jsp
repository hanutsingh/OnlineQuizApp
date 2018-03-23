<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
    Class.forName("org.gjt.mm.mysql.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/ExamApp","root","");
    PreparedStatement stmt=con.prepareStatement("Select * from teachers where department=?");
    stmt.setString(1,request.getParameter("branch"));
    ResultSet rs=stmt.executeQuery();
    String ans="";
    while(rs.next())
    {
        ans=ans+rs.getString("email")+"#";
        ans=ans+rs.getString("name")+"#";
    }
    out.write(ans);
    con.close();
%>