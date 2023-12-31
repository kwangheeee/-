<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<header>
		userId : ${sessionScope.userId } / adminYn : ${sessionScope.adminYn }
		
		<!-- 어드민 -->
		<c:if test="${sessionScope.adminYn eq 'Y'}" var="res">
			<div>로고</div>
			<div>
				<a href="">도서관리</a>
				<a href="">사용자관리</a>
			</div>
			<div><a href="../logout.jsp">로그아웃</a></div>
		</c:if>		
		
		<!-- 사용자 -->
		<c:if test="${not res}">
			<div>로고</div>
			<div>
				<a href="">도서관리시스템</a>
			</div>
			<a href="">마이페이지</a>
			
			<!-- 로그인 전 -->
			<c:if test="${empty sessionScope.userId }" var="res1">
				<div><a href="../login.jsp">로그인</a></div>
			</c:if>
		
			<!-- 로그인 후 -->
			<c:if test="${not res1 }">
				<div><a href="../logout.jsp">로그아웃</a></div>
			</c:if>
		</c:if>
		
	</header>
</body>
</html>