<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>

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

	<!-- 로고 -->
	<header>
		<h1 class="text-center">
			<a href="home.do"><center>
					<img src="<c:url value="/resources/icecream.jpg"/>">
				</center></a>
		</h1>
	</header>

	<!-- login form -->
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">

				<form action="loginpro.do" method="post">
					<br>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="id"
							name="userid">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="pw"
							name="userpw">
					</div>

					<div class="form-group">
						<input type="submit" class="form-control"
							style="background-color: pink; color: white;" value="로그인">
					</div>
					<div class="form-group">
						<a href="join.do" class="form-control"
							style="background-color: pink; text-align: center; color: white;">회원가입</a>
					</div>
				</form>

			</div>
		</div>
	</div>

	<c:if test="${msg=='error'}">
		<script type="text/javascript">
			alert("틀림");
		</script>
	</c:if>


</body>
</html>