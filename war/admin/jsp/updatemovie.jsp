<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.TreeMap"%>
<%@page import="com.google.appengine.api.datastore.FetchOptions"%>
<%@page import="com.google.appengine.api.datastore.Entity"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="com.google.appengine.api.datastore.Query"%>
<%@page import="com.google.appengine.api.datastore.KeyFactory"%>
<%@page import="com.google.appengine.api.datastore.Key"%>
<%@page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@page import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@page import="com.twelvelouisiana.googleapps.vhslist.dao.MovieDao" %>
<%@page import="com.twelvelouisiana.googleapps.vhslist.model.Movie" %>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Update Movie</title>
    <link href="/css/media.css" rel="stylesheet" type="text/css" />
  </head>

  <body>
   <%@ include file="/header.html" %>
   <form name="movielist" action="/admin/servlet/updatemovie" method="post">
   <p align="center">
<%
	String updateTitle = "";
	String updateNotes = "";
	String updateUrl = "";
	String updateFormat = "";
	String updateLocation = "";
	String updateId = "";
	String updateYear = "";
	if (request.getParameter("title") != null)
	{
		updateTitle = request.getParameter("title");
		Movie updateMovie = MovieDao.INSTANCE.getMovie(updateTitle);
		updateNotes = updateMovie.getNotes();
		updateUrl = updateMovie.getUrl();
		updateFormat = updateMovie.getFormat();
		updateLocation = updateMovie.getLocation();
		updateId = String.valueOf(updateMovie.getId());
		updateYear = updateMovie.getYear();
	}

%>
   <b>Select a Movie Title:</b><br>
   <select name="movie" onchange="document.location.href=this.value">
   <option selected>
<%
	List<Movie> movies = MovieDao.INSTANCE.listMovies();
	for (Movie movie : movies)
	{
	   	String title = movie.getTitle();
		String encodedTitle = URLEncoder.encode(title, "UTF-8");
%>
      <option value="/admin/jsp/updatemovie.jsp?title=<%=encodedTitle%>"><%=title %>
<%
	}
%>
	</select>
	</p>
	<br>
	<table align="center">
	<tr>
		<td valign="top" align="right">Title:</td>
		<td valign="top" align="left"><input type="text" name="title" size="90" value="<%= ((updateTitle==null) ? "" : updateTitle) %>"></td>
	</tr>
	<tr>
		<td valign="top" align="right">Notes:</td>
		<td valign="top" align="left"><input type="text" name="notes" size="90" value="<%= ((updateNotes==null) ? "" : updateNotes) %>"></td>
	</tr>
	<tr>
		<td valign="top" align="right">Url:</td>
		<td valign="top" align="left"><input type="text" name="url" size="90" value="<%= ((updateUrl==null) ? "" : updateUrl) %>"></td>
	</tr>
	<tr>
		<td valign="top" align="right">Year:</td>
		<td valign="top" align="left"><input type="text" name="year" size="90" value="<%= ((updateYear==null) ? "" : updateYear) %>"></td>
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
		if (updateFormat.equals(format))
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
		if (updateLocation.equals(location))
		{
			selected = "selected=\"selected\"";
		}
		else
		{
			selected = "";
		}
%>
		<option value="<%=location%>" <%=selected%>><%=location%></option>
<%
	}
%>
		</select></td>
	</tr>
	</table>
	<input type="hidden" name="id" value="<%= ((updateId==null) ? "" : updateId) %>">
    <p align="center"><button type="submit">Update</button></p>
    </form>
     <%@ include file="/footer.html" %>
  </body>
</html>
