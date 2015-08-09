<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %> 


<%
	
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("follower_id");
	String name = request.getParameter("follower_name");
	String user_id = (String)session.getAttribute("user_id");
	
	
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
		
		String sql = "INSERT INTO `BABY_NOTE`.`Follower` (`F_ID`, `F_Name`, `M_ID`)"
				+"VALUES (?, ?, ?);";
		
		pstmt = conn.prepareStatement(sql);
	
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, user_id);
	
		pstmt.executeUpdate();
		
		sql = "INSERT INTO `BABY_NOTE`.`Follower` (`F_ID`, `F_Name`, `M_ID`)"
				+"	VALUES (?, ?, ?);";
		
		pstmt = conn.prepareStatement(sql);
	
		pstmt.setString(1, user_id);
		pstmt.setString(2, name);
		pstmt.setString(3, id);
	
		pstmt.executeUpdate();
	
		out.println("<script>alert('following 하였습니다.');this.close;</script>");
		
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