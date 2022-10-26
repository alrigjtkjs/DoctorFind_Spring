<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../header.jsp" %>
<head>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
   <style>  
      table{
         border:1px solid #e6e6e6;
      }
      .table-striped > tbody > tr:nth-child(2n+1) > th,
      .table-striped > tbody > tr:nth-child(2n+1) > td {
         background-color: #f2f7f7;
      }
      a:link, a:visited, a:hover, a:active {text-decoration: none;}
   </style>

<body>
   <div id="cont_cont">
      <div class="container" role="main">
			<div class="title-boxlong"><h2><b>예약</b></h2></div>
         <form class="f" name="f" action="/member/book.do" method="post">
            <div class="table table-responsive">
               <table class="table table-striped table table-bordered">
            <tr>
                <td>병원명</td>
                <td id="hosname">${hosname}</td>
                <input type="hidden" name="hosname" value="${hosname}"/>
            </tr>
            <tr>
                <td>예약자 성함</td>
                <td id="name">${member.name}</td>
                <input type="hidden" name="name" value="${member.name}"/>
            </tr>
            <tr>
                <td>연락처</td>
                <td>${member.phone_num}</td>
            </tr>
            
            <tr>
               <td>예약시간</td>
               <td>
                <input type="date" name="bdate" id=bdate min="${tomorrow}">
                <select name="btime" id="btime">
                  <option selected value="0">시간 선택</option>
                  <option value="09:00">AM 09:00</option>
                  <option value="09:30">AM 09:30</option>
                  <option value="10:00">AM 10:00</option>
                  <option value="10:30">AM 10:30</option>
                  <option value="11:00">AM 11:00</option>
                  <option value="11:30">AM 11:30</option>
                  <option value="12:00">PM 12:00</option>
                  <option value="14:00">PM 14:00</option>
                  <option value="14:30">PM 14:30</option>
                  <option value="15:00">PM 15:00</option>
                  <option value="15:30">PM 15:30</option>
                  <option value="16:00">PM 16:00</option>
                  <option value="16:30">PM 16:30</option>
                  <option value="17:00">PM 17:00</option>
                  <option value="17:30">PM 17:30</option>
               </select>
              </td>
            </tr>
            <tr>
                <td>증상</td>
                <td><input type="text"  class="form-control" id="symptom" name="symptom" placeholder="증상을 입력해 주세요"></td>
            </tr>
            <tr>
               <td>기타내용</td>
               <td><textarea rows="10" cols="50" name="content" id="content" class="form-control" placeholder="기타 자세한 내용을 입력해 주세요"></textarea></td>
            </tr>
            </table>
            <div align="right">
               <div class="btn">
                  <button type="button" class="btn btn-outline-info btn-lg" id="listButton" onclick="location.href='../search'">목록</button>	
                  <button type="submit" class="btn btn-info btn-lg" id="saveButton">예약하기</button>	
               </div>
            </div>
         </form>
		</div>
   </div>
   
   <script type="text/javascript">
      $("#saveButton").click(function() {
         var bdate=document.querySelector("#bookdate").value;
         var btime=document.querySelector("#booktime").value;
         var param = {bdate:bdate,btime:btime,symptom:$("#symptom").val(),content:$("#content").val(),hosname:$("#hosname").text()};
         console.log(bdate,btime)
         console.log(param)
         $.get("/team2app/book/book_ok", param, function(data) {
         });                 
     });
   </script>
   

<%@include file="../footer.jsp" %>
</body>
</html>