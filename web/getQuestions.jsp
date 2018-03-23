<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
    Class.forName("org.gjt.mm.mysql.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/ExamApp","root","");
    String scode=request.getParameter("scode");
    PreparedStatement stmt=con.prepareStatement("Select * from questions where scode=?");
    stmt.setString(1,scode);
    ResultSet rs=stmt.executeQuery();
    out.write("<table align=center>");
    while(rs.next())
    {
        String qid=rs.getString(1);
        out.write("<tr>");
        out.write("<td>"+qid+"</td>");
        out.write("<td>"+rs.getString(3)+"</td>");
        out.write("<td>"+rs.getString(4)+"</td>");
        out.write("<td>"+rs.getString(5)+"</td>");
        out.write("<td>"+rs.getString(6)+"</td>");
        out.write("<td>"+rs.getString(7)+"</td>");
        out.write("<td>"+rs.getString(8)+"</td>");
        out.write("<td><a href='questionmgmt.jsp?QID="+qid+"'>Edit</a></td>");
        out.write("</tr>");
    }    
    out.write("</table>");
    con.close();
%>