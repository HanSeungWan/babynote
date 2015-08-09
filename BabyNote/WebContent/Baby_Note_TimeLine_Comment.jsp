<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 이부분 수정 하시면 됩니다. 다이어리 메인 페이지에서 출력 부분 입니다. -->
<!DOCTYPE html>
<html>
<c:forEach items = "${timeLineCommentList}" var="list"> 
<table border="1">
	<tr>
		<td>
			<c:choose>
				<c:when test="${null == list.image}"></c:when>
				<c:when test="${null != list.image}"><img src="${list.image}" width="100"></img></c:when>
			</c:choose>
				id : ${list.id}
				| Diary contents : ${list.contents}
				<br>
		</td>
	</tr>
</table>
</c:forEach>

<table border="1">
		<tr>
			<td>
				<form name = comment method = "post" action = "Baby_Note_TimeLine_Insert_Comment.do">
					<input type = "text" name = "contents"/>
					<input type = "submit" value = "입력"/>
					<input type = "hidden" value = "${list.dNo}" name = "dNo"/>
					<input type = "hidden" value = "${list.tNo}" name = "tNo"/>
				</form>
			</td>
		</tr>
</table>
</html>
