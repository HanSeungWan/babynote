<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %> 
	
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	String d_no = request.getParameter("d_no");
	String contents = null;
	String subject = null;
	String image = null;
	String share = null;
	String id = (String)session.getAttribute("user_id");
	
try{
			
		String url = "jdbc:mysql://localhost:3307/BABY_NOTE";
		String dbid = "root";
		String dbpw = "sql123!@#";
		
	    Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,dbid,dbpw);
		
		String sql = "SELECT * FROM BABY_NOTE.Diary where D_No = '"+d_no+"';";
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			
			image = rs.getString(2);
			contents = rs.getString(3); // Diary contents
			subject = rs.getString(5); // Diary Subject
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<script type="text/javascript">
var InputImage = 
	(function loadImageFile() {
    if (window.FileReader) {
        var ImagePre; 
        var ImgReader = new window.FileReader();
        var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i; 

        ImgReader.onload = function (Event) {
            if (!ImagePre) {
                var newPreview = document.getElementById("imagePreview");
                ImagePre = new Image();
                ImagePre.style.width = "200px";
                ImagePre.style.height = "140px";
                newPreview.appendChild(ImagePre);
            }
            ImagePre.src = Event.target.result;
            
        };

        return function () {
        	
            var img = document.getElementById("image").files;
           
            if (!fileType.test(img[0].type)) { 
            	alert("이미지 파일을 업로드 하세요"); 
            	return; 
            }
            
            ImgReader.readAsDataURL(img[0]);
        }

    }
   			
            document.getElementById("imagePreview").src = document.getElementById("image").value;

      
})();
</script>


<!-- 이부분 수정하시면 됩니다. 다이어리 수정시 들어갈 부분입니다. -->

<form name="fileForm" id="fileForm" action="Baby_Note_Diary_Change_Do.jsp" method = post enctype="multipart/form-data">
	제목 : <textarea rows = "1" cols="30" name = "subject" > <%= subject %> </textarea> <br>
	내용 : <textarea rows = "5" cols="30" name = "contents"><%= contents %></textarea> <br>
	사진 :
	<div id="imagePreview"></div><br>
	<input id="image" name ="file1" type="file" onchange="InputImage();"> <br>
	공유 : <input type = "checkbox" value = 'y' name = "share"> <br>
	<input type="submit" value="쓰기">
	<input type="hidden" value="<%=d_no%>" name="d_no"></input>
</form>
