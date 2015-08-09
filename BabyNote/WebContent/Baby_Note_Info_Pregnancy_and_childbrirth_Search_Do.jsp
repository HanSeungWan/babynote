<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %> 
 
<%
	request.setCharacterEncoding("UTF-8");
	String searchs = request.getParameter("searchs");

	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	String image[] = new String[99999];
	String subject[] = new String[99999];
	String contents[] = new String[99999];
	String date[] = new String[99999];
	String views[] = new String[99999];
	String rating[] = new String[99999];
	int counter = 0;

	try{
		String url = "jdbc:mysql://localhost:3307/BABY_NOTE";
		String dbid = "root";
		String dbpw = "sql123!@#";
		
	    Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,dbid,dbpw);
		
		String sql = "select * from BABY_NOTE.Info Where I_Category = 'p' and I_Category in (SELECT I_Category FROM BABY_NOTE.Info where I_Subject Like '%"+searchs+"%' OR I_Contents LIKE '%"+searchs+"%')";	
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			image[counter] = rs.getString(3);
			subject[counter] = rs.getString(4);
			contents[counter] = rs.getString(5);
			date[counter] = rs.getString(7);
			views[counter] = rs.getString(8);
			rating[counter] = rs.getString(9);
			counter++;
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

<!-- 요기 수정해 주시면 됩니다! -->
<%
	for(int i=0; i<counter; i++){%>
			<table border = "1" >
				<tr>
					<td>
						<br><%
							out.println("Image : "); %><img src = "<%=image[i]%>" width="100"> <br><%
							out.println("Subject : " + subject[i]);%><br><%
							out.println("Contents : " + contents[i]);%><br><%
							out.println("Date : "  + date[i]);%><br><%
							out.println("Views : "  + views[i]);%><br><%
							out.println("Rating : "  + rating[i]);%><br>
					</td>
				</tr>
			</table>
			<%
	}
%>