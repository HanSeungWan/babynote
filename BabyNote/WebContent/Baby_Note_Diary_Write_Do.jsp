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
	 String share = "";
	 String no = "";
	 String m_id = "";
	
	 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 String date =  formatter.format(new java.util.Date());
	 
	formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
	String no_date = formatter.format(new java.util.Date());
	
	 String realFolder = "";
	 String filename1 = "";
	 int maxSize = 1024*1024*5;
	 String encType = "UTF-8";
	 String savefile = "Diary_Image";
	 ServletContext scontext = getServletContext();
	 realFolder = scontext.getRealPath(savefile);
	 m_id = (String)session.getAttribute("user_id");
	 
	 try{
	  	MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	  	Enumeration<?> files = multi.getFileNames();
		
	    String file1 = (String)files.nextElement();
	    filename1 = multi.getFilesystemName(file1);
	    
	    subject = multi.getParameter("subject");
		contents = multi.getParameter("contents");
		share = multi.getParameter("share");
		
		if(share == null) {share = "n";}
		
		no = 1 + "+" + m_id + "+" + no_date; // 고유 넘버 생성 1+아이디+날짜
		
	 } catch(Exception e) {
	  e.printStackTrace();
	  
	 }

	 String fullpath = savefile + "/" + filename1;
 
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	
	try{
		String url = "jdbc:mysql://localhost:3307/BABY_NOTE";
		String dbid = "root";
		String dbpw = "sql123!@#";
		
	    Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,dbid,dbpw);
		
		String sql = "INSERT INTO `BABY_NOTE`.`Diary` (`D_No`, `D_Image`, `D_Contents`, "
				+ "		`D_Share`, "
				+ "		`D_Subject`, "
				+ "		`M_ID`, "
				+ "		`D_Date`) "
				+ "		VALUES "
				+ "     (?, " // D_No
				+ "		?, " // D_Image
				+ "		?, "  // D_Contents
				+ "		?, "  // D_Share
				+ "		?, "  // D_SUbject
				+ "		?, "  // M_ID
				+ "		?); " ; // D_Date	 
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, no);
		pstmt.setString(2, fullpath);
		pstmt.setString(3, contents);
		pstmt.setString(4, share);
		pstmt.setString(5, subject);
		pstmt.setString(6, m_id);
		pstmt.setString(7, date);
	
		pstmt.executeUpdate();
		
		// TimeLine 저장 부분
		if(share.equals("y")){
			
			String t_no = null;
			String t_date = null;
			int t_rating = 0;
			String d_no = no;
			
			formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
			no_date =  formatter.format(new java.util.Date());
			
			t_no = 4 + "+" + m_id + "+" + no_date; // 고유 넘버 생성 4+아이디+날짜
			
			sql = "INSERT INTO `BABY_NOTE`.`TimeLine` (`T_No`,`T_Date`,`T_Rating`,`D_No` ,`M_ID`) "
				+  "VALUES(?,?,?,?,?); ";
				
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, t_no);
			pstmt.setString(2, no_date);
			pstmt.setInt(3, t_rating);
			pstmt.setString(4, no);
			pstmt.setString(5, m_id);
			
			pstmt.executeUpdate();
		}
		
		else{}
		
		response.sendRedirect("http://45.55.192.8:8080/Baby_Note_Diary_View.jsp");
		
	}catch(Exception e){
		e.printStackTrace();
		out.println("erorr");
		
	}finally{
		if(stmt != null) try{stmt.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}           
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
}
%>

