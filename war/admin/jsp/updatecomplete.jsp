<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Update Complete</title>
    <link href="/css/media.css" rel="stylesheet" type="text/css" />
  </head>

  <body>
   <%@ include file="/header.html" %>
	<h1 align="center">Movie Updated</h1>
	<%
	String title = request.getParameter("title");
	String format = request.getParameter("format");
	String location = request.getParameter("location");
	String notes = request.getParameter("notes");
	String url = request.getParameter("url");
	String year = request.getParameter("year");
	%>
    <table align="center">
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
      <tr>
        <th align="right" valign="middle">Notes:</th>
        <td align="left" valign="middle"><%=notes%></td>
      </tr>
      <tr>
        <th align="right" valign="middle">URL:</th>
        <td align="left" valign="middle"><%=url%></td>
      </tr>
      <tr>
        <th align="right" valign="middle">Year:</th>
        <td align="left" valign="middle"><%=year%></td>
      </tr>
    </table>
     <%@ include file="/footer.html" %>
  </body>
</html>
