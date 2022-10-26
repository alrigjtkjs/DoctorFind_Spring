<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../header.jsp" %>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">    
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css">

    <style>
        #contents {width: 100%; background: #fff; display: flex;}
        #cont_cont {width: 53%; height: 100%; background: #dceff7;margin:0 auto;}
        #cont_tit {width: 80%; height: 100px; background: #444;margin:0 auto;text-align: center}
		.vertical_tab {float:left; width:9%; margin-left:20rem; margin-top:5rem;}
		#cont_cont .container {width: 100%; margin: 0 auto; }
		.cont {height : 100%;}
		#tab-jan {width:100%; height:100%; margin:0px;}
		.month-content{
			display: none;
			background: #ffff;
			color: #222;
			padding: 12px;
		}
		.month-content.current{
			display: inherit;	
		}
		.month-tab {
            margin-top : 2%;
			margin-bottom: 2%;
		}
		summary {
			cursor: pointer;
		  }
		
        #tab-2 img{
        vertical-align:top;
        }
        
        p{
        display:inline-block;
        }
        .nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover {
            color: #fff;
            background-color: #80cbc4;
        }
       a:link, a:visited, a:hover, a:active {text-decoration: none;}
    </style>
    
</head>
<body>
    <div><img id="healthinfo-bg" src="/img/healthinfo-bg.jpg"></div>
    <div class="title-box-center">
        <h2><b>건강정보</b></h2>
        <h5><b>#Healthy information</b></h5>
    </div>
    <div class ="vertical_tab">
        <ul class="nav nav-pills nav-stacked">
            <li class="calender active" data-tab="tab-1"><a href="#calender" data-toggle="pill" >건강캘린더</a></li>
            <li class="site" data-tab="tab-2"><a href="#site" data-toggle="pill">관련 사이트</a></li>
        </ul>
    </div>
    <form name="healthinfo" action="healthinfo" method="post">
    <div id="cont_cont">
        <div class="container">
            <div class="cont">
                <div id="tab-1" class="tab-content current">
                    <ul class="nav nav-pills">
                        <li class="tab-month active" data-tab="tab-detail" value="1"><a href="#jan" data-toggle="pill" id="1">1월</a></li>
                        <li class="tab-month" data-tab="tab-detail" value="2"><a href="#feb" data-toggle="pill" id="2">2월</a></li>
                        <li class="tab-month" data-tab="tab-detail" value="3"><a href="#mar" data-toggle="pill" id="3">3월</a></li>
                        <li class="tab-month" data-tab="tab-detail" value="4"><a href="#apr" data-toggle="pill" id="4">4월</a></li>
                        <li class="tab-month" data-tab="tab-detail" value="5"><a href="#may" data-toggle="pill" id="5">5월</a></li>
                        <li class="tab-month" data-tab="tab-detail" value="6"><a href="#jun" data-toggle="pill" id="6">6월</a></li>
                        <li class="tab-month" data-tab="tab-detail" value="7"><a href="#jul" data-toggle="pill" id="7">7월</a></li>
                        <li class="tab-month" data-tab="tab-detail" value="8"><a href="#aug" data-toggle="pill" id="8">8월</a></li>
                        <li class="tab-month" data-tab="tab-detail" value="9"><a href="#sep" data-toggle="pill" id="9">9월</a></li>
                        <li class="tab-month" data-tab="tab-detail" value="10"><a href="#oct" data-toggle="pill" id="10">10월</a></li>
                        <li class="tab-month" data-tab="tab-detail" value="11"><a href="#nov" data-toggle="pill" id="11">11월</a></li>
                        <li class="tab-month" data-tab="tab-detail" value="12"><a href="#dec" data-toggle="pill" id="12">12월</a></li>
                    </ul>
                </div>
                <div id="tab-2" class="tab-content">
                    <ul>
                        <li><a href="https://www.mfds.go.kr/index.do"><img src="https://www.g-health.kr/images/common/symbol02.gif"></a>
                        <p>
                        <a href="https://www.mfds.go.kr/index.do">식품 의약품 안전처</a><br><br>
                            소비자를 위한 의약품 정보<br>
                            일상 생활에서 약을 복용할 때 주의해야 할 사항과 함께 연령별 / 질환별 의약품 사용정보가 제공됩니다.</p>
                        </li><br>
                        <li><a href="https://www.nhis.or.kr/nhis/index.do"><img src="https://www.g-health.kr/images/common/symbol03.gif"></a>
                        <p><a href="https://www.nhis.or.kr/nhis/index.do">건강in</a><br><br>
                                의약품 정보 검색<br>
                        의약품검색, 제품식별검색, 상호작용 등 개별 약물에 대한 상세 정보를 검색할 수 있습니다.</p>
                        </li><br>
                        <li><a href="http://www.foodsafetykorea.go.kr/"><img src="https://www.g-health.kr/images/common/symbol04.gif"></a>
                        <p><a href="http://www.foodsafetykorea.go.kr/">식품나라</a><br><br>
                            (1)식생활 정보<br>
                            임신부, 영유아, 어린이, 청소년, 성인, 노인 등에 대한 맞춤형 식생활정보와 식품안전에 대한 정보가 제공됩니다.<br><br>
                            (2)건강기능식품<br>
                            건강기능식품의 섭취량, 섭취방법, 섭취 시 주의사항, 국내외제품에 대한 검색 등 건강기능식품에 대한 정보를 제공합니다.
                        </p>
                        </li><br>
                        <li><a href="http://www.nrc.go.kr/nrc/main.do"><img src="https://www.g-health.kr/images/common/symbol05.gif"></a>
                        <p><a href="http://www.nrc.go.kr/nrc/main.do">국립재활원</a><br><br>
                            장애인 재활정보<br>
                            장애인 복지제도, 교육·취업, 재활의학정보, 전국 재활병원 안내 대한 정보를 제공합니다.</p>
                        </li><br>
                    </ul>
                </div>
	        </div>
<div id="tab" class="month-tab">
	<div id="tab-detail" class="month-content current" style="white-space:pre-line;">
	<ul id="tab-detail-ul">       
	</ul>
	</div>
</div>
</div>
</div>
    </form>
    <script>
    $(document).ready(function(){
    	var now = new Date();	
    	var month = now.getMonth()+1;	
    	console.log("월 : ", month);
    	console.log("지금: ", now);
    	document.getElementById(month).click();
    });
    </script>
    <script>
        $(document).ready(function(){
            $('.vertical_tab ul li').click(function(){
                var tab_id = $(this).attr('data-tab');
                $('.vertical_tab ul li').removeClass('active');
                $('.tab-content').removeClass('current');
                $('.month-content').removeClass('current');
                $(this).addClass('active');
                $("#"+tab_id).addClass('current');
            })
        });
        $(document).ready(function(){
            $('.cont #tab-1 ul li').click(function(){
                var tab_id = $(this).attr('data-tab');
                $('.cont ul li').removeClass('active');
                $('.month-content').removeClass('current');
                $(this).addClass('active');
                $("#"+tab_id).addClass('current');
            })
        });
        $('.cont #tab-1 ul li').on('click', function(e) {
			if($(this).parent('#tab-1').length > 0) {
				console.log("상위 li");
			} else {
				var p = {value : $(this).val()};
				console.log($(this).val());
				//$.post("/health/healthinfo.do", p, function(data){});
				$.ajax({
                	url: "../health/healthinfo.json",
                	type: "POST",
                	data: {month: $(this).val()},
                	success: function(data){
                		console.log("!data위")
                		if(!data){
                			alert("오류남");
                			return false;
                		}
                		
                		console.log("var위")
                		var html = "";
                		console.log("var아래")
                		
                		if(data.length == 0){
                			html += "<li>서버 오류</li>";
                		}else{
                			for(let list of data){
		                		html += "<details>";
		                		html += "<summary><li>"+list.subject+"</li></summary><br>";
		                		html += "<li>"+list.content+"</li><br>";
		                		html += "</details><br><br>";
                			}
                		}
                		$("#tab-detail-ul").html(html);
                	}
                });
			}
		})
        
    </script>
<%@include file="../footer.jsp" %>
</body>
</html>