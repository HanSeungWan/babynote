<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <html>
    <body>
    <c:if test="${!empty errMsg }">
    	<c:out value="${errMsg }"></c:out>
    </c:if>
    </body>
    </html>
