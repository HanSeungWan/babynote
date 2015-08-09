<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<body>
	<form name="fileForm" id="fileForm" action="Baby_Note_SignIn.do" method = post >
				<input type ="text" name = "id" value = "hans1@naver.com" required = ""/> <br>
				<input type ="password" name = "pw" value = "1234" required = ""/> <br>
				<input type = "submit" name = "SingIn" value = "로그인"> <br>
			</form>
				<A HREF= "Baby_Note_Find_IdPw.jsp" "text-decoration:none">아이디 비밀번호 찾기</a>
				<A HREF= "Baby_Note_SignUp.jsp" "text-decoration:none">회원가입</a>
</body>
	
		