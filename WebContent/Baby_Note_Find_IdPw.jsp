<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %> 

<html>
<form action="Baby_Note_Find_IdPw_Do.jsp" method = post>
	아이디 : <input type = "text" name = "id"> <br>
	질문 : 
			<select name="questions">
				<option value = "0">비밀번호 찾기에 사용할 질문을 선택해 주세요.</option>
				<option value = "1">가장좋아 하는 색은?</option>
				<option value = "2">가장좋아 하는 친구는?</option>
				<option value = "3">고향 이름은?</option>
				<option value = "4">내가 가장 좋아 하는 것은?</option>
			</select> <br>
	답변 : <input type = "text" name = "answer"> <br>
	<input type="submit" value="찾기">
</form>
</html>