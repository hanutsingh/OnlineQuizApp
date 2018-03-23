<%-- 
    Document   : index
    Created on : Jun 29, 2017, 9:00:12 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
        function validate()
        {
            a1=document.getElementById("t1");
            a2=document.getElementById("t2");
            a3=document.getElementById("t3");
            a4=document.getElementById("t4");
            a5=document.getElementById("t5");
            len=a1.value.length;
            at=a1.value.indexOf("@");
            dot=a1.value.lastIndexOf(".");
            if(len<10 || at<3 || dot<7)
            {
                document.getElementById("d1").innerHTML="<font color=red>*Invalid Email Type!!!</font>";
                a1.focus();
                return false;
            }
            else
            {
                document.getElementById("d1").innerHTML="";                
            }
            if(a2.value.length<8)
            {
                document.getElementById("d2").innerHTML="<font color=red>Min 8 Characters.</font>";
                a2.focus();
                return false;
            }
            else
            {
                document.getElementById("d2").innerHTML="";
            }
            if(a2.value!=a3.value)
            {
                document.getElementById("d3").innerHTML="<font color=red>*Enter Same Password</font>";
                a3.focus();
                return false;
            }
            else
            {
                document.getElementById("d3").innerHTML="";
            }
            if(a4.value.length!=10)
            {
                document.getElementById("d4").innerHTML="<font color=red>*Enter 10 Digits RollNo.</font>";
                a4.focus();
                return false;
            }
            else
            {
                document.getElementById("d4").innerHTML="";
            } 
            if(a5.value.length<4)
            {
                document.getElementById("d5").innerHTML="<font color=red>*</font>";
                a5.focus();
                return false;
            }
            else
            {
                document.getElementById("d5").innerHTML="";
            } 
            return true;
        }
        var xmlhttp;
        function checkEmail()
        {
            xmlhttp=new XMLHttpRequest();
            xmlhttp.onreadystatechange=showStatus;
            s=document.getElementById("t1").value;
            if(s!="")
            {
                xmlhttp.open("GET","checkEmail.jsp?email="+s,true);
                xmlhttp.send(null);
            }
        }
        function showStatus()
        {
            if(xmlhttp.readyState==4 && xmlhttp.status==200)
            {
                reply=xmlhttp.responseText.trim();
                if(reply=="Y")
                {
                    document.getElementById("d1").innerHTML="Email Already Exists";
                    document.getElementById("t1").focus();
                }
                else
                {
                    document.getElementById("d1").innerHTML="";
                }
            }
        }
        </script>
    </head>
    <body>
        <c:if test="${param.b1 ne nil}">
            <s:update dataSource="${con}">
                Insert into Students values(?,?,?,?,?)
                <s:param value="${param.t1}"/>
                <s:param value="${param.t4}"/>
                <s:param value="${param.t6}"/>
                <s:param value="${param.t7}"/>
                <s:param value="${param.t5}"/>
            </s:update>
                <s:update dataSource="${con}">
                    Insert into users values(?,?,'student','D')
                    <s:param value="${param.t1}"/>
                    <s:param value="${param.t2}"/>    
                </s:update>    
                    <c:set var="msg" value="Your Request is accepted.We are forwarding the request to the HOD for verification.After Verification you can login" />    
        </c:if>
        <img src="banner.jpg" width='100%'><hr>
        <br>
        <form method="post">
        <table align='center'>
            <tr>
                <td>Email:</td><td><input type='email' name='t1' id="t1" onBlur="checkEmail()"></td><td><div id="d1"></div></td>
            </tr>
            <tr>
                <td>Password:</td><td><input type='password' name='t2' id="t2"></td><td><div id="d2"></div></td>
            </tr>
            <tr>
                <td>Re-Password:</td><td><input type='password' name='t3' id="t3"></td><td><div id="d3"></div></td>
            </tr>
             <tr>
                <td>Roll No:</td><td><input type='text' name='t4' id="t4"></td><td><div id="d4"></div></td>
            </tr>
             <tr>
                <td>Name:</td><td><input type='text' name='t5' id="t5"></td><td><div id="d5"></div></td>
            </tr>
             <tr>
                 <td>Branch:</td><td><select name='t6'><option value="CS">Computer Science</option><option value="ME">Mechanical</option><option value="CE">Civil</option></select></td><td></td>
            </tr>
             <tr>
                 <td>Semester:</td><td><select name="t7"><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option></select></td><td></td>
            </tr>
            <tr>
                <td></td><td></td><td></td>
            </tr>
            <tr>
                <td></td><td><input type='submit' onClick="return validate()" name='b1' value='Register'></td><td></td>
            </tr>
            <tr>
                <td colspan="3"></td>
            </tr>
        </table></form><br><br>
    <center><font color='red'><c:out value="${msg}" /></font></center>
        <hr><img src="fotter.jpg" width='100%'>
    </body>
</html>
