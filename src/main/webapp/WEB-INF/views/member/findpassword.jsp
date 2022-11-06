<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 프로젝트의 context 경로를 편하게 사용하기 위한 코드 --%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<html>
  <head>
    <meta charset="UTF-8">
    <title>EnjoyTrip</title>
    
    <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous"
    />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${root}/assets/css/thema.css"/>
    <link href="${root}/assets/css/signup.css" rel="stylesheet" />
		<script src="${root}/assets/js/signup.js"></script>
  

  </head>
  <body>

    <%@ include file="/WEB-INF/views/include/nav.jsp" %>
		<div class="img-banner">
			<%@ include file="/WEB-INF/views/include/background.jsp" %>
      <form
        id="content"
        method="post"
        action="${root}/member/findpassword"
        style="width: 400px"
      >
        <div class="text-center fw-bold" style="font-size: 50px">FIND PWD</div>
        <div class="mb-3 text-center text-secondary">Enjoy-Trip</div>
        <div class="mb-3">
          <label for="userid" class="form-label fs-5">아이디를 입력하세요</label>
          <input type="text" class="form-control" id="userId" style="height: 45px" />
        </div>
        <div class="mb-2">
          <div type="text" class="form-control" id="userPwd" style="height: 45px"></div>
        </div>
        <button
          type="button"
          id="btn-find"
          class="btn btn-outline-primary w-100 mt-4 fs-5"
          style="height: 45px"
        >
          비밀번호찾기
        </button>
      </form>
    </div>
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <script>
        let btn = document.querySelector("#btn-find");

        btn.addEventListener("click", function () {
          // console.log(this.parent);
          let div = document.querySelector("#userPwd");
          let userId = document.querySelector("#userId").value;
          console.log("userid :", userId);
          // fetch
          if (!userId) {
            alert("아이디 입력하십셔");
            return;
          }

      console.log(${root})
          fetch("${root}/member/findquery", {
            method: "post",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({userId:userId})
          })
            .then((response) => response.text())
            .then((data) => {
            	console.log(typeof data)
              if (data != "null") {
            	console.log(data);
                //div.textContent = "귀하의 비밀번호는"+data+ " 입니다"
                div.textContent = `귀하의 비밀번호는 \${data}입니다`
              } else {
                div.textContent = "그런 아이디 없다..";
              }
            });

        });
    </script>
  </body>
  <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"
    ></script>
<script src="https://kit.fontawesome.com/389723ec7a.js" crossorigin="anonymous"></script>
</html>
