<%
    String[] questions=(String[])session.getAttribute("QUES");
    String[] op1=(String[])session.getAttribute("OP1");
    String[] op2=(String[])session.getAttribute("OP2");
    String[] op3=(String[])session.getAttribute("OP3");
    String[] op4=(String[])session.getAttribute("OP4");
    int[] uans=(int[])session.getAttribute("UANS");
    String s=session.getAttribute("INDEX").toString();
    int index=Integer.parseInt(s);
    String x=request.getParameter("x");
    if(x.equals("P")) index--;
    if(x.equals("N")) index++;
    if(index<0) index=0;
    if(index>=questions.length) index=questions.length-1;
    session.setAttribute("INDEX",index);
    String reply="";
    reply=questions[index]+"#";
    reply+=op1[index]+"#";
    reply+=op2[index]+"#";
    reply+=op3[index]+"#";
    reply+=op4[index]+"#";
    reply+=uans[index];
    out.write(reply);
%>