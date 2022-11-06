<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


	<link href="${root}/assets/css/signup.css" rel="stylesheet" />
	<link href="${root}/assets/css/mainpage.css" rel="stylesheet" />
	<script src="${root}/assets/js/signup.js"></script>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
</head>
<body>
		<%@ include file="/WEB-INF/views/include/nav.jsp" %>
	<div class="img-banner">
		<%@ include file="/WEB-INF/views/include/background.jsp" %>
		

		<div id="main-title" class="d-flex justify-content-center align-items-center flex-column">
			<div>새로운 만남,<br> 새로운 장소 <br>지금 경험해보세요!</div>
			<div>
				<a class="text-decoration-none m-5" href="${root}/attraction">map</a>
				<a class="text-decoration-none m-5" href="${root}/attraction/2">map2</a> 

			</div>

		</div>
		
		<%@ include file="/WEB-INF/views/include/footer.jsp" %>	
	</div>
</body>
</html>