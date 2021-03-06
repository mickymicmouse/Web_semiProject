<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>

<!-- 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<c:url value="/resources/user/css/bootstrap.min.css"/>">
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="<c:url value="/resources/user/js/bootstrap.min.js"/>"></script>


<!-- css -->
<style>
nav {
	margin: 10px;
}

body {
	background-color: #FFD9EC;
}

ul {
	list-style: none;
	text-align: center;
	border-top: 2px solid #D9418C;
	border-bottom: 2px solid #D9418C;
	padding: 10px 0;
}

ul li {
	display: inline;
	text-transform: uppercase;
	padding: 0 10px;
	letter-spacing: 10px
}

ul li a {
	text-decoration: none;
	color: #AB195E;
}

ul li a:hover {
	text-decoration: underline;
	color: white;
}
</style>

</head>
<body>
	<script>
		function fn_idchk() {

			$.ajax({
				url : "/crazy/idchk",
				type : "post",
				dataType : "json",
				data : {
					"userid" : $("#userid").val()
				},
				success : function(data) {
					if (data == 1) {
						alert("중복된 아이디입니다.");
					} else if (data == 0) {
						$("idchk").attr("value", "Y");
						alert("사용가능한 아이디입니다.")
					}
				}
			})
		}
	</script>
	
		<!-- 로그인, 회원가입, 로그아웃 -->
	<br>
	<div style="text-align: right; color: #D9418C;">
		<c:choose>
			<c:when test="${sessionScope.userid==null}">
				<a style="color: #D9418C" href="login.do">login</a>
				<a style="color: #D9418C" href="join.do">join</a>
			</c:when>
			<c:otherwise>
				<b>${sessionScope.userid} &nbsp;&nbsp;</b>
				<a style="color: #D9418C" href="logout.do">logout</a>
			</c:otherwise>
		</c:choose>
	</div>
	
	<!-- 로고 -->
	<header>
		<h1 class="text-center">
			<a href="home.do"><center>
					<img src="<c:url value="/resources/icecream.jpg"/>">
				</center></a>
		</h1>
	</header>

	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">

				<form action="crazyRegister.do" method="post">
					<br>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="id"
							name="userid" id="userid">
						<button class="idchk" type="button" id="idchk"
							onclick="fn_idchk()" value=" N" class="form-control"
							style="background-color: pink; color: white;">중복확인</button>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="pw"
							name="userpw" id="userpw">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="사용자 이름"
							name="username">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이메일"
							name="email">
					</div>

					<div class="form-group">
						<input type="submit" class="form-control"
							style="background-color: pink; color: white;" value="회원가입">
					</div>
				</form>

			</div>
		</div>
	</div>

	<c:if test="${msg=='error'}">
		<script type="text/javascript">
			alert("회원가입에 실패했습니다.");
		</script>
	</c:if>

</body>
</html>