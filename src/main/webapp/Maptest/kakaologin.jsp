<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.servlet.RequestDispatcher"%>
<%@page import="javax.servlet.ServletException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<a id="send-to-btn" href="#" onclick="sendTo();">
  <img src="//k.kakaocdn.net/14/dn/btqc6xrxbuT/7VJk7YSWITkz9K9pbXEffk/o.jpg" />
</a>
<script type="text/javascript">
  function sendTo() {
    Kakao.Auth.login({
      scope: 'PROFILE,TALK_MESSAGE',
      success: function() {
        Kakao.API.request({
          url: '/v2/api/talk/memo/default/send',
          data: {
            template_object: {
              object_type: 'feed',
              content: {
                title: '딸기 치즈 케익',
                description: '#케익 #딸기 #삼평동 #카페 #분위기 #소개팅',
                image_url:
                  'http://k.kakaocdn.net/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
                link: {
                  mobile_web_url: 'https://developers.kakao.com',
                  web_url: 'https://developers.kakao.com',
                },
              },
              social: {
                like_count: 286,
                comment_count: 45,
                shared_count: 845,
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
</body>
</html>