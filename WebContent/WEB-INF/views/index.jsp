<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.hanains.guestbook.vo.GuestbookVo"%>
<%@ page import="java.util.List"%>
<%
	List<GuestbookVo> list = (List<GuestbookVo>) request.getAttribute("list");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>

	<c:set var="count" value="${fn:length(list)}"></c:set>
	--${count }--

	<form action="/guestbook2/gs?a=index" method="post">
		<table border=1 width=500>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
				<td>비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td colspan=4><textarea name="message" cols=60 rows=5></textarea></td>
			</tr>
			<tr>
				<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
			</tr>
		</table>
	</form>
	<br>

	<c:forEach items="${list}" var="vo" varStatus="status">

		<table width=510 border=1>
			<tr>
				<td>${count-status.index}</td>
				<td>${vo.name}</td>
				<td>${vo.date}</td>
				<td><a href="/guestbook2/gs?a=deleteform&no=${vo.no}">삭제</a></td>
			</tr>
			<tr>
				<td colspan=4>${vo.message }</td>
			</tr>
		</table>
		<br>
	</c:forEach>
</body>
</html>