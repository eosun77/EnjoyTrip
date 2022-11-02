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
<div class="row" style="margin-top: 50px">
	<div class="col-1"></div>
    <div class="col-8">
    	<div id="map" style="width: 100%; height: 510px"></div>
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

    
	    <div oncontextmenu="return false" class="snippet-body">
	      <section>
	        <div class="container pt-1">
	          <div class="row">
	            <div class="col-9" style="height: 45px">
	              <div class="input-group rounded w-25 d-inline-flex mr-2">
	                <input
	                  type="text"
	                  class="form-control rounded"
	                  placeholder="Search"
	                  aria-label="Search"
	                  aria-describedby="search-addon"
	                  id="attractionSearch"
	                  onkeyup="keyEvent()"
	                />
	                <span class="input-group-text border-0" id="search-addon">
	                  <i class="fas fa-search"></i>
	                </span>
	              </div>
	              <button
	                type="button"
	                class="btn btn-danger btn-circle"
	                data-bs-toggle="tooltip"
	                title="숙소"
	                id="bed_btn"
	              >
	                <i class="fa-solid fa-bed fa-lg"></i>
	              </button>
	              <button
	                type="button"
	                class="btn btn-warning btn-circle"
	                data-bs-toggle="tooltip"
	                title="관광지"
	                id="tour_btn"
	              >
	                <i class="fa-solid fa-umbrella-beach fa-lg"></i>
	              </button>
	              <button
	                type="button"
	                class="btn btn-success btn-circle"
	                data-bs-toggle="tooltip"
	                title="맛집"
	                id="rest_btn"
	              >
	                <i class="fa-solid fa-utensils fa-lg"></i>
	              </button>
	              <button
	                type="button"
	                class="btn btn-info btn-circle"
	                data-bs-toggle="tooltip"
	                title="미술관"
	                id="museum_btn"
	              >
	                <i class="fa-solid fa-building-columns fa-lg"></i>
	              </button>
	              <button
	                type="button"
	                class="btn btn-primary btn-circle"
	                data-bs-toggle="tooltip"
	                title="시장"
	                id="market_btn"
	              >
	                <i class="fa-solid fa-store fa-lg"></i>
	              </button>
	              <button
	                type="button"
	                class="btn btn-dark btn-circle"
	                data-bs-toggle="tooltip"
	                title="스포츠"
	                id="sports_btn"
	              >
	                <i class="fa-solid fa-person-hiking fa-lg"></i>
	              </button>
	              <button
	                type="button"
	                class="btn btn-secondary btn-circle"
	                data-bs-toggle="tooltip"
	                title="축제"
	                id="fest_btn"
	              >
	                <i class="fa-solid fa-map-pin fa-lg"></i>
	              </button>
	            </div>
	
	            <div class="col-3 text-end" style="height: 45px">
	              <a
	                class="btn mb-3 mr-1"
	                href="#carouselExampleControls"
	                role="button"
	                data-bs-slide="prev"
	              >
	                <i class="fa-solid fa-chevron-left"></i>
	              </a>
	              <a
	                class="btn mb-3"
	                href="#carouselExampleControls"
	                role="button"
	                data-bs-slide="next"
	              >
	                <i class="fa-solid fa-chevron-right"></i>
	              </a>
	            </div>
	            <div class="col-12">
	              <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
	              	<div class="carousel-inner" id="cInner">
	              	<!-- 사진들어가요 -->
	              	</div>
	              </div>
	            </div>
	          </div>
	        </div>
	      </section>
	    </div>
    </div>
    <div class="col-2 card text-dark bg-light mb-3">
    	<h4 class="card-title text-center mt-3 fw-bold me-1"> <img src="${root}/assets/img/airplane.png" alt="logo" height="40px" width="40px"/>여행 플래너</h4>
    	<div id="planInner">
    		<!-- 여행 계획 -->
    	</div>
    	<div class="text-end me-1	">
			<button type="button"
                class="btn btn-outline-primary"
                data-bs-toggle="modal"
                data-bs-target="#registerModal"
                onclick="makeWriteModal()">저장</button>
  		</div>
    </div>
</div>

	<!-- modal -->
	<div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" id="detailInner">
  		
  		</div>
	</div>

    <!-- 회원 등록 Modal -->
    <div
      class="modal fade"
      id="registerModal"
      data-bs-backdrop="static"
      data-bs-keyboard="false"
      tabindex="-1"
      aria-labelledby="staticBackdropLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">나의 여행계획</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
           	<div class="mb-3" id="writeImg">
            
            </div>
  			<ul class="timeline-with-icons" id="writePlan">
    			
  			</ul>
          </div>
      	</div>
      </div>
    </div>
  
  <!-- 각 버튼 이벤트 리스너 -->
  <script>
  let plans = [];
  
  let nowCocontentTypeId= 32;
  let sigungucode = 1;
  let areacode = 1;
  let attractionSearch = "";
  
  window.onload = function () {
	  cinit(nowCocontentTypeId);
  }

  document.querySelector("#bed_btn").addEventListener("click", function () {
	 nowCocontentTypeId = 32;
	 cinit(nowCocontentTypeId);
  });
  
  document.querySelector("#tour_btn").addEventListener("click", function () {
	  nowCocontentTypeId = 12;
	  cinit(nowCocontentTypeId);
  });
  
  document.querySelector("#rest_btn").addEventListener("click", function () {
	  nowCocontentTypeId = 39;
	  cinit(nowCocontentTypeId);
  });
  
  document.querySelector("#museum_btn").addEventListener("click", function () {
	  nowCocontentTypeId = 14;
	  cinit(nowCocontentTypeId);
  });
  
  document.querySelector("#market_btn").addEventListener("click", function () {
	  nowCocontentTypeId = 38;
	  cinit(nowCocontentTypeId);
  });
  
  document.querySelector("#sports_btn").addEventListener("click", function () {
	  nowCocontentTypeId = 28;
	  cinit(nowCocontentTypeId);
  });
  
  document.querySelector("#fest_btn").addEventListener("click", function () {
	  nowCocontentTypeId =15;
	  cinit(nowCocontentTypeId);
  });
  
  // 검색
  function keyEvent() {
	  cinit(nowCocontentTypeId);
	  attractionSearch = document.querySelector("#attractionSearch").value;
  }
  
  function cinit(nowCocontentTypeId) {
	 let cInner = document.querySelector("#cInner");
	 while (cInner.firstChild) {
		 cInner.firstChild.remove();
	 }
	 fetch("${root}/attraction/plan?contentTypeId="+nowCocontentTypeId+"&areaCode="+areacode +"&sigunguCode="+sigungucode + "&attractionSearch=" + attractionSearch)
		 .then((response) => response.json())
		 .then((data) => makeList(data));
  }
 
  
	function makeList(data) {
	  console.log(data);
	  let cnt = 0;
	  var moveLatLon = new kakao.maps.LatLng(data[0].mapy, data[0].mapx);
	  map.panTo(moveLatLon); 
	  data.forEach((item) => {
	    if (item.firstimage) {
	      let cInner = document.querySelector("#cInner");
	      let cItem;
	      let cItem_row;
	      if (cnt % 4 == 0) {
	        cItem = document.createElement("div");
	        if (cnt == 0) {
	          cItem.setAttribute("class", "carousel-item active");
	        } else {
	          cItem.setAttribute("class", "carousel-item");
	        }
	        cItem.setAttribute("id", "cItem_" + parseInt(cnt / 4));

	        cItem_row = document.createElement("div");
	        cItem_row.setAttribute("class", "row");
	        cItem_row.setAttribute("id", "row_" + parseInt(cnt / 4));
	      } else {
	        cItem = document.querySelector("#cItem_" + parseInt(cnt / 4));
	        cItem_row = document.querySelector("#row_" + parseInt(cnt / 4));
	      }
	      cnt++;

	      let cItem_row_col = document.createElement("div");
	      cItem_row_col.setAttribute("class", "col-md-3 mb-3");
	      cItem_row_col.setAttribute("data-x", item.mapy);
	      cItem_row_col.setAttribute("data-y", item.mapx);
	      cItem_row_col.setAttribute("name", "cItem");

	      let cItem_row_col_card = document.createElement("div");
	      cItem_row_col_card.setAttribute("class", "card");

	      let cItem_row_col_card_img = document.createElement("img");
	      cItem_row_col_card_img.setAttribute("class", "img-fluid");
	      cItem_row_col_card_img.setAttribute("alt", "100%x280");
	      cItem_row_col_card_img.setAttribute("src", item.firstimage);
	      cItem_row_col_card_img.setAttribute("style", "height : 190px");
	      

	      let cItem_row_col_card_infoBtn = document.createElement("button");
	      cItem_row_col_card_infoBtn.setAttribute("class", "btn btn-circle btn-info btn-sm");
	      cItem_row_col_card_infoBtn.setAttribute("style", "position: absolute; top: 8px; left:8px;");
	      cItem_row_col_card_infoBtn.setAttribute("data-bs-toggle", "modal");
	      cItem_row_col_card_infoBtn.setAttribute("data-bs-target", "#detailModal");
	      cItem_row_col_card_infoBtn.setAttribute("name", "info");
	      cItem_row_col_card_infoBtn.setAttribute("data-contentid", item.contentid);


	      let cItem_row_col_card_infoBtn_infoicon = document.createElement("i");
	      cItem_row_col_card_infoBtn_infoicon.setAttribute("class", "fa-solid fa-info");

	      let cItem_row_col_card_addBtn = document.createElement("button");
	      cItem_row_col_card_addBtn.setAttribute("class", "btn btn-circle btn-success btn-sm");
	      cItem_row_col_card_addBtn.setAttribute("style", "position: absolute; top: 8px; left:46px;");
	      cItem_row_col_card_addBtn.setAttribute("name", "add");
	      cItem_row_col_card_addBtn.setAttribute("data-title", item.title);
	      cItem_row_col_card_addBtn.setAttribute("data-addr", item.addr);
	      cItem_row_col_card_addBtn.setAttribute("data-mapx", item.mapx);
	      cItem_row_col_card_addBtn.setAttribute("data-mapy", item.mapy);
	      cItem_row_col_card_addBtn.setAttribute("data-contentid", item.contentid);
	      cItem_row_col_card_addBtn.setAttribute("data-firstimage", item.firstimage);
	      
	      let cItem_row_col_card_addBtn_addicon = document.createElement("i");
	      cItem_row_col_card_addBtn_addicon.setAttribute("class", "fa-solid fa-plus");

	      let cItem_row_col_card_body = document.createElement("div");
	      cItem_row_col_card_body.setAttribute("class", "card-body");
	      cItem_row_col_card_body.setAttribute("style", "height : 100px");

	      let cItem_row_col_card_body_title = document.createElement("h4");
	      cItem_row_col_card_body_title.setAttribute("class", "card-title");
	      cItem_row_col_card_body_title.setAttribute("name", "title");
	      cItem_row_col_card_body_title.appendChild(document.createTextNode(item.title));

	      let cItem_row_col_card_body_text = document.createElement("p");
	      cItem_row_col_card_body_text.setAttribute("class", "card-text");
	      cItem_row_col_card_body_text.appendChild(document.createTextNode(item.addr));

	      cItem_row_col_card_addBtn.appendChild(cItem_row_col_card_addBtn_addicon);
	      cItem_row_col_card_infoBtn.appendChild(cItem_row_col_card_infoBtn_infoicon);
	      cItem_row_col_card_body.appendChild(cItem_row_col_card_body_title);
	      cItem_row_col_card_body.appendChild(cItem_row_col_card_body_text);
	      cItem_row_col_card.appendChild(cItem_row_col_card_img);
	      cItem_row_col_card.appendChild(cItem_row_col_card_infoBtn);
	      cItem_row_col_card.appendChild(cItem_row_col_card_addBtn);
	      cItem_row_col_card.appendChild(cItem_row_col_card_body);
	      cItem_row_col.appendChild(cItem_row_col_card);
	      cItem_row.appendChild(cItem_row_col);
	      cItem.appendChild(cItem_row);
	      cInner.appendChild(cItem);
	    }
	  });
	  
	  // 모달
	  const infos = document.querySelectorAll('[name="info"]');
	  infos.forEach((info) => {
		    info.addEventListener("click", function () {
			    let id = info.getAttribute("data-contentid");
			    fetch(`${root}/attraction/plan/\${id}`)
			    .then(response => response.json())
				.then(data => makeDetailModal(data))
			});
	  });
    
	  // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	  const adds = document.querySelectorAll('[name="add"]');
	  adds.forEach((add) => {
	    add.addEventListener("click", function () {
	    	let flag = true;
	    	for(let i=0;i<plans.length;i++) {
	    		if(plans[i].title==add.getAttribute("data-title")) {
	    			flag = false;
	    		}
	    	}
	    	if(flag) {
	    		let plan = {
		    			title : add.getAttribute("data-title"),
		    			addr : add.getAttribute("data-addr"),
		    			image : add.getAttribute("data-firstimage"),
		    			mapx : add.getAttribute("data-mapy"),
		    			mapy : add.getAttribute("data-mapx"),
		    			contentid : add.getAttribute("data-contentid"),
		    			contentType : nowCocontentTypeId
		    	};
		    	plans.push(plan);
		    	makePlanner();
		    	makeMarker();
		    	makeLine();
	    	} else {
	    		alert("이미 추가한 장소입니다.");
	    	}
	    });
	});
	}
	
	function makeDetailModal(data) {
		console.log(data);
    	let list =`
    		<div class="card mb-3">
    		  <img src=\${data.firstimage} class="card-img-top" alt="img">
    		  <div class="card-body">
    		    <h5 class="card-title">\${data.title}</h5>
    		    <p class="card-text"><small class="text-muted">\${data.addr}</small></p>
    		    <p class="card-text">\${data.overview}</p>
    		  </div>
    		</div>
			    `;
		document.querySelector("#detailInner").innerHTML = list;
	}
	
	function makeWriteModal() {
		console.log(plans);
		document.querySelector("#writeImg").innerHTML = 
			` <img src=\${plans[0].image} alt="img" style="height : 300px; width:100%"> `;
		let div = ``;
		let len=0;
		plans.forEach((plan) => {
			div = div +
			`
				<li class="timeline-item mb-4">
			    <input type="hidden" name="contentid\${len}" value="\${plan.contentid}">
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
					<input type="text" class="form-control" id="memo" name="memo${i.index}" placeholder="메모..."/>
			    </li>
			`;
			len++;
		});
		div = div + `<input type="hidden" name="len" value="\${len}">`;
		document.querySelector("#writePlan").innerHTML = div;		
	}
	
	let linePath = [];
	let polyline = new kakao.maps.Polyline({
	    path: linePath, // 선을 구성하는 좌표배열 입니다
	    strokeWeight: 5, // 선의 두께 입니다
	    strokeColor: '#FF0000', // 선의 색깔입니다
	    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid' // 선의 스타일입니다
	});
	
	function makeLine() {
		polyline.setMap(null);
		linePath = [];
		plans.forEach((plan) => {
			linePath.push(new kakao.maps.LatLng(plan.mapx, plan.mapy));
		});
		    polyline = new kakao.maps.Polyline({
		    path: linePath, // 선을 구성하는 좌표배열 입니다
		    strokeWeight: 5, // 선의 두께 입니다
		    strokeColor: '#FF0000', // 선의 색깔입니다
		    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'solid' // 선의 스타일입니다
		});
		polyline.setMap(map);
	}
	
	let markers = [];
	function makeMarker() {
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		var imageSize = new kakao.maps.Size(24, 35); 
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		plans.forEach((plan) => {
			console.log(plan);
			var moveLatLon = new kakao.maps.LatLng(plan.mapx, plan.mapy);
		    map.panTo(moveLatLon); 
		    var marker = new kakao.maps.Marker({
		        position: moveLatLon,
		        image : markerImage
		    });
			marker.setMap(map);
			markers.push(marker);
		});
	}
	
	function makePlanner() {
		console.log(plans);
		let planInner = document.querySelector("#planInner");
		let div = ``;
		let len=0;
		plans.forEach((plan) => {
			div = div +
			`
				<div class="card mb-3" style="width: 300px; height: 100px">
 			 		<div class="row g-0">
    					<div class="col-md-4">
      						<img src="\${plan.image}" class="img-fluid rounded-start" alt="..." style="height: 99px; width:100%">
    					</div>
    					<div class="col-md-8">
      						<div class="card-body">
        						<div class="card-title fw-bold">\${plan.title}</div>
      						</div>
      						<div class="text-end me-3">
							<button class="btn btn-circle btn-primary btn-ssm mb-1" name = "up" data = "\${plan.title}">
								<i class="fa-solid fa-chevron-up"></i>
							</button>
							<button class="btn btn-circle btn-primary btn-ssm mb-1" name = "down" data = "\${plan.title}">
								<i class="fa-solid fa-chevron-down"></i>
							</button>
							<button class="btn btn-circle btn-danger btn-ssm mb-1" name = "delete" data = "\${plan.title}">
								<i class="fa-solid fa-x"></i>
							</button>
						</div>
    					</div>
  					</div>
				</div>
		    `;
		});
		planInner.innerHTML = div;
		
		const btnXs = document.querySelectorAll('[name="delete"]');
		btnXs.forEach((btnX) => {
			btnX.addEventListener("click", function () {
				deletePlan(btnX.getAttribute("data"));
		  });
		});
		
		 const btnUps = document.querySelectorAll('[name="up"]');
		 btnUps.forEach((btnUp) => {
		    btnUp.addEventListener("click", function () {
		        upPlan(btnUp.getAttribute("data"));
		    });
		 });
		 
		 const btnDowns = document.querySelectorAll('[name="down"]');
	     btnDowns.forEach((btnDown) => {
	        btnDown.addEventListener("click", function () {
	        	downPlan(btnDown.getAttribute("data"));
			});
		 });
	}
	
	function downPlan(data) {
		for(var i = 0; i < plans.length-1; i++){ 
			if (plans[i].title == data) { 
				let temp = plans[i];
				plans[i] = plans[i+1];
				plans[i+1] = temp;
				break;
			}
		}
		makePlanner();
		makeLine();
	}
	
	function upPlan(data) {
		for(var i = 1; i < plans.length; i++){ 
			if (plans[i].title == data) { 
				let temp = plans[i];
				plans[i] = plans[i-1];
				plans[i-1] = temp;
				break;
			}
		}
		makePlanner();
		makeLine();
	}
	
	function deletePlan(data) {
		polyline.setMap(null);
		for(var i = 0; i < plans.length; i++){ 
			if (plans[i].title == data) { 
			   plans.splice(i, 1); 
			   i--; 
			}
		}
		makePlanner();
		resetMarkers();
		makeMarker();
		makeLine();
	}

	
	function resetMarkers() {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i].setMap(null);
	    }
	    makers = [];
	}
	

  </script>
  
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
