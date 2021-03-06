<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

<script type="text/javascript">
function list(page){
	location.href = "crazyboard.do?curPage=" + page
}
</script>

</head>
<body>
	<%@ include file="home.jsp"%>
	<br>
	<br>
	<br>

	<div class="container">
		<div class="row">
			<form>
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #FF00DD">
					<thead>
						<tr>
							<th
								style="background-color: #eeeeee; text-align: center; color: #D9418C;">아이디</th>
							<th
								style="background-color: #eeeeee; text-align: center; color: #D9418C;">이름</th>
							<th
								style="background-color: #eeeeee; text-align: center; color: #D9418C;">제목</th>
							<th
								style="background-color: #eeeeee; text-align: center; color: #D9418C;">날짜</th>
						</tr>
					</thead>
					<tbody>


						<c:forEach var="row" items="${map.list}">
							<tr>
								<td>${row.writer}</td>
								<td>${row.username}</td>
								<td><a href="crazyboardview.do?bno=${row.bno}">${row.subject}</a></td>
								<td>${row.regdate}</td>
							</tr>
						</c:forEach>

					</tbody>
					
					<!-- 페이지 네비게이션 -->
					<tr>
						<td colspan="5" align="center">
							<!--  현재 페이지 블럭이 1보다 크면 처음 페이지로 이동 -->
							<c:if test="${map.pager.curBlock > 1 }">
								<a href="javascript:list('1')">[처음]</a>
							</c:if>
							<!-- 현재 페이지 블럭이 1보단 크면 [이전]을 출력 -->
							<c:if test="${map.pager.curBlock > 1 }">
								<a href="javascript:list('${map.pager.prevPage }')">[이전]</a>
							</c:if>
							<!--  페이지 블럭 처음부터 마지막 블러갂지 1씩 증가하는 페이지 출력 -->
							<c:forEach var= "num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd }">
								<c:choose>
									<c:when test="${num == map.pager.curPage }">
										<span style="color:#D9418C;">${num}</span>&nbsp;
									</c:when>
									<c:otherwise>
										<a href="javascript:list('${num}')">${num}</a>&nbsp;
									</c:otherwise>
								</c:choose>	
							</c:forEach>
							<!-- 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 다음페이지로 이동 -->
							<c:if test="${map.pager.curBlock <= map.pager.totBlock }">
								<a href="javascript:list('${map.pager.nextPage}')">[다음]</a>
							</c:if>
							<!-- 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 끝으로 이동 -->
							<c:if test="${map.pager.curBlock <= map.pager.totBlock }">
								<a href="javascript:list('${map.pager.totPage }')">[끝]</a>
							</c:if>
						
						
						</td>
					
					</tr>
					
					<tr>
					<c:choose>
						<c:when test="${sessionScope.userid!=null}">
						<td colspan="4"><input type="button"
							style="background-color: #D9418C" value="글쓰기"
							class="btn btn-primary pull-right"
							onclick="javascript:location.href='crazywrite.do'" /></td>
						</c:when>
					</c:choose>
					
					</tr>

				</table>
			</form>

		</div>
	</div>

</body>
</html>