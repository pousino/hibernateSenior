package com.inetum.training.business.hibernate.boot;

import java.util.List;

import com.inetum.training.business.hibernate.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.stat.Statistics;

import com.inetum.training.business.hibernate.entity.Employee;

public class HibernateL2EHCacheMain {

	public static void main(String[] args) {

		//Initialize Sessions
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Statistics stats = sessionFactory.getStatistics();
		System.out.println("Stats enabled="+stats.isStatisticsEnabled());
		stats.setStatisticsEnabled(true);
		System.out.println("Stats enabled="+stats.isStatisticsEnabled());

		Session session = sessionFactory.openSession();
		Session otherSession = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Transaction otherTransaction = otherSession.beginTransaction();

		printStats(stats, 0);
		
		System.out.println("***** " + 1 + " *****");
		Employee emp = (Employee) session.load(Employee.class, 1L);
		printData(emp, stats, 1);
		
		System.out.println("***** " + 2 + " *****");
		emp = (Employee) session.load(Employee.class, 1L);
		printData(emp, stats, 2);
		
		System.out.println("***** " + 3 + " *****");
		//clear first level cache, so that second level cache is used
		session.evict(emp);
		emp = (Employee) session.load(Employee.class, 1L);
		printData(emp, stats, 3);

		System.out.println("***** " + 4 + " *****");
		emp = (Employee) session.load(Employee.class, 3L);
		printData(emp, stats, 4);

		System.out.println("***** " + 5 + " *****");
		emp = (Employee) otherSession.load(Employee.class, 1L);
		printData(emp, stats, 5);
		
		System.out.println("***** " + 6 + " *****");
		//Retrieve By Query
		String queryStr = "From Employee emp where emp.salary >=300";
		List<Employee> emps = session.createQuery(queryStr)
				.setCacheable(true)
				.list();
		printData(emps, stats, 6);
		List<Employee> emps2 = session.createQuery(queryStr)
				.setCacheable(true)
				.list();
		printData(emps2, stats, 7);


		//Retrieve With get and load (exception throwee
		Employee empWithLoad = (Employee) session.load(Employee.class, 10L);
		//empWithLoad.getAddress();


		//Retrieve By SUBSELECT
		String queryStrFindAllEmploye = "From Employee emp";
		List<Employee> allEmps = session.createQuery(queryStrFindAllEmploye)
				.setCacheable(true)
				.list();
		printData(allEmps, stats, 8);
		
		
		List<Employee > empBatchSizes = session.createQuery("From Employee emp").list();
		for (Employee empC : empBatchSizes) {
		  System.out.println("Size ==> "+empC.getCars().size());
		}

		//Release resources
		transaction.commit();
		otherTransaction.commit();
		sessionFactory.close();
	}

	private static void printStats(Statistics stats, int i) {
		System.out.println("***** " + i + " *****");
		System.out.println("Second Level Hit Count="+ stats.getSecondLevelCacheHitCount());
		System.out.println("Second Level Miss Count="	+ stats.getSecondLevelCacheMissCount());
		System.out.println("Second Level Put Count=" + stats.getSecondLevelCachePutCount());
	}

	private static void printData(Employee emp, Statistics stats, int count) {
		//System.out.println(count+":: Name="+emp.getName()+", Zipcode="+emp.getAddress().getZipcode());
		System.out.println(count+":: Name="+emp.getName());
		printStats(stats, count);
	}

	private static void printData(List<Employee> emps, Statistics stats, int count) {
		//emps.stream().forEach(emp -> System.out.println(count+":: Name="+emp.getName()+", Zipcode="+emp.getAddress().getZipcode()));
		emps.stream().forEach(emp -> System.out.println(count+":: Name="+emp.getName()));
		printStats(stats, count);
	}

}
