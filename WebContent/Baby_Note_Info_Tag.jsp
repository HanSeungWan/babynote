<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %> 

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	int check = 0;
		
	try{
		String url = "jdbc:mysql://localhost:3307/BABY_NOTE";
		String dbid = "root";
		String dbpw = "sql123!@#";
		
	    Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,dbid,dbpw);
		
		String sql = "SELECT * FROM BABY_NOTE.Info where I_Category = 'Column';";	
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			out.println("Info No : " + rs.getString(1)); // Info 등록번호
			%> <br></br> <%
			out.println("Info Category : 칼럼"); // Info Category
			%> <br></br> <%
			out.println("Info Image : " );
			%>
				<img src = "<%=rs.getString(3)%>" width="100">
			<% // Info Image
			%> <br></br> <%
			out.println("Info subject : " + rs.getString(4)); // Info 글 제목
			%> <br></br> <%
			out.println("Info Contents : " + rs.getString(5)); // Info 내용
			%> <br></br> <%
			//out.println(rs.getString(6)); // Info 제공자 = master -> hanseungwan24@gmail.comInfo
			out.println("Info Date : " + rs.getString(7));
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