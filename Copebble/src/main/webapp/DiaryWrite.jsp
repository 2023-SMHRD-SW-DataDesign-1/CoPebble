<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="Diary">
		<form action="DiaryWriteCon.do" method="post"
			enctype="multipart/form-data">
			<table id="DiaryWritelist">
				<tr>
					<span>제목</span>
					<td><input type="text" name="TITLE"></td>
				</tr>

				<tr>
					<td colspan="2">내용</td>
				</tr>
				<tr>
					<td colspan="2"><input name="FILENAME" type="file">
					</td>
				</tr>
				<tr>
					<td><textarea name="DIARY" rows="10" style="resize: none;"></textarea>
					</td>
				</tr>
				<tr>
				<td>패밀리키
			<input type="text" name="FAMILY_KEY">	</td>	
					<td colspan="2"><input type="reset" value="초기화"> <input
						type="submit" value="작성하기"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>