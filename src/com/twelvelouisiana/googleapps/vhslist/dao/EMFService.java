/**
 * 
 */
package com.twelvelouisiana.googleapps.vhslist.dao;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 * @author TOMalley
 *
 */
public class EMFService
{
	private static final EntityManagerFactory emfInstance = Persistence
			.createEntityManagerFactory("transactions-optional");

	private EMFService()
	{
		
	}

	public static EntityManagerFactory get()
	{
		return emfInstance;
	}
}
