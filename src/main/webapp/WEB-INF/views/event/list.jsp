<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../header.jsp" %>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">  
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script><!--페이지,검색창카테고리-->
    <script src="/js/datatables-simple-demo.js"></script><!--페이지,검색창카테고리-->

    <style>
        #datatablesSimple{
            border: 1px solid #dedede;
        }
        th{
            background-color:#e1f0ed;
        }
        .card-body{
            margin-top:5rem;
        }
        #contents {width: 100%; display: flex;}
        #cont_tit {width: 100%; height: 100px; margin:0 auto;}
        a:link, a:visited, a:hover, a:active {text-decoration: none;} 
    </style>
</head>
<body>
    <div><img id="event-bg" src="/img/event-bg.jpg"></div>
    <div id="cont_tit">
        <div class="title-box-center">
            <h2><b>이벤트</b></h2>
            <h6>#Medical event</h6>
        </div>
    </div>
    <div id="cont_cont">
        <div class="container">
                <div id="layoutSidenav">
                    <div id="layoutSidenav_content">
                        <div class="container-fluid px-4">
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>병원이름</th>
                                            <th>이벤트 이름</th>
                                            <th>등록일</th>
                                            <th>이벤트 내용</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="list" items="${list}">
                                        <tr>
                                        <td>${list.seq}</td>
                                        <td>${list.hospital_name}</td>
                                        <td>${list.event_name}</td>
                                        <td>${list.rdate}</td>
                                        <td><a href="/event/econtent.do?seq=${list.seq}">${list.content}</a></td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%@include file="../footer.jsp" %>
</body>
</html>