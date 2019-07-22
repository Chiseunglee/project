<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
안전하게 로그아웃 되었습니다. 이용해주셔서 감사합니다.<hr/>
다시 로그인 하시려먼
아이디와 비밀번호를 입력하십시오<hr>
<form action="logined">
<table border="1">
<tr>
<td>아이디</td>
<td><input type="text" name="id">
</td>
</tr>
<tr>
<td>비밀번호</td>
<td><input type="password" name="pw">
</td>
</tr>
<tr> 
<td colspan=2><input type="checkbox" name="savedID" value="1">아이디 저장
</tr> 
<tr>
<td colspan=2>
<a href="join">[회원가입]</a>
<input type="submit" value="로그인">
</table>
<hr>
<a href="main">[첫화면으로]</a>
</form>
</body>
</html>