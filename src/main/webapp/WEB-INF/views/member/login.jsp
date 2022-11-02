<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
    	<%@ include file="/WEB-INF/views/include/head.jsp" %>
  	</head>
  	<body>
  	<form class="position-absolute top-50 start-50 translate-middle" method="post" action="${root}/member/login" style="width:400px">
	  		<input type="hidden" name="act" value="login">
	    	<div class="text-center fw-bold" style="font-size: 50px;">LOG IN</div>
	    	<div class="mb-3 text-center text-secondary">Enjoy-Trip</div>
	    	<div class="mb-3">
	    		<label for="userid" class="form-label fs-5">아이디</label>
	        	<input
	        		type="text"
	        		class="form-control"
	        		id="email"
	          		name = "userid"
	          		style=height:45px
	       		/>
	   		</div>
	    	<div class="mb-2">
	    		<label for="userpwd" class="form-label fs-5">비밀번호</label>
	        	<input type="password" class="form-control" id="userpwd" name="userpwd" style=height:45px />
	    	</div>
	    	<a class="text-decoration-none" href="#" style="padding: 0px">비밀번호를 잊으셨나요?</a>
	    	<button type="submit" class="btn btn-outline-primary w-100 mt-4 fs-5" style=height:45px>로그인</button>
	    	<div class="mt-4 text-center">
	       		회원이 아니세요?
	        	<a class="text-decoration-none" href="${root}/member/join">회원가입하기</a>
	    	</div>
		<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	</form>
	</body>
</html>
	
