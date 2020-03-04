package com.dao;

import org.springframework.orm.hibernate4.HibernateTemplate;

public class ReportedIncidentsByCustomerDAO {

	private HibernateTemplate htemplate;

	public ReportedIncidentsByCustomerDAO() {
		super();
	}

	public HibernateTemplate getHtemplate() {
		return htemplate;
	}

	public void setHtemplate(HibernateTemplate htemplate) {
		this.htemplate = htemplate;
	}
	
}
