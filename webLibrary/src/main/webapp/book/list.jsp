<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/style.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	let message = '${message}';
	if(message != null && "" != message){
		alert(message);
	}

	function deletBook(){
		delNolist = document.querySelectorAll("[name=delNo]:checked");
		let delNo = "";
		delNolist.forEach((e)=>{
			delNo += e.value + ','
		});
		delNo = delNo.substr(0, delNo.length-1);
		console.log(delNo);
		
		
		// 삭제요청
 		searchForm.action="../book/delete.book";
		searchForm.delNo.value=delNo;
		searchForm.submit();
	}

</script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<h2>도서목록</h2>
	총 건수 : ${map.totalCnt }
	<!-- 검색 폼 시작 -->
	<%@ include file="../common/SearchForm.jsp" %>
	<!-- 검색 폼 끝 -->
	
	
	<table border="1" width='90%'>
		<c:if test="${sessionScope.adminYn eq 'Y' }">
		<tr>
			<td colspan="6" class="rigth">
				<!-- 어드민 계정인 경우 등록, 삭제 버튼을 출력 -->
				<button onclick="location.href='../book/write.book'">도서등록</button>
				<button onclick="deletBook()">도서삭제</button>
			</td>
		</tr>
		</c:if>
		<!-- 목록 출력 -->
		<tr>
			<th width="5%"></th>
			<th width="20%">제목</th>
			<th width="10%">저자</th>
			<th width="10%">대여여부</th>
			<th width="20%">대여일</th>
			<th width="20%">반납일</th>
		</tr>
		<c:if test="${empty map.list}" var="res">
			<tr>
				<td colspan="5" class="center">등록된 게시물 없음</td>
			</tr>
		</c:if>
		<c:if test="${not res }">
			<c:forEach items="${map.list }" var="book" step="1">
				<tr>
					<td class="center">
						<!-- 삭제용 체크박스 -->
						<input type="checkbox" name="delNo" value="${book.no }">
					</td>
					<td>
						<a href="../book/view.book?no=${book.no}">
							${book.title }
						</a>
					</td>
					<td>${book.author }</td>
					<c:if test="${book.rentyn eq 'N' }" var='rnt'>
						<td>대여가능</td>
					</c:if>
					<c:if test="${not rnt }">
						<td>대여중</td>
					</c:if>
					<td>${book.startDate }</td>
					<td>${book.endDate }</td>
				</tr>
			</c:forEach>
		</c:if>
	<!-- 페이징 -->
		<tr>
			<td align='center' colspan='6'><%@include file="../common/PageNavi.jsp" %></td>
<!-- 			<td align='center' >
				<button onclick="">대여하기</button>
				<button onclick="">반납하기</button>
			</td> -->
		</tr>
	</table>
	
	
	
	<!-- 상세 -->
	
	<!-- 삭제 -->
	<!-- 등록 -->
</body>
</html>