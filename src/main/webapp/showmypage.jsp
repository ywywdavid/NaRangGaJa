<%@page import="guiderev.service.GuideRevService"%>
<%@page import="mypage.service.MypageService"%>
<%@page import="customer.service.CustomerService"%>
<%@page import="guide.service.GuideService"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@400&display=swap" rel="stylesheet">

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css?ver=123" rel="stylesheet" />

<link rel="stylesheet" href="css/mypageCss/reset.css">
<link rel="stylesheet" href="css/mypageCss/common.css">
<link rel="stylesheet" href="css/mypageCss/style.css">


<script>
function popup(){
    var url = "addVehicle.jsp";
    var name = "popup test";
    var option = "width = 600, height = 500, top = 100, left = 100, location = no"
    window.open(url, name, option);
}
</script>
<style>
body {
	background: #F2F2F2;
	margin: 0px 150px;
}

th, td {
  padding: 15px;
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
	padding: 26px;
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
	width: 70%;
	height: 100%;
	border: solid 1px #cccccc;
	margin: 0 auto;
	text-align: left;
	margin-top:30px;
}

article #box {
	width: 90%;
	margin: 10px 0px 10px 50px;
	border: none;
	display: flex;
	border: solid 1px #cccccc;
}

article #box2 {
	width: 45%;
	height: 100%;
	margin: 10px;
	border: none;
	flex: 1;
}

article #box3 {
	width: 45%;
	height: 100%;
	margin: 10px;
	border: none;
	flex: 2;
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
	font-family: ??????;
	text-decoration: none;
}

.news ul li a {
	color: #848484;
}

input[type="text"] {
	width: 200px;
	height: 40px;
	border-radius: 5px;
	border-color: black;
	text-align: center;
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
	font-family: 'Hahmlet', serif;
	text-align: center;
	font-size:30px;
	font-weight: lighter;
	color: black;
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
		
			if (id == null || type == null) // ???????????? ???????????? ???
			{
		%>
			<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp">?????? ??????</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                    <form action="searchingResult.jsp" id="search" style="display:block;">
						<li>
						<select name="search_type" style="float: left; margin-top:15px; padding:10px; line-height: 1.2;">
							<option value="course">??????</option>
							<option value="name">?????????</option>
							<option value="id">?????????</option>
						</select>
						</li>
						<li style="float: left;"><input type="text" name="search_word" value="" 
						style="margin-top:15px; width: 400px; height: 40px; border-color: #CC9966;"></li>
						<li style="float: left; margin-top:12px; margin-right:150px;"><input type="submit" value="??????"></li>
					</form>
                        <li class="nav-item"><a class="nav-link" href="loginform.jsp">?????????</a></li>
                        <li class="nav-item"><a class="nav-link" href="customerjoinform.jsp">????????????</a></li>
                    </ul>
                </div>
            </div>
        </nav>

		<%
			} else if(id !=null && type.equals("customer") ) { //?????? ????????? ?????? ??????
				
				CustomerService service = CustomerService.getInstance();
				ResultSet rs = service.SelectName(id);
				
				while (rs.next()) {
					String name = rs.getString(1);
					session.setAttribute("name", name);
		%>

		<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp">?????? ??????</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                    <form action="searchingResult.jsp" id="search" style="display:block;">
						<li>
						<select name="search_type" style="float: left; margin-top:15px; padding:10px; line-height: 1.2;">
							<option value="course">??????</option>
							<option value="name">?????????</option>
							<option value="id">?????????</option>
						</select>
						</li>
						<li style="float: left;"><input type="text" name="search_word" value="" 
						style="margin-top:15px; width: 400px; height: 40px; border-color: #CC9966;"></li>
						<li style="float: left; margin-top:12px;"><input type="submit" id="searching" value="??????"></li>
					</form>
                        <li class="nav-item"><a class="nav-link" href="logoutProc.jsp">????????????</a></li>
                        <li class="nav-item"><a class="nav-link" href="myinfor.jsp">??? ??????</a></li>
                        <li class="nav-item"><a class="nav-link" href="FAQform.jsp">Q n A</a></li>
                    </ul>
                </div>
            </div>
        </nav>
		
		<div class="sidebar">
			<ul style="line-height:200%">
			<li><a href="customercourseform.jsp">??????????????????</a></li>
			<li><a href="matchingQnA.jsp"> ??????????????????</a></li>
			<li><a href="receivetextform.jsp">??????????????????</a></li>
			<li><a href="mypage.jsp"> ??? ?????????</a></li>
			</ul>
		</div>
		<%
				}
				rs.close();
			} else if (id !=null && type.equals("guide")){
				
				GuideService service = GuideService.getInstance();
				ResultSet rs = service.SelectName(id);
				
				while (rs.next()) {
					String name = rs.getString(1);
					session.setAttribute("name", name);
		%>
		<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp">?????? ??????</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                    <form action="searchingResult.jsp" id="search" style="display:block;">
						<li>
						<select name="search_type" style="float: left; margin-top:15px; padding:10px; line-height: 1.2;">
							<option value="course">??????</option>
							<option value="name">?????????</option>
							<option value="id">?????????</option>
						</select>
						</li>
						<li style="float: left;"><input type="text" name="search_word" value="" 
						style="margin-top:15px; width: 400px; height: 40px; border-color: #CC9966;"></li>
						<li style="float: left; margin-top:12px;"><input type="submit" id="searching" value="??????"></li>
					</form>
                        <li class="nav-item"><a class="nav-link" href="logoutProc.jsp">????????????</a></li>
                        <li class="nav-item"><a class="nav-link" href="guidemyinfor.jsp">??? ??????</a></li>
                        <li class="nav-item"><a class="nav-link" href="FAQform.jsp">Q n A</a></li>
                    </ul>
                </div>
            </div>
        </nav>
		
		<div class="sidebar">
			<ul style="line-height:200%">
			<li><a href="guidecourseform.jsp">??????????????????</a></li>
			<li><a href="matchingQnA.jsp"> ??????????????????</a></li>
			<li><a href="receivetextform.jsp">??????????????????</a></li>
			<li><a href="mypage.jsp"> ??? ?????????</a></li>
			</ul>
		</div>
		<% 		
				}
				rs.close();
			} else if(id.equals("?????????") && type.equals("auth")){												
		%>
		<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp">?????? ??????</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                    <form action="searchingResult.jsp" id="search" style="display:block;">
						<li>
						<select name="search_type" style="float: left; margin-top:15px; padding:10px; line-height: 1.2;">
							<option value="course">??????</option>
							<option value="name">?????????</option>
							<option value="id">?????????</option>
						</select>
						</li>
						<li style="float: left;"><input type="text" name="search_word" value="" 
						style="margin-top:15px; width: 400px; height: 40px; border-color: #CC9966;"></li>
						<li style="float: left; margin-top:12px;"><input type="submit" id="searching" value="??????"></li>
					</form>
                        <li class="nav-item"><a class="nav-link" href="logoutProc.jsp">????????????</a></li>
                        <li class="nav-item"><a class="nav-link" href="viewmemberform.jsp">?????? ??????</a></li>
                        <li class="nav-item"><a class="nav-link" href="viewcoursesform.jsp">?????? ??????</a></li>
                        <li class="nav-item"><a class="nav-link" href="FAQform.jsp">Q n A ??????</a></li>
                    </ul>
                </div>
            </div>
        </nav>
		
		<% 
			}
		%>

	<div class="clear" style="margin-top:150px;"></div>
	<%
	MypageService service = MypageService.getInstance();	
	
	String showid = request.getParameter("id");
	String showtype = request.getParameter("type");
	
	
	int checkpage = service.CheckPage(showid);
	int checkvehicle = service.CheckVehicle(showid);

	%>
	
	
	

		<%
			if (checkpage == 0) // ??? ???????????? ?????????
			{
		%>
		<article style="margin-bottom:50px;">
		<nav style="text-align: center;">
			<a>??? ???????????? ????????????.<br>
	 
			<br>
		</nav>
		</article>
		
				
		<%
			} else { // ??? ???????????? ?????? ???
				
		%>
	<%
		
	ServletContext context = this.getServletContext();
	String directory = context.getRealPath("upload");
	
	
	if(showtype.equals("customer")){
		//????????? ????????? ?????? ??????

		ResultSet rs = service.SelectMyPage(showid,showtype);
		ResultSet nrs= service.GetName(showid, showtype);
	%>
	<article style="margin-bottom:50px;">
	<article id="box" >
	<article id="box2">
		<%
		while (rs.next()) {
			//String src = directory+"\\"+rs.getString(4);
			String src= "upload\\"+rs.getString(4);
			System.out.println("src: "+ src);
			%>
			<section id="image">
			<img src="<%=src%>" style="width: 400px; height: 300px;">
			</section>
	</article>
			<article id="box2">
			<section id="infor">
			<form action="writetextform.jsp">
			<input type="hidden" name="Receiver_id" value="<%=rs.getString(1)%>">
			<li style="list-style-type: none; font-size : 20px;"><%=rs.getString(1)%>
			<input type="image" src="image/Letter.png" style="width:25px; height:25px; margin-left:10px;" value="">
			</li>
			</form>
			</section>
			<section id="infor">
			<%
			while(nrs.next()){				
			%>
			<li style="list-style-type: none; font-weight: 700;"><%=nrs.getString(1)%></li>
			<%			
			}
			nrs.close();
			%>
			</section>
			<section id="infor">
			<li style="list-style-type: none;"><%=rs.getString(6)%></li>
			</section>
			<%
			}//while	
			rs.close();
		%>
		</article>
	</article>
	<article id="box" style="height: 300px;">
	</article>
	</article>
	
	
	<!-- ????????? -->
	<%
	ResultSet postRs = service.GetPosts(showid, showtype);
	while(postRs.next()){
		
	%>
	
	<article class="contents">
                    <header class="top">
   

                        <div class="sprite_more_icon" data-name="more">
                            <ul class="toggle_box">                               
                                <li>??????</li>
                                <li>??????</li>
                            </ul>
                        </div>
                    </header>

                    <div class="img_section">
                        <div class="trans_inner">
                            <div><img src="<%="upload\\"+postRs.getString(3) %>" width="300" height="200" alt="visual01"></div>
                        </div>
                    </div>


                    <div class="comment_container">
                        <div class="comment" id="comment-list-ajax-post37">
                            <div class="comment-detail">
                                <div class="nick_name m_text"><%=postRs.getString(1) %></div>
                                <div><%=postRs.getString(4) %></div>
                            </div>
                        </div>
                </article>
                
                <%
	}
	postRs.close();
                %>
	<!-- ????????? -->
	
	
	
	<%
			} else{
		%>
	
	<%
	ResultSet rs = service.SelectMyPage(showid,showtype);
	ResultSet nrs= service.GetName(showid, showtype);
	GuideRevService service1 = GuideRevService.getInstance();
	ResultSet rrs= service1.AvgRep(showid);
	%>
	<article style="margin-bottom:50px;">
	<article id="box" >
		<article id="box2">
		<%
		while (rs.next()) {
			//String src = directory+"\\"+rs.getString(4);
			String src= "upload\\"+rs.getString(4);
			System.out.println(src);
			%>
			<section id="image">
			<img src="<%=src%>" style="width: 400px; height: 300px;">
			</section>
		</article>
		<article id="box2">
			<section id="infor">
			<%
			while(rrs.next()){
				double avgrep = 0;
				if(rrs.getString(1) == null)
				{
					avgrep =  1;
				} else {
					avgrep =  Double.parseDouble(rrs.getString(1));
				}
				
				if(avgrep >= 4)
				{
			%>
			<img src="image/Diamond.png" height="100px" width="100px">
			<%
				} else if(avgrep >= 3 && avgrep < 4)
				{
			%>
			<img src="image/Platinum.png" height="100px" width="100px">
			<%
				} else if(avgrep >= 2 && avgrep < 3)
				{
			%>
			<img src="image/Gold.png" height="100px" width="100px">
			<%
				} else if(avgrep >= 1 && avgrep < 2)
				{
			%>
			<img src="image/Silver.png" height="100px" width="100px">
			<%
				} else
				{
			%>
			<img src="image/Bronze.png" height="100px" width="100px">
			<%
				}
			}
			rrs.close();
			%>
			</section>
			<section id="infor">
			<form action="writetextform.jsp">
			<input type="hidden" name="Receiver_id" value="<%=rs.getString(2)%>">
			<li style="list-style-type: none; font-size : 20px;"><%=rs.getString(2)%>
			<input type="image" src="image/Letter.png" style="width:25px; height:25px; margin-left:10px;" value="">
			</li>
			</form>
			</section>
			<section id="infor">
			<%
			while(nrs.next()){				
			%>
			<li style="list-style-type: none; font-weight: 700;"><%=nrs.getString(1)%></li>
			<%			
			}
			nrs.close();
			%>
			</section>
			<section id="infor">
			<li style="list-style-type: none;"><%=rs.getString(6)%></li>
			</section>
			<%
			}//while	
			rs.close();
		%>
		</article>
	</article>
	
	
	
	<!-- ????????? -->
	<%
	ResultSet postGRs = service.GetPosts(showid, showtype);
	while(postGRs.next()){
		
	%>
	
	<article class="contents">
                    <header class="top">
   

                        <div class="sprite_more_icon" data-name="more">
                            <ul class="toggle_box">                               
                                <li>??????</li>
                                <li>??????</li>
                            </ul>
                        </div>
                    </header>

                    <div class="img_section">
                        <div class="trans_inner">
                            <div><img src="<%="upload\\"+postGRs.getString(3) %>" width="300" height="200" alt="visual01"></div>
                        </div>
                    </div>


                    <div class="comment_container">
                        <div class="comment" id="comment-list-ajax-post37">
                            <div class="comment-detail">
                                <div class="nick_name m_text"><%=postGRs.getString(1) %></div>
                                <div><%=postGRs.getString(4) %></div>
                            </div>
                        </div>
                </article>
                
                <%
	}
	postGRs.close();
                %>
	<!-- ????????? -->
	
	
	
	<%
	if (checkvehicle == 0) // ??????????????? ?????????
	{
	%>
	<article id="box">
	<nav>
	<h1>???????????? ????????? ????????????.</h1>
	<br>
	</nav>
	</article>
	</article>
	<%
	}
	else // ??????????????? ?????????
	{
	%> 
	<article id="box">
	<article id="box2">
	<h1 style="text-align: center;">?????? ??????</h1>
	</article>
	<article id="box3">
	<%
	ResultSet rs1 = service.SelectVehicle(showid);
			while (rs1.next()) {
				String src= "upload\\"+rs1.getString(3);
				System.out.println(src);
	%>
		<section id="infor">
			<li style="list-style-type: none; border: solid thin; font-size : 20px;"><%=rs1.getString(2)%></li>
			</section>
			<section id="image" >
			<img src="<%=src%>" style="width: 400px; height: 300px;">
			</section>
	<%
			}
			rs1.close();
	%>
		</article>
	</article>
	</article>	<!-- ?????? body -->
	<%
			}//??????????????? ?????? ???
	
			GuideRevService guideRevService = GuideRevService.getInstance();
			ResultSet rs3 = guideRevService.SelectRev(showid);
			int average=0;
	%>
	
	
	<article style="margin:50px auto;">
	<h1 style="color: black; margin:50px auto;">????????? ??????</h1>
	<article style="margin: 0 auto; border:none;">
	<form action="writeReview.do">
	<input type="hidden" name="guide_id" value="<%=showid%>">
	????????? ???????????????: <input type="text" name="detail" placeholder="????????? ??????????????????" autocomplete="off" style="width:60%;">	<select name="rep">
					<option>??????</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
	<input type="submit" value="??????">
	</form>

	<table border="1" style="width:100%;">
		<tr>
			<td>????????? ?????????</td>
			<td>??????</td>
			<td>????????????</td>
			<td>??????</td>
		</tr>
		<%
			while (rs3.next()) {
				/* average=rs3.getInt(5); */
		%>
		<tr>
			<td><%=rs3.getString(1)%></td>			
			<td><%=rs3.getString(2)%></td>
			<td><%=rs3.getString(3)%></td>
			<td><%=rs3.getInt(4)%></td>			
		</tr>
		<%
			}
		%>
	</table>
	<%-- <h>????????? ??????: <%=average %></h> --%>
	</article>
	</article>
	<%
			rs3.close();
	
			}//???????????? ????????? ?????? ???
			}//??? ???????????? ?????? ???
		%>
		
	
	
	
	
	
	
	
	<div class="clear"></div>
	<header class="news"> <nav>
	<ul>
		<li><a href="#">???????????? |</a></li>
		<li><a href="#"> ???????????? ???????????? |</a></li>
		<li><a href="#"> ????????????????????? |</a></li>
		<li><a href="#"> ???????????? |</a></li>
		<li><a href="#"> ?????????????????? |</a></li>
		<li><a href="#"> ????????????</a></li>
		<li><a href="#"> ????????????</a></li>
	</ul>
	</nav> </header>
	<footer>
	<p style="font-weight: bold; font-size: 15px;">(??????)????????????????????? ???????????????.</P>
	<P>????????? ????????? ??????????????? 134 ??????????????? ???.17092 TEL: 031-8020-3114 FAX:
		031-332-6479</p>
	<p>?????????????????????:??? 2018-????????????-2635???|????????????????????? : privacy@yogiyo.co.kr|???????????? :
		partnership@deliveryhero.co.kr|?????????????????? : support@yogiyo.co.kr|???????????????????????????
		: (???)?????????????????????</p>
	</footer>
</body>
</html>