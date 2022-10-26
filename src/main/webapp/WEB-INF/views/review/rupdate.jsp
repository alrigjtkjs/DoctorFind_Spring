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
        /*  
        #contents {width: 100%; height: 80px; background: none; display: flex;}
        #cont_cont {width: 80%; height: 1000px; background: #d0e2f7;margin:0 auto;}
        #cont_tit {width: 100%; height: 100px; background: #d0e2f7;margin:0 auto;text-align: center}
        #footer {width: 100%; height: 150px; background: #333;}
        h2{padding: 30px 0px 0px 0px;}
        */
    </style>
</head>

<body>
<!-- 
{% if user_email == review.email %}
{% elif user_email != review.email %}
<script language ="javascript">
    alert("작성자가 아닙니다!")
    history.back();
</script>
{% endif %}
 -->
    <div id="cont_cont">
        <div class="container" role="main">
           <div class="title-boxlong"><h2><b>게시물 수정</b></h2></div>
           <form class="form-horizontal" name="f" action="rupdate.do" method="post">
           <input type="hidden" name="seq" value="${list.seq}"/>
              <div class="table table-responsive">
                 <table class="table table-striped">
              <tr>
                  <td>작성자</td>
                  <td>${list.writer}</td>
              </tr>
              <tr>
                <td>제목</td>
                <td><input type="text"  class="form-control" name="subject" value="${list.subject}"></td>
            </tr>
            <tr>
                <td>병원명</td>
                <td><input type="text"  class="form-control" name="hosname" value="${list.hosname}"></td>
            </tr>
            <tr>
                <td>평가</td>
                <td><select name="rating" id="rating">
                  <option selected value="0">별점 선택</option>
                  <option value="5" ${rating eq '5' ? 'selected' : ''}>★★★★★</option>
                  <option value="4" ${rating eq '4' ? 'selected' : ''}>★★★★☆</option>
                  <option value="3" ${rating eq '3' ? 'selected' : ''}>★★★☆☆</option>
                  <option value="2" ${rating eq '2' ? 'selected' : ''}>★★☆☆☆</option>
                  <option value="1" ${rating eq '1' ? 'selected' : ''}>★☆☆☆☆</option>
               </select>
              </td>
            </tr>
            <tr>
                <td>글내용</td>
                <td><input type="text" name="content" class="form-control" value="${list.content}"></td>
            </tr>
            </table>
            <div align="right">
            <div class="btn">
               <button type="button" class="btn btn-outline-info btn-lg" id="listButton" onclick="location.href='/review/list.do'">목록</button>	
               <button type="submit" class="btn btn-info btn-lg" id="updateButton">저장</button>	
            </div>
            </div>
         </form>
		</div>
   </div>
   <script>
   $(function(){
		var starrating = ${list.rating};
		const selectbox = document.getElementById('rating');
		$('#rating').val(starrating).prop("selected",true);
	}); 
   </script>
   <script>
    $("#star").on("change", function(){
       console.log($(this).val())
       var p = {value : $(this).val()}
       $.get("/team2app/rupdate/{{review.id}}", p, function(data){});
       /*$("option:selected", this).attr("value");
       $("option:selected", this);
       $("option:selected", this).text();
       $(this).find("option:selected").text();*/
   });
 </script>
<%@include file="../footer.jsp" %>
</body>
</html>