<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String s=session.getAttribute("INDEX").toString();
    int[] uans=(int[])session.getAttribute("UANS");
    int i=Integer.parseInt(s);
    String x=request.getParameter("ans");
    int y=Integer.parseInt(x);
    uans[i]=y;
    session.setAttribute("UANS",uans);
%>
