<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 이부분 수정 하시면 됩니다. 다이어리 메인 페이지에서 출력 부분 입니다. -->
<!DOCTYPE html>
<html>
<c:forEach items = "${diaryContentsList}" var="list"> 
<table border="1">
	<tr>
		<td>
			<form action="/Baby_Note_Diary_Delete.do">
				<input type="submit" value="삭제"> <input type="hidden"
					value= "${list.no}" name=d_no>
			</form>
			<form action="/Baby_Note_Diary_Change.do">
				<input type="submit" value="수정"> <input type="hidden"
					value= "${list.no}" name=d_no>
			</form>
			<c:choose>
				<c:when test="${null == list.image}"></c:when>
				<c:when test="${null != list.image}"><img src="${list.image}" width="100"></img></c:when>
			</c:choose>
				<br>
				Diary subject : ${list.subject}
				<br>
				Diary contents : ${list.contents}
				<br>
		</td>
	</tr>
</table>
</c:forEach>
</html>