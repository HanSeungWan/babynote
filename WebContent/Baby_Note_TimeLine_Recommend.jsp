<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %> 

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String m_id = (String)session.getAttribute("user_id");
	String d_no = request.getParameter("d_no");
	int rating = 0;
	
	try{
		String url = "jdbc:mysql://localhost:3307/BABY_NOTE";
		String dbid = "root";
		String dbpw = "sql123!@#";
		
	    Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,dbid,dbpw);
		
		String sql = "SELECT T_Rating FROM BABY_NOTE.TimeLine where D_No = '"+d_no+"';";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);

		while(rs.next()){
			rating = rs.getInt(1);		
		}
		
		rating++;
		
		sql = "UPDATE `BABY_NOTE`.`TimeLine` SET `T_Rating`='"+rating+"' WHERE `D_No`='"+d_no+"'";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.executeUpdate();
		
		response.sendRedirect("/Baby_Note_TimeLine_Veiw.jsp");
		
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