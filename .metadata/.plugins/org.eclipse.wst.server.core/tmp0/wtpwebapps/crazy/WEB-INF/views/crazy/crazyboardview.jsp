<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글읽기</title>
</head>
<body>
	<%@ include file="home.jsp"%>
	<br>
	<br>
	<br>
	<div class="container">
		<br>
		<br>
		<form name="form2" action="crazyboardupdate.do" method="post"
			style="text-align: center;">
			<table class="table table-striped table-bordered"
				style="border: 2px soliid #D9418C; text-align: center; background-color: #FFFFFF">
				<thead>
					<tr>
						<th colspan="2"
							style="background-color: #eeeeee; text-align: center; color:#D9418C;">글 수정</th>
					</tr>
				</thead>

				<tbody>

					<tr>
						<th>작성일</th>
						<th>아이디</th>
					</tr>
					<tr>
						<td>${bno.regdate}</td>
						<td>${bno.writer}</td>
					</tr>

					<c:choose>
					
						<c:when
							test="${sessionScope.userid == bno.writer}">
							<tr>
								<th colspan="2">제목</th>

							</tr>
							<tr>
								<td colspan="2"><input type="text" name="subject"
									value="${bno.subject}" class="form-control"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea rows="7" placeholder="content" id="content"
										name="content" class="form-control">${bno.content }</textarea></td>

							</tr>
							<tr>
								<td colspan="2"><input type="hidden" name="bno" 
									value="${bno.bno }" /><input type="submit" style="background-color:#D9418C; color:white;" 
									class="btn btn-default pull-right" value="수정"></td>
							</tr>


						</c:when>
					
						
						
						<c:otherwise>
							<tr>
								<th colspan="2">제목</th>

							</tr>
							<tr>
								<td colspan="2"><input type="text" name="subject"
									value="${bno.subject}" class="form-control"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea rows="7" placeholder="content" id="content"
										name="content" class="form-control">${bno.content }</textarea></td>

							</tr>

						</c:otherwise>

					</c:choose>

				</tbody>

			</table>


		</form>

	</div>

</body>
</html>