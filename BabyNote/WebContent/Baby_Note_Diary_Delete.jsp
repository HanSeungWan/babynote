<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %> 


<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	String d_no = request.getParameter("d_no");
	
	try{
		
		String url = "jdbc:mysql://localhost:3307/BABY_NOTE";
		String dbid = "root";
		String dbpw = "sql123!@#";
		
	    Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,dbid,dbpw);
		
		String sql = "DELETE FROM `BABY_NOTE`.`TimeLine` WHERE `D_No`= ? ";
	
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,d_no);
		
		pstmt.executeUpdate();
		

		sql = "DELETE FROM `BABY_NOTE`.`Diary` WHERE `D_No`= ? ";

		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,d_no);
		
		pstmt.executeUpdate();
		
		response.sendRedirect("http://45.55.192.8:8080/Baby_Note_Diary_Veiw.jsp");
		
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