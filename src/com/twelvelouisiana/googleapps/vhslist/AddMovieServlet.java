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

/**
 * @author TOMalley
 *
 */
public class AddMovieServlet extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String title = checkNull(req.getParameter("title")).toUpperCase();
		String format = checkNull(req.getParameter("format")).toUpperCase();
	    String notes = checkNull(req.getParameter("notes")).toUpperCase();
	    String url = checkURL(req.getParameter("url"));
	    String location = checkNull(req.getParameter("location")).toUpperCase();
	    String year = checkNull(req.getParameter("year"));

	    MovieDao.INSTANCE.add(title, format, notes, url, location, year);

	    StringBuilder redirectUrl = new StringBuilder();
	    redirectUrl.append("/admin/jsp/addcomplete.jsp?title=");
	    redirectUrl.append(title);
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

}
