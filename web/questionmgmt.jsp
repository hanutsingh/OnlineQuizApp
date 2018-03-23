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
        <script>
            var xmlhttp;
            function getSubjectDetails()
            {
                s=document.getElementById("s1").value;
                xmlhttp=new XMLHttpRequest();
                xmlhttp.onreadystatechange=showDetails;
                xmlhttp.open("GET","getSubjectDetails.jsp?scode="+s,true);
                xmlhttp.send(null);
            }
            function showDetails()
            {
                if(xmlhttp.status==200 && xmlhttp.readyState==4)
                {
                    reply=xmlhttp.responseText.trim();
                    arr=reply.split("#");
                    document.getElementById("d1").innerHTML=arr[0];
                    document.getElementById("d2").innerHTML=arr[1];
                    document.getElementById("d3").innerHTML=arr[2];
                    document.getElementById("d4").innerHTML=arr[3];
                    document.getElementById("d5").innerHTML=arr[4];
                    getQuestions();
                }
            }
            function getQuestions()
            {
                s=document.getElementById("s1").value;
                xmlhttp=new XMLHttpRequest();
                xmlhttp.onreadystatechange=showQuestions;
                xmlhttp.open("GET","getQuestions.jsp?scode="+s,true);
                xmlhttp.send(null);
            }
            function showQuestions()
            {
                if(xmlhttp.status==200 && xmlhttp.readyState==4)
                {
                    reply=xmlhttp.responseText.trim();
                    document.getElementById("questions").innerHTML=reply;
                }
            }
        </script>
    </head>
    <body>
        <jsp:include page="teacherheader.jsp"/>
        <table align="center">
            <tr>
                <td>Subject:</td><td>
                    <select id="s1" name="s1" onchange="getSubjectDetails()">
                        <option>Select Subject</option>
                        <s:query dataSource="${con}" var="rs">
                            Select * from subjectassignment where temail=?
                            <s:param value="${email}" />
                        </s:query>
                            <c:forEach items="${rs.rows}" var="row">
                                <option><c:out value="${row.scode}" /></option>
                            </c:forEach>    
                    </select>
                </td><td></td><td></td>
            </tr>
            <tr>
                <td>Subject Name:</td><td><div id="d1"></div></td><td></td><td></td>
            </tr>
            <tr>
                <td>Total Questions:</td><td><div id="d2"></div></td><td></td><td></td>
            </tr>
            <tr>
                <td>Marks:</td><td><div id="d3"></div></td><td></td><td></td>
            </tr>
            <tr>
                <td>Duration:</td><td><div id="d4"></div></td><td></td><td></td>
            </tr>
            <tr>
                <td><b>Questions Available:</b></td><td><div id="d5"></div></td><td></td><td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
        </table> 
        <hr>
        <table align="center">
            <tr>
                <td>Question:</td><td><textarea style="width:500px"></textarea></td><td></td>
            </tr>
            <tr>
                <td>Option 1:</td><td><input type="text"  style="width:500px"></td><td></td>
            </tr>
            <tr>
                <td>Option 2:</td><td><input type="text"  style="width:500px"></td><td></td>
            </tr>
            <tr>
                <td>Option 3:</td><td><input type="text"  style="width:500px"></td><td></td>
            </tr>
            <tr>
                <td>Option 4:</td><td><input type="text"  style="width:500px"></td><td></td>
            </tr>
            <tr>
                <td>Answer</td><td><input type="radio" value="1" name="r1"> 1 <input type="radio" value="2" name="r1"> 2 <input type="radio" value="3" name="r1"> 3 <input type="radio" value="4" name="r1"> 4</td><td></td>
            </tr>
            <tr>
                <td></td><td><input type="submit" name="b1" value="Save"> <input type="submit" name="b1" value="Update"></td><td></td>
            </tr>
        </table>
        <hr>
        <div id="questions"></div>
        <hr>
        <hr>
    </body>
</html>
