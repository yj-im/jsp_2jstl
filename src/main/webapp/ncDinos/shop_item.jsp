<%@page import="vo.FanItemVO"%>
<%@page import="dao.FanItemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style tyle="text/css">
.container{
	display : flex; width:800px; margin:auto
}
.cont-box{
	margin-left:20px; width:300px
}
.img-box{
	width:500px; height:550px;
}
.orderCount{
	border-bottom:1px solid gray; border-top:1px solid gray
}
.orderButton{
	margin-top:20px;
}
.orderCount > input{
	padding:5px 10px; margin: 10px;
}
.orderButton > button{
	padding:10px 20px; font-size: 1.2rem
}
</style>
</head>
<body>
<%
	FanItemVO vo=null;
	try{
		int seq=Integer.parseInt(request.getParameter("seq"));
		// request.getParameter("seq") : seq 라는 이름의 파라미터값 가져오기
		// Integer.parseInt(문자열) : 문자열을 정수로 변환
		
		FanItemDao dao=FanItemDao.getInstance();
		vo=dao.selectByPk(seq);	// 파라미터로 전달돼 seq 값으로 select 조회.
		// ?seq=99 이런걸줬을때 값이 없으니 밑에코드처럼 ncDinos 초기화면으로 가게하는 코드
		if(vo ==null){
			response.sendRedirect("ncDinos_shop.jsp");
		}
		//out.print(vo);	// 테스트용
		pageContext.setAttribute("vo", vo);
	}catch (Exception e){
		// seq 파라미터가 없을 때, 예외 발생. -> 상품 목록 페이지로 리다이렉트 합니다.	
		// 홈피에서 상품눌렀을때 ?seq=1 이 주소가 붙는데	이걸지우고 엔터치면 오류뜨는걸 다시 올바른 ncdinos페이지로
		// 나오게끔 하는 코드
		response.sendRedirect("ncDinos_shop.jsp");
	}
%>

	<h3>구매</h3>
	<hr/>
		<div class="container">
			<div class="img-box">
				<img alt="${vo.title}" src="product/${vo.filename}" width="100%">
			</div>
			<div class="cont-box">
				<h3>${vo.title }</h3>
				<h3>정가 : <fmt:formatNumber value="${vo.price }" pattern="###,###"/> 원</h3>
				<h3>판매가 : <fmt:formatNumber value="${vo.price }" pattern="###,###"/> 원</h3>
				<div class="orderCount"> 주문 수량 : 
					<input type="number" min="1" max="999" size="20"/>
				</div>
				<div class="orderButton">
					<button>구매하기</button>
				</div>
			</div>
		</div>
	<hr/>
	<div style="text-align:center">
		<button style="padding:10px 20px; font-size: 1.2rem" 
		onclick="location.href='ncDinos_shop.jsp'">목록</button>
	</div>


</body>
</html>