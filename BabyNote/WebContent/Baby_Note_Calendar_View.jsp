<%@ page info="diary calendar" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" import="java.sql.*,java.io.*,java.net.*,java.util.*" %>

<%
	
	request.setCharacterEncoding("UTF-8");

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String mode = request.getParameter("mode");
	String id = request.getParameter("id");
	String member_id = (String)session.getAttribute("user_id");
	String member_name = "한승완"; // 임시
	String member_email = null;	
	String year = new String();
	String month = new String();
	String day = new String();
	String subject = new String();
	String contents = new String();
	String created = new String();
	String userid = new String();
	String query = new String();	
	
	if (mode.equals("view")) {// start if
	

	
	//회원 인증 체크	
	//if (member_id.equals("") || member_name.equals("") || member_email.equals("")) {
	//	response.sendRedirect("login.jsp?ret_url=calendar.jsp");
	//}
	
	try {
		String dburl = "jdbc:mysql://localhost:3307/BABY_NOTE";
		String dbid = "root";
		String dbpw = "sql123!@#";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dburl,dbid,dbpw);
		
	} catch (SQLException e) {
	}
	
	try {
		query = "select * from Calendar where C_No = "+id;
		rs = stmt.executeQuery(query);
		
		if(rs.next()) {
			year = rs.getString("C_Year");
			month = rs.getString("C_Month");
			day = rs.getString("C_Day");
			subject = rs.getString("C_Subject");
			contents = rs.getString("C_Contents");
			created = rs.getString("C_Created");
			userid =rs.getString("M_ID");
		}
		rs.close();
		
	} catch(SQLException e) {
	} finally {
		conn.close();
	}
	
	} //end if
	
	if (mode.equals("insert")){
	
	year    = request.getParameter("year");
	month = request.getParameter("month");
	day    = request.getParameter("day");
	
	}
%>

<html>
<head>
<title>다이어리</title>

<style type="text/css">
<!--
A:link{font-size:9pt; font-family:"굴림"; text-decoration:none;color:#3E3E3E}
A:visited{font-size:9pt; font-family:"굴림"; text-decoration:none;color:#3E3E3E}
A:hover {font-size: 9pt; font-family:"굴림"; text-decoration: underline;color: #F29708;}

.title {font-size: 9pt; font-family:"굴림"; color:#504F4F}
-->
</style>


</head>
<body LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0">
<table width="235" height="180" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td align="center" valign="top">
<!-- 모드가 insert일때 시작-->
<%
	if (mode.equals("insert")){
%>
	<table width="210" height="145" border="0" cellspacing="0" cellpadding="0" align="center">
	
	
	<tr>
		<td width="210" height="5"></td>
	</tr>
	<tr>
		<td width="210" height="3" bgcolor="#44A5E9"></td>
	</tr>
	<tr>
		<td width="210" height="2" bgcolor="#D2FCFC"></td>
	</tr>
	<tr>		
		<td width="210" height="50" align="left" class="title"><img src = "Calendar_Image/point.gif" border="0" align="absmiddle">&nbsp;<%= year %>년 <%= month %>월 <%= day %>일 <br>&nbsp;&nbsp;스캐줄은 없습니다.</td>
	</tr>
	<tr>
		<td width="210"></td>
	</tr>
	<tr>
		<td width="210" height="1" bgcolor="#A6E6E6"></td>
	</tr>
	
	
	<table>
	<table width="210"  height="25" border="0" cellspacing="0" cellpadding="0" align="center">
	
	
	<tr>
		<td width="210" height="20" align="center">		
			<a href="Baby_Note_Calendar_Main.jsp"><img src="Calendar_Image/list.gif" border="0" alt="diary_list.gif" align="absmiddle"></a>
			<a href="Baby_Note_Calendar_Login.jsp?mode=<%= mode %>&year=<%= year %>&month=<%= month %>&day=<%= day %>"><img src = "Calendar_Image/write.gif" border="0" alt="new_write.gif" align="absmiddle"></a>			
		</td>
	</tr>
	<tr>
		<td width="210" height="1" bgcolor="#D2FCFC"></td>
	</tr>
	<tr>
		<td wdith="210" height="2" bgcolor="#44A5E9"></td>
	</tr>
	
	</table>
	
<%
	}
%>
<%
	if (mode.equals("view")){
%>
	<table width="210" height="145" border="0" cellspacing="0" cellpadding="0" align="center">
	
	
	<tr>
		<td width="210" height="5"></td>
	</tr>
	<tr>
		<td width="210" height="3" bgcolor="#44A5E9"></td>
	</tr>
	<tr>
		<td width="210" height="2" bgcolor="#D2FCFC"></td>
	</tr>
	<tr>		
		<td width="210" height="20" align="left" class="title">&nbsp;<%= year %>년 <%= month %>월 <%= day %>일</td>
	</tr>
	<tr>
		<td width="210" height="20" align="left" class="title">&nbsp;제목&nbsp;:&nbsp;<%= subject %></td>
	</tr>
	<tr>
		<td width="210" height="80" align="left">
			<table width="200" height="80" border="0" cellspacing="0" cellpadding="0" align="left" valign="top">
				<tr>
					<td width="5"></td>
					<td width="195" valign="top" align="left" class="title"><%= contents %></td>
				</tr>
				<tr>
					<td colspan="2" width="200"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width="210"></td>
	</tr>
	<tr>
		<td width="210" height="1" bgcolor="#A6E6E6"></td>
	</tr>
	
	
	</table>
	<table width="210"  height="25" border="0" cellspacing="0" cellpadding="0" align="center">
	
	
	<tr>
		<td width="210" height="20" align="center">
			<a href="Baby_Note_Calendar_Main.jsp"><img src="Calendar_Image/list.gif" border="0" alt="diary_list.gif" align="absmiddle"></a>
			<a href="Baby_Note_Calendar_Login.jsp?mode=modify&id=<%= id %>"><img src = "Calendar_Image/modify.gif" border="0" alt="modify.gif" align="absmiddle"></a>
			<a href="Baby_Note_Calendar_Login.jspp?mode=delete&id=<%= id %>"><img src = "Calendar_Image/delete.gif" border="0" alt="delete.gif" align="absmiddle"></a>			
		</td>
	</tr>
	<tr>
		<td width="210" height="1" bgcolor="#D2FCFC"></td>
	</tr>
	<tr>
		<td wdith="210" height="2" bgcolor="#44A5E9"></td>
	</tr>
	
	</table>
	
<%
	}
%>
			
		</td>
	</tr>
</table>
</body>
</html>