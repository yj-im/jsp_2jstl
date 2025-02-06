<%@page import="vo.Customer"%>
<%@page import="dao.TblCustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2_EL.jsp</title>
</head>
<body>
	<h2>EL 은 Expression Language 의 약자. 표현언어</h2>
	<p>자바 객체에 접근 할 때 매우 유용하게 사용됩니다. 기호 입니다</p>
	<%
		TblCustomerDao dao=TblCustomerDao.getInstance();
		Customer vo=dao.selectByPk("twice");
		pageContext.setAttribute("vo", vo);
	%>
	<%-- <ul>
		<li>아이디 : <%= vo.getCustomId() %></li>
		<li>성명 : <%= vo.getName() %></li>
		<li>이메일 : <%= vo.getEmail() %></li>
		<li>나이 : <%= vo.getAge() %></li>
	</ul> --%>
	<h3>EL로 바꾸기</h3>
	<p>EL 기호안에 `객체변수.속성변수` 로 작성하면 getter 메소드를 
		실행하여 객체안에서 해당 변수값을 가져옵니다.
	</p>
	<ul>
		<li>아이디 : <c:out value="${vo.customId }"/> </li>
		<li>성명 : <c:out value="${vo.name }"/></li>
		<li>이메일 : <c:out value="${vo.email }"/></li>
		<li>나이 : <c:out value="${vo.age }"/></li>
		<li>가입날짜 : <c:out value="${vo.regDate }"/></li>
		
	</ul>
</body>
</html>