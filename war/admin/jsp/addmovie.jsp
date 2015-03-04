<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Movie</title>
<link href="/css/media.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@ include file="/header.html" %>
	<form name="addmovie" action="/admin/servlet/addmovie" method="post">
	<table>
	<tr>
		<td valign="top" align="right">Title:</td>
		<td valign="top" align="left"><input type="text" name="title" size="90"></td>
	</tr>
	<tr>
		<td valign="top" align="right">Notes:</td>
		<td valign="top" align="left"><input type="text" name="notes" size="90"></td>
	</tr>
	<tr>
		<td valign="top" align="right">Url:</td>
		<td valign="top" align="left"><input type="text" name="url" size="90"></td>
	</tr>
	<tr>
		<td valign="top" align="right">Year:</td>
		<td valign="top" align="left"><input type="text" name="year" size="90"></td>
	</tr>
<%
	List<String> formats = new ArrayList<String>();
	BufferedReader input = new BufferedReader(new FileReader("data/movie/formats.txt"));
	String line = "";
	while ((line = input.readLine()) != null)
	{
		formats.add(line);
	}
	input.close();
	%>
	<tr>
		<td valign="top" align="right">Format:</td>
		<td valign="top" align="left"><select name="format" size="<%=formats.size()%>">
<%
	String selected = "";
	for (String format : formats)
	{
		if ("VHS".equals(format))
		{
			selected = "selected=\"selected\"";
		}
		else
		{
			selected = "";
		}	
%>
<option value="<%=format%>" <%=selected%>><%=format%></option>

<%
}
%>
</select></td>
	</tr>
	<tr>
	<%
	List<String> locations = new ArrayList<String>();
	BufferedReader input2 = new BufferedReader(new FileReader("data/movie/locations.txt"));
	String line2 = "";
	while ((line2 = input2.readLine()) != null)
	{
		locations.add(line2);
	}
	input2.close();
	%>
		<td valign="top" align="right">Location:</td>
		<td valign="top" align="left"><select name="location">
		<option value=""></option>
		<%
	for (String location : locations)
	{
%>
		<option value="<%=location%>"><%=location%></option>
<%
	}
%>
		</select></td>
		</tr>
		<tr>
		<td valign="top" align="right"><button type="submit">Add</button></td>
		<td>&nbsp;</td>
	</tr>
	</table>
	</form>
<%@ include file="/footer.html" %>
</body>
</html>