package com.inetum.training.business.hibernate.dao.test;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import com.inetum.training.business.hibernate.util.HibernateUtil;
import org.hibernate.ObjectNotFoundException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.stat.Statistics;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.inetum.training.business.hibernate.entity.Employee;

public class HibernateOptiPerfDAOTest {

	public static  SessionFactory sessionFactory = null;
	public static Transaction tx = null;
	public static Statistics stats = null;
	public static Session session = null;
	
	@BeforeAll
	public static void initTest() {
		sessionFactory = HibernateUtil.getSessionFactory();
		session = sessionFactory.getCurrentSession();
		tx = session.beginTransaction();
		stats = sessionFactory.getStatistics();
		stats.setStatisticsEnabled(true);
	}
	
	@Test
	public void testOptiHibernateCacheWithSuccess() {
		//Get employee with id=1
		Employee emp = (Employee) session.get(Employee.class, 1l);
		printData(stats,emp,1);
		assertNotNull(emp, "Employee not found");
	}
	
	@Test
	public void testOptiHibernateCacheWithThrow() {
		ObjectNotFoundException thrown = Assertions.assertThrows(ObjectNotFoundException.class, () -> {
			Employee emp = (Employee) session.load(Employee.class, 1l);
			printData(stats,emp,1);
	  });
	  Assertions.assertTrue(thrown.getMessage().contains("No row with the given identifier exists"));
	}
	
	@AfterAll
	public static void closeTest() {
		tx.commit();
		sessionFactory.close();
	}
	
	private static void printData(Statistics stats,Employee emp, int count) {
		System.out.println(count+":: Name="+emp.getName()+", Zipcode="+emp.getAddress().getZipcode());
		//System.out.println("Size ==> "+emp.getCars().size());
		printStats(stats, count);
	}
	
	private static void printStats(Statistics stats, int i) {
		System.out.println("***** Stats " + i + " *****");
		System.out.println("Second Level Hit Count="+ stats.getSecondLevelCacheHitCount());
		System.out.println("Second Level Miss Count="	+ stats.getSecondLevelCacheMissCount());
		System.out.println("Second Level Put Count=" + stats.getSecondLevelCachePutCount());
	}
}
