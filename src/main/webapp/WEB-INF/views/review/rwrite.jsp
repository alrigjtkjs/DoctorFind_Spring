<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../header.jsp" %>
<head>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">  
   <style>  
      .write{
         padding:1rem;
         margin:0px auto;
         margin-top:2rem;
         margin-bottom:4rem;
         border-left:8px solid #0dcaf0;
      }
      .f{
         margin-top:2rem;
      }
      table{
         border:1px solid #e6e6e6;
      }
      td-color{
         background-color:#e8edec;
      }
      .table-striped > tbody > tr:nth-child(2n+1) > th,
      .table-striped > tbody > tr:nth-child(2n+1) > td {
         background-color: #f2f7f7;
      }
      .write-btn{
         margin-top:2rem;
      }
      a:link, a:visited, a:hover, a:active {text-decoration: none;}
   </style>

<body>
   <div id="cont_cont">
      <div class="container" role="main">
			<div class="title-box"><h2><b>게시물 작성</b></h2></div>
         <form class="f" name="f" action="rwrite.do" method="post">
            <div class="table table-responsive">
               <table class="table table-striped table table-bordered">
            <tr>
               <td class="td-color">작성자</td>
               <td><input type="text"  class="form-control" name="writer" value="${sessionScope.name}" readonly/></td>
            </tr>
            <tr>
               <td class="td-color">제목</td>
               <td><input type="text"  class="form-control" name="subject" placeholder="제목을 입력해 주세요"></td>
            </tr>
            <tr>
               <td class="td-color">병원명</td>
               <td><input type="text"  class="form-control" name="hosname" placeholder="병원명을 입력해 주세요"></td>
            </tr>
            
            <tr>
               <td class="td-color">평가</td>
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
               <td><textarea rows="10" cols="50" name="content" class="form-control"></textarea></td>
            </tr>
            </table>
            <div class="write-btn" align="right">
               <button type="button" class="btn btn-outline-info btn-lg" id="listButton" onclick="location.href='/review/list.do'">목록</button>	
               <button type="submit" class="btn btn-info btn-lg" id="saveButton">저장</button>	
            </div>
         </form>
		</div>
   </div>
   <!-- 
   <script>
      $("#star").on("change", function(){
         console.log($(this).val())
         var p = {value : $(this).val()}
         $.get("/team2app/rwrite/", p, function(data){});
         /*$("option:selected", this).attr("value");
         $("option:selected", this);
         $("option:selected", this).text();
         $(this).find("option:selected").text();*/
     });
   </script>
    -->
<%@include file="../footer.jsp" %>
</body>
</html>