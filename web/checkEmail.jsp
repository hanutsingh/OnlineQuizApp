<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
    Class.forName("org.gjt.mm.mysql.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/ExamApp","root","");
    PreparedStatement stmt=con.prepareStatement("Select * from Students where email=?");
    stmt.setString(1,request.getParameter("email"));
    ResultSet rs=stmt.executeQuery();
    String ans="N";
    if(rs.next()) ans="Y";
    out.write(ans);
    con.close();
%>