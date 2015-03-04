/**
 * 
 */
package com.twelvelouisiana.googleapps.vhslist;

import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.twelvelouisiana.googleapps.vhslist.dao.MovieDao;
import com.twelvelouisiana.googleapps.vhslist.model.Movie;

/**
 * @author TOMalley
 *
 */
public class UpdateMovieServlet extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		Long id = getId(req.getParameter("id"));
		String title = checkNull(req.getParameter("title")).toUpperCase();
		String format = checkNull(req.getParameter("format")).toUpperCase();
	    String notes = checkNull(req.getParameter("notes")).toUpperCase();
	    String url = checkURL(req.getParameter("url"));
	    String location = checkNull(req.getParameter("location")).toUpperCase();
	    String year = checkNull(req.getParameter("year"));
	    
	    Movie movie = new Movie(title, format, notes, url, location, year);
	    
	    MovieDao.INSTANCE.update(id, movie);

	    StringBuilder redirectUrl = new StringBuilder();
	    redirectUrl.append("/admin/jsp/updatecomplete.jsp?title=");
	    redirectUrl.append(URLEncoder.encode(title, "UTF-8"));
	    redirectUrl.append("&format=");
	    redirectUrl.append(format);
	    redirectUrl.append("&location=");
	    redirectUrl.append(location);
	    redirectUrl.append("&notes=");
	    redirectUrl.append(URLEncoder.encode(notes, "UTF-8"));
	    redirectUrl.append("&url=");
	    redirectUrl.append(url);
	    redirectUrl.append("&year=");
	    redirectUrl.append(year);
	    resp.sendRedirect(redirectUrl.toString());
	}

	private String checkNull(String s)
	{
		if (s == null)
		{
			return "";
		}
		return s;
	}
	
	public String checkURL(String urlStr)
	{
	    try
	    {
	    	URL url = new URL(urlStr);
	    	return urlStr;
	    }
	    catch (Exception e) {}

	    return "";
	}
	
	public Long getId(String stringId)
	{
		Long id = new Long(0);
		try
		{
			if (stringId != null)
			{
				id = Long.valueOf(stringId);
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return id;
	}

}
