<%-- 
    Document   : p3
    Created on : Jul 2, 2017, 9:26:32 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            var xmlhttp;
            function getQuestion(f)
            {
                xmlhttp=new XMLHttpRequest();
                xmlhttp.onreadystatechange=showQuestion;
                xmlhttp.open("GET","getQuestion.jsp?x="+f,true);
                xmlhttp.send(null);
            }
            function showQuestion()
            {
                if(xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    ans=xmlhttp.responseText.trim();
                    arr=ans.split("#");
                    document.getElementById("question").innerText=arr[0];
                    document.getElementById("op1").innerText=arr[1];
                    document.getElementById("op2").innerText=arr[2];
                    document.getElementById("op3").innerText=arr[3];
                    document.getElementById("op4").innerText=arr[4];
                    document.getElementById("r1").checked=false;
                    document.getElementById("r2").checked=false;
                    document.getElementById("r3").checked=false;
                    document.getElementById("r4").checked=false;
                    if(arr[5]=="1") document.getElementById("r1").checked=true;
                    if(arr[5]=="2") document.getElementById("r2").checked=true;
                    if(arr[5]=="3") document.getElementById("r3").checked=true;
                    if(arr[5]=="4") document.getElementById("r4").checked=true;                        
                }
            }
            function setAnswer(m)
            {
                xmlhttp=new XMLHttpRequest();
                xmlhttp.open("POST","setAnswer.jsp?ans="+m.value,true);
                xmlhttp.send(null);
            }
            <%
                String s=session.getAttribute("DURATION").toString();
                int x=Integer.parseInt(s);
                x=x*60;
                out.write("var time="+x);
            %>
            function startTimer()
            {
                setInterval("showTimer()",1000);
            }
            function showTimer()
            {
                time--;
                m=Math.floor(time/60);
                s=time%60;
                if(time>30)
                {
                    document.getElementById("time").innerHTML=m+":"+s;
                }
                if(time<30 && time>0)
                {
                    document.getElementById("time").innerHTML="<font color='red'>"+m+":"+s+"</font>";
                }
                if(time==0)
                {
                    window.open("finish.jsp","_self");
                }
            }
            startTimer();
        </script>
    </head>
    <body onload="getQuestion('N')">
        <br><br>        
        <hr>
        <table align="center" width="700px" border="0">
            <tr>
                <td></td><td></td><td>Time:</td><td><div id="time">00:00</div></td>
            </tr>
            <tr>
                <td></td><td></td><td></td><td></td>
            </tr>
            <tr style="height:50px">
                <td>Q)</td><td><div id="question" style="width:500px"></div></td><td></td><td></td>
            </tr>
            <tr>
                <td>1)<input type="radio" name="r1" id="r1" value="1" onClick="setAnswer(this)"></td><td><div id="op1" style="width:500px"></div></td><td></td><td></td>
            </tr>
            <tr>
                <td>2)<input type="radio" name="r1" id="r2" value="2" onClick="setAnswer(this)"></td><td><div id="op2" style="width:500px"></div></td><td></td><td></td>
            </tr>
            <tr>
                <td>3)<input type="radio" name="r1" id="r3" value="3" onClick="setAnswer(this)"></td><td><div id="op3" style="width:500px"></div></td><td></td><td></td>
            </tr>
            <tr>
                <td>4)<input type="radio" name="r1" id="r4" value="4" onClick="setAnswer(this)"></td><td><div id="op4" style="width:500px"></div></td><td></td><td></td>
            </tr>
            <tr>
                <td></td><td></td><td></td><td></td>
            </tr>
            <tr>
                <td></td><td><input type="button" name="b1" value="Previous" onclick="getQuestion('P')"> <input type="button" name="b2" value="Next" onclick="getQuestion('N')"></td><td><input type="button" name="b3" value="Finish" onClcik="javascript:window.open('finish.jsp','_self');"></td><td></td>
            </tr>
            <tr>
                <td></td><td></td><td></td><td></td>
            </tr>
        </table>
        <hr>
    </body>
</html>
