<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="/include/head.jsp" %>
  </head>
  <body>
  	<%@ include file="/include/nav.jsp" %>
  	<div class="container top-50 start-50">
      <div class="text-center fw-bold mb-3" style="font-size: 50px; margin-top: 80px">WRITE</div>
      <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-sm-12">
          <form id="form-register" method="POST" action="">
			<input type="hidden" name="act" value="write">
            <div class="mb-3">
              <label for="subject" class="form-label">제목 : </label>
              <input
                type="text"
                class="form-control"
                id="subject"
                name="subject"
                placeholder="제목..."
              />
            </div>
            <div class="mb-0">
              <label for="content" class="form-label">내용 : </label>
              <textarea class="form-control" id="content" name="content" rows="7"></textarea>
            </div>
            <div class="mb-0">
            	<div class="container">
    			<!-- Section: Timeline -->
					<section class="py-5">
  						<ul class="timeline-with-icons" id="planInner">
    			         <c:forEach var="plan" items="${plans}" varStatus="i">
    			         <li class="timeline-item mb-4">
    			         <input type="hidden" name="id${i.index}" value="${plan.contentid}">
							<span class="timeline-icon">
								${i.count}
							</span>
							<h5 class="fw-bold">${plan.title}</h5>
							<p class="text-muted mb-2 fw-bold">${plan.addr}</p>
							<input type="text" class="form-control" id="memo" name="memo${i.index}" placeholder="메모..."/>
			    		</li>
    			        </c:forEach>
  						</ul>
					</section>
					<input type="hidden" name="len" value="${plans.size()}">
				<!-- Section: Timeline -->
   	 	   		</div>
            </div>
            <div class="col-auto text-center">
              <button type="button" id="btn-register" class="btn btn-outline-primary mb-3">
                        여행계획 올리기
              </button>
              <button type="button" id="btn-list" class="btn btn-outline-danger mb-3">
                         다시 계획하기
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>

    <script>
      document.querySelector("#btn-register").addEventListener("click", function () {
        if (!document.querySelector("#subject").value) {
          alert("제목 입력!!");
          return;
        } else if (!document.querySelector("#content").value) {
          alert("내용 입력!!");
          return;
        } else {
          let form = document.querySelector("#form-register");
          form.setAttribute("action", "${root}/board");
          form.submit();
        }
      });
      
      document.querySelector("#btn-list").addEventListener("click", function () {
    	if(confirm("취소를 하시면 작성한 글은 삭제됩니다.\n취소하시겠습니까?")) {
    		location.href="javascript:history.back()"
   	    }
      });
    </script>
<%@ include file="/include/footer.jsp" %>
