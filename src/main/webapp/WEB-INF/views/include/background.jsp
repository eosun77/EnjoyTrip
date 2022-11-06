<link rel="stylesheet" href="${root}/assets/css/background.css">
<div id="background-img">
</div>
  
<script>
    window.addEventListener("load",function(){



        function batchImgLogic(start,num,arr){
            let wsize = Math.floor(100/(num - 2));
            let hsize = Math.floor(100/(num - 2));
            let left = Math.floor(Math.random() * 100);
            let right = Math.floor(Math.random() * 100);
            //let tan = (right - left)/100

            //step size
            let wstep = Math.floor(100/num);
            let hstep = Math.floor((right-left)/wstep);

            let wcoord = 0;
            let hcoord = left;

            let div = document.getElementById("background-img");

            for(var i =0; i<num;i++){
                //console.log(arr[i])
                let uri = arr[start + i]
                if(uri != " " && uri != ""){
                    //직선배치 . url의 앞뒤 ""제거

                    //이미지 로드가 fail..
                    console.log(uri + " good")
                    let img = document.createElement("img");
                    img.src = uri.slice(1,-1);
                    //img.loading = "lazy";
                    img.style.cssText=`
                    position:absolute;
                    width:\${wsize}%; 
                    height:\${hsize}%;
                    top:\${hcoord}%;
                    left:\${wcoord}%;
                    animation: load-img 3s;
                    `;
                    div.appendChild(img);
                    img.addEventListener("error",()=>{
                        <!-- this.src = "${root}/assets/img/noimg.png"; -->
                    })
                    hcoord += hstep;
                    wcoord += wstep;
                    console.log(hcoord + " "+wcoord);
      
                }else{
                    console.log(uri + " trash")
                    hcoord += hstep;
                    wcoord += wstep;
                }
            }

            return start + num;
        }



        function batchImg(num){
            //[top,left] : from [0,left] to [100,right] diagnol array
            //imgs [start, end) load
            // temp) num < 10;
            // url 개수: 20
            let url ="${root}/member/background";
            fetch(url)
            .then((response)=>response.text())
            .then((data)=>
            {
                var start =0;
                var arr = data.split(",").slice(1,-1)
                console.log(arr)
                //two diagnol
                start = batchImgLogic(start,num,arr)
                start = batchImgLogic(start,num,arr)
        
            })
            .catch((error)=>console.log(error))

        }
        //img
        batchImg(8);


    })
</script> 
