<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    <link rel="stylesheet" href="${root}/assets/css/main.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"/>
  </head>
  <body>
  	<%@ include file="/WEB-INF/views/include/nav.jsp" %>
  	<div class="container" style="margin-top: 100px">
    	<div class="text-center">
    		<h2 class="fw-bold mb-3" id="title"></h2>
    		<p class="card-text text-end mb-3"><small class="text-muted" id="viewInfo"></small></p>
    	</div>

	<div class="row mt-3">
		<div class="col-6">
			<div class="text-center fw-bold mb-3 fs-4"> <i class="fa-solid fa-circle-info text-info"></i> 여행 정보 </div>
			<div class="mb-3" id="viewcontent"></div>
			<div class="col-3 fw-bold fs-5 mb-3"> <i class="fa-solid fa-map-location-dot text-success"></i> 지도 </div>
			<div id="map" style="width: 100%; height: 400px"></div>		
		</div>
       	<div class="col-6">
       		<div class="text-center fw-bold mb-3 fs-4"> <i class="fa-solid fa-calendar-check text-info pe-1"></i> 타임라인 </div>
			<ul class="timeline-with-icons" id="viewPlan">
       		</ul>		
		</div>
	</div>
     

      	<script
        	type="text/javascript"
       		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d42d2f1100b020c18ff62f591ad32c9a"
      	></script>
    	<script>
       		var mapContainer = document.getElementById("map"), // 지도를 표시할 div
        	mapOption = {
            	center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            	level: 3 // 지도의 확대 레벨
          	};

       	 	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
        	var map = new kakao.maps.Map(mapContainer, mapOption);
      	</script>	
      	
   	</div>

    
    <script>
    let linePath = [];
    let markers = [];
	let polyline = new kakao.maps.Polyline({
	    path: linePath, // 선을 구성하는 좌표배열 입니다
	    strokeWeight: 5, // 선의 두께 입니다
	    strokeColor: '#FF0000', // 선의 색깔입니다
	    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid' // 선의 스타일입니다
	});
	fetch("/board/${id}")
    .then((response) => response.json())
    .then((data) => makeLine(data));
  

	function makeLine(data) {
		
		let title = document.querySelector("#title");
		title.innerHTML = "<i class=\"fa-solid fa-plane-departure pe-3 text-primary\"></i>" + data.subject;
		
		let info = document.querySelector("#viewInfo");
		info.innerHTML = data.userName + " / " + data.registerTime +  " / " + data.hit
		
		let content = document.querySelector("#viewcontent");
		let table = ``; 
		let contents = data.content.split("/")
		table = table + 
			`
		    <div class="row border-bottom">
		      <div class="col-3 fw-bold fs-5 p-3"> <i class="fa-solid fa-cart-flatbed text-primary"></i>  준비물 </div>
		      <div class="col-9 fs-5 p-3">\${contents[0]} </div>
		      </div>
		    <div class="row border-bottom">
		    <div class="col-3 fw-bold fs-5 p-3"> <i class="fa-solid fa-circle-exclamation text-danger"></i> 주의사항</div>
		    <div class="col-9 fs-5 p-3">\${contents[1]}</div>
		    </div>
		    <div class="row border-bottom">
		      <div class="col-3 fw-bold fs-5 p-3"> <i class="fa-regular fa-note-sticky text-warning"></i> 기타 </div>
		      <div class="col-9 fs-5 p-3">\${contents[2]}</div>
		    </div>
		  `;
		console.log(table);
		content.innerHTML = table;
		
		polyline.setMap(null);
		linePath = [];
		data.planList.forEach((plan) => {
			linePath.push(new kakao.maps.LatLng(plan.mapy, plan.mapx));
		});
		    polyline = new kakao.maps.Polyline({
		    path: linePath, // 선을 구성하는 좌표배열 입니다
		    strokeWeight: 5, // 선의 두께 입니다
		    strokeColor: '#FF0000', // 선의 색깔입니다
		    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'solid' // 선의 스타일입니다
		});
		polyline.setMap(map);
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		var imageSize = new kakao.maps.Size(24, 35); 
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		
		let sumx = 0;
		let sumy = 0;
		
		data.planList.forEach((plan) => {
			var moveLatLon = new kakao.maps.LatLng(plan.mapy, plan.mapx);
		    map.panTo(moveLatLon); 
		    var marker = new kakao.maps.Marker({
		        position: moveLatLon,
		        image : markerImage
		    });
			marker.setMap(map);
			markers.push(marker);
			sumx += Number(plan.mapy);
			sumy += Number(plan.mapx);
		});
		sumx = sumx/data.planList.length;
		sumy = sumy/data.planList.length;
		var moveLatLon = new kakao.maps.LatLng(sumx, sumy);
	    map.panTo(moveLatLon);
	    map.setLevel(7);
	    
	    let planInner = document.querySelector("#viewPlan");
		let div = ``;
		let len=0;
		data.planList.forEach((plan) => {
			div = div +
			`
				<li class="timeline-item mb-4">
					<span class="timeline-icon">
		    `;
			if(plan.contentType==32) {
				div = div + `<i class="fa-solid fa-bed fa-sm"></i>`;
			} else if(plan.contentType==12) {
				div = div + `<i class="fa-solid fa-umbrella-beach fa-sm"></i>`;
			} else if(plan.contentType==39) {
				div = div + `<i class="fa-solid fa-utensils fa-sm"></i>`;
			} else if(plan.contentType==14) {
				div = div + `<i class="fa-solid fa-building-columns fa-sm"></i>`;
			} else if(plan.contentType==38) {
				div = div + `<i class="fa-solid fa-store fa-sm"></i>`;
			} else if(plan.contentType==28) {
				div = div + `<i class="fa-solid fa-person-hiking fa-sm"></i>`;
			} else if(plan.contentType==15) {
				div = div + `<i class="fa-solid fa-map-pin fa-sm"></i>`;
			} else {
				div = div + `<i class="fa-solid fa-umbrella-beach fa-sm"></i>`;
			}
			div = div + 
			`		
			        </span>
					<h5 class="fw-bold">\${plan.title}</h5>
					<p class="text-muted mb-2 fw-bold">\${plan.addr}</p>
					<p class="mb-2 fw-bold">\${plan.memo}</p>
			    </li>
			`;
			len++;
		});
		div = div + `<input type="hidden" name="len" value="\${len}">`;
		planInner.innerHTML = div;
		
	}
	

    </script>
  </body>
</html>
  
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
