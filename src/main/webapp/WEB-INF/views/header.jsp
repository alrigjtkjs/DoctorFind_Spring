<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="author" content="KOSMO team2">
    <title>FindDoctor</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
</head>
<body>
    <div id="header">
            <div class="container">
                <div class="header">
                    <div class="header-menu">
                        <div class="header-logo-img">
                            <a href='../'><img src="/img/fd_logo200.png"></a>
                        </div>
                        <div class="header-btn">
                        <c:choose>
                        <c:when test="${sessionScope.email != null}">
	                        	<span>${sessionScope.name}님, 안녕하세요</span>
	                            <button class="btn btn-outline-info btn-sm" type="submit" id="infoMButton" onclick="location.href = '/member/logout.do'">
                                	로그아웃</button>
	                        </c:when>
	                        <c:otherwise>
	                            <button class="btn btn-outline-info btn-sm" type="submit" id="loginButton" onclick="location.href = '/member/login.do'">
	                               	 로그인</button>
	                            <button class="btn btn-outline-info btn-sm" type="submit" id="signupButton" onclick="location.href = '/member/signup.do'">
	                               	 회원가입</button>
	                        </c:otherwise>
                            </c:choose> 
                        </div>
                    </div>
                </div>
            </div>
    </div>
        <div id="contents">
            <div id="cont_nav">
                <nav>
                <div class="container">
                    <ul>
                    <li><a href="/search/search.do">병원찾기<i class='fa fa-angle-down'></i></a>
                        <ul>
                            <li><a href="/search/search.do">세부 조건별 찾기</a></li>
                            <li><a href="/search/map.do">지도에서 찾기</a></li>
                        </ul>
                        <li><a href="/review/list.do">병원후기</a></li>
                        <li> <a href="/health/healthinfo.do">건강정보</a></li>
                        <li> <a href="/event/list.do">이벤트</a></li>
                       <c:choose>
                        <c:when test="${sessionScope.email != null}">
                        	<li> <a href="/member/mypage.do">마이페이지</a></li>
                        </c:when>
                        <c:otherwise>
                        	<li><a href="../" onclick="alert('로그인 회원만 이용가능합니다.')">마이페이지</a></li>
                       </c:otherwise>
                       </c:choose>
                    </ul>
                </div>
                </nav>
            </div>
        </div>
        <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script>
        $('nav li').hover(
            function() {
                $('ul', this).stop().slideDown(200);
            },
            function() {
                $('ul', this).stop().slideUp(200);
            }
        );
        </script>
        
</body>