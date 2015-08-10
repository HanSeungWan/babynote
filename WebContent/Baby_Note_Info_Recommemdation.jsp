<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %> 

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String temp = request.getParameter("Recommend");
	int status = Integer.parseInt(temp);
	String I_No = request.getParameter("No");
	
	try{
		String url = "jdbc:mysql://localhost:3307/BABY_NOTE";
		String dbid = "root";
		String dbpw = "sql123!@#";
		
	    Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,dbid,dbpw);
		
		String sql = "SELECT I_Rating FROM BABY_NOTE.Info Where I_No = " + "'" + I_No + "'";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		int no = 0;
		
		while(rs.next()){
			
			no = rs.getInt(1);
		}
		
		// status가 1이면 좋아요 상태로 Rating이 1증가.
		if(status == 1){
			
			no = no + 1;
			sql = "UPDATE `BABY_NOTE`.`Info` SET `I_Rating`= " + "'" + no + "'" + " WHERE `I_No` = " + "'" + I_No + "'" ;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();		
		}
		
		// status가 0이면 Rating -1
		else if(status == 0){
			
			if(no == 0){} // Rating이 0일 경우 -1 거절
			
			else{
				no = no - 1;
				
				sql = "UPDATE `BABY_NOTE`.`Info` SET `I_Rating`= " + "'" + no + "'" + " WHERE `I_No` = " + "'" + I_No + "'" ;
				
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
			}
			
		}
		
		while(rs.next()){
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