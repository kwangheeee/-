<%@page import="com.library.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>
    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: lightgray;
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>
<script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">회원가입</h4>
				<form class="validation-form" novalidate action="./login/join.member" method='get'>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">이름</label> <input type="text" name="name"
								class="form-control" id="id" placeholder="" value="" required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="nickname">아이디</label> <input type="text"
								class="form-control" id="id" name="id" placeholder="" value=""
								required>
							<div class="invalid-feedback">아이디를 입력해주세요.</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="address2">비밀번호<span class="text-muted">
						</span></label> <input type="password" class="form-control" id="address2" name="pw"
							placeholder="대문자 / 소문자 / 특수기호를 사용해 주세요.">
					</div>
					<div class="mb-3">
						<label for="email">이메일</label> <input type="email" name="email"
							class="form-control" id="email" placeholder="you@example.com"
							required value="@naver.com">
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="address">주소</label> <input type="text" name="address"
							class="form-control" id="address" placeholder="서울특별시 강남구"
							required>
						<div class="invalid-feedback">주소를 입력해주세요.</div>
					</div>


					<div class="row">
						<div class="col-md-8 mb-3">
							<label for="root">사용권한</label> 
							<select class="custom-select d-block w-100" id="root" name="adminYN">
								<option value="">-</option>
								<option value="Y">관리자</option>
								<option value="N">사용자</option>
							</select>
							<div class="invalid-feedback">.</div>
						</div>
						<div class="col-md-4 mb-3">
							<label for="code">추천인 코드</label> 
							<input type="text" class="form-control" id="code" name="code" placeholder="" >
							<div class="invalid-feedback">추천인 코드를 입력해주세요.</div>
						</div>
					</div>
					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">가입완료</button>
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; 떡잎 마을 도서관</p>
		</footer>
	</div>
</body>
</html>