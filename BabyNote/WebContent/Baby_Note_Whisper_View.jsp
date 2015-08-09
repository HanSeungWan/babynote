<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!-- 요기 수정해 주시면 됩니다! -->
<body>
		<table border = "1" >
			<c:forEach items ="${whisperContentsList}" var="list">
				<tr>
					<td>
						@ : ${list.contents} <br>			
					</td>
				</tr>
			</c:forEach>
		</table>
</body>