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
                Insert into subjects values(?,?,?,?,?,?,?,?,?,?)
                <s:param value="${param.t1}" />
                <s:param value="${param.t2}" />
                <s:param value="${param.t3}" />
                <s:param value="${param.t4}" />
                <s:param value="${param.t5}" />
                <s:param value="${param.t6}" />
                <s:param value="${param.t7}" />
                <s:param value="${param.t8}" />
                <s:param value="${param.t9}" />
                <s:param value="${param.t10}" />
            </s:update>                
        </c:if>
        <form method="post">
        <table align="center">
            <tr>
                <td>Subject Code:</td><td><input type="text" name="t1" id="t1"></td><td></td>
            </tr>
            <tr>
                <td>Subject Name:</td><td><input type="text" name="t2" id="t2"></td><td></td>
            </tr>
            <tr>
                <td>Branch:</td><td>
                    <select name='t3' id="t3"><option value="CS">Computer Science</option><option value="ME">Mechanical</option><option value="CE">Civil</option></select>
                </td><td></td>
            </tr>
            <tr>
                <td>Semester:</td><td>
                    <select name='t4' id="t4"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option></select>
                </td><td></td>
            </tr>
            <tr>
                <td>Total Questions:</td><td><input type="text" name="t5" id="t5"></td><td></td>
            </tr>
            <tr>
                <td>Total Marks:</td><td><input type="text" name="t6" id="t6"></td><td></td>
            </tr>
            <tr>
                <td>Start Date:</td><td><input type="date" name="t7" id="t7"></td><td></td>
            </tr>
            <tr>
                <td>End Date:</td><td><input type="date" name="t8" id="t8"></td><td></td>
            </tr>
            <tr>
                <td>Duration:</td><td><input type="text" name="t9" id="t9"></td><td>(in Minutes)</td>
            </tr>
            <tr>
                <td>Status:</td><td><input type="radio" name="t10" id="t10" value='E'>Enable <input type="radio" name="t10" id="t11" value='D'>Disable</td><td></td>
            </tr>
            <tr>
                <td></td><td><input type="submit" name="b1" value="Save"></td><td></td>
            </tr>
        </table></form>
        <hr>
        
        <table align="center">
            <tr>
                <th>Subject Code</th>
                <th>Name</th>
                <th>Branch</th>
                <th>Semester</th>
                <th>Questions</th>
                <th>Marks</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Duration</th>
                <th>Status</th>
            </tr>
            <s:query dataSource="${con}" var="rs">
                Select * from Subjects
            </s:query>
            <c:forEach items="${rs.rows}" var="row">
                <tr>
                    <td><c:out value="${row.scode}" /></td>
                    <td><c:out value="${row.sname}" /></td>
                    <td><c:out value="${row.branch}" /></td>
                    <td><c:out value="${row.semester}" /></td>
                    <td><c:out value="${row.questions}" /></td>
                    <td><c:out value="${row.marks}" /></td>
                    <td><c:out value="${row.sdate}" /></td>
                    <td><c:out value="${row.edate}" /></td>
                    <td><c:out value="${row.duration}" /></td>
                    <td><c:out value="${row.status}" /></td>
                </tr>
            </c:forEach>   
        </table>
        <jsp:include page="footer.jsp" />
    </body>
</html>
