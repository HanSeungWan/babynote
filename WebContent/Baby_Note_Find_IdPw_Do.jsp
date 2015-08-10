<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String answer = request.getParameter("answer");
	String questions = request.getParameter("questions");
	int check = 0;
	int id_check = 0;
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	String pw = null;
	String  sql = null;
	
	try{
		String url = "jdbc:mysql://localhost:3307/BABY_NOTE";
		String dbid = "root";
		String dbpw = "sql123!@#";
		
	    Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,dbid,dbpw);
		
		sql = "SELECT count(*) FROM BABY_NOTE.Member where Member.M_ID = '"+id+"';";	
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			id_check = rs.getInt(1);
		}
		
		if(id_check == 1){
			if(answer.equals("")){
				out.println("<script>alert('질문 답변을 입력해 주세요.');history.back();</script>");
			} else { 
				if(questions.equals("0")){ // 질문 선택이 안되었을 경우.
					out.println("<script>alert('질문을 입력해 주세요.');history.back();</script>");
					} else{	
						sql = "SELECT count(*) FROM BABY_NOTE.Member where Member.M_Questions = '"+questions+"' and Member.M_Answer = '"+answer+"';";	
						stmt = conn.createStatement();
						rs = stmt.executeQuery(sql);
						
						while(rs.next()){
							check = rs.getInt(1);
						}
						
						if(check == 1){
							sql = "SELECT Member.M_PW FROM BABY_NOTE.Member where Member.M_Questions = '"+questions+"' and Member.M_Answer = '"+answer+"';";	
							stmt = conn.createStatement();
							rs = stmt.executeQuery(sql);
							
							while(rs.next()){
								pw = rs.getString(1);
							}
							
							%>
								<script>alert('비밀번호 : ' + <%=pw%> + ' 입니다.');location.href='http://45.55.192.8:8080/Baby_Note_SignIn.jsp'</script>
							<%
						} else{
							%>
								<script>alert('질문 답변이 틀렸습니다.');history.back();</script>
							<%
						}
					}
			}
		} else {
			%>
				<script>alert('아이디가 없습니다.');history.back();</script>
			<%
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