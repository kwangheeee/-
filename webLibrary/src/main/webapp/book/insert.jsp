<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method='post' action="../book/insert.book">
		<ul>
			<li>제목<input type="text" name='title'></li>		
			<li>작가<input type="text" name='author'></li>
			<li><input type="submit" value='등록하기'></li>		
		</ul>			
	</form>
</body>
</html>