<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../header.jsp" %>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">  
    <style>
        .title-box{
            margin-top:3rem;
        }  
        #cont_img { 
           width : 65%;
           height: 65%;

        }
        .event-btn{
            width:80%;
            margin-top:5rem;
        }
        #contents {width: 100%; height: 80px; background: none; display: flex;}
        #cont_cont {width: 80%; height: 1000px; margin:0 auto; margin-top:5rem;}
        #cont_tit {width: 100%; height: 100px; margin:0 auto;}
        #footer {width: 100%; height: 150px; background: #333;}
        a:link, a:visited, a:hover, a:active {text-decoration: none;}
    </style>
</head>
<body>
<c:forEach items="${content}" var="content" begin="0" end="1">
    <div id="cont_tit">
        <div class="title-box">
            <h2><b>이벤트 상세정보</b></h2>
            <h6>${content.hospital_name}_${content.content}</h6>
        </div>
    </div>
    <div id="cont_cont">
        <div class="container">
            <center>	
                <div><img id="cont_img" src="${content.img_address}"></div>
            </center>
            
            <div class="event-btn" align="right">
            <!--  
                {% if request.session.login_ok_user %}
                <a href="dibs/{{event.id}}"><button class="btn btn-outline-info btn-lg" type="button" onclick="alert('마이페이지에서 확인하세요!')">
                    찜하기</button></a>
                {% else %}
                <a href="../event"><button class="btn btn-outline-info btn-lg" type="button" onclick="alert('로그인 회원만 이용가능합니다!')">
                    찜하기</button></a>
                {% endif %}
                -->
                <a href="dibs/{{event.id}}"><button class="btn btn-outline-info btn-lg" type="button">
                    찜하기</button></a>
                <a href="/event/list.do"><button class="btn btn-info btn-lg" type="button">
                    목록</button></a>
            </div>
        </div>
    </div>
    </c:forEach>
<%@include file="../footer.jsp" %>
</body>
</html>