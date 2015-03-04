<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.TreeMap"%>
<%@page import="com.google.appengine.api.datastore.FetchOptions"%>
<%@page import="com.google.appengine.api.datastore.Entity"%>
<%@page import="java.util.List"%>
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
    <title>List Movies</title>
    <link href="/css/media.css" rel="stylesheet" type="text/css" />
  </head>

  <body>
   <%@ include file="/header.html" %>
   <form name="movielist" action="/emailmovielist" method="post">
   <p align="center">
   Name: <input type="text" name="name" autofocus required><br>
   Email: <input type="email" name="email" required placeholder="Enter a valid email address">
   </p>
   <p align="center"><button type="submit">Send List</button></p>
   <table style="border:1px solid black;" class="center">
   <tr>
   		<th class="padwithborder" align="left" valign="middle"></th>
   		<th class="padwithborder" align="left" valign="middle">Title</th>
        <th class="padwithborder" align="left" valign="middle">Format</th>
        <th class="padwithborder" align="left" valign="middle">Location</th>       
      	<th class="padwithborder" align="left" valign="middle"></th>
   	</tr>
<%
	List<Movie> movies = MovieDao.INSTANCE.listMovies();
	int counter = 0;
	String alternate = "";
	for (Movie movie : movies)
	{
	   	String title = movie.getTitle();
		String format = movie.getFormat();
		String location = movie.getLocation();
		String url = movie.getUrl();
		String notes = movie.getNotes();
		String year = movie.getYear();
		String yearString = "";
		if (year != null && year.length() > 0)
		{
			yearString = " (" + year + ")";
		}
		if (counter++ % 2 == 0)
	   	{
	   		alternate = " class=\"bgwhite\"";
	   	}
	   	else
	   	{
	   		alternate = "";
	   	}
%>
      <tr<%=alternate%>>
      	<td class="padwithborder" align="left" valign="middle"><input type="checkbox" name="movie" value="<%=title%>"/></td>  
        <td class="padwithborder" align="left" valign="middle"><a target="_blank" href="<%=url%>"><span class="tooltip"><%=title %><span style="width: 500px;"><%=title %><%=yearString%><br><br><%=notes%></span></span></a></td>
        <td class="padwithborder" align="left" valign="middle"><%=format%></td> 
        <td class="padwithborder" align="left" valign="middle"><%=location%></td>
        <td class="padwithborder" align="left" valign="middle"><%=counter%></td>       
      </tr>
<%
	}
%>
    </table>
    <p align="center"><button type="submit">Send List</button></p>
    </form>
     <%@ include file="/footer.html" %>
  </body>
</html>
