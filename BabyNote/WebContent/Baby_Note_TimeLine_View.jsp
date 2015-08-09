<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<c:forEach items = "${timeLineList}" var="list"> 
<table border="1">
	<tr>
		<td>
			<form action="Baby_Note_TimeLine_Comment.do">
				<input type="submit" value="댓글"/> 
				<input type="hidden" value= "${list.dNo}" name="dNo"/>
				<input type="hidden" value= "${list.no}" name="tNo"/>
				
			</form>
			<form action="Baby_Note_TimeLine_Recommend.do">
				<input type="submit" value="추천"> <input type="hidden"
					value= "${list.no}" name="d_no">
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
				Id : ${list.id}
				<br>
				Rating : ${list.rating}
		</td>
	</tr>
</table>
</c:forEach>
</html>