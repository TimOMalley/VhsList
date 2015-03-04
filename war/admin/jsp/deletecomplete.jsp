<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Delete Complete</title>
    <link href="/css/media.css" rel="stylesheet" type="text/css" />
  </head>

  <body>
   <%@ include file="/header.html" %>
	<h1>Movie Deleted From Listing</h1>
	<%
	String title = request.getParameter("title");
	String format = request.getParameter("format");
	String location = request.getParameter("location");
	%>
    <table>
      <tr>
        <th align="right" valign="middle">Title:</th>
        <td align="left" valign="middle"><%=title.toUpperCase()%></td>        
      </tr>
      <tr>
        <th align="right" valign="middle">Format:</th>
        <td align="left" valign="middle"><%=format%></td>
      </tr>
      <tr>
        <th align="right" valign="middle">Location:</th>
        <td align="left" valign="middle"><%=location%></td>
      </tr>
    </table>
     <%@ include file="/footer.html" %>
  </body>
</html>
