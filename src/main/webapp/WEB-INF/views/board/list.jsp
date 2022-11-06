<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"/>
  </head>
  <body>
  	<%@ include file="/WEB-INF/views/include/nav.jsp" %>
  	<div class="container" style="margin-top: 100px">
    	<div class="text-center">
    		<h2 class="fw-bold">여행 계획</h2>
    	</div>
    	
    	<div class="row row-cols-1 row-cols-md-4 g-4 mt-5" id="planListView">
	
		</div>
    </div>
    
    <script type="text/javascript">
    	let root = "/board";
    	
    	fetch("/board")
        .then((response) => response.json())
        .then((data) => makeList(data));
   		
    	function makeList(listArticle) {
            let tbody = ``;
            listArticle.forEach(function (article) {
              tbody += `
            	  <div class="col" onclick="goView(this)" id="\${article.articleNo}">
            	  	<div class="card h-100">
		      			<img src="\${article.firstimage}" class="card-img-top w-100" alt="..." style="height : 200px">
		      			<div class="card-body">
		        			<h5 class="card-title fw-bold">\${article.subject}</h5>
		        			<p class="card-text text-end"><small class="text-muted">\${article.userName} \${article.registerTime}</small></p>
		      			</div>
		    		</div>
		    	</div>
    					`;
            });
            document.querySelector("#planListView").innerHTML = tbody;
          }
    	
    	function goView(el) {
            id = el.getAttribute("id");
            console.log(id);
            location.href="mvview/"+id;
          }
    </script>
  </body>
</html>
  
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
