<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

<!-- 이부분 수정해 주시면 되요~! -->
<!DOCTYPE html>
<html>
	<head>
		<title>
			회원 가입
		</title>
	</head>
	<body>
		<form name="fileForm" id="fileForm" action="Baby_Note_SignUp.do" method = post enctype="multipart/form-data">
			아이디 : <input type ="email" name = "id" required = ""/> <br>
			비밀번호 : <input type ="password" name = "pw" required = ""/> <br>
			비밀번호 확인 : <input type ="password" name = "rpw" required = ""/> <br>
			이름 : <input type = "text" name = "name" required = ""/> <br>
			질문 : 
			<select name="questions" >
				<option value = "0">비밀번호 찾기에 사용할 질문을 선택해 주세요.</option>
				<option value = "1">가장좋아 하는 색은?</option>
				<option value = "2">가장좋아 하는 친구는?</option>
				<option value = "3">고향 이름은?</option>
				<option value = "4">내가 가장 좋아 하는 것은?</option>
			</select> <br>
			답변 : <input type = "text" name = "answer" required = ""/> <br>
			프로필사진 : <div id="imagePreview"></div><br>
			<input id="image" name ="file1" type="file" onchange="InputImage();"> <br>
			<input type="submit" value="가입하기">
		</form>
	</body>
</html>