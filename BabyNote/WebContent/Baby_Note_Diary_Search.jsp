<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 육아 일기 상단에 있는 검색 버튼과, 일기 쓰기 버튼이 있는 프레임 입니다.  -->

<html>
	<form method = post action = "Baby_Note_Diary_Search.do" target = "d_bottom">
		<input type = "text" name = "searchs">
		<input type = "submit" value = "검색"><br>
	</form>
	<form action="Baby_Note_Diary_Write.jsp" target="d_bottom">
    	<input type="submit" value="일기 쓰기">
	</form>
</html>
