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
	//��尡 �����ϰ��
	if (mode.equals("insert")) {
		if( request.getParameter("log_id").equals("hans@naver.com") && request.getParameter("passwd").equals("1234") ){
%>
			<script>	
				window.alert( "�α��� �Ǿ����ϴ�.")
				location.replace("Baby_Note_Calendar_Write.jsp?year=<%= year%>&month=<%= month %>&day=<%= day %>")
			</script>
<%
		} else {
%>
			<script>
				window.alert( "ID �� Password�� �ٽ� Ȯ�����ֽʽÿ�.")
				location.replace("Baby_Note_Calendar_View.jsp?mode=insert&year=<%= year %>&month=<%= month %>&day=<%= day %>")
			</script>
<%
		}
	}
%>

<%
	//��尡 �����ϰ��
	if (mode.equals("modify")) {
		if( request.getParameter("log_id").equals("root����� ���̵� �����ٶ�") && request.getParameter("passwd").equals("passwd�����ٶ�") ){
%>
			<script>	
				window.alert( "�α��� �Ǿ����ϴ�.")
				location.replace("Baby_Note_Calendar_Write.jsp?mode=modify&id=<%= id %>")
			</script>
<%
		} else {
%>
			<script>
				window.alert( "ID �� Password�� �ٽ� Ȯ�����ֽʽÿ�.")
				location.replace("Baby_Note_Calendar_View.jsp?mode=view&id=<%= id%>")
			</script>
<%
		}
	}
%>

<%
	//��尡 �����ϰ��
	if (mode.equals("delete")) {
		if( request.getParameter("log_id").equals("root����� ���̵� �����ٶ�") && request.getParameter("passwd").equals("passwd�����ٶ�") ){
%>
			<script>	
				window.alert( "������ �������� ���� �Ǿ����ϴ�.")
				location.replace("delete.jsp?id=<%= id %>")
			</script>
<%
		} else {
%>
			<script>
				window.alert( "ID �� Password�� �ٽ� Ȯ�����ֽʽÿ�.")
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