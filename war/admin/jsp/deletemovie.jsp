<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Movie</title>
<link href="/css/media.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@ include file="/header.html" %>
	<form name="deletemovie" action="/admin/servlet/deletemovie" method="post">
	<table>
	<tr>
		<td valign="top" align="right">Title:</td>
		<td valign="top" align="left"><input type="text" name="title" size="90"></td>
	</tr>

	<tr>
		<td valign="top" align="right"><button type="submit">Delete</button></td>
		<td>&nbsp;</td>
	</tr>
	</table>
	</form>
<%@ include file="/footer.html" %>
</body>
</html>