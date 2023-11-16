package com.inetum.training.business.hibernate.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import lombok.Data;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Data
@Table(name = "ADDRESS")
@Cache(usage=CacheConcurrencyStrategy.READ_ONLY, region="employee")
public class Address {

	@Id
	@Column(name = "emp_id", unique = true, nullable = false)
	@GeneratedValue(generator = "gen")
	@GenericGenerator(name = "gen", strategy = "foreign", 
				parameters = { @Parameter(name = "property", value = "employee") })
	private long id;

	@Column(name = "address_line1")
	private String addressLine1;

	@Column(name = "zipcode")
	private String zipcode;

	@Column(name = "city")
	private String city;

	@OneToOne
	@PrimaryKeyJoinColumn
	private Employee employee;

	

}
