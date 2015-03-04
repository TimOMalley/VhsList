/**
 * 
 */
package com.twelvelouisiana.googleapps.vhslist;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
public class EmailMovieListServlet extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String NEW_LINE = "\n";
	private static final String ADMIN_EMAIL = "tomalley23@gmail.com";
	private static final String ADMIN_NAME = "Tim OMalley";

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String[] movies = req.getParameterValues("movie");
		
	    StringBuilder message = new StringBuilder();
	    message.append("Name:\t");
	    message.append(name);
	    message.append(NEW_LINE);
	    
	    message.append("Email:\t");
	    message.append(email);
	    message.append(NEW_LINE);
	    message.append(NEW_LINE);
	    
	    if (movies == null)
	    {
//	    	resp.setContentType("text/plain");
//	        resp.getWriter().println("No movies selected, Email not sent.");
	    	resp.sendRedirect("/jsp/senderror.jsp");
	    	return;
	    }
	    else
	    {
	    	for (int i = 0; i < movies.length; i++)
	    	{
	    		Movie movie = MovieDao.INSTANCE.getMovie(movies[i]);
	    		message.append(movie.getTitle());
	    		message.append("\t");
	    		message.append(movie.getLocation());
	    		message.append(NEW_LINE);
	    	}
	    }
	    try
	    {
            sendEmail(message.toString(), name, email);

        }
	    catch (Exception e)
	    {
            resp.setContentType("text/plain");
            resp.getWriter().println("Something went wrong. Please try again.");
            throw new RuntimeException(e);
        }
//	    resp.setContentType("text/plain");
//        resp.getWriter().println(message.toString());
	    resp.sendRedirect("/jsp/listsent.jsp");
	}
	
	private void sendEmail(String msgBody, String name, String email) throws Exception
	{
		Properties props = new Properties();
	    Session session = Session.getDefaultInstance(props, null);
		Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(ADMIN_EMAIL, ADMIN_NAME));
        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(ADMIN_EMAIL, ADMIN_NAME));
        if (validateAddress(email))
        {
        	// Add to CC
        	msg.addRecipient(Message.RecipientType.CC, new InternetAddress(email, name));
        }
        msg.setSubject("VHS Movie List");
        msg.setText(msgBody);
        Transport.send(msg);
	}
	
	private boolean validateAddress(String address)
	{
		boolean isValid = false;
		try {
			InternetAddress addr = new InternetAddress(address);
			addr.validate();
			isValid = true;
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isValid;
	}

}
