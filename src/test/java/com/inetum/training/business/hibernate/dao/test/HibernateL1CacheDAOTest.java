package com.inetum.training.business.hibernate.dao.test;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.stat.Statistics;
import org.junit.jupiter.api.Test;

import com.inetum.training.business.hibernate.entity.Employee;
import com.inetum.training.business.hibernate.util.HibernateUtil;

public class HibernateL1CacheDAOTest {

	
	@Test
	public void testL1HibernateCache() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		Statistics stats = sessionFactory.getStatistics();
		stats.setStatisticsEnabled(true);
		
		//Get employee with id=1
		Employee emp = (Employee) session.load(Employee.class, 1l);
		printData(stats,emp,1);
		
		
		//Fetch same data again, check logs that no query fired
		//on a deja lobjet, pas besoin de faire de requete
		Employee emp1 = (Employee) session.load(Employee.class, 1l);
		printData(stats,emp1,2);
		
		
		//TODO 2 : Faire le necessaire pour que l'assertion ci dessous soit verifiee
		
		
		System.out.println("Session Contains Employee with id=1?"+session.contains(emp));
		assertFalse(session.contains(emp));

		//since object is removed from first level cache, you will see query in logs
		Employee emp4 = (Employee) session.load(Employee.class, 1l);
		printData(stats,emp4,3);
		
		//this object is still present, so you won't see query in logs
		Employee emp5 = (Employee) session.load(Employee.class, 2l);
		printData(stats,emp5,4);
		
		
		//TODO 3 : Faire le necessaire pour que l'assertion ci dessous soit verifiee
		
		Employee emp6 = (Employee) session.load(Employee.class, 1l);
		printData(stats,emp6,5);
		Employee emp7 = (Employee) session.load(Employee.class, 2l);
		printData(stats,emp7,6);
		
		System.out.println("Session Contains Employee with id=2?"+session.contains(emp7));
		
		//On s'assure que le nombre d'entites (et de collections) tirees du cache soient exactement 4
		assertTrue(stats.getSecondLevelCacheHitCount() == 6);
		//On s'assure que le nombre d'entites tirees de la base car absent du cache est de ?
		//TODO 4 Ecrire le code de l'assertion ci dessous
		//On s'assure que le nombre d'entites (et de collections) presentes en cache est de ?
		//TODO 5 Ecrire le code de l'assertion ci dessous
		
		tx.commit();
		sessionFactory.close();
	}
	
	private static void printData(Statistics stats,Employee emp, int count) {
		System.out.println(count+":: Name="+emp.getName()+", Zipcode="+emp.getAddress().getZipcode());
		//System.out.println("Size ==> "+emp.getCars().size());
		printStats(stats, count);
	}
	
	private static void printStats(Statistics stats, int i) {
		System.out.println("***** " + i + " *****");
		System.out.println("Second Level Hit Count="+ stats.getSecondLevelCacheHitCount());
		System.out.println("Second Level Miss Count="	+ stats.getSecondLevelCacheMissCount());
		System.out.println("Second Level Put Count=" + stats.getSecondLevelCachePutCount());
	}
}
