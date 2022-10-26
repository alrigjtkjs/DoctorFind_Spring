<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../header.jsp" %>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">  
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="/js/datatables-simple-demo.js"></script>
    <style>
        th{
            background-color:#e8edec;
        }
        .card mb-4{
            margin-top:3rem;
        }
        #contents {width: 100%; background: none; display: flex;}
        #cont_cont {width: 80%; margin:0 auto;}
        #cont_tit {width: 100%; height: 100px; margin:0 auto;}
        a:link, a:visited, a:hover, a:active {text-decoration: none;}
    </style>
</head>
<body>
    <div><img id="review-bg" src="/img/review-bg.jpg"></div>
    <div class="title-box-center">
        <h2><b>병원후기</b></h2>
        <h6>#Review</h6>
    </div>
    <div id="cont_cont">
        <div class="container">
            <div id="layoutSidenav">
                <div id="layoutSidenav_content">
                    <div class="container-fluid px-4">
                        <div class="card mb-4">
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>조회수</th>
                                            <th>병원이름</th>
                                        </tr>
						
                                    </thead>
                                    <tbody>
                                      <c:choose>
										<c:when test="${empty list}">
											<td align='center' colspan="5">데이터가 없음</td>
										</c:when>
										<c:otherwise>
											<c:forEach items="${list}" var="rev">
												<TR>
												<TD align='center'>${rev.seq}</TD>
												<c:choose>
												<c:when test="${sessionScope.email != null}">
												<TD><a href='rcontent.do?seq=${rev.seq}'>${rev.subject}</a></TD>
												</c:when>
												<c:otherwise>
												<TD><a href='' onclick="alert('로그인 회원만 이용가능합니다.')">${rev.subject}</a></TD>
												</c:otherwise>
												</c:choose>
												<TD>${rev.email}</TD>
												<TD>${rev.rdate}</TD>
												<TD>${rev.views}</TD>
												<TD>${rev.hosname}</TD>			
												
												</TR>
											</c:forEach>
										</c:otherwise> 
									</c:choose>
                                <!--        <ui>
                                            <c:forEach var="board" items="${board.names }">
       												 <li>${tmp }</li>
    										</c:forEach>
    										</ui>  -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
						<c:choose>
                        <c:when test="${sessionScope.email != null}">
                        	<div class="write-btn" align="right">
                            <button class="btn btn-outline-info btn-lg" type="submit" id="signupButton" onclick="location.href = '/review/rwrite.do' ">
                                	글쓰기</button>
                        </div>
                        </c:when>
                        <c:otherwise>
                        	<div class="write-btn" align="right">
                            <button class="btn btn-outline-info btn-lg" type="submit" id="signupButton" onclick="alert('로그인 회원만 이용가능합니다.')">
                                	글쓰기</button>
                        	</div>
                       </c:otherwise>
                       </c:choose>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function views()  {
            const viewplus = {value : 1};
            $.get("/team2app/review/", viewplus, function(data){});
          }
    </script>
<%@include file="../footer.jsp" %>
</body>
</html> 