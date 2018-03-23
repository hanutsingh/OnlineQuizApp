<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
    Class.forName("org.gjt.mm.mysql.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/ExamApp","root","");
    String scode=request.getParameter("scode");
    PreparedStatement stmt=con.prepareStatement("Select * from subjects where scode=?");
    stmt.setString(1,scode);
    ResultSet rs=stmt.executeQuery();
    String ans="";
    if(rs.next())
    {
        ans=ans+rs.getString("sname")+"#";
        ans=ans+rs.getString("questions")+"#";
        ans=ans+rs.getString("marks")+"#";
        ans=ans+rs.getString("duration")+"#";        
    }
    stmt=con.prepareStatement("Select count(*) from questions where scode=?");
    stmt.setString(1,scode);
    rs=stmt.executeQuery();
    if(rs.next())
    {
        ans=ans+rs.getString(1);        
    }
    out.write(ans);
    con.close();
%>