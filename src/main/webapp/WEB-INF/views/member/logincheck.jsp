<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
{% if not request.session.login_ok_user %}
	<script language ="javascript">
		alert("로그인 회원만 이용가능!")
		//console.log("서비스 이용 불가!! at template7_logincheck.html")
		//location.href="../" {#새로운 요청이기 때문에 이전 폼이 날아감#}
		history.back();
	</script>
{% endif %}