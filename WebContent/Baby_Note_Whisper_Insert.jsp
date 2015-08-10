<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
	</head>
	<body>
		<form name="fileForm" id="fileForm" action="Baby_Note_Whisper_Insert.do" method = post target = "whisper_buttom">
			내용 : <input type = "text" name = "contents" required = ""/>
			<input type="submit" value="입력하기" onclick = "refresh()" onkeypress = "refresh()">
		</form>
	</body>
</html>

<script>
	function refresh(){
		location.reload();
	}
</script>