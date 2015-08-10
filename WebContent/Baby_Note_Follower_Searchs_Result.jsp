<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<c:forEach items = "${contentsList}" var="list"> 
<table border="1">
	<tr>
		<td>
			<c:choose>
				<c:when test="${null == list.image}"></c:when>
				<c:when test="${null != list.image}"><img src="${list.image}" width="100"></img></c:when>
			</c:choose>
				<br>
				Id : ${list.id}
				<br>
				Name : ${list.name }
				<form method = post action = "Baby_Note_TimeLine_Following.do">
										<input type=hidden name = "follower_id" value="${list.id}">
										<input type=hidden name = "follower_name" value="${list.name}"> 
										<input type = "submit" value = "following"><br>
									</form>
		</td>
	</tr>
</table>
</c:forEach>
</html>