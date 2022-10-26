<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../header.jsp" %>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">  
    <style>
        tbody{
            width:80%;
        }
        td{
            width:3rem;
        }
        .td-color.{
            background-color:#e3e3e3;
        }
        #tr-content{
            height:10rem;
        }
        .write{
            padding:1rem;
            margin:0px auto;
            margin-top:2rem;
            margin-bottom:4rem;
            border-left:8px solid #0dcaf0;
        }
        .table table-striped{
            margin:2rem;
            border-top:2px solid #17a2b8;
        }
        .table-striped > tbody > tr:nth-child(2n+1) > th {
            background-color: #f2f7f7;
        }
        .btn{
            float:right;
            margin-left:1rem;
        }
        /* 
        기존 CSS
        #contents {width: 100%; height: 80px; background: none; display: flex;}
        #cont_cont {width: 80%; height: 1000px; background: #d0e2f7;margin:0 auto;}
        #cont_tit {width: 100%; height: 100px; background: #d0e2f7;margin:0 auto;text-align: center}
        #footer {width: 100%; height: 150px; background: #333;}
        h2{padding: 30px 0px 0px 0px;}
        a:link, a:visited, a:hover, a:active {text-decoration: none;}
        */
    </style>
</head>
<body>
    <div id="cont_cont">
        <div class="container">
            <div class="title-boxlong"><h2><b>게시물</b></h2></div>
            <form class="form-horizontal" name="f" action="" >
                <div class="table table-responsive">
                    <table class="table table-striped">
                <tr>
                    <td class="td-color">제목</td>
                    <td>${list.subject}</td>
                    <td class="td-color">조회수</td>
                    <td>${list.views}</td>
                </tr>
                <tr>
                    <td class="td-color">작성자</td>
                    <td>${list.writer}</td>
                    <td class="td-color">작성시간</td>
                    <td>${list.rdate}</td>
                </tr>
                <tr>
                    <td class="td-color">병원명</td>
                    <td>${list.hosname}</td>
                    <td class="td-color">평가</td>
                    <td>
					<c:choose>
						<c:when test ="${list.rating == 5}">
							★★★★★
						</c:when>
						<c:when test ="${list.rating == 4 }">
							★★★★☆
						</c:when>
						<c:when test ="${list.rating == 3 }">
							★★★☆☆
						</c:when>
						<c:when test ="${list.rating == 2 }">
							★★☆☆☆
						</c:when>
						<c:when test ="${list.rating == 1 }">
							★☆☆☆☆
						</c:when>
						
						
<%-- 					
						<c:otherwise>"${list.rating == 2 }"
							★★☆☆☆
						</c:otherwise>  
						<c:otherwise>"${list.rating == 1 }"
							★☆☆☆☆                                        
                        </c:otherwise>  --%>                                            
                       	<%-- 
                        <c:otherwise test = "${list.rating == 4 }"
                        ★★★★☆
                        </c:otherwise>
                        <c:otherwise test = "${list.rating == 3 }"
                        ★★★☆☆
                        </c:otherwise>
                        <c:otherwise test = "${list.rating == 2 }"
                        ★★☆☆☆
                        </c:otherwise>
                        <c:otherwise test = "${list.rating == 1 }"
                        ★☆☆☆☆
                        </c:otherwise>
                        <c:otherwise test = "${별점이 없어요 }"
                        </c:otherwise>
                        {% else%}
                        별점이 없어요
                        {% endif %} --%>
                        </c:choose>
                    </td>
                </tr>
                <tr id="tr-content">
                    <td class="td-color">글내용</td>
                    <td colspan="3">${list.content}</td>
                </tr>
                </table>
                <div class="btn">
                    <button type="button" class="btn btn-outline-info btn-lg" id="listButton" onclick="location.href='/review/list.do'">
                        목록</button>
                        <c:choose>
                        <c:when test="${sessionScope.email eq list.email}">
                        <button type="button" class="btn btn-info btn-lg" id="deleteButton" onclick="location.href='/review/del.do?seq=${list.seq}'">
                        	삭제</button>
                    	<button type="button" class="btn btn-info btn-lg" id="updateButton" onclick="location.href='/review/rupdate.do?seq=${list.seq}'">
                       	 수정</button>
                        </c:when>
                        <c:otherwise>
                    
                        </c:otherwise>
                        </c:choose>
                </div>
            </form>
            </div>
        </div>
  </div>
  
<%@include file="../footer.jsp" %>
</body>