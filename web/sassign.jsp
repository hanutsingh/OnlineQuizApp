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
        <script>
            var xmlhttp;
            function getTeachers()
            {
                br=document.getElementById("s1").value;
                xmlhttp=new XMLHttpRequest();
                xmlhttp.onreadystatechange=showTeachers;
                xmlhttp.open("GET","getTeachers.jsp?branch="+br,true);
                xmlhttp.send(null);
            }
            function showTeachers()
            {
                if(xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    result=xmlhttp.responseText;
                    arr=result.split("#");
                    obj1=document.getElementById("s2");
                    obj1.length=0;
                    for(i=0;i<arr.length-1;i=i+2)
                    {
                        opt=document.createElement("option");
                        opt.text=arr[i+1];
                        opt.value=arr[i];
                        obj1.appendChild(opt);
                    }
                }
            }
            function getSubjects()
            {
                t=document.getElementById("s2").value;
                xmlhttp=new XMLHttpRequest();
                xmlhttp.onreadystatechange=showSubjects;
                xmlhttp.open("GET","getSubjects.jsp?tn="+t,true);
                xmlhttp.send(null);
            }
            function showSubjects()
            {
                if(xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    result=xmlhttp.responseText;
                    arr=result.split("#");
                    obj1=document.getElementById("s3");
                    obj1.length=0;
                    for(i=0;i<arr.length-1;i++)
                    {
                        opt=document.createElement("option");
                        opt.text=arr[i];
                        opt.value=arr[i];
                        obj1.appendChild(opt);
                    }
                }
            }
            
        </script>
    </head>
    <body>
        <jsp:include page="hodheader.jsp" />
        <c:if test="${param.b1 ne nil}">
            <s:update dataSource="${con}">
                Insert into subjectassignment values(?,?)
                <s:param value="${param.s3}" />
                <s:param value="${param.s2}" />
            </s:update>
        </c:if>
                <form method="post">
        <table align="center">
            <tr>
                        <td>Branch/Department:</td><td><select id="s1" name="s1" onChange="getTeachers()">
                                <s:query dataSource="${con}" var="rs">
                                    Select distinct department from teachers
                                </s:query>
                                    <option>Select Department</option>    
                                    <c:forEach items="${rs.rows}" var="row">
                                        <option><c:out value="${row.department}" /></option>
                                    </c:forEach>
                    </select></td><td></td>
            </tr>
            <tr>
                <td>Select Teacher:</td><td>
                    <select id="s2" name="s2" onchange="getSubjects()"></select>
                </td><td></td>
            </tr>
             <tr>
                <td>Select Subject:</td><td>
                    <select id="s3" name="s3"></select>
                </td><td></td>
            </tr>
            <tr>
                <td></td><td><input type="submit" name="b1" value="Assign Subject" onclick="javascript:return confirm('Are you sure?');"></td><td></td>
            </tr>
        </table></form>
        <jsp:include page="footer.jsp" />
    </body>
</html>
