<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 이부분 수정해 주시면 됩니다! 육아 일기를 작할때 뜨는 창입니다. -->

<html>
	<head>
		<title>
			Diary_Write
		</title>
	</head>
	<body>
		<form name="fileForm" id="fileForm" action="Baby_Note_Diary_Write.do" method = post enctype="multipart/form-data">
			제목 : <input type ="text" name = "subject"> <br>
			내용 : <textarea rows = "5" cols="30" name = "contents"></textarea> <br>
			사진 :
			<div id="imagePreview"></div><br>
			<input id="image" name ="file1" type="file" onchange="InputImage();"> <br>
			공유 : <input type = "checkbox" value = 'y' name = "share"> <br>
			<input type="submit" value="쓰기">
		</form>
	</body>
</html>

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
