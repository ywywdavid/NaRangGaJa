<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="qna.service.QnaService"%>
<%@page import="customer.service.CustomerService"%>
<%@page import="guide.service.GuideService"%>
<%@page import="util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@400&display=swap" rel="stylesheet">

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css?ver=123" rel="stylesheet" />

<style>
body {
   background: #F2F2F2;
   margin: 0px 150px;
}

.blueone {
  border-collapse: collapse;
}  
.blueone th {
  padding: 10px;
  color: #CC9966;
  border-bottom: 3px solid #CC9966;
  text-align: left;
}
.blueone td {
  color: #669;
  padding: 10px;
  border-bottom: 1px solid #ddd;
}
.blueone tr:hover td {
  color: #004;
}


#join {
   width: 100px;
   color: 000000;
   border-color: white;
   background-color: white;
   font-size: 1.0em;
}

.infor {
   height: 500px;
   text-align: center;
   margin: 50px 0px 20px 150px;
   background-color: white;
   box-sizing: border-box;
   border-radius: 20px;
   width: 80%;
   float: left;
   padding-bottom: 30px;
   color: black;
}

.login {
   background: #FFFFFF;
   border: 1px solid;
   height: 100px;
   border-radius: 20px;
   border-color: #CC9966;
   font-size: 15px;
   text-align: right;
   z-index: 1;
}

.sidebar{
   position: fixed;
   top: 250px;
   left: 50px;
   padding: 20px;
   width: 170px;
   font-size: 15px;
   text-align:right;
   background-color:white;
   border-bottom: 0.25rem solid #64a19d;
   border-radius: 0.25rem;
}

.news {
   text-align: center;
   font-size: 15px;
   z-index: 1;
   border: 1px solid;
   border-color: #cccccc;
}

.Brandimage {
   width: 100%;
   height: 180px;
   float: left;
   margin-left: 650px;
}

.backimage {
   background-image: url('image/back.png');
   background-repeat: no-repeat;
   background-size: cover;
}

section {
   width: 100%;
   height: 100%;
   border: none;
}

#image{
   float: left;
}

#infor{
   float: right;
   margin-top:20px;
   
}

article {
   width: 85%;
   height: 100%;
   border: solid 1px #cccccc;
   margin: 0 auto;
   text-align: left;
   margin-top:30px;
}

article #box {
   width: 90%;
   margin: 10px 0px 90px 50px;
   border: none;
   border: solid 1px #cccccc;
}

.Thema {
   width: 24%;
   border: 0px;
   margin: 0px;
}

.clear {
   clear: both;
}

footer {
   border: 1px solid;
   border-color: #cccccc;
   padding: 10px;
   padding-right: 50px;
   color: black;
   text-align: right;
   font-size: 12px;
}

ul {
   list-style-type: none;
}

ul li {
   display: inline;
   text-align: right;
}

ul li a {
   color: black;
   font-family: 굴림;
   text-decoration: none;
}

.news ul li a {
   color: #848484;
}

input[type="text"] {
   width: 200px;
   height: 40px;
}

input[type="submit"] {
   height: 45px;
   background-color: orange;
   border-radius: 5px;
   border-color: white;
   color: white;
   border: none;
   padding-left: 10px;
   padding-right: 10px;
   margin-left: 5px;
}

input[type="button"] {
   height: 45px;
   background-color: orange;
   border-radius: 5px;
   border-color: white;
   color: white;
   border: none;
   padding-left: 10px;
   padding-right: 10px;
   margin-left: 5px;
}

.contents {
   border: 3px solid black;
   margin: 20px auto;
   margin-top: 50px;
   text-align: center;
   width: 80%;
   height: 400px;
}

h3 {
   text-align: center;
   font-weight: lighter;
}

h1 {
   font-family: '바탕';
   padding-top: 50px;
   text-align: center;
}

#ub {
   width: 100px;
   height: 50px;
   background-color: #819FF7;
   float: right;
   margin-right: 350px;
   margin-top: 20px;
   border-radius: 5px;
   border-color: white;
   color: white;
   border: none;
}

select {
   -moz-appearance: none;
   -webkit-appearance: none;
   appearance: none;
   font-family: "Noto Sansf KR", sans-serif;
     line-height: 2.0;
     background-color: #fff;
     padding: 0.6em 1.4em 0.5em 0.8em;
     margin: 0;
     border: 1px solid #aaa;
     border-radius: 0.5em;
     box-shadow: 0 1px 0 1px rgba(0, 0, 0, 0.04);
     text-align:center;
}

</style>
</head>
<body>
<%
String id = (String)session.getAttribute("id");
String type = (String)session.getAttribute("type");

   if(id.equals("관리자") && type.equals("auth")){
%>
       <nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp">나랑 가자</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                    <form action="searchingResult.jsp" id="search" style="display:none;">
                  <li>
                  <select name="search_type" style="float: left; margin-top:15px; padding:10px; line-height: 1.2;">
                     <option value="course">제목</option>
                     <option value="name">닉네임</option>
                     <option value="id">아이디</option>
                  </select>
                  </li>
                  <li style="float: left;"><input type="text" name="search_word" value="" 
                  style="margin-top:15px; width: 400px; height: 40px; border-color: #CC9966;"></li>
                  <li style="float: left; margin-top:12px;"><input type="submit" value="검색"></li>
               </form>
                        <li class="nav-item"><a class="nav-link" href="logoutProc.jsp">로그아웃</a></li>
                        <li class="nav-item"><a class="nav-link" href="viewmemberform.jsp">회원 관리</a></li>
                        <li class="nav-item"><a class="nav-link" href="viewcoursesform.jsp">코스 관리</a></li>
                        <li class="nav-item"><a class="nav-link" href="FAQform.jsp">Q n A 관리</a></li>
                    </ul>
                </div>
            </div>
        </nav>
   
   <div class="clear" style="margin-top:100px;"></div>
   
   <%
      String title = request.getParameter("title");
      int num = 0;
      int checked = 0;
   
      QnaService service = QnaService.getInstance();
      ResultSet rs = service.qnabytitle(title);
      
      while (rs.next()){
         checked = Integer.parseInt(rs.getString(6));
         num = Integer.parseInt(rs.getString(1));
         if(checked == 0){
   %>
   
   <article style="margin-bottom:50px;">
   <article id="box">
   <form action="writeAform.jsp">
   <table style="margin-left:200px; line-height:50px;">
      <tr>
         <th width="10%">번호</th>
         <td><a><%=rs.getInt(1)%></a></td>
         <input type="hidden" name="num" value="<%=rs.getInt(1)%>">
      </tr>
      <tr>
         <th>제목</th>
         <td>
            <input type="text" name="title" style="width: 800px; margin:10px 10px;" value="<%=rs.getString(4)%>" readonly>
         </td>
      </tr>
      <%
      if(rs.getString(3) == null)
      {
      %>
      <tr>
         <th>아이디</th>
         <td>
            <a><%=rs.getString(2)%></a>
            <input type="hidden" name="id" value="<%=rs.getString(2)%>">
         </td>
      </tr>
      <tr>
         <th>타입 </th>
         <td>
            <a>customer</a>
            <input type="hidden" name="type" value="customer">
         </td>
      </tr>
      <%
      } else {
         
      %>
      <tr>
         <th>아이디:</th>
         <td>
            <a><%=rs.getString(3)%></a>
            <input type="hidden" name="id" value="<%=rs.getString(3)%>">
         </td>
      </tr>
      <tr>
         <th>타입:</th>
         <td>
            <a>guide</a>
            <input type="hidden" name="type" value="guide">
         </td>
      </tr>
      <%
      }
      %>
      <tr>
         <th>내용</th>
         <td>
            <input type="text" name="detail" style="width: 800px; height:150px; margin:10px 10px;" value="<%=rs.getString(5)%>" readonly>
         </td>
      </tr>
   </table>
   <input type="submit" value="답변" style="float:right; margin-top:25px;">
   <input type="button" value="목록" style="float:right; margin-top:25px;" onclick="location.href='FAQform.jsp'">
   </form>
   </article>
   </article>
      <%
         }//처리대기중일 경우
         else if(checked == 1){
      %>
      <article style="margin-bottom:50px;">
   <article id="box">
   <form action="commitFAQ.do">
   <table style="margin-left:200px; line-height:50px;">
      <tr>
         <th width="10%">번호</th>
         <td><a><%=rs.getInt(1)%></a></td>
         <input type="hidden" name="num" value="<%=rs.getInt(1)%>">
      </tr>
      <tr>
         <th>제목</th>
         <td>
            <input type="text" name="title" style="width: 800px; margin:10px 10px;" value="<%=rs.getString(4)%>" readonly>
         </td>
      </tr>
      <%
      if(rs.getString(3) == null)
      {
      %>
      <tr>
         <th>아이디</th>
         <td>
            <a><%=rs.getString(2)%></a>
         </td>
      </tr>
      <tr>
         <th>타입 </th>
         <td>
            <a>customer</a>
         </td>
      </tr>
      <%
      } else {
         
      %>
      <tr>
         <th>아이디:</th>
         <td>
            <a><%=rs.getString(3)%></a>
         </td>
      </tr>
      <tr>
         <th>타입:</th>
         <td>
            <a>guide</a>
         </td>
      </tr>
      <%
      }
      %>
      <tr>
         <th>내용</th>
         <td>
            <input type="text" name="detail" style="width: 800px; height:150px; margin:10px 10px;" value="<%=rs.getString(5)%>" readonly>
         </td>
      </tr>
   </table>
   <input type="submit" value="게시" style="float:right; margin-top:25px;">
   <input type="button" value="목록" style="float:right; margin-top:25px;" onclick="location.href='FAQform.jsp'">
   </form>
   </article>
      <%
      ResultSet rs1 = service.selectAnswer(num);
      while(rs1.next()){
%>
<article id="box" style="margin-bottom:50px;">
<table style="margin-left:200px; line-height:50px;">
<tr>
      <th width="10%">답변</th>
      <td>
         <textarea style="width: 800px; height:200px; margin:10px 10px;" readonly><%=rs1.getString(1)%></textarea>
      </td>
   </tr>
</table>
</article>
</article>
   <%
      }
      rs1.close();
         }//답변완료일 경우
      }
      rs.close();   
   } else if(id !=null && type.equals("customer")){
      
      CustomerService service = CustomerService.getInstance();
      ResultSet rs = service.SelectName(id);
      
      while (rs.next()) {
         String name = rs.getString(1);
         session.setAttribute("name", name);
         %>
      <nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp">나랑 가자</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                    <form action="searchingResult.jsp" id="search" style="display:block;">
                  <li>
                  <select name="search_type" style="float: left; margin-top:15px; padding:10px; line-height: 1.2;">
                     <option value="course">제목</option>
                     <option value="name">닉네임</option>
                     <option value="id">아이디</option>
                  </select>
                  </li>
                  <li style="float: left;"><input type="text" name="search_word" value="" 
                  style="margin-top:15px; width: 400px; height: 40px; border-color: #CC9966;"></li>
                  <li style="float: left; margin-top:12px;"><input type="submit" id="searching" value="검색"></li>
               </form>
                        <li class="nav-item"><a class="nav-link" href="logoutProc.jsp">로그아웃</a></li>
                        <li class="nav-item"><a class="nav-link" href="myinfor.jsp">내 정보</a></li>
                        <li class="nav-item"><a class="nav-link" href="FAQform.jsp">Q n A</a></li>
                    </ul>
                </div>
            </div>
        </nav>
      
      <div class="sidebar">
         <ul style="line-height:200%">
         <li><a href="customercourseform.jsp">코스예약하기</a></li>
         <li><a href="matchingQnA.jsp"> 코스매칭하기</a></li>
         <li><a href="receivetextform.jsp">쪽지확인하기</a></li>
         <li><a href="mypage.jsp"> 내 페이지</a></li>
         </ul>
      </div>
      <%
         }
      rs.close();
   } else if(id !=null && type.equals("guide")){
      GuideService service = GuideService.getInstance();
      ResultSet rs = service.SelectName(id);
      
      while (rs.next()) {
         String name = rs.getString(1);
         session.setAttribute("name", name);
%>
   <nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp">나랑 가자</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                    <form action="searchingResult.jsp" id="search" style="display:block;">
                  <li>
                  <select name="search_type" style="float: left; margin-top:15px; padding:10px; line-height: 1.2;">
                     <option value="course">제목</option>
                     <option value="name">닉네임</option>
                     <option value="id">아이디</option>
                  </select>
                  </li>
                  <li style="float: left;"><input type="text" name="search_word" value="" 
                  style="margin-top:15px; width: 400px; height: 40px; border-color: #CC9966;"></li>
                  <li style="float: left; margin-top:12px;"><input type="submit" id="searching" value="검색"></li>
               </form>
                        <li class="nav-item"><a class="nav-link" href="logoutProc.jsp">로그아웃</a></li>
                        <li class="nav-item"><a class="nav-link" href="guidemyinfor.jsp">내 정보</a></li>
                        <li class="nav-item"><a class="nav-link" href="FAQform.jsp">Q n A</a></li>
                    </ul>
                </div>
            </div>
        </nav>

<div class="sidebar">
   <ul style="line-height:200%">
   <li><a href="guidecourseform.jsp">코스예약하기</a></li>
   <li><a href="matchingQnA.jsp"> 코스매칭하기</a></li>
   <li><a href="receivetextform.jsp">쪽지확인하기</a></li>
   <li><a href="mypage.jsp"> 내 페이지</a></li>
   </ul>
</div>
<%       
      }
      rs.close();
   }
   %>
   <div class="clear" style="margin-top:150px;"></div>
   <%
   
   if((id !=null && type.equals("customer")) || (id !=null && type.equals("guide"))){
      String title = request.getParameter("title");
      int checked = 0;
      int num = 0;
      
      QnaService service = QnaService.getInstance();
      ResultSet rs = service.qnabytitle(title);
      
      while (rs.next()){
         checked = Integer.parseInt(rs.getString(6));
         num = Integer.parseInt(rs.getString(1));
   %>
   
   <article style="margin-bottom:50px;">
   <article id="box">
   <table style="margin-left:200px; line-height:50px;">
      <tr>
         <th width="10%">제목</th>
         <td>
            <input type="text" name="title" style="width: 800px; margin:10px 10px;" value="<%=rs.getString(4)%>" readonly>
         </td>
      </tr>
      <%
      if(rs.getString(3) == null)
      {
      %>
      <tr>
         <th>아이디</th>
         <td>
            <a><%=rs.getString(2)%></a>
            <input type="hidden" name="id" value="<%=rs.getString(2)%>">
         </td>
      </tr>
      <tr>
         <th>타입 </th>
         <td>
            <a>customer</a>
            <input type="hidden" name="type" value="customer">
         </td>
      </tr>
      <%
      } else {
         
      %>
      <tr>
         <th>아이디:</th>
         <td>
            <a><%=rs.getString(3)%></a>
            <input type="hidden" name="id" value="<%=rs.getString(3)%>">
         </td>
      </tr>
      <tr>
         <th>타입:</th>
         <td>
            <a>guide</a>
            <input type="hidden" name="type" value="guide">
         </td>
      </tr>
      <%
      }
      %>
      <tr>
         <th>내용</th>
         <td>
            <textarea style="width: 800px; height:150px; margin:10px 10px;" readonly><%=rs.getString(5)%></textarea>
         </td>
      </tr>
   </table>
   </article>
   <%
      }
      rs.close();
      if(checked == 1){
         ResultSet rs1 = service.selectAnswer(num);
         while(rs1.next()){
   %>
   <article id="box">
   <table style="margin-left:200px; line-height:50px;">
   <tr>
         <th width="10%">답변</th>
         <td>
            <textarea style="width: 800px; height:200px; margin:10px 10px;" readonly><%=rs1.getString(1)%></textarea>
         </td>
      </tr>
   </table>
   <input type="button" value="목록" style="float:right; margin-top:25px;" onclick="location.href='FAQform.jsp'">
   </article>
   </article>
      <%
         }
      }
   }
      %>

   
   <div class="clear"></div>
   <header class="news"> <nav>
   <ul>
      <li><a href="#">이용약관 |</a></li>
      <li><a href="#"> 개인정보 처리방침 |</a></li>
      <li><a href="#"> 통합멤버십정책 |</a></li>
      <li><a href="#"> 회사소개 |</a></li>
      <li><a href="#"> 여기요사장님 |</a></li>
      <li><a href="#"> 입점문의</a></li>
      <li><a href="#"> 공지사항</a></li>
   </ul>
   </nav> </header>
   <footer>
   <p style="font-weight: bold; font-size: 15px;">(용인)딜리버리히어로 유니버시티.</P>
   <P>용인시 처인구 용인대학로 134 용인대학교 우.17092 TEL: 031-8020-3114 FAX:
      031-332-6479</p>
   <p>통신판매업신고:제 2018-서울서초-2635호|개인정보담당자 : privacy@yogiyo.co.kr|제휴문의 :
      partnership@deliveryhero.co.kr|고객만족센터 : support@yogiyo.co.kr|호스트서비스사업자
      : (주)심플렉스인터넷</p>
   </footer>
</body>
</html>