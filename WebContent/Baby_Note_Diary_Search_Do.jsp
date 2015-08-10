<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %> 
 
<%
	request.setCharacterEncoding("UTF-8");
	String searchs = request.getParameter("searchs");

	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	String image [] = new String [99999];
	String subject [] = new String [99999];
	String contents [] = new String [99999];
	String date [] = new String [99999];
	String d_no [] = new String [99999];
	int counter = 0;
	
	try{
		String url = "jdbc:mysql://localhost:3307/BABY_NOTE";
		String dbid = "root";
		String dbpw = "sql123!@#";
		
	    Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,dbid,dbpw);
		
		String sql = "SELECT * FROM BABY_NOTE.Diary where D_Subject Like '%"+searchs+"%' OR D_Contents LIKE '%"+searchs+"%';";	
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			d_no[counter] = rs.getString(1);
			image[counter] = rs.getString(2);
			contents[counter] = rs.getString(3);
			subject[counter] = rs.getString(5);
			date[counter] = rs.getString(7);
			counter++;
		}
	
	}catch(Exception e){
		e.printStackTrace();
		out.println("erorr");
		
	}finally{
		if(stmt != null) try{stmt.close();}catch(SQLException sqle){}
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}           
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
}
%>

<!-- 이부분 수정 하시면 됩니다. 다이어리 메인 페이지에서 검색 후 결과를 출력 하는 부분 입니다. -->

<%
	for(int i=0; i<counter; i++){
%>
				<table border = "1">
					<tr>
						<td>
							<form action="http://45.55.192.8:8080/Baby_Note_Diary_Delete.jsp">
				    			<input type="submit" value="삭제">
				    			<input type="hidden" value=<%= d_no[i] %> name = d_no>
							</form>
							<form action="http://45.55.192.8:8080/Baby_Note_Diary_Change.jsp">
				    			<input type="submit" value="수정">
								<input type="hidden" value=<%= d_no[i] %> name = d_no>
							</form>
<%
							if(image[i] == null){
								// 이미지 없을 때	
							} else {
%>
								Diary Image <img src = "<%=image[i]%>" width="100"></img>
<% 							}
							%> <br></br> <%
							out.println("Diary Contents : " + contents[i]); // Diary contents
							%> <br></br> <%
							out.println("Diary Subject : " + subject[i]); // Diary Subject
							%> <br></br> <%
							out.println("Diary Date : " + date[i]); // Diary Date
							%> <br></br> 	
						</td>
					</tr>
				</table>
<%
		}
%>