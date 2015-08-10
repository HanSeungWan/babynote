<%@ page info="diary calendar" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" import="java.sql.*,java.io.*,java.net.*,java.util.*" %>

<%! 

	public String checkNull(String str) {
		String strTmp;
		if(str == null)
			strTmp = "";
		else
			strTmp = str;
		return strTmp;
	}

%>

<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	String mode = checkNull(request.getParameter("mode"));
	String id = request.getParameter("id");
	String member_id = (String)session.getAttribute("user_id");
	String member_name = "한승완"; // 임시
	String member_email = null;	
	String year = new String();
	String month = new String();
	String day = new String();
	String subject = new String();
	String contents = new String();
	String query = new String();
	String created = new String();
	
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
		stmt = conn.createStatement();
	} catch(SQLException e) {
	}
	
	try {
		if (mode.equals("modify")) {
		
		query = "select * from Calendar where C_No="+id;
		rs = stmt.executeQuery(query);
		
			if (rs.next()) {
				year = rs.getString("year");
				month = rs.getString("month");
				day = rs.getString("day");
				subject = rs.getString("subject");
				contents = rs.getString("contents");
				created = rs.getString("created");
				mode = "update";
			}	
		rs.close();
		} else if (mode.equals("insert")) {
			//새글을 저장할 경우
			
			query = "insert into Calendar values (seq_diary_id.nextval, ?, ?, ?, ?, ?, sysdate, ?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, year);
			pstmt.setString(2, month);
			pstmt.setString(3, day);
			pstmt.setString(4, subject);
			pstmt.setString(5, contents);
			pstmt.setString(6, member_id);
			pstmt.execute();
			
			response.sendRedirect("calendar.jsp");
			
		} else if (mode.equals("update")) {
			//수정한 글을 저장할 경우
			
			query = "update Calendar set C_Year=?, C_Month=?, C_Day=?, C_Subject=?, C_Contents=? WHERE C_No="+id;
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, year);
			pstmt.setString(2, month);
			pstmt.setString(3, day);
			pstmt.setString(4, subject);
			pstmt.setString(5, contents);
			pstmt.execute();
			
			response.sendRedirect("Baby_Note_Calendar_Main.jsp");
			
		} else {
			//모드 값이 없으면 새글 작성으로 간주
			mode = "insert";
		}
	} catch(SQLException e) {
	} finally {
		conn.close();
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


<script language="JavaScript">
<!--	
function check()
{
	f = document.diaryInput;
	if (!f.subject.value) {
		alert ("제목을 입력하세요!");
		f.subject.focus();
		return false;
	}
	
	if (!f.contents.value) {
		alert("내용을 입력하세요!");
		f.contents.focus();
		return false;	
	}	
}
//-->
</script>


</head>
<body LEFTMARGIN="0" TOPMARGIN="0" MARGINWIDTH="0" MARGINHEIGHT="0">
<form method="post"  name="diaryInput" action="Baby_Note_Calendar_Write.jsp" onSubmit="return check()">

	<table width="235" height="180" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td align="center" valign="top" >
			
			
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
						<td width="210" height="20" align="left" class="title">
							<input type="hidden" name="year" value="<%= year %>" >
							<input type="hidden" name="month" value="<%= month %>">
							<input type="hidden" name="day" value="<%= day %>">
							&nbsp;<%= year %>년 <%= month %>월 <%= day %>일
						</td>
					</tr>
					<tr>
						<td width="210" height="20" align="left" class="title">&nbsp;제목&nbsp;:&nbsp;<input type="text" name="subject" value="<%= subject %>" size="20" maxlength="100" class="title">
						</td>
					</tr>
					<tr>
						<td width="210" height="80" align="left">
							<table width="200" height="80" border="0" cellspacing="0" cellpadding="0" align="left" valign="top">
								<tr>
									<td width="5"></td>
									<td width="195" valign="top" align="left" class="title"><textarea name="contents" cols="30" rows="5" class="title"><%= contents %></textarea></td>
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
							<input type="hidden" name="mode" value="<%= mode %>">
							<input type="hidden" name ="id" value="<%= id %>">
							<input type = "submit" value="전송">
							<input type = "button" value="취소" onClick="location='Baby_Note_Calendar_Main.jsp'">			
						</td>
					</tr>
					<tr>
						<td width="210" height="1" bgcolor="#D2FCFC"></td>
					</tr>
					<tr>
						<td wdith="210" height="2" bgcolor="#44A5E9"></td>
					</tr>
					
				</table>
	
			</td>
		</tr>
	</table>

</form>
</body>
</html>