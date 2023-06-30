<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
    function validateForm(form) {  // 필수 항목 입력 확인
        if (form.name.value == "") {
            alert("작성자를 입력하세요.");
            form.name.focus();
            return false;
        }
        if (form.title.value == "") {
            alert("제목을 입력하세요.");
            form.title.focus();
            return false;
        }
        if (form.content.value == "") {
            alert("내용을 입력하세요.");
            form.content.focus();
            return false;
        }
        if (form.pass.value == "") {
            alert("비밀번호를 입력하세요.");
            form.pass.focus();
            return false;
        }
    }
</script>
</head>
<h2>책 등록하기</h2>
<form name="writeFrm" method="post" enctype="multipart/form-data"
	action="./write.book" onsubmit="return validateForm(this);">
	
	<!-- <form method='post' action="../book/insert.book"> -->
	
	<table border="1" width="90%">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" style="width: 150px;" value='${sessionScope.userId }' readonly='readonly'}/></td>
		</tr>
		
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" style="width: 90%;" /></td>
		</tr>
		
		<tr>
			<td>작가</td>
			<td><input type="text" name="author" style="width: 90%; "/>
			</td>
		</tr>
		
		<tr>
			<td>책이미지</td>
			<td><input type="file" name="bookImg" /></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<button type="submit">작성 완료</button>
				<button type="reset">RESET</button>
				<button type="button" onclick="location.href='./list.book';">
					목록 바로가기</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>