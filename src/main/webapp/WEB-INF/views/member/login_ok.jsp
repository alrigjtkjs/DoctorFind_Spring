<%@ page contentType="text/html; charset=utf-8" %>
<script language="javascript">
    switch({{result}}){
        case 0:
            alert("로그인 실패(회원 이메일이 존재하지 않습니다.)");
            location.href = "../"
            break;
        case 1:
            alert("로그인 실패(비밀번호가 일치하지 않습니다.)");
            location.href = "../"
            break;
        case 2:
            alert("로그인 성공")
            location.href = "../../"
    } 
</script>