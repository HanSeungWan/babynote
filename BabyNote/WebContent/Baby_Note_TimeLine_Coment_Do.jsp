<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	ResultSet rs = null;		
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	String tl_no = null;
	String contents = request.getParameter("contents");
	String date = null;
	String no_date = null;
	String t_no = request.getParameter("t_no");
	String d_no = request.getParameter("d_no");
	String m_id = (String)session.getAttribute("user_id");
	
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	date =  formatter.format(new java.util.Date());
	
	formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
	no_date =  formatter.format(new java.util.Date());
	
	tl_no = 5 + "+" + m_id + "+" + no_date; // 고유 넘버 생성 5+아이디+날짜
	
	try{
		String url = "jdbc:mysql://localhost:3307/BABY_NOTE";
		String dbid = "root";
		String dbpw = "sql123!@#";
		
	    Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,dbid,dbpw);
		
		String sql = " SET FOREIGN_KEY_CHECKS = 0; ";
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		
		sql = "INSERT INTO `BABY_NOTE`.`TimeLine_Reply` (`TL_No`, `TL_Contents`, `TL_Date`, `T_No`, `D_No`, `M_ID`)"
				+ " VALUES(?,?,?,?,?,?);";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, tl_no);
		pstmt.setString(2, contents);
		pstmt.setString(3, date);
		pstmt.setString(4, t_no);
		pstmt.setString(5, d_no);
		pstmt.setString(6, m_id);
		
		out.println(pstmt);
		
		pstmt.executeUpdate();
		
		request.getRequestDispatcher("/Baby_Note_TimeLine_Coment.jsp").forward(request, response);
	
	}catch(Exception e){
		e.printStackTrace();
		out.println("erorr");
		
	}finally{
		if(stmt != null) try{stmt.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}           
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
}
%>