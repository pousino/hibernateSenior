package com.inetum.training.business.hibernate.boot;

import com.inetum.training.business.hibernate.entity.Employee;
import com.inetum.training.business.hibernate.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.stat.Statistics;

public class HibernateL1EhCacheMain {

public static void main(String[] args) throws InterruptedException {
		
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		Statistics stats = sessionFactory.getStatistics();
		System.out.println("Stats enabled="+stats.isStatisticsEnabled());
		stats.setStatisticsEnabled(true);
		System.out.println("Stats enabled="+stats.isStatisticsEnabled());
		
		//Get employee with id=1
		System.out.println("***** " + 1 + " *****");
		Employee emp = (Employee) session.load(Employee.class, new Long(1));
		printData(stats,emp,1);
		
		//waiting for sometime to change the data in backend
		Thread.sleep(100);
	
		System.out.println("***** " + 2 + " *****");
		//Fetch same data again, check logs that no query fired
		Employee emp1 = (Employee) session.load(Employee.class, new Long(1));
		printData(stats,emp1,2);
		
		//Create new session
		System.out.println("***** " + 3 + " *****");
		Session newSession = sessionFactory.openSession();
		//Get employee with id=1, notice the logs for query
		Employee emp2 = (Employee) newSession.load(Employee.class, new Long(1));
		printData(stats,emp2,3);
		
		//START: evict example
		// to remove specific object from hibernate first level cache (etapes 4,5,6)
		//Get employee with id=2, first time hence query in logs
		System.out.println("***** " + 4 + " *****");
		Employee emp3 = (Employee) session.load(Employee.class, new Long(2));
		printData(stats,emp3,4);
		
		//evict the employee object with id=1
		System.out.println("***** " + 5 + " *****");
		session.evict(emp);
		System.out.println("Session Contains Employee with id=1?" + session.contains(emp));
		//since object is removed from first level cache, you will see query in logs
		Employee emp4 = (Employee) session.load(Employee.class, new Long(1));
		printData(stats,emp4,5);
	
		System.out.println("***** " + 6 + " *****");
		//this object is still present, so you won't see query in logs
		Employee emp5 = (Employee) session.load(Employee.class, new Long(2));
		printData(stats,emp5,6);
		//END: evict example
	
		System.out.println("***** " + 7 + " *****");
		//START: clear example to remove everything from first level cache
		//session.clear();
		Employee emp6 = (Employee) session.load(Employee.class, new Long(1));
		printData(stats,emp6,7);
		
		System.out.println("***** " + 8 + " *****");
		Employee emp7 = (Employee) session.load(Employee.class, new Long(2));
		printData(stats,emp7,8);
		
		System.out.println("Session Contains Employee with id=2?"+session.contains(emp7));
		
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
		//Global number of cacheable entities/collections successfully retrieved from the cache
		System.out.println("Second Level Hit Count="+ stats.getSecondLevelCacheHitCount());
		// Global number of cacheable entities/collections not found in the cache and loaded from the database.
		System.out.println("Second Level Miss Count="	+ stats.getSecondLevelCacheMissCount());
		//Global number of cacheable entities/collections put into the cache
		System.out.println("Second Level Put Count=" + stats.getSecondLevelCachePutCount());
	}
	

}
