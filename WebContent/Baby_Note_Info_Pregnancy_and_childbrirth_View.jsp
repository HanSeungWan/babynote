<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 요기 수정해 주시면 됩니다! -->
<body>
		<table border = "1" >
			<c:forEach items ="${infoList}" var="list">
				<tr>
					<td>
						Image : <img src = "${list.image}"> <br>
						Subject : ${list.subject} <br>
						Contents : ${list.contents} <br>
						Date : ${list.date}						
					</td>
				</tr>
			</c:forEach>
		</table>
</body>