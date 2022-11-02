<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
  </head>
  <body>
    <form class="position-absolute top-50 start-50 translate-middle" id="form-join" method="POST" action="" style="width:400px">
        <input type="hidden" name="act" value="signup"/>
        <div class="text-center fw-bold" style="font-size: 50px;">SIGN UP</div>
        <div class="mb-3 text-center text-secondary">Enjoy-Trip</div>
        <div class="mb-3">
              <label for="username" class="form-label">이름</label>
              <input
                type="text"
                class="form-control"
                id="username"
                name="userName"
                placeholder="이름..."
                style=height:45px
              />
        </div>
        <div id="namecheck-result"></div>
        
        <div class="mb-3">
        	<label for="userid" class="form-label">아이디</label>
            <input
            	type="text"
                class="form-control"
                id="userid"
                name="userId"
                placeholder="아이디..."
                style=height:45px
              />
            </div>
            <div id="idcheck-result"></div>
            
            <div class="mb-3">
            	<label for="userpwd" class="form-label">비밀번호</label>
              	<input
                	type="password"
                	class="form-control"
                	id="userpwd"
                	name="userPwd"
               	 	placeholder="비밀번호..."
               	 	style=height:45px
              	/>
            </div>
            
            <div class="mb-3">
              	<label for="pwdcheck" class="form-label">비밀번호 확인</label>
              	<input type="password" class="form-control" id="pwdcheck" placeholder="비밀번호확인..." style=height:45px />
            </div>
            <div class="mb-3">
              	<label for="emailid" class="form-label">이메일</label>
              	<div class="input-group">
                	<input
                  		type="text"
                  		class="form-control"
                  		id="emailid"
                  		name="email"
                  		placeholder="이메일아이디"
                  		style=height:45px
                	/>
<!--                 <span class="input-group-text">@</span>
                <select
                  	class="form-select"
                  	id="emaildomain"
                  	name="emailDomain"
                  	aria-label="이메일 도메인 선택"
                  	style=height:45px
                >
               		<option selected>선택</option>
                  	<option value="ssafy.com">ssafy.com</option>
                  	<option value="google.com">google.com</option>
                  	<option value="naver.com">naver.com</option>
                  	<option value="kakao.com">kakao.com</option>
                </select> -->
              </div>
            </div>
            <div id="emailcheck-result"></div>
            
            <div class="col-auto text-center">
              	<button type="button" class="btn btn-outline-primary w-100 mt-4 fs-5" id="btn-join" style=height:45px>회원가입</button>
      			<a class="btn btn-primary w-100 mt-4 fs-5" style=height:45px href="/">홈으로</a>
            </div>
    	</form>
    	
    	<script>
	    	let isUseId = false;
	    	let isUseName = false;
	    	
	    	
		    document.querySelector("#userid").addEventListener("keyup", function () {
		    	let userid = this.value;
		    	let resultDiv = document.querySelector("#idcheck-result");
		    	if(userid.length < 6 || userid.length > 16) {
		    		resultDiv.setAttribute("class", "mb-3 text-dark");
		    		resultDiv.textContent = "아이디는 6자 이상 16자 이하 입니다.";
		    		isUseId = false;
		    	} else {
		    		fetch("${root}/member/id/" + userid)
		    		.then(response => response.text())
		    		.then(data => {
		    			if(data == 0) {
		    				console.log(data);
			    			resultDiv.setAttribute("class", "mb-3 text-primary");
			    		    resultDiv.textContent = userid + "는 사용할 수 있습니다.";
			    		    isUseId = true;
			    		} else {
			    			resultDiv.setAttribute("class", "mb-3 text-danger");
			      		    resultDiv.textContent = userid + "는 사용할 수 없습니다.";
			      		    isUseId = false;
			    		}
		    		});
		    	}
		    });
		    
		    document.querySelector("#userName").addEventListener("keyup", function () {
		    	let userName = this.value;
		    	let resultDiv = document.querySelector("#namecheck-result");
		    	if(userName.length > 6) {
		    		resultDiv.setAttribute("class", "mb-3 text-dark");
		    		resultDiv.textContent = "이름은 한글 6자 이하, 영어 12자 이하입니다.";
		    		isUseId = false;
		    	} else {
		    		fetch("${root}/member/name/" + userName)
		    		.then(response => response.text())
		    		.then(data => {
		    			if(data == 0) {
		    				console.log(data);
			    			resultDiv.setAttribute("class", "mb-3 text-primary");
			    		    resultDiv.textContent = userName + "는 사용할 수 있습니다.";
			    		    isUseName = true;
			    		} else {
			    			resultDiv.setAttribute("class", "mb-3 text-danger");
			      		    resultDiv.textContent = userName + "는 사용할 수 없습니다.";
			      		    isUseName = false;
			    		}
		    		});
		    	}
		    });
		    
		    
/* 		    document.querySelector("#userid").addEventListener("keyup", function () {
		    	let userid = this.value;
		    	let resultDiv = document.querySelector("#idcheck-result");
		    	if(userid.length < 6 || userid.length > 16) {
		    		resultDiv.setAttribute("class", "mb-3 text-dark");
		    		resultDiv.textContent = "아이디는 6자 이상 16자 이하 입니다.";
		    		isUseId = false;
		    	} else {
		    		fetch("${root}/member/" + userid)
		    		.then(response => response.text())
		    		.then(data => {
		    			if(data == 0) {
		    				console.log(data);
			    			resultDiv.setAttribute("class", "mb-3 text-primary");
			    		    resultDiv.textContent = userid + "는 사용할 수 있습니다.";
			    		    isUseId = true;
			    		} else {
			    			resultDiv.setAttribute("class", "mb-3 text-danger");
			      		    resultDiv.textContent = userid + "는 사용할 수 없습니다.";
			      		    isUseId = false;
			    		}
		    		});
		    	}
		    }); */
		   
		    
		    document.querySelector("#btn-join").addEventListener("click", function () {
		        if (!document.querySelector("#username").value) {
		          alert("이름 입력!!");
		          return;
		        } else if (!document.querySelector("#userid").value) {
		          alert("아이디 입력!!");
		          return;
		        } else if (!document.querySelector("#userpwd").value) {
		          alert("비밀번호 입력!!");
		          return;
		        } else if (document.querySelector("#userpwd").value != document.querySelector("#pwdcheck").value) {
		          alert("비밀번호 확인!!");
		          return;
		        } else if (!isUseId) {
		          alert("아이디 확인!!");
		          return;
		        } else if(!isUseName){
		        	alert("이름 확인!!");
		        	return;
		        }
		        else {
		          let form = document.querySelector("#form-join");
		          form.setAttribute("action", "${root}/member/join");
		          form.submit();
		        }
		   });
	    </script>
  
    	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	</body>
</html>
