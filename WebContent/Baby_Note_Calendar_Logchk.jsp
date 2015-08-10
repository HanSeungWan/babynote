<%@ page info="diary calendar" %>
<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page language="java" import="java.io.*,java.net.*,java.util.*" %>

<%
	String mode = request.getParameter("mode");
	String id = request.getParameter("id");
	String year = new String();
	String month = new String();
	String day = new String();
	String subject = new String();
	String contents = new String();
%>

<html>
<head>
<title>chek</title>


<%
	//모드가 새글일경우
	if (mode.equals("insert")) {
		if( request.getParameter("log_id").equals("hans@naver.com") && request.getParameter("passwd").equals("1234") ){
%>
			<script>	
				window.alert( "로그인 되었습니다.")
				location.replace("Baby_Note_Calendar_Write.jsp?year=<%= year%>&month=<%= month %>&day=<%= day %>")
			</script>
<%
		} else {
%>
			<script>
				window.alert( "ID 나 Password를 다시 확인해주십시오.")
				location.replace("Baby_Note_Calendar_View.jsp?mode=insert&year=<%= year %>&month=<%= month %>&day=<%= day %>")
			</script>
<%
		}
	}
%>

<%
	//모드가 수정일경우
	if (mode.equals("modify")) {
		if( request.getParameter("log_id").equals("root사용자 아이디 수정바람") && request.getParameter("passwd").equals("passwd수정바람") ){
%>
			<script>	
				window.alert( "로그인 되었습니다.")
				location.replace("Baby_Note_Calendar_Write.jsp?mode=modify&id=<%= id %>")
			</script>
<%
		} else {
%>
			<script>
				window.alert( "ID 나 Password를 다시 확인해주십시오.")
				location.replace("Baby_Note_Calendar_View.jsp?mode=view&id=<%= id%>")
			</script>
<%
		}
	}
%>

<%
	//모드가 삭제일경우
	if (mode.equals("delete")) {
		if( request.getParameter("log_id").equals("root사용자 아이디 수정바람") && request.getParameter("passwd").equals("passwd수정바람") ){
%>
			<script>	
				window.alert( "관리자 권한으로 삭제 되었습니다.")
				location.replace("delete.jsp?id=<%= id %>")
			</script>
<%
		} else {
%>
			<script>
				window.alert( "ID 나 Password를 다시 확인해주십시오.")
				location.replace("Baby_Note_Calendar_View.jsp?mode=view&id=<%= id%>")
			</script>
<%
		}
	}
%>
	
</head>
<body>
</body>
</html>