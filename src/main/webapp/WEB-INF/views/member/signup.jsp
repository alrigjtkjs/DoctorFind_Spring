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
    <link href="css/styles.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
    <!-- Bootstrap JS-->
    <script src="js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">  
    <style>
        /*추가 CSS*/
        #signup-form {
            width:40%;
            background-color:#E7E7E7;
            padding:4rem;
            margin:0px auto;
            margin-bottom:5rem;
        }
        div.container{
            margin-bottom:4rem;
        }

        #id-box{
            display:flex;
        }
        #signupBtn{
            margin-top:3rem;
        }
        a:link, a:visited, a:hover, a:active {text-decoration: none;} 

        /*
        기본 CSS
        #contents {width: 100%; height: 80px; background: none; display: flex;}
        #cont_cont {width: 80%; height: 1000px; background: #d0e2f7;margin:0 auto;}
        #cont_tit {width: 100%; height: 100px; background: #d0e2f7;margin:0 auto;text-align: center}
        #footer {width: 100%; height: 150px; background: #333;}
        h2{padding: 30px 0px 0px 0px;}
        a:link, a:visited, a:hover, a:active {text-decoration: none;}
        */
    </style>

    <script>
        window.addEventListener('load', () => {
        const forms = document.getElementsByClassName('validation-form');
    
        Array.prototype.filter.call(forms, (form) => {
            form.addEventListener('submit', function (event) {
            if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
            }
    
            form.classList.add('was-validated');
            }, false);
        });
        }, false);
    </script>
</head>

<body>
    <!-- Section-->
    <!-- SiginUp Form -->
    <section>
        <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
            <div class="title-box">
                <h2 class="mb-3"><b>회원가입</b></h2>
                <h6>DoctorFine과 함께 해보세요!</h6>
            </div>
            <form class="validation-form" method="post" action="signup.do" novalidate id="signup-form">
            <div class="row">
                <div id="nameBox">
                    <label for="name">이름</label>
                    <input type="text" class="form-control" placeholder="ex)홍길동" name="name" required>
                    <div class="invalid-feedback">이름을 입력해주세요.</div>
                </div>
                <div id="idbox">
                    <div class="idBox">
                        <label for="email">ID (e-mail)</label>
                        <input type="email" class="form-control" placeholder="ex) DoctorFine@example.com" name="email" required>
                        <div class="invalid-feedback">e-mail을 입력해주세요(@포함)</div>
                    </div>
                </div>
            </div>
            <div id="phoneBox">휴대폰번호</label>
                <input type="text" placeholder="-는 제외해주세요. ex) 01012345678" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1')" class="form-control" name="phone_num" required>

                <div class="invalid-feedback">휴대폰번호를 입력해주세요.</div>
            </div>
            <div id="pwBox">
                <label for="pw">비밀번호</label>
                <input type="password" class="form-control" placeholder="6자 이상 입력해주세요" name="pw" minlength="6" required>
                <div class="invalid-feedback">비밀번호를 입력해주세요(6자이상)</div>
            </div>
    
            <div id="addrBox">
                <label for="addr">주소</label>
                <input type="text" class="form-control" placeholder="ex)서울특별시 금천구 가산동" name="addr" required>
                <div class="invalid-feedback">주소를 입력해주세요.</div>
            </div>
            <div class="mb-4" id="signupBtn">
            <button class="btn btn-info btn-lg btn-block text-white" type="submit" formmethod="post">
            	회원가입</button>
            </div>
            </form>
        </div>
<%@include file="../footer.jsp" %>
</body>