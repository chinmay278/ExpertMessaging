package com.dao;

import org.springframework.orm.hibernate4.HibernateTemplate;

public class ReportedIncidentsByExpertsDAO {

	private HibernateTemplate htemplate;

	public ReportedIncidentsByExpertsDAO() {
		super();
	}

	public HibernateTemplate getHtemplate() {
		return htemplate;
	}

	public void setHtemplate(HibernateTemplate htemplate) {
		this.htemplate = htemplate;
	}
	
}
