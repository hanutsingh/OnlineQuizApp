<%-- 
    Document   : p1
    Created on : Jul 2, 2017, 9:26:05 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <s:setDataSource driver="org.gjt.mm.mysql.Driver" url="jdbc:mysql://127.0.0.1/ExamApp" user="root" password="" var="con" scope="session" />
        <br>
        <br>
        <br>
        <br>
        <form method="post" action="p2.jsp">
        <table align="center">
            <tr>
                <td>Exam Subject:</td><td>
                    <select id="s1" name="s1">
                        <option>Select Subject</option>
                        <s:query dataSource="${con}" var="rs">
                            Select * from subjects
                        </s:query>
                            <c:forEach var="row" items="${rs.rows}">
                                <option><c:out value="${row.scode}" /></option>
                            </c:forEach>                            
                    </select>
                </td>
            </tr>
            <tr>
                <td></td><td><input type="submit" name="b1" value="Continue"></td>
            </tr>
        </table></form>
    </body>
</html>
