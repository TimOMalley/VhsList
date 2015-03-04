/**
 * 
 */
package com.twelvelouisiana.googleapps.vhslist;

import java.io.IOException;

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
public class DeleteMovieServlet extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String title = checkNull(req.getParameter("title")).toUpperCase();
		
	    Movie movie = MovieDao.INSTANCE.getMovie(title);
	    StringBuilder redirectUrl = new StringBuilder();
	    if (movie == null)
	    {
	    	redirectUrl.append("/admin/jsp/delerror.jsp?title=");
		    redirectUrl.append(title);
	    }
	    else
	    {
	    	MovieDao.INSTANCE.remove(movie.getId());
	    	redirectUrl.append("/admin/jsp/deletecomplete.jsp?title=");
	    	redirectUrl.append(movie.getTitle());
	    	redirectUrl.append("&format=");
		    redirectUrl.append(movie.getFormat());
		    redirectUrl.append("&location=");
		    redirectUrl.append(movie.getLocation());
	    }
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

}
