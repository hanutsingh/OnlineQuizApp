.]<%-- 
    Document   : hod
    Created on : Jun 29, 2017, 9:30:35 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<c:if test="${utype ne 'hod'}">
    <c:redirect url="index.jsp" />
</c:if>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="hodheader.jsp" />
        <c:if test="${param.b1 ne nil}">
            <s:update dataSource="${con}">
                Insert into Teachers values(?,?,?,?,?)
                <s:param value="${param.t1}" />
                <s:param value="${param.t3}" />
                <s:param value="${param.t4}" />
                <s:param value="${param.t2}" />
                <s:param value="${param.t5}" />
            </s:update>
                <s:update dataSource="${con}">
                    Insert into users values(?,?,'teacher','E')
                    <s:param value="${param.t1}" />
                    <s:param value="${param.t21}" />
                </s:update>    
        </c:if>
        <form method="post">
        <table align="center">
            <tr>
                <td>Email:</td><td><input type="email" name="t1" id="t1"></td><td></td>
            </tr>
             <tr>
                <td>Password:</td><td><input type="password" name="t21" id="t21"></td><td></td>
            </tr>
            <tr>
                <td>Name:</td><td><input type="text" name="t2" id="t2"></td><td></td>
            </tr>
            <tr>
                <td>Department:</td><td>
                    <select name='t3' id="t3"><option value="CS">Computer Science</option><option value="ME">Mechanical</option><option value="CE">Civil</option></select>
                </td><td></td>
            </tr>
            <tr>
                <td>Designation:</td><td><input type="text" name="t4" id="t4"></td><td></td>
            </tr>
            <tr>
                <td>Specialization:</td><td><input type="text" name="t5" id="t5"></td><td></td>
            </tr>
            <tr>
                <td></td><td><input type="submit" name="b1" value="Save"></td><td></td>
            </tr>
        </table></form>
        <hr>
        
        <table align="center">
            <tr>
                <th>Email</th>
                <th>Name</th>
                <th>Department</th>
                <th>Designation</th>
                <th>Specialization</th>
            </tr>
            <s:query dataSource="${con}" var="rs">
                Select * from Teachers 
            </s:query>
            <c:forEach items="${rs.rows}" var="row">
                <tr>
                    <td><c:out value="${row.email}" /></td>
                    <td><c:out value="${row.name}" /></td>
                    <td><c:out value="${row.department}" /></td>
                    <td><c:out value="${row.designation}" /></td>
                    <td><c:out value="${row.specialization}" /></td>
                </tr>
            </c:forEach>   
        </table>
        <jsp:include page="footer.jsp" />
    </body>
</html>
