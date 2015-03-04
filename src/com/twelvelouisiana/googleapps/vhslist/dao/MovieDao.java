/**
 * 
 */
package com.twelvelouisiana.googleapps.vhslist.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.twelvelouisiana.googleapps.vhslist.model.Movie;

/**
 * @author TOMalley
 *
 */
public enum MovieDao
{
	INSTANCE;

	public List<Movie> listMovies() {
		EntityManager em = EMFService.get().createEntityManager();
		// read the existing entries
		Query q = em.createQuery("select m from Movie m order by m.title");
		List<Movie> movies = q.getResultList();
		return movies;
	}

	public void add(String title, String format, String notes, String url, String location, String year) {
		synchronized (this) {
			EntityManager em = EMFService.get().createEntityManager();
			Movie movie = new Movie(title, format, notes, url, location, year);
			em.persist(movie);
			em.close();
		}
	}

	public Movie update(Long id, Movie updatedMovie) {
		EntityManager em = EMFService.get().createEntityManager();
		Movie movie = null;
		try {
			String format = updatedMovie.getFormat();
			String location = updatedMovie.getLocation();
			String notes = updatedMovie.getNotes();
			String title = updatedMovie.getTitle();
			String url = updatedMovie.getUrl();
			String year = updatedMovie.getYear();
			
			movie = em.find(Movie.class, id);
			if (movie != null)
			{
				if (format != null)
					movie.setFormat(format);
				if (location != null)
					movie.setLocation(location);
				if (notes != null)
					movie.setNotes(notes);
				if (title != null)
					movie.setTitle(title);
				if (url != null)
					movie.setUrl(url);
				if (year != null)
					movie.setYear(year);
				em.merge(movie);
			}
		} finally {
			em.close();
		}
		return movie;
	}

	public Movie getMovie(String title) {
		EntityManager em = EMFService.get().createEntityManager();
		Query q = em.createQuery("select t from Movie t where t.title = :title");
		q.setParameter("title", title);
		List<Movie> movies = q.getResultList();
		if (movies == null || movies.size() == 0)
			return null;
		return movies.get(0);
	}

	public void remove(long id) {
		EntityManager em = EMFService.get().createEntityManager();
		try {
			Movie movie = em.find(Movie.class, id);
			em.remove(movie);
		} finally {
			em.close();
		}
	}
}
