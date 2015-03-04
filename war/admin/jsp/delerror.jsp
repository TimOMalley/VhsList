<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Delete Error</title>
    <link href="/css/media.css" rel="stylesheet" type="text/css" />
  </head>

  <body>
   <%@ include file="/header.html" %>
	<h1 align="center">Movie Delete Error</h1>
	<%
	String title = request.getParameter("title");
	%>
    <h2 align="center">Could not delete <%=title%> from listing!</h2>
     <%@ include file="/footer.html" %>
  </body>
</html>
