<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<%@include file="../header.jsp" %>
<head>
	<script src="/js/trim.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">  
    <style>
        /*추가 CSS*/
        .section {
            margin:2rem;
        }
        .login {
            width:80%;
            padding:1rem;
            margin:0px auto;
            margin-top:2rem;
            margin-bottom:4rem;
            border-left:8px solid #0dcaf0;
        }
        .warning{
        	color:red;
        	paddig-bottom:1rem;
        	padding-left:2rem;
        }
        #login-form{
            width:70%;
            background-color:#E7E7E7;
            padding:3rem;
            margin:0px auto;
            margin-bottom:5rem;
        }
        #login-box{
            padding-bottom:1rem;
        }
        div.container{
            margin-bottom:4rem;
        }
        a:link, a:visited, a:hover, a:active {text-decoration: none;}

    </style>
    <script>
    	$(function(){
    		$("loginB").click(function(){
    			var userId = $("#email").val();
    			var userPw = $("#pw").val();
    			if (userId == ""){
    				alter("아이디를 입력해주세요.");
    				$("#email").focus();
    				return;
    			}
    			if (userPw == "") {
					alter("비밀번호를 입력해주세요.");
					$("#pw").focus();
					return;
				}
    			document.f.submit();
    		});
    	});
    </script>
</head>
<body>
    <!-- Section-->
    <!-- Login Form -->
    <section>
        <div class="container">
            <div class="title-box">
                <h2><b>로그인</b></h2>
                <h6>DoctorFine에 오신것을 환영합니다!</h6>
            </div>
            <section class="login-form">
            	<!-- message -->
	           <c:if test="${message eq 'fail'}">
	           	<div class="warning">
	           		<h6>❌회원정보가 일치하지 않습니다. 다시 입력해주세요❌</h6>
	           	</div>
	           </c:if>
	           <c:if test="${message eq 'notPw'}">
	           	<div class="warning">
	           		<h6>❌비밀번호가 일치하지 않습니다. 다시 입력해주세요❌</h6>
	           	</div>
	           </c:if>
                <form name="f" action="loginok.do" method="post" novalidate > <!--validation-form 연결중 login.jsp-->
                    <div class="col-md-6 mb-3" id="login-form">
                        <div id="login-box">
                            <label for="email">ID(E-Mail)</label> 
                            <input type="text" class="form-control" id="email" name="email" placeholder="ex)DoctorFine@example.com"/>
                            <div class="invalid-feedback">ID를 입력해주세요.</div>
                        </div>
                        <div id="password-box">
                            <label for="pw">비밀번호</label> 
                            <input type="password" class="form-control" id="pw" name="pw" />
                            <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                        </div>
                        <div id="in" align="right">
                            <a href="signup.do" id="connect-siginup">
                                <h6>아직 회원이 아니신가요?</h6></a>
                            <button class="btn btn-outline-info btn-lg" type="submit">로그인
                            </button>
                        </div>
                    </div>
                  </form>
                </section>
            </form>
        </div>
    </section>
    <%@include file="../footer.jsp" %>
</body>
</html>