# OnlineQuizApp
An Application developed in Java(using JSP,JSTL,AJAX,SQL,HTML,CSS,JavaScript,XML)on Netbeans IDE.

Technology used:-
1) Java SE(Java Core)---------------------------------------->Backend
2) Java EE(JSP,JSTL,Servlet)--------------------------------->Enterprises development
3) SQL ------------------------------------------------------>Database Management
4) GlassFish Server------------------------------------------>Hosting/Server 
5) HTML,CSS,Javascript--------------------------------------->Styling/Designing
6) AJAX,XML-------------------------------------------------->forms

It is based on online quiz/exam websites through which the users can give their exams online instead of pen and paper so to reduce the use of pen and paper during exams.

In this application there are three different types of users-HOD(admin),teachers and students.

1) HOD(admin)->HOD has the full power of controlling everything like teacher's login management[where HOD can do the registerations of teachers in all the departments according to their designation];
student's login management[where HOD can update the status of any students i.e. enable from disable or vice versa];
subjects declaration[where HOD declared all subjects of online quiz/exam according to their departments];
and in subject's assignment[HOD can assign the subjects to any of the registered teacher so that they make question papers according to their details provided by the HOD].

1) Teachers->Teachers registration is only done by HOD according to their designation but not by themselves.
Teachers have the ability to set the questions of their assigned subjects i.e. add/update the questions,its options and its answer(for checking purpose).
and set the exams schedule i.e. set  the starting and ending date of that subjects exam and also see the result of students based on their performances in theirs subjects.

3) Students->Firstly the students have to registered themselves and when their status is updated by the HOD(admin)from disable to enable only then they are eligible to give their online exam after visiting/going to their dashboard.
After going to their dashboard and click on the StartQuiz button theirs quiz/exam begin. 
where they have to select the subject of their department and then click onto the Continue button, 
quiz is starts now the timer is displayed on the top right side of the screen.
where the user has to select one option out of the four and click on the next button by going to the next question
and the previous button,going to the previous question and click on the finish after finish their exam,also theirs exam also ends when their timer display zero.

FOR DATABASE(ExamApp)- contains 7 tables(including----->>>

      (1)-users- stores only ulogin(Email), upassword(password), utype(HOD/Teacher/Student) and status(Enable(E),Disable(D)) that check user's details during their's login ;
 
      (2)-teachers-stores teacher's information(email,department,designation,name,specialization);
 
      (3)-students-stores students's information(email(Students ulogin/ID),rollno,branch,semester,name);
 
      (4)-subjects-stores subject's details(scode(subject's code),sname(subject's name),branch,semester,questions,marks,sdate(exam Starting date),edate(exam Ending date),duration(exam duration in minutes),status);
 
      (5)-subjectassignment-stores the information about the assigned subjects to teachers(scode,temail(Teacher's ulogin/ID));
 
      (6)-questions-stores question's details(QID(questions ID),scode(Subject's code),questions(question inputed/updated/uploaded by teacher during set the question papers),op1(OPTION1),op2(OPTION2),op3(OPTION3),op4(OPTION4),ans(the correct answer of that question));
 
      (7)-results-stores student's results(examid,email(student's ulogin/ID),scode(subject's code),name,examdate,mmarks(minimum marks to pass that exam),marks(the total marks he/she get in the exam)); )
 
  
#index.jsp- requires user's information like userId and password, and if both fields are correctly inputed by user then a session is created for that user and that session is not end until user commit logout(logout.jsp) from his account;

#register.jsp- requires students information like email,password,roll_no,name,branch,semester;

#checkEmail.jsp- it check the emails during registration in the database(users) so that no two users have same email address; 

#tloginmgmt.jsp- do the registerations of teachers from the "getTeachers.jsp" in all the departments according to their designations;  
 
 #sloginmgmt.jsp- update the status of any students i.e. enable from disable or vice versa;
 
 #subjects.jsp- declares all subjects of online quiz/exam according to their departments;
 
 #sassign.jsp- assign the subjects to any of the registered teacher from the "getTeachers.jsp" so that they make question papers according to their details provided by the HOD;

 #questionmgmt.jsp- set the questions of their assigned subjects i.e. add/update the questions,its options and its answer(for checking purpose);
 
 #getSubjects.jsp- display the details of that particular selected subject;
 
 #getQuestions.jsp- display the list of uploaded questions of selected subject; 
 
 #examschedule.jsp- set the starting and ending date of exam of that subject;
 
 #setAnswer.jsp- stores the selected option out of four i.e. answer selected by student;
 
 #p1.jsp- here student can select his/her subject to give his/her online quiz/exam;
 
 #p2.jsp- pick the questions during quiz/exam for students of selected subject in the random order and redirect it onto "p3.jsp"; 
 
 #p3.jsp- display the result of p2.jsp i.e. display the questions during quiz/exam for students of selected subject in the random order;
 
 
 
 
 
 
 
 
 
