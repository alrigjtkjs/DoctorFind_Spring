<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../header.jsp" %>
<head>
	<meta charset="utf-8">
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
    <!--지역 select box-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/js/region.js" async></script>
    
    
    
    
    <!-- 지역/주소 검색 -->
    <!-- 
    <script>
    	$(function(){
    		$("#inputname").keydown(function(key) {
                if (key.keyCode == 13) {
                    $("#searchB").click();
                }
            });
    		$("#searchB").on("click", function(){
    			var addr1 = $('#addressRegion1 option:selected').val();
            	var addr2 = $('#addressDo1 option:selected').val();
            	var name = $("#inputname").val();
            	//var cp = $("#newcp").text();
                console.log("addr1: "+addr1);
                console.log("addr2: "+addr2);
                //console.log("cp: "+cp);
                
                console.log("name: "+name);
                if((addr1 != '')&(addr2 == '')){
                	alert("시/도를 선택해주세요.");
                }else{
	    			$.ajax({
	    				 url: "../search/search01.json", 
	                     type: "POST", 
	                     data: {
	                    	 name: $("#inputname").val(),
	                    	 addr1: $("#addressRegion1").find(":selected").text(),
	                    	 addr2: $("#addressDo1").find(":selected").text(),
	                    	 addr3: $("#addressSiGunGu1").find(":selected").text(),
	                    	 //cp: cp
	                    	 }, 
	                     
	                     success: function(data){
	                    	 alert("데이터전송성공");
	                    	 alert(data.list.hosname);
	                    	 //var y = "Y";
	                    	 //var n = "N";
	                    	 var today = $("#today").val();
	                    	 var html = "";

	                    	 if(data.list.length == 0){
	                    		 alert("data없음");
	                             html += "<tr>";
	                             html += "<tr><td colspan='6' id='infomsg' style='text-align:center'>검색어를 입력해주세요.</td></tr>";
	                             html += "</tr>";
	                          }else{
	                        	  for(let x of data.list){
	                        		  html += "<tr class='tr_visible'>";
	                        		  html += "<td>"+x.hosname+"</td>";
	                        		  if(today==2){
	                        			  html += "<td><a href='' class='opertime'>"+x.mon;
	                        		  }else if(today==3){
	                        			  html += "<td><a href='' class='opertime'>"+x.tue;
	                        		  }else if(today==4){
	                        			  html += "<td><a href='' class='opertime'>"+x.wed;
	                        		  }else if(today==5){
	                        			  html += "<td><a href='' class='opertime'>"+x.thur;
	                        		  }else if(today==6){
	                        			  html += "<td><a href='' class='opertime'>"+x.fri;
	                        		  }else if(today==7){
	                        			  html += "<td><a href='' class='opertime'>"+x.sat;
	                        		  }else if(today==1){
	                        			  html += "<td><a href='' class='opertime'>";
	                        		  }
	                        		  html += "<span style='background-color:white'>"+x.mon+"<br>"+x.tue+"<br>"+x.wed+"<br>"+x.thur+"<br>"+x.fri+"<br>"+x.sat+"</span></a></td>";
	                        		  html += "<td>"+x.addr+"</td>";
	                        		  html += "<td>"+x.tel+"</td>";
	                        		  html += "<td style='text-align: center;'><a href='/member/book.do'>예약</a></td>";
	                        		  
	                        		  html += "<td style='text-align: center;'><a href='' class='look' id='look'>보기</a><a href='' class='fold' id='fold' style='display:none'>접기</a></td>";    
	                        		  html += "</tr>";
	                        		  html += "<tr class='detail' id='detail' style='display:none'>";
	                        		  html += "<td></td>";
	                        		  html += "<td>✔"+x.mon+"<br>✔"+x.tue+"<br>✔"+x.wed+"<br>✔"+x.thur+"<br>✔"+x.fri+"<br>✔"+x.sat+"</td>";
	                        		  html += "<td>";
	                        		  html += "<ul>";
	                        		  html += "<li>◆ 홈페이지: <a href='"+x.url+"'>"+x.url+"</a></li>";
	                        		  html += "<li>◆ 진료과목: "+x.subject+"</li>";
	                        		  html += "<li>◆ 총 의사수: "+x.doctors+"명</li>";
	                        		  
	                        		  if(x.emgday=='Y'){
	                        			  html += "<li>◆ 응급실 주간운영: O</li>";
	                        		  }else if(x.emgday=='N'){
	                        			  html += "<li>◆ 응급실 주간운영: X</li>";
	                        		  }else{
	                        			  html += "<li>◆ 응급실 주간운영: -</li>";
	                        		  }
	                        		  
	                        		  if(x.emgnight=='Y'){
	                        			  html += "<li>◆ 응급실 야간운영: O</li>";
	                        		  }else if(x.emgnight=='N'){
	                        			  html += "<li>◆ 응급실 야간운영: X</li>";
	                        		  }else{
	                        			  html += "<li>◆ 응급실 야간운영: -</li>";
	                        		  }
	      
	              					  html += "<li>◆ 일요일 진료안내: "+x.sunDoff+"</li>";
	              					  html += "<li>◆ 공휴일 진료안내: "+x.holyoff+"</li>";
	              					  html += "</ul>";
	              					  html += "</td>";
	              					  html += "<td></td>";
	              					  html += "<td></td>";
	              					  html += "<td></td>";
	              					  html += "</tr>";
	                        	  }
	                          }
	                    	 $("#content").html(html);
	                     }
	    			});
                }
    		});
    		
    		$("#newcp").on("click", function(){
    			var cp = $("#newcp").text();
    			console.log("cp: "+cp);
    			
    			$.ajax({
   				 url: "../search/search02.json", 
                    type: "GET", 
                    data: {
                   	 name: $("#inputname").val(),
                   	 addr1: $("#addressRegion1").find(":selected").text(),
                   	 addr2: $("#addressDo1").find(":selected").text(),
                   	 addr3: $("#addressSiGunGu1").find(":selected").text(),
                   	 cp: cp
                   	 }, 
                    
                    success: function(data){
                    	alert("페이징클릭");
                    }
    			});
    		});
    		
    	});
    </script>
     -->
    
    <style>       
        #contents {width: 100%; display: flex;}
        #cont_cont {width: 80%; margin:0 auto;}
        #cont_tit {width: 100%; height: 100px; margin:0 auto; margin:3rem;}
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
            font-size: 13px;
            margin: 0 0 10px;
        }
        #addressRegion1,#addressDo1,#addressSiGunGu1{
            width: 13%;
            border: 1px solid #bbb;
            border-radius: 8px;
            padding: 10px 10px;
            font-size: 13px;
            margin: 0 0 10px;
        }
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
            width: 120px;
            position: absolute;
            top: 10px;
            text-decoration: none
        }
        .page-item.active .page-link {
            background-color: #96d4ce;
            border-color: #96d4ce;
        }
        
    </style>
</head>
<body>
    <div id="cont_tit">
        <div class="title-box">
            <h2><b>세부 조건별 찾기</b></h2>
        </div>
    </div>
    
    <div id="cont_cont">
        
        <div class="container">
            <center>
			<form name="f" action="search.do">
	            <div class="region">
	                <select name="addr1" id="addressRegion1" onchange="selectitem(this)"></select>
	                <select name="addr2" id="addressDo1" onchange="selectitem(this)"></select>
	                <select name="addr3" id="addressSiGunGu1" onchange="selectitem(this)"></select>
	                <div class="search" style="display:inline-block">
	                    
	                    <input type="text" id="inputname" name="inputname" placeholder="병원명을 입력하세요." value="${keyword}">
	                    
	                </div>
	                <button class="btn btn-info" type="button" class="searchB" id="searchB" name="searchB">검색</button>
	            	<input type="hidden" name="cp" value="1"/>
	            </div>
	           
	            </center>
	            <center>
	            <div class="detail_check">
	                <div class="option" id="option1">진료중</div>
	                <div class="option" id="option2">야간진료(18시이후)</div>
	                <div class="option" id="option3">공휴일진료</div>
	                <div class="option" id="option4">응급실주간</div>
	                <div class="option" id="option5">응급실야간</div>
	            </div>
            </form>
        </center>
        <!--  <input type="hidden" id="today" value="${today}"/>-->
        <table class="styled-table" style="margin-left: auto; margin-right: auto;">
                <thead>
                    <tr style="text-align: center;">
                        <th>병원명</th>
                        <th>진료시간</th>
                        <th>주소</th>
                        <th>전화번호</th>
                        <th>예약</th>
                        <th>자세히</th>
                    </tr>
                </thead>
                
                
                <tbody>
                <c:choose>
                <c:when test="${empty listResult}">
                <tr><td colspan="6" id="infomsg" style="text-align:center">검색어를 입력해주세요.</td></tr></c:when>
                <c:otherwise>
                    <c:forEach items="${listResult.list}" var="x">
                    <tr class="tr_visible">
                        <td>${x.hosname}</td>
                        <td>
                        <c:choose>
                        <c:when test="${today eq 2}">
                        <a href="" class="opertime">${x.mon}</c:when>
                        <c:when test="${today eq 3}">
                        <a href="" class="opertime">${x.tue}</c:when> 
                        <c:when test="${today eq 4}">
                        <a href="" class="opertime">${x.wed}</c:when>
                        <c:when test="${today eq 5}">
                        <a href="" class="opertime">${x.thur}</c:when>
                        <c:when test="${today eq 6}">
                        <a href="" class="opertime">${x.fri}</c:when>
                        <c:when test="${today eq 7}">
                        <a href="" class="opertime">${x.sat}</c:when>
                        <c:when test="${today eq 1}">
                        <a href="" class="opertime">일요일휴진</c:when>
                        </c:choose>
      					<span style="background-color:white">${x.mon}<br>${x.tue}<br>${x.wed}<br>${x.thur}<br>${x.fri}<br>${x.sat}</span></a></td>                 
                        <td>${x.addr}</td>
                        <td>${x.tel}</td>
                        <c:choose>
                        <c:when test="${sessionScope.email ne null}">
                            <td style="text-align: center;"><a href="/member/book.do?hosname=${x.hosname}">예약</a></td>
		                </c:when>
		                <c:otherwise>
                        <td style="text-align: center;"><a href="" onclick="alert('로그인 회원만 이용가능!')">예약</a></td>
		                </c:otherwise>
		               
		                </c:choose>
                        
                        <td style="text-align: center;"><a href="" class="look" id="look">보기</a><a href="" class="fold" id="fold" style="display:none">접기</a></td>    
                        
                    </tr>
                    <tr class="detail" id="detail" style="display:none">
                        <td></td>
                        <td>✔${x.mon}<br>✔${x.tue}<br>✔${x.wed}<br>✔${x.thur}<br>✔${x.fri}<br>✔${x.sat}</td>
                        <td>
                            <ul>
                                <li>◆ 홈페이지: <a href="${x.url}">${x.url}</a></li>
                                <li>◆ 진료과목: ${x.subject}</li>
                                <li>◆ 총 의사수: ${x.doctors}명</li>
                                
                                <c:choose>
                                <c:when test="${x.emgday eq 'Y'}">
                                <li>◆ 응급실 주간운영: O</li></c:when>
                                <c:when test="${x.emgday eq 'N'}">
                                <li>◆ 응급실 주간운영: X</li></c:when>
                                <c:otherwise>
                                <li>◆ 응급실 주간운영: -</li></c:otherwise>
								</c:choose>
								<c:choose>
								<c:when test="${x.emgnight eq 'Y'}">
                                <li>◆ 응급실 야간운영: O</li></c:when>
                                <c:when test="${x.emgnight eq 'N'}">
                                <li>◆ 응급실 야간운영: X</li></c:when>
                                <c:otherwise>
                                <li>◆ 응급실 야간운영: -</li></c:otherwise>
                                </c:choose>
                                <li>◆ 일요일 진료안내: ${x.sunDoff}</li>
                                <li>◆ 공휴일 진료안내: ${x.holyoff}</li>
                            </ul>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>  
                    </c:forEach>
                     </c:otherwise>
                    </c:choose>
                </tbody>
            </table>

        <ul class="pagination justify-content-center mb-4">
        	<c:choose>
		   		<c:when test="${listResult.cp ne 1}">
			   		<li class="page-item">
		        		<a class="page-link" href="search.do?cp=1">처음</a>
		        	</li>
	        	</c:when>
	        	<c:otherwise>
			        <li class="page-item disabled">
			        <a class="page-link" href="#">처음</a>
			    </c:otherwise>
			</c:choose>
	        
        
        <c:choose>
        	<c:when test="${listResult.cp ne 1}">
	        	<li class="page-item">
	        		<a class="page-link" href="search.do?cp=${listResult.cp-1}">이전</a>
	        	</li>
        	</c:when>
	        <c:otherwise>
		        <li class="page-item disabled">
		        	<a class="page-link" href="#">이전</a>
		        </c:otherwise>
        </c:choose>
        
        	<li class="page-item">
	        <c:forEach begin="${range[0]}" end="${range.get(range.size() - 1)}" var="i">
	   			<c:choose>
	   			    <c:when test="${i==listResult.cp}">
	   			    <li class="page-item active">
	                	<a href="search.do?cp=${i}"><span class="page-link" id="newcp">${i}</span></a>
	                    </li>
	                </c:when>
	                <c:otherwise>
	                <li class="page-item">
	                <a class="page-link" href="search.do?cp=${i}">${i}</a></li>
	                </c:otherwise>
				</c:choose>
	    	</c:forEach>
	    	
	    	<c:choose>
	        	<c:when test="${listResult.cp ne listResult.totalPageCount}">
		        	<li class="page-item">
		        		<a class="page-link" href="search.do?cp=${listResult.cp+1}">다음</a>
		        	</li>
	        	</c:when>
	        <c:otherwise>
		        <li class="page-item disabled">
		        	<a class="page-link" href="#">다음</a>
	        </c:otherwise>
        	</c:choose>
        	
	   		<c:choose> 
		   		<c:when test="${listResult.cp ne listResult.totalPageCount}">
		        	<li class="page-item">
			        	<a class="page-link" href="search.do?cp=${listResult.totalPageCount}">맨끝</a>
			        </li>
			    </c:when>
			    <c:otherwise>
			        <li class="page-item disabled">
			        	<a class="page-link" href="#">맨끝</a>
			    </c:otherwise>
			</c:choose>
    	</ul>
    	
                <!-- <ul class="pagination justify-content-center mb-4">
                    {% if page_obj.has_previous %}
                    <li class="page-item">
                        <a class="page-link" href="?page={{ page_obj.previous_page_number }}"><<</a>
                    </li>
                    {% else %}
                        <li class="page-item disabled">
                        <a class="page-link" href="#"><<</a>
                    </li>
                        {% endif %}
                
                    {% for index in pagelist %}
                        {% if index == page_obj.number %}
                    <li class="page-item active">
                        <span class="page-link">{{ index }}</span>
                    </li>
                        {% else %}
                        <li class="page-item">
                            <a class="page-link" href="?page={{ index }}">{{ index }}</a>
                        </li>
                        {% endif %}
                    {% endfor %}
                
                        {% if page_obj.has_next %}
                    <li class="page-item">
                        <a class="page-link" href="?page={{ page_obj.next_page_number }}">>></a>
                    </li>
                        {% else %}
                        <li class="page-item disabled">
                        <a class="page-link" href="#">>></a>
                    </li>
                        {% endif %}
                </ul> -->
                       
        </div>
    </div>
    <!--상세보기-->
    <!--검색 처리-->
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
     
     
    <script type="text/javascript">
    
	    $(function(){
			/*$("#inputname").keypress(function(key) {
	            if (key.keyCode == 13) {
	                $("#searchB").click();
	            }
	        });*/
			$("#searchB").on("click", function(){
				var addr1 = $('#addressRegion1 option:selected').val();
	        	var addr2 = $('#addressDo1 option:selected').val();
	        	var name = $("#inputname").val();
	        	//var cp = $("#newcp").text();
	            console.log("addr1: "+addr1);
	            console.log("addr2: "+addr2);
	            //console.log("cp: "+cp);
	            
	            console.log("name: "+name);
	            if((addr1 != '')&(addr2 == '')){
	            	alert("시/도를 선택해주세요.");
	            }else{
	            	document.f.submit();
	            }
			});
	    });
        <!--
	    $(document).ready(function() {           
            $("#inputname").keydown(function(key) {
                if (key.keyCode == 13) {
                    $("#searchB").click();
                }
            });
        });
        $("#searchB").click(function() {
            var param = {addr1:$("#addressRegion1").find(":selected").text(),addr2:$("#addressDo1").find(":selected").text(),addr3:$("#addressSiGunGu1").find(":selected").text(),name:$("#inputname").val()};
            $.get("search.do", param, function(data) {
            });
            $(".styled-table").load(window.location.href + ".styled-table");      
        });
        -->
    </script>
    <script type="text/javascript">
        $(".look").click(function() {
            $(this).parent().parent().nextUntil('.tr_visible').toggle();
            $(this).hide();
            $(this).next().show();
            return false;
        });
        $(".fold").click(function() {
            $(this).parent().parent().nextUntil('.tr_visible').toggle();
            $(this).hide();
            $(this).prev().show();
            return false;
        });
    </script>
     
    <!-- 
    <script>
        function check(){
        	var addr1 = $('#addressRegion1 option:selected').val();
        	var addr2 = $('#addressDo1 option:selected').val();
            console.log("addr1: ",addr1);
            console.log("addr2: "+addr2);
            if((addr1 != '')&(addr2 == '')){
            	alert("시/도를 선택해주세요.");
            }else{
            	document.f.submit();
            }
        }       
    </script>
     -->
    
<%@include file="../footer.jsp" %>

</body>
</html>