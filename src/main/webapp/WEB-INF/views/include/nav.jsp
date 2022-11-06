<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark shadow fixed-top" style="height: 44px">
	<div class="container">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" href="/">
					<img src="${root}/assets/img/logo.png" alt="logo" height="30px" />
				</a>
			</li>
		</ul>
	
	<c:choose>
		<c:when test="${empty userinfo}">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="${root}/member/login">로그인</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${root}/member/join">회원가입</a>
				</li>
			</ul>
		</c:when>
		<c:otherwise>
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link disabled">${userinfo.userName}님 반갑습니다.</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${root}/board/list">여행 계획 보기</a>
			    </li>
				<li class="nav-item"><a class="nav-link"
					href="#">마이페이지</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${root}/member/login">로그아웃</a>
				</li>
			</ul>
		</c:otherwise>
	</c:choose>
	</div>
	
</nav>