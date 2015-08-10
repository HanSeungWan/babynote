<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	String subject = null;
	String contents = null;
	String share = null;
	String d_no = null;
	String m_id = (String)session.getAttribute("user_id");
	
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String date =  formatter.format(new java.util.Date());
	
	String realFolder = "";
	String filename1 = "";
	int maxSize = 1024*1024*5;
	String encType = "UTF-8";
	String savefile = "Diary_Image";
	ServletContext scontext = getServletContext();
	realFolder = scontext.getRealPath(savefile);
	 
	try{
		MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	 	Enumeration<?> files = multi.getFileNames();
		
	 	subject = multi.getParameter("subject");
		contents = multi.getParameter("contents");
		share = multi.getParameter("share");
		d_no = multi.getParameter("d_no");
		m_id = (String)session.getAttribute("user_id");
		
	    String file1 = (String)files.nextElement();
	    filename1 = multi.getFilesystemName(file1);
	    
		if(share == null) {share = "n";}
		
	 } catch(Exception e) {
	  e.printStackTrace();
	  
	 }

	 String fullpath = savefile + "/" + filename1;
 	
	try{
		String url = "jdbc:mysql://localhost:3307/BABY_NOTE";
		String dbid = "root";
		String dbpw = "sql123!@#";
		
	    Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,dbid,dbpw);
		
		String sql  = 
			"UPDATE `BABY_NOTE`.`Diary` SET `D_No` = ?, `D_Image` = ?, `D_Contents` = ?,"
			+ "`D_Share` = ?, `D_Subject` = ?, `M_ID` = ?, `D_Date` = ?"
			+ "WHERE `D_No` = '"+d_no+"' AND `M_ID` = '"+m_id+"';";
 
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, d_no);
		pstmt.setString(2, fullpath);
		pstmt.setString(3, contents);
		pstmt.setString(4, share);
		pstmt.setString(5, subject);
		pstmt.setString(6, m_id);
		pstmt.setString(7, date);
	
		pstmt.executeUpdate();
		
		response.sendRedirect("http://45.55.192.8:8080/Baby_Note_Diary_Veiw.jsp");
		
	}catch(Exception e){
		e.printStackTrace();
		out.println("erorr");
		
	}finally{
		if(stmt != null) try{stmt.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}           
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
}
%>

