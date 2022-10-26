<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../header.jsp" %>
<head>
     <!--전체글꼴-->
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">  
     <!--버튼-->
     <script src="/js/optionB.js" async></script>
     <link rel="stylesheet" href="/css/optionB.css">  
     <!--테이블-->  
     <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
     <link rel="stylesheet" href="/css/searchT.css">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <!--페이징-->
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
     <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
     <link rel="stylesheet" href="/css/mapl.css">
     <!--지역 select box-->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
     <style>       
         #contents {width: 100%; background: none; display: flex;}
         #cont_cont {width: 80%;  margin:0 auto;}
         #cont_tit {width: 100%; height: 100px; margin:0 auto;}
         a:link, a:visited, a:hover, a:active {text-decoration: none;}  
         .search {
             position: relative;
             width: 300px;
         }
         input {
             width: 100%;
             border: 1px solid #bbb;
             border-radius: 8px;
             padding: 10px 10px;
             font-size: 14px;
         }
         /*img {
             position : absolute;
             width: 17px;
             top: 12px;
             right: 10px;
             margin: 0;
         }*/
         .form-select{
             width: 12%;
             border: 1px solid #bbb;
             border-radius: 8px;
             padding: 10px 5px;
             font-size: 12px;
         }
         a.opertime{
             border-bottom: 1px dashed;
             text-decoration: none
         }
         a.opertime:hover{
             position: relative
         }
         a.opertime span{
             display: none
         }
         a.opertime:hover span{
             border: #c0c0c0 1px dotted;
             padding: 5px 5px 5px 5px;
             display: block;
             z-index: 100;
             left: 0px;
             margin: 10px;
             width: 130px;
             position: absolute;
             top: 10px;
             text-decoration: none
         }
		.right-box {
			  background: yellow;
			  float: right;
		}
     </style>
</head>
<body>
    <div id="cont_tit">
        <div class="title-box">
            <h2><b>지도에서 찾기</b></h2>
        </div>

    </div>
    <div id="cont_cont">
        <div class="container">
        
            <div class="search" style=" width:100%;" >
      <center>
<!-- 검색창  --><!-- 검색창  --><!-- 검색창  --><!-- 검색창  --><!-- 검색창  --><!-- 검색창  --><!-- 검색창  --><!-- 검색창  -->

		<div class="search" style="width:80%;">
		<div style="float:left; width:80%;" >
            <form action="./map.do" method="post" vertical-align="middle">
				<input type="text" name="sId" placeholder="병원명을 입력하세요." value="${sessionScope.mapKey}" style="float:left;">
				</div>
			<div >
				<input style=" width:15%; height:45px;  " type="submit" value="검색"  >
				</div>
			</form>
</center>
<!-- 검색창  --><!-- 검색창  --><!-- 검색창  --><!-- 검색창  --><!-- 검색창  --><!-- 검색창  --><!-- 검색창  --><!-- 검색창  -->
</div>
</div>


        <center>
<div id="map" style="width:80%;height:600px; float: left;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63420363e3bb2acc6f2ab79aaf0aa176"></script>

          </center> 
         
         <form id="searchForm" name="searchForm" method="post"> 
                    <input type="hidden" name="selectedValue" id="selectedValue" value="${selectedValue}">
            <div  style="display: block;background-color:#e3e3e3;width:20%;height:600px;overflow:scroll; ">
                <ul>
                <c:forEach var="i"  varStatus="Search" begin="0" end="1000">
                <li class="area white-space overflow ellipsis" ><a href="#" onclick="test1(${list[i].ypoint},${list[i].xpoint})"><c:out value="${list[i].hosname}" /></a></li>
                			 
                </c:forEach>
                </ul>
            </div>    
       </form> 
        </div>
    </div>
    
    
   <script>
   var List=[
		<c:forEach var="i"  varStatus="Search" begin="0" end="1000">
	    {
	    "hosname":"${list[i].hosname}",
	    "xpoint":"${list[i].xpoint}",
	    "ypoint":"${list[i].ypoint}"
	    },
	    </c:forEach>
	    ];
   
   
  /*  for (var i = 0; i < List.length; i++) {
	    if (List[i].xpoint === "0.0") { // 값이 같은 배열 인덱스 확인
	    	List.splice(i, 1);
	    i--
	    }
	} */
	
	
   //지도 줌해주는 곳
   //리스트에 좌표값이 없을때 경복궁 좌표중심으로 서울 보여지고 검색해서 받아온 값이 있으면 그곳 보여줌 
if (List[0].xpoint == ""){  
	var mapContainer = document.getElementById('map'),// 지도를 표시할 div  
    mapOption = {
    	 center: new kakao.maps.LatLng(37.578472 , 126.97727), // 경복궁
         level: 9 // 지도의 확대 레벨
    };
}else{
	var mapContainer = document.getElementById('map'),// 지도를 표시할 div  
    mapOption = { 
       center: new kakao.maps.LatLng(List[0].ypoint, List[0].xpoint), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };
}

    
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 

//alert(typeof List[0].xpoint);//좌표값 타입 스트링
//alert(JSON.stringify(List[0].xpoint + List[0].ypoint));
/* alert(JSON.stringify(List[0].ypoint+", "+List[0].xpoint+"  "+
		List[1].ypoint+", "+List[1].xpoint+"  "+
		List[2].ypoint+", "+List[2].xpoint+"  "+
		List[3].ypoint+", "+List[3].xpoint+"  "+
		List[4].ypoint+", "+List[4].xpoint+"  "+
		List[5].ypoint+", "+List[5].xpoint+"  "
		)); */

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < List.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: new kakao.maps.LatLng(List[i].ypoint, List[i].xpoint),  // 마커를 표시할 위치
        title : List[i].hosname, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
};

   

         function test1(ypoint,xpoint){
           
        	 if(ypoint == 0.0 || xpoint == 0.0){
        		alert("좌표값이없음") 
        	 }else{
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
            mapOption = { 
                center: new kakao.maps.LatLng(ypoint, xpoint), // 지도의 중심좌표
                level:4 // 지도의 확대 레벨
            };                
            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

            var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
        
        for (var i = 0; i < List.length; i ++) {
            
            // 마커 이미지의 이미지 크기 입니다
            var imageSize = new kakao.maps.Size(24, 35); 
            
            // 마커 이미지를 생성합니다    
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
            
            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: new kakao.maps.LatLng(ypoint,xpoint), // 마커를 표시할 위치
                title : List[i].name + "  추가 내용 넣을것" , // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                image : markerImage // 마커 이미지 
            });
        }
            
            }
         }
    </script>   
   
  
<%@include file="../footer.jsp" %>
</body>
</html>