<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../header.jsp" %>
<head>
    <!--*****BootStrap content*****-->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>FineDoctor</title>
    <!-- Bootstrap css-->
    <link href="/css/styles.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
    <!-- Bootstrap JS-->
    <script src="/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    
    <style>
        #mypage-bg{
            width:100%;
            height:350px;
        }  
        .mypage{
            width:90%;
            padding: 0.5rem;
            border-left:8px solid #0dcaf0;
            margin:0px auto;
            margin-top:1rem;
            margin-bottom:5rem;
        }
        form{
            width:50%;
        }
        .info{
            margin-bottom:3rem;
        }
        .info-box{
            width:60%;
            border:1px solid #17a2b8;
            border-radius: 20px;
            padding:1rem;
        }
        .infoMButton{
            width:80%;
        }
        .row{
            margin:1rem;
        }
        .booking-board{
            margin-top:2rem;
            margin-bottom:4rem;
        }
        .booking{
            width:70%;
            margin-bottom:1rem;
        }
        .event-board{
            margin-bottom:5rem;
        }
        .event{
            width:70%;
            margin-bottom:1rem;
        }
        .table{
            width:80%;
        }
        th{
            text-align:center;
        }
        .modiBtn{
            width:60%;
            margin-top:1rem;
        }
        a:link, a:visited, a:hover, a:active {text-decoration: none;}
    </style>
</head>
<body>
    <section>
        <div class="title-box"><h2><b>마이페이지</b></h2></div>
                <div class="row" align="center">
                <div class="info">
                    <div>
                        <div><img src="/img/profile160.png"></div>
                        <span id="name"><h3><b>${sessionScope.name}</b></h3></span>
                        <span id="email"><h6>${sessionScope.email}</h6></span>
                    </div>
                    <form name="f" action="updateok.do" method="post">
                        <div class="info-box">
                            <div class="info-box-in">
                                <div><!--여기부터-->
                                    <label for="phone"><b>휴대폰번호</b></label>
                                     <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1')" class="form-control" name="phone_num" value="${member.phone_num}" >
                                    <!--위에코드=숫자만 입력됨-->
                                </div>
                                <div>
                                    <label for="pw"><b>비밀번호</b></label>
                                    <input type="password" class="form-control" name="pw" value="${member.pw}" minlength="6">
                                    <!--위에코드=비밀번호 4글자이상-->
                                </div> <!--복사-->
                                <div>
                                    <label for="address"><b>주소</b></label>
                                    <input type="text" class="form-control" name="addr" value="${member.addr}">
                                </div>
                            </div>
                        </div>
                        <div class="modiBtn" align="right">
                            <button class="btn btn-info" type="submit" id="infoMButton">
                            	회원정보수정</button>
                        </div>
                    </form>
                </div>
                    
                    <div class="booking-board">
                        <div class="booking">
                            <div><label for="review"><h3>예약현황</h3></label></div>
                        </div>
                            <table class="table">
                            <thead class="table-light">
                              <tr>
                                <th>#</th>
                                <th>병원명</th>
                                <th>예약날짜/시간</th>
                                <th>증상</th>
                                <th>내용</th>
                                <th>취소</th>
                              </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${blist}" var="b">
                              <tr style="text-align: center;">
                                <td>${b.seq}</td>
                                <td>${b.hosname}</td>
                                <td>${b.bdate} / ${b.btime}</td>
                                <td>${b.symptom}</td>
                                <td>${b.content}</td>
                                <td>
                                <center><button type="button" class="btn btn-outline-info btn-sm" id="deleteButton" onclick="location.href='/member/book/del.do?seq=${b.seq}'">
                               		취소</button></center>
                                </td>
                              </tr>
                              </c:forEach>
                            </tbody> 
                        </table>
                    </div>
                    
                    <div class="event-board">
                        <div class="event">
                            <label for="event"><h3>찜한 이벤트</h3></label>
                        </div>
                        <table class="table">
                            <thead class="table-light">
                              <tr>
                                 <th>#</th>
                                 <th>병원명</th>
                                 <th>이벤트내용</th>
                                 <th>삭제</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                              <td colspan="4" style="text-align:center;">찜한 이벤트가 없습니다.</td>
                               <!-- 
                                <td><center>{{i.id}}</center></td>
                                <td><center>{{i.hosname}}</center></td>
                                <td><center>{{i.title}}</center></td>
                                <td><center><button type="button" class="btn btn-outline-info btn-sm" id="deleteButton" onclick="location.href='../../team2app/mypage/dibsdelete/{{i.title}}'">
                                    	삭제</button></center></td>
                                    	 -->
                              </tr>
                            </tbody> 
                        </table>
                    </div>
                </div>
            </div>
    </section>
<%@include file="../footer.jsp" %> 

</body>