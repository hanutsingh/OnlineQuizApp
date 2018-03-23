<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
    Class.forName("org.gjt.mm.mysql.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/ExamApp","root","");
    String email=request.getParameter("tn");
    PreparedStatement stmt=con.prepareStatement("Select * from teachers where email=?");
    stmt.setString(1,email);
    ResultSet rs=stmt.executeQuery();
    String dept="";
    rs.next();
    dept=rs.getString("department");
    stmt=con.prepareStatement("Select * from subjects where branch=? and scode not in(Select scode from subjectassignment)");
    stmt.setString(1,dept);
    rs=stmt.executeQuery();
    String ans="";
    while(rs.next())
    {
        ans=ans+rs.getString("scode")+"#";
    }
    out.write(ans);
    con.close();
%>