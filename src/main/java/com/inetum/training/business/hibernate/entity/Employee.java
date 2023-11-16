package com.inetum.training.business.hibernate.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;
import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Cascade;

@Entity
@Data
@Table(name = "EMPLOYEE")
@Cache(usage=CacheConcurrencyStrategy.READ_ONLY, region="employee")
public class Employee {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "emp_id")
	private long id;

	@Column(name = "emp_name")
	private String name;

	@Column(name = "emp_salary")
	private double salary;

	@OneToOne(mappedBy = "employee")
	@Cascade(value = org.hibernate.annotations.CascadeType.ALL)
	private Address address;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "employee")
	//TODO : Jouer sur les differentes valeurs du EAGER et observer
	//@Fetch(FetchMode.SELECT)
	//TODO : Jouer sur les differentes valeurs de retour et observer
	@BatchSize(size = 5)
	//TODO : Jouer egalement avec le BatchSize 
	private List<Car> cars;
	

}
