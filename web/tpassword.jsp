<%-- 
    Document   : teacher
    Created on : Jun 29, 2017, 9:30:49 AM
    Author     : Administrator
--%>

<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<c:if test="${utype ne 'teacher'}">
    <c:redirect url="index.jsp" />
</c:if>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="teacherheader.jsp"/>
        
        
        <hr>
        <hr>
    </body>
</html>
