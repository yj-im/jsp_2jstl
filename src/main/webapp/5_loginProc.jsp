<%@page import="vo.UserAccountVO"%>
<%@page import="dao.UserAccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5_loginProc.jsp</title>
</head>
<body>
	<%
		String userid=request.getParameter("userid");
		String password=request.getParameter("password");
		
		// SQL 실행을 위해 UserAccountDao 의 객체를 가져오기
		UserAccountDao dao=UserAccountDao.getInstance();
		// 로그인 sql 실행을 위한 메소드 호출
		UserAccountVO vo=dao.selectForLogin(userid, password);
		if(vo !=null){
			
			session.setAttribute("user", vo);	
			// 세션에 필요한 데이터 저장. --> 로그인 사용자 정보를 서버에서 저장
			response.sendRedirect("/2JSTL/");	
			// HOME 경로로 url 설정. 서버측에서 url 로 페이지 요청 
			
		}else {	
		response.sendRedirect("5_login.jsp?fail=y");
			// 서버측에서 새로운 url로 페이지를 요청. 로그인 실패를 알리기 위한 파라미터 추가
		}
	%>
	
	
	
</body>
</html>