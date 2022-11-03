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
      action="${root}/member/modify"
      style="width: 400px"
    >
      <input type="hidden" name="id" value="${userinfo.id}" />
      <div class="text-center fw-bold" style="font-size: 50px">MY PAGE</div>
      <div class="mb-3 text-center text-secondary">Enjoy-Trip</div>
      <div class="mb-3">
        <label for="userid" class="form-label fs-5">아이디</label>
        <div type="text" class="form-control" id="userId" name="userid" style="height: 45px">
          ${userinfo.userId}
        </div>
      </div>
      <div class="mb-3">
        <label for="userName" class="form-label fs-5">닉네임</label>
        <div type="text" class="form-control" id="userName" name="userName" style="height: 45px">
          ${userinfo.userName}
        </div>
      </div>
      <div class="mb-3">
        <label for="userEmail" class="form-label fs-5">이메일</label>
        <div type="text" class="form-control" id="userEmail" name="userEmail" style="height: 45px">
          ${userinfo.email}
        </div>
      </div>

      <div class="mb-3">
        <label for="addr" class="form-label fs-5">주소</label>
        <input
          type="text"
          class="form-control"
          id="addr"
          name="addr"
          style="height: 45px"
          placeholder="${userinfo.addr}"
        />
      </div>

      <div class="mb-3">
        <label for="addr2" class="form-label fs-5">상세주소</label>
        <input
          type="text"
          class="form-control"
          id="addr2"
          name="addr2"
          style="height: 45px"
          placeholder="${userinfo.addr2}"
        />
      </div>

      <div class="mb-3">
        <label for="zipCode" class="form-label fs-5">우편번호</label>
        <input
          type="text"
          class="form-control"
          id="zipCode"
          name="zipCode"
          style="height: 45px"
          placeholder="${userinfo.zipCode}"
        />
      </div>

      <button
        type="button"
        class="btn btn-outline-primary w-100 mt-4 fs-5"
        style="height: 45px"
        onclick="location.href = '${root}/member/pwdchange' "
      >
        비밀번호변경하기
      </button>
      <button
        type="button"
        class="btn btn-outline-primary w-100 mt-4 fs-5"
        style="height: 45px"
        onclick="location.href = '${root}/member/attractionchange' "
      >
        관심장소수정하기
      </button>
      <button type="submit" class="btn btn-outline-primary w-100 mt-4 fs-5" style="height: 45px">
        회원정보수정하기
      </button>
      <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </form>

    <form action="${root}/member/delete/${userinfo.id}" id="form-delete">
      <button
        type="button"
        class="btn btn-outline-primary w-100 mt-4 fs-5"
        style="height: 45px"
        id="btn-delete"
      >
        회원탈퇴
      </button>
    </form>
  </body>
  <script>
    // addr, addr2, zipCode 입력된게 없는경우 처리.
    //회원탈퇴 누를경우 : delete메서드로 삭제
    let btnDelte = document.querySelector("#btn-delete");
    btnDelte.addEventListener("click", () => {
      let form = document.querySelector("#form-delete");
      form.submit();
    });
    // => restapi로 싹 바꾸기.
  </script>
</html>
