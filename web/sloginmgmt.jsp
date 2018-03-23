<%-- 
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
            Update users set status=? where ulogin=?
            <s:param value="${param.tt1}" />
            <s:param value="${param.t1}" />
            </s:update>
        </c:if>
        <c:if test="${param.email ne nil}">
            <s:query var="rs" dataSource="${con}">
                Select Students.*,status from Students,users where email=? and Students.email=Users.ulogin
                <s:param value="${param.email}"/>
            </s:query>                
        </c:if>
        <form method="post">
            <c:set var="st1" value="" />
            <c:if test="${rs.rows[0].status ne nil and rs.rows[0].status eq 'D'}">
                <c:set var="st1" value="checked" />
            </c:if>
            <c:set var="st2" value="" />
            <c:if test="${rs.rows[0].status ne nil and rs.rows[0].status eq 'E'}">
                <c:set var="st2" value="checked" />
            </c:if>
        <table align="center">
            <tr>
                <td>Email:</td><td><c:out value="${rs.rows[0].email}" /><input type='hidden' value='<c:out value="${rs.rows[0].email}" />' name='t1'></td><td></td>
            </tr>
            <tr>
                <td>Roll No:</td><td><c:out value="${rs.rows[0].rollno}" /></td><td></td>
            </tr>
            <tr>
                <td>Name:</td><td><c:out value="${rs.rows[0].name}" /></td><td></td>
            </tr>
            <tr>
                <td>Branch:</td><td><c:out value="${rs.rows[0].branch}" /></td><td></td>
            </tr>
            <tr>
                <td>Semester:</td><td><c:out value="${rs.rows[0].semester}" /></td><td></td>
            </tr>
            <tr>
                <td>Status:</td><td><input type='radio' name='tt1' value='E' <c:out value="${st2}"/>>Enable <input type='radio' name='tt1' value='D' <c:out value="${st1}"/>>Disable</td><td></td>
            </tr>
            <tr>
                <td></td><td><input type="submit" name="b1" value="Save"></td><td></td>
            </tr>
        </table></form>
        <hr>
        
        <table align="center">
            <tr>
                <th>Email</th>
                <th>Roll No</th>
                <th>Name</th>
                <th>Branch</th>
                <th>Semester</th>
                <th>Status</th>
                <th></th>
            </tr>
            <s:query dataSource="${con}" var="rs">
                Select Students.*,Users.status from Students,Users where Students.email=Users.ulogin
            </s:query>
            <c:forEach items="${rs.rows}" var="row">
                <tr>
                    <td><c:out value="${row.email}" /></td>
                    <td><c:out value="${row.rollno}" /></td>
                    <td><c:out value="${row.name}" /></td>
                    <td><c:out value="${row.branch}" /></td>
                    <td><c:out value="${row.semester}" /></td>
                    <td><c:out value="${row.status}" /></td>
                    <td><a href='sloginmgmt.jsp?email=<c:out value="${row.email}" />'>Update Status</a></td>
                </tr>
            </c:forEach>   
        </table>
        <jsp:include page="footer.jsp" />
    </body>
</html>
