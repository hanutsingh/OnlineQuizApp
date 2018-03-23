<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
    Class.forName("org.gjt.mm.mysql.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/ExamApp","root","");
    PreparedStatement stmt=con.prepareStatement("Select * from subjects where scode=?");
    stmt.setString(1,request.getParameter("s1"));
    ResultSet rs=stmt.executeQuery();
    int totalq=0,marks=0,duration=0;
    if(rs.next())
    {
        totalq=rs.getInt("questions");
        marks=rs.getInt("marks");
        duration=rs.getInt("duration");
    }
    stmt=con.prepareStatement("Select * from questions where scode=? order by rand() limit ?");
    stmt.setString(1,request.getParameter("s1"));
    stmt.setInt(2,totalq);
    rs=stmt.executeQuery();    
    String[] questions=new String[totalq];
    String[] op1=new String[totalq];
    String[] op2=new String[totalq];
    String[] op3=new String[totalq];
    String[] op4=new String[totalq];
    int[] ans=new int[totalq];
    int[] uans=new int[totalq];
    int i=0;
    while(rs.next())
    {
        questions[i]=rs.getString("questions");
        op1[i]=rs.getString("op1");
        op2[i]=rs.getString("op2");
        op3[i]=rs.getString("op3");
        op4[i]=rs.getString("op4");
        ans[i]=rs.getInt("ans");
        i++;
    }
    session.setAttribute("QUES",questions);
    session.setAttribute("OP1",op1);
    session.setAttribute("OP2",op2);
    session.setAttribute("OP3",op3);
    session.setAttribute("OP4",op4);
    session.setAttribute("ANS",ans);
    session.setAttribute("UANS",uans);
    session.setAttribute("INDEX",-1);
    session.setAttribute("TOTALQ",totalq);
    session.setAttribute("MARKS",marks);
    session.setAttribute("DURATION",duration);
    response.sendRedirect("p3.jsp");
%>