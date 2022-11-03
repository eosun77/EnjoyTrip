<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
  </head>
  <body>
    <form
      class="position-absolute top-50 start-50 translate-middle"
      method="post"
      action="${root}/member/findpassword"
      style="width: 400px"
    >
      <div class="text-center fw-bold" style="font-size: 50px">LOG IN</div>
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
        비밀번호찾기 ${root}
      </button>
      ${root}
    </form>
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
          fetch("\${root}/member/findquery", {
            method: "Post",
            headers: { "Content-Type": "text/plain" },
            body: userId,
          })
            .then((response) => response.text())
            .then((data) => {
              if (data) {
                div.textContent = `귀하의 비밀번호는 ${data} 입니다`;
              } else {
                div.textContent = "그런 아이디 없다..";
              }
            });

          div.textContent = "귀하의 비밀번호는 ";
        });
    </script>
  </body>
</html>
