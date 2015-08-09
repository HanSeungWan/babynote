<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

카테고리  <br>
-> 칼럼 = c <br>
-> 임신 출산  = p <br>
-> 육아 = g <br>
	
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

<html>
	<head>
		<title>
			Info Write
		</title>
	</head>
	<body>
		<form name="fileForm" id="fileForm" action="Baby_Note_Info_Write_Do.jsp" method = post enctype="multipart/form-data">
			제목 : <input type ="text" name = "subject"> <br>
			카테고리 : <input type ="text" name = "category"> <br>
			내용 : <textarea rows = "5" cols="30" name = "contents"></textarea> <br>
			views : <input type ="text" name = "views"> <br>
			rating : <input type ="text" name = "rating"> <br>
			사진 :
			<div id="imagePreview"></div><br>
			<input id="image" name ="file1" type="file" onchange="InputImage();"> <br>
			<input type="submit" value="쓰기">
		</form>
	</body>
</html>