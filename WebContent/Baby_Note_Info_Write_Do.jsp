<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	 String subject = "";
	 String contents= "";
	 int no = 0;
	 String	category = "";
	 int views = 0;
	 int rating = 0;
	 
	 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 String date =  formatter.format(new java.util.Date());
	 
	 String m_id = "master"; // 마스터 아이디
	
	 String realFolder = "";
	 String filename1 = "";
	 int maxSize = 1024*1024*5;
	 String encType = "UTF-8";
	 String savefile = "InfoImage";
	 ServletContext scontext = getServletContext();
	 realFolder = scontext.getRealPath(savefile);
	 
	 try{
	  	MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	  	Enumeration<?> files = multi.getFileNames();
		
	    String file1 = (String)files.nextElement();
	    filename1 = multi.getFilesystemName(file1);
	    
	    subject = multi.getParameter("subject");
		contents = multi.getParameter("contents");
		category = multi.getParameter("category");
		views = Integer.parseInt(multi.getParameter("views"));
		rating = Integer.parseInt(multi.getParameter("rating"));
		
	 } catch(Exception e) {
	  e.printStackTrace();
	  
	 }

	 String fullpath = savefile + "/" + filename1;
	 
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = null;
	
	try{
		String url = "jdbc:mysql://localhost:3306/BABY_NOTE";
		String dbid = "root";
		String dbpw = "nmop1019";
		
	    Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,dbid,dbpw);
		
		sql = "SELECT count(*) FROM BABY_NOTE.Info;";
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			no = rs.getInt(1) + 1;
		}
		
		sql = "INSERT INTO `BABY_NOTE`.`Info` (`I_No`, `I_Image`, `I_Contents`,`I_Subject`, `M_ID`, `I_Date`, `I_Category`, `I_Views`, `I_Rating` ) "
				+ "VALUES (?,?, ?, ?, ?, ?, ?, ?, ?); " ; 
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, no);
		pstmt.setString(2, fullpath);
		pstmt.setString(3, contents);
		pstmt.setString(4, subject);
		pstmt.setString(5, m_id);
		pstmt.setString(6, date);
		pstmt.setString(7, category);
		pstmt.setInt(8, views);
		pstmt.setInt(9, rating);
		
		out.println(pstmt);
		pstmt.executeUpdate();
		
		out.println("<script>alert('등록 되었습니다.');</script>");
		
	}catch(Exception e){
		e.printStackTrace();
		
	}finally{
		if(stmt != null) try{stmt.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}           
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
}
%>

