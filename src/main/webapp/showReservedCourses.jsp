<%@page import="course.service.CourseService"%>
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
	margin-top:50px;
	
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
	font-family: 굴림;
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
	font-family: '바탕';
	padding-top: 100px;
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
	String id = (String) session.getAttribute("id");
	String type = (String)session.getAttribute("type");		
	
	CourseService service = CourseService.getInstance();
	
	
	if(type == "customer"){
		//고객이 로그인 했을 경우
			
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

	<div class="clear" style="margin-top:150px;"></div>

	<article style="margin-bottom:50px;">
		<nav style="text-align: center;">
			<a>예약 목록</a>
						
			<article id="box" >
	<table border="1" cellspacing="0">
		<tr>
			<td>썸네일</td>
			<td>코스 이름</td>
			<td>고객 아이디</td>
			<td>가이드 아이디</td>
			<td>지역</td>			
			<td>총 인원 수</td>
			<td>예산</td>
			<td>시작일</td>
			<td>종료일</td>
			<td>확인메세지보내기</td>			
		</tr>
		<%
		ResultSet rs2 = service.ShowReservedCourses(id, type);
			while (rs2.next()) {
				String src= "upload\\"+rs2.getString(9);
				System.out.println(src);
		%>
		<tr>
			<td><img src="<%=src%>" style="width: 200px; height: 150px;" onerror="this.src='image/Noimage.jpg'"></td>
			<td>
			<form action="showCourseList.jsp">
			<input type="submit" name="course_code" value="<%=rs2.getString(1)%>">
			</form>
			</td>			
			<td>
			<form action="showmypage.jsp">
			<input type="hidden" name="type" value="customer">
			<input type="submit" name="id" value="<%=rs2.getString(2)%>">
			</form>
			</td>
			<td>
			<form action="showmypage.jsp">
			<input type="hidden" name="type" value="guide">
			<input type="submit" name="id" value="<%=rs2.getString(3)%>">
			</form>
			</td>			
			<td><%=rs2.getString(4)%></td>
			<td><%=rs2.getInt(5)%></td>
			<td><%=rs2.getInt(6)%></td>
			<td><%=rs2.getString(7)%></td>
			<td><%=rs2.getString(8)%></td>
			<td><button id="send-to-btn" href="#" onclick="sendToCustomer();">확인</button></td>
		</tr>	
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">

var course_code ="<%=rs2.getString(1)%>";
var customer = "<%=rs2.getString(2)%>";
var guide ="<%=rs2.getString(3)%>";
var region ="<%=rs2.getString(4)%>";
var num ="<%=rs2.getInt(5)%>";
var budget ="<%=rs2.getInt(6)%>";
var sdate ="<%=rs2.getString(7)%>";
var edate ="<%=rs2.getString(8)%>";

Kakao.init('494257621fe30b68809cbdd7f5024017'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
  function sendToCustomer() {
	  Kakao.Auth.login({
	      scope: 'PROFILE,TALK_MESSAGE',
	      success: function() {
	        Kakao.API.request({
	          url: '/v2/api/talk/memo/default/send',
	          data: {
	            template_object: {
	              object_type: 'feed',
	              content: {
	                title: course_code + '코스 매칭이 성사되었습니다.',
	                /*  description: '나랑가자 사이트에서 확인해주세요!', */ 
	                 description: '가이드 카톡 ID:' + guide,
	                image_url:
	                  'https://ifh.cc/g/0hgpgh.png',
	                link: {
	                  mobile_web_url: 'https://developers.kakao.com',
	                  web_url: 'https://developers.kakao.com',
	                },
	              },
	              social: {
	                
	              },
	              buttons: [
	                {
	                  title: '웹으로 보기',
	                  link: {
	                    mobile_web_url: 'https://developers.kakao.com',
	                    web_url: 'https://developers.kakao.com',
	                  },
	                },
	                {
	                  title: '앱으로 보기',
	                  link: {
	                    mobile_web_url: 'https://developers.kakao.com',
	                    web_url: 'https://developers.kakao.com',
	                  },
	                },
	              ],
	            },
	          },
	          success: function(res) {
	            alert('success: ' + JSON.stringify(res))
	          },
	          fail: function(err) {
	            alert('error: ' + JSON.stringify(err))
	          },
	        })
	      },
	      fail: function(err) {
	        alert('failed to login: ' + JSON.stringify(err))
	      },
	    })
	  }
	</script>
		<%
			}
		
		%>
	</table>
	</article>
	<%
	rs2.close();
	%>


	<%
		} else {			
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

	<div class="clear" style="margin-top:150px;"></div>

	<article style="margin-bottom:50px;">
		<nav style="text-align: center;">
			<a>예약 목록</a>
						
			<article id="box" >
	<table border="1" cellspacing="0">
		<tr>
			<td>썸네일</td>
			<td>코스 이름</td>
			<td>고객 아이디</td>
			<td>가이드 아이디</td>
			<td>지역</td>			
			<td>총 인원 수</td>
			<td>예산</td>
			<td>시작일</td>
			<td>종료일</td>
			<td>확인메세지보내기</td>			
		</tr>
		<%
		ResultSet rs2 = service.ShowReservedCourses(id, type);
			while (rs2.next()) {
				String src= "upload\\"+rs2.getString(9);
				System.out.println(src);
		%>
		<tr>
			<td><img src="<%=src%>" style="width: 200px; height: 150px;" onerror="this.src='image/Noimage.jpg'"></td>
			<td>
			<form action="showCourseList.jsp">
			<input type="submit" name="course_code" value="<%=rs2.getString(1)%>">
			</form>
			</td>			
			<td>
			<form action="showmypage.jsp">
			<input type="hidden" name="type" value="customer">
			<input type="submit" name="id" value="<%=rs2.getString(2)%>">
			</form>
			</td>
			<td>
			<form action="showmypage.jsp">
			<input type="hidden" name="type" value="guide">
			<input type="submit" name="id" value="<%=rs2.getString(3)%>">
			</form>
			</td>			
			<td><%=rs2.getString(4)%></td>
			<td><%=rs2.getInt(5)%></td>
			<td><%=rs2.getInt(6)%></td>
			<td><%=rs2.getString(7)%></td>
			<td><%=rs2.getString(8)%></td>
			<td><button id="send-to-btn" href="#" onclick="sendToGuide();">확인</button></td>
		</tr>	
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">

var course_code ="<%=rs2.getString(1)%>";
var customer ="<%=rs2.getString(2)%>";
var guide ="<%=rs2.getString(3)%>";
var region ="<%=rs2.getString(4)%>";
var num ="<%=rs2.getInt(5)%>";
var budget ="<%=rs2.getInt(6)%>";
var sdate ="<%=rs2.getString(7)%>";
var edate ="<%=rs2.getString(8)%>";

Kakao.init('494257621fe30b68809cbdd7f5024017'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
  function sendToGuide() {
	  Kakao.Auth.login({
	      scope: 'PROFILE,TALK_MESSAGE',
	      success: function() {
	        Kakao.API.request({
	          url: '/v2/api/talk/memo/default/send',
	          data: {
	            template_object: {
	              object_type: 'feed',
	              content: {
	                title: course_code + '코스 매칭이 성사되었습니다.',
	                /*  description: '나랑가자 사이트에서 확인해주세요!', */ 
	                 description: '고객 카톡 ID:' + customer,
	                image_url:
	                  'https://ifh.cc/g/0hgpgh.png',
	                link: {
	                  mobile_web_url: 'https://developers.kakao.com',
	                  web_url: 'https://developers.kakao.com',
	                },
	              },
	              social: {
	                
	              },
	              buttons: [
	                {
	                  title: '웹으로 보기',
	                  link: {
	                    mobile_web_url: 'https://developers.kakao.com',
	                    web_url: 'https://developers.kakao.com',
	                  },
	                },
	                {
	                  title: '앱으로 보기',
	                  link: {
	                    mobile_web_url: 'https://developers.kakao.com',
	                    web_url: 'https://developers.kakao.com',
	                  },
	                },
	              ],
	            },
	          },
	          success: function(res) {
	            alert('success: ' + JSON.stringify(res))
	          },
	          fail: function(err) {
	            alert('error: ' + JSON.stringify(err))
	          },
	        })
	      },
	      fail: function(err) {
	        alert('failed to login: ' + JSON.stringify(err))
	      },
	    })
	  }
	</script>
		<%
			}
		
		%>
	</table>
	</article>
	<%
	rs2.close();
		}
	%>
		</nav>
		</article>

	
	
	
	
	
	
	
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