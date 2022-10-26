<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<%@include file="header.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta name="author" content="KOSMO team2">
    <title>FindDoctor</title>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">  
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/style.css">
    <style>
        a:link, a:visited, a:hover, a:active {text-decoration: none;}
        #cont_cont{
           padding-top:3rem;
        }
        .column.col1{
            padding-top:3rem;
        }
        .img-tb{
            border: 1px solid #80cbc4;
        }
        .banner-container{
            width: 200px;
            height:300px;
            overflow:hidden;
          }
          .banner{
            width:calc(100vw*4);
            height:100%;
            display:flex;
            animation: animation1 10s infinite;
            /*기본 전환 animation을 위한 설정*/
            -webkit-transition: all 0.5s cubic-bezier(1, .01, .32, 1);
            -moz-transition: all 0.5s cubic-bezier(1, .01, .32, 1);
            -o-transition: all 0.5s cubic-bezier(1, .01, .32, 1);
            -ms-transition: all 0.5s cubic-bezier(1, .01, .32, 1);
            transition: all 0.5s cubic-bezier(1, .01, .32, 1);
          }
          .banner>div{
            width:200px;
            height:100%;
          }
          .banner>div:nth-child(1){
            background-color:#2E4559;
          }
          .banner>div:nth-child(2){
            background-color:#4A6D8C;
          }
          .banner>div:nth-child(3){
            background-color:#6A8AA6;
          }
          .banner>div:nth-child(4){
            background-color:#A9C6D9;
          }
          .list-button{
            width:100%;
            height:10px;
            display:flex;
            justify-content:center;
            margin-top:-30px;
            position:absolute;
            z-index:2;
          }
          .list-button-item{
            width:10px;
            height:10px;
            border-radius:5rem;
            background-color:black;
            cursor: pointer;
            display: inline-block;
            margin:6px;
          }
          .list-button-item.active{
            background-color:white;
          }
          @keyframes animation1 {
            0% {margin-left: 0}
            20% {margin-left: 0}
            25% {margin-left: -100%}
            45% {margin-left: -100%}
            50% {margin-left: -200%}
            70% {margin-left: -200%}
            75% {margin-left: -300%}
            95% {margin-left: -300%}
            100% {margin-left: 0}
          }
          @keyframes animation2 {
            0% {margin-left: -100%}
            20% {margin-left: -100%}
            25% {margin-left: -200%}
            45% {margin-left: -200%}
            50% {margin-left: -300%}
            70% {margin-left: -300%}
            75% {margin-left: 0}
            95% {margin-left: 0}
            100% {margin-left: -100%}
          }
          @keyframes animation3 {
            0% {margin-left: -200%}
            20% {margin-left: -200%}
            25% {margin-left: -300%}
            45% {margin-left: -300%}
            50% {margin-left: 0}
            70% {margin-left: 0}
            75% {margin-left: -100%}
            95% {margin-left: -100%}
            100% {margin-left: -200%}
          }
          @keyframes animation4 {
            0% {margin-left: -300%}
            20% {margin-left: -300%}
            25% {margin-left: 0}
            45% {margin-left: 0}
            50% {margin-left: -100%}
            70% {margin-left: -100%}
            75% {margin-left: -200%}
            95% {margin-left: -200%}
            100% {margin-left: -300%}
          }
    </style>
</head>
<body>
    
            <div id="cont_ban">
                <div class="ban">
                    <ul>
                    <li class="ban_img2"><img src="/img/index-bg.jpg" alt="샘플 이미지2" style="width: 100%; height:600px;"></li>
                    </ul>
                </div>
            </div>
            <form name="input" action="search/search.do">
                <div class="search_box">
                    <input type="hidden" name="addr1" value="">
                    <input type="hidden" name="addr2" value="">
                    <input type="hidden" name="addr3" value="">
                    <input type="text" id="textfiled" name="inputname" placeholder="병원명을 입력하세요.">
                    <button type="button" class="searchB" id="searchB" name="searchB" onClick="refreshPage()">검색</button>
                </div>
            </form>
            <div id="cont_cont">
                <div class="container">
                    <div class="cont">
                        <div class="column col1">
                            <ul class="tabs">
                                <li class="tab-link current" data-tab="tab-1" id="notice">공지사항</li>
                                <li class="tab-link" data-tab="tab-2" id="monthlyinfo">이달의 건강정보</li>
                                <li class="tab-link" data-tab="tab-3" id="lastreview">최신 리뷰</li>
                                <li class="tab-link" data-tab="tab-4" id="lastevent">최신 이벤트</li>
                            </ul>
                            <div id="tab-1" class="tab-content current">
                                <ul>
                                    <div class="main-current">
                                        <img src="/img/free-icon-view-more-6810473.png" style="width:10%; height:10%">
                                        <span style = "font-size:0.8em;">
                                            공지사항
                                            </span>
                                        </div>
                                        <details>
                                            <summary>08월 10일자 공지사항입니다</summary>
                                            <li>xx수정사항 개선</li>
                                            <li>xx현상 개선</li>
                                        </details>
                                        <details>
                                            <summary>08월 03일자 공지사항입니다</summary>
                                            <li>후기 게시판 기능 추가</li>
                                            <li>솔직한 후기 공유 부탁드립니다.</li>
                                        </details>
                                        <details>
                                            <summary>07월 27일자 공지사항입니다</summary>
                                            <li>파인닥터 홈페이지 개설</li>
                                            <li>많은 관심과 이용 부탁드립니다.</li>
                                        </details>
                                    </ul>
                                </div>
                                <div id="tab-2" class="tab-content">
                                    <ul>
                                        <div class="main-current" id="infotab">
                                        
                                    </ul>
                                </div>
                                <div id="tab-3" class="tab-content">
                                    <ul>
                                        <div class="main-current">
                                            <a href="review/list.do"><img src="/img/free-icon-view-more-6810473.png" style="width:10%; height:10%"></a>
                                        <span style = "font-size:0.8em;" id="span-tab-3">
                                    </ul>
                                </div>
                                <div id="tab-4" class="tab-content">
                                    <ul>
                                        <div class="main-current">
                                            <a href="event/list.do"><img src="/img/free-icon-view-more-6810473.png" style="width:10%; height:10%"></a>
                                            <span style = "font-size:0.8em;" id="span-tab-4">
                                          
                                    </ul>
                                </div>
                        </div>
                        <div class="column col2">
                            <table class="img-tb">
                                <th width="200"></th>
                            <tr><td height="300">
                                <div class="banner-container">
                                    <div class="banner" id="eventbanner">
                                    </div>
                                  </div>
                                  <div class="list-button">
                                    <span class="list-button-item active"></span> 
                                    <span class="list-button-item"></span> 
                                    <span class="list-button-item"></span> 
                                    <span class="list-button-item"></span> 
                                  </div>
                            </td></tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <script>
    $(document).ready(function(){
    		var now = new Date();	
    		var month = now.getMonth()+1;
    		
			$.ajax({
            	url: "../healthinfo.json",
            	type: "POST",
            	data: {month:month},
            	success: function(data){
            		
            		if(!data){
            			alert("오류남");
            			return false;
            		}
            		
            		
            		var html = "";
            		
            		html +='<a href="health/healthinfo.do"><img src="/img/free-icon-view-more-6810473.png" style="width:10%; height:10%" id="monthinfo"></a>';
            		html += "<span style = 'font-size:1em;'>";
            		html += month+"월의 건강정보";
            		html += "</span>";
            		html += "</div>";
            		
            		
            		if(data.length == 0){
            			html += "<li>서버 오류</li>";
            		}else{
            			/*for(let list of data){
	                		html += "<li>"+list.subject+"</li>"
            			}*/
            			/*data.forEach(function (list, index, array){
            				html += "<li>"+list.subject+"</li>"
            			});*/
            			for (let i = 0; i<3; i++){
            				html += "<li style = 'font-size:0.6em;'>"+data[i].subject+"</li>"
            			}
            		}
            		$("#infotab").html(html);
            	}
            });

    });
    $("#lastevent").on("click", function(){
    	$.ajax({
    		url: "../event.json",
        	type: "POST",
        	data: {list:1},
        	success: function(data){
        		console.log("!data위")
        		if(!data){
        			alert("오류남");
        			return false;
        		}
        		
        		console.log("var위")
        		var html = "";
        		html += '<a href="event/econtent.do?seq='+data[0].seq+'">'+data[0].event_name+'</a>';
        		html += '</span>';
        		html += '</div>';
        		
        		if(data.length == 0){
        			html += "<li>서버 오류</li>";
        		}else{
        			
            		
        			for (let i = 1; i<4; i++){
        				html += '<li style = "font-size:0.8em;"><a href="event/econtent.do?seq='+data[i].seq+'">'+data[i].event_name+'</a></li>';
        			}
        		}
        		$("#span-tab-4").html(html);
        	}
    	});
    	$.ajax({
    		url: "../event.json",
        	type: "POST",
        	data: {list:1},
        	success: function(data){
        		console.log("!data위")
        		if(!data){
        			alert("오류남");
        			return false;
        		}
        		
        		console.log("var위")
        		var html = "";
        		
        		if(data.length == 0){
        			html += "<li>서버 오류</li>";
        		}else{
        			for (let i = 0; i<4; i++){
        				y = i+1;
        				html += '<div data-index='+y+'><a href="event/econtent.do?seq='+data[i].seq+'"><img src='+data[i].img_address+' width=100%; height=100%;></a></div>';
        			}
        			
        		}
        		$("#eventbanner").html(html);
        	}
    	});
    });
    $(document).ready(function(){
    $.ajax({
		url: "../event.json",
    	type: "POST",
    	data: {list:1},
    	success: function(data){
    		console.log("!data위")
    		if(!data){
    			alert("오류남");
    			return false;
    		}
    		
    		console.log("var위")
    		var html = "";
    		
    		if(data.length == 0){
    			html += "<li>서버 오류</li>";
    		}else{
    			for (let i = 0; i<4; i++){
    				y = i+1;
    				html += '<div data-index='+y+'><a href="event/econtent.do?seq='+data[i].seq+'"><img src='+data[i].img_address+' width=100%; height=100%;></a></div>';
    			}
    			
    		}
    		$("#eventbanner").html(html);
    	}
	});
    });
    $("#lastreview").on("click", function(){
    	$.ajax({
    		url: "../review.json",
        	type: "POST",
        	data: {list:1},
        	success: function(data){
        		if(!data){
        			alert("오류남");
        			return false;
        		}
        		var html = "";
        		html += '<a href="review/rcontent.do?seq='+data[0].seq+'" onclick="views()">'+data[0].subject+'</a>';
                html += '</span>';
                html += '</div>';
                       		
        		if(data.length == 0){
        			html += "<li>서버 오류</li>";
        		}else{          		
        			for (let i = 1; i<4; i++){
        				html += '<li style = "font-size:0.8em;"><a href="review/rcontent.do?seq='+data[i].seq+'" onclick="views()">'
        						+data[i].subject+'</a></li>';
        			}
        		}
        		$("#span-tab-3").html(html);
        	}
    	});
    });
    </script>
    <script>
        let interval;
        let activeIndex = 1;

		$(document).ready(function(){
		  interval = setInterval(changeActiveIndex,2500);
			$('.list-button-item').on('click',function(){
				console.log("버튼 클릭됨")
			  	// list button의 색상 변경
			    const index = $(this).index();
			    activeIndex = index;
			    indexhundread = -(100*index);
			    indexhundread = String(indexhundread)+"%";
			    changeActiveIndex();
			    clearInterval(interval);
			    // animation 재설정을 위해 animation을 잠시 제거한다.
			    $('.banner').css('animation','none');
			   	// animation 재설정
			    $('.banner').animate({marginLeft:indexhundread},1,function(){
			    	//1초의 시간 여유(해당 이미지로 이동하는 animation을 위한 시간)를 두고 다시 animation을 설정한다.
			    	setTimeout(function(){
		    		indexx = index+1;
		    		$('.banner').css('animation','animation'+indexx+' 10s infinite')
		    		
			  		interval = setInterval(changeActiveIndex,2500);
			      }, 1000)
			    })
			  })
			})
		function changeActiveIndex(){
			if(activeIndex>3) {
		  	activeIndex%=4;
		  }
		  changeActiveBtn();
			activeIndex+=1;
		}
		function changeActiveBtn(){
		  $('.list-button-item').removeClass('active');
		  $('.list-button span:eq('+activeIndex+')').addClass('active');
		  
		}
		    </script>
		   <script>
		       function views()  {
		           const viewplus = {value : 1};
		           $.get("/team2app/review/", viewplus, function(data){});
		         }
		   </script>
		   <script>
		       $(document).ready(function(){
		
		           $('ul.tabs li').click(function(){
		               var tab_id = $(this).attr('data-tab');
		
		               $('ul.tabs li').removeClass('current');
		               $('.tab-content').removeClass('current');
		
		               $(this).addClass('current');
		               $("#"+tab_id).addClass('current');
		           })
		
		       });
	</script>
   <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
   <script type="text/javascript">
       $(document).ready(function() {           
           $("#textfiled").keydown(function(key) {
               if (key.keyCode == 13) {
                   var param = {inputname:$("#textfiled").val()};
                   $.get("/search", param, function(data) {
                   });
                   $(".styled-table").load(window.location.href + ".styled-table");
               }
           });
       });
       $("#searchB").click(function() {
           var param = {inputname:$("#textfiled").val()};
           $.get("/search", param, function(data) {
           });
           $(".styled-table").load(window.location.href + ".styled-table");
           
       });
   </script>
   <script>
       function refreshPage(){
           window.location.reload();
       } 
   </script>
    <%@include file="footer.jsp" %>
</body>
</html>