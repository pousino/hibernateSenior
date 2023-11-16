package com.inetum.training.business.hibernate.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Data
@Table(name = "CAR")
@Cache(usage=CacheConcurrencyStrategy.READ_ONLY, region="employee")
public class Car {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private long id;

	@Column(name = "CAR_NUMBER")
	private String carNumber;

	@Column(name = "MODEL")
	private String model;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "BUY_DATE", nullable = false, length = 19)
	protected Date buyDate;

	@ManyToOne
	@JoinColumn(name = "EMP_ID")
	private Employee employee;
	

}
