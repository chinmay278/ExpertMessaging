package com.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;

import com.dto.QuestionCategory;
import com.dto.QuestionSubCategory;

public class QuestionSubCategoryDAO {

	private HibernateTemplate htemplate;
	private SessionFactory sfact;
	
	public QuestionSubCategoryDAO() {
		super();
	}

	public SessionFactory getSfact() {
		return sfact;
	}

	public void setSfact(SessionFactory sfact) {
		this.sfact = sfact;
	}


	public HibernateTemplate getHtemplate() {
		return htemplate;
	}

	public void setHtemplate(HibernateTemplate htemplate) {
		this.htemplate = htemplate;
	}
	
	public boolean addQuestionSubCategory(QuestionSubCategory obj)
	{
		boolean b = false;
		Session s = sfact.openSession();
		Transaction tr = s.beginTransaction();
		
		try
		{
			s.save(obj);
			
			tr.commit();
			s.close();
			
			b = true;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return false;
		}
		
		return b;
	}
	
	public boolean deleteQuestionSubCategory(int subcatid)
	{
		boolean b = false;
		Session s = sfact.openSession();
		Transaction tr = s.beginTransaction();
		
		try
		{
			Query q = s.createQuery("DELETE From "
							+ "QuestionSubCategory where id=:subcatid");
					
					q.setParameter("subcatid", subcatid);
					
					int count = q.executeUpdate();
					
					tr.commit();
					s.close();
					
					if(count > 0)
						b = true;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return false;
		}
		
		return b;
	}

	public List<QuestionSubCategory> 
	getQuestionSubCategoriesByQuestionCategory(int catid)
	{
		List<QuestionSubCategory> lst = null;
		
		try
		{
			lst = htemplate.execute(
					new HibernateCallback<List<QuestionSubCategory>>() {
						
						@Override
						public List<QuestionSubCategory> 
doInHibernate(Session session) throws HibernateException {
						
							Query q = 
session.createQuery("FROM QuestionSubCategory qsc "
		+ "where qsc.qcat=:qcatobj");
							
							QuestionCategory qcatobj = 
									new QuestionCategory();
							qcatobj.setId(catid);
							
							q.setParameter("qcatobj", qcatobj);
							
							if(q.list().size() > 0)
							{
								return q.list();
							}
							else
								return null;
						}
					});
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return null;
		}
		
		return lst;
	}
	
	public String getQuestionSubCategoryName(int subcatid)
	{
		String subcatname = null;
		
		try
		{
			subcatname = htemplate.execute(
					new HibernateCallback<String>() {
						
						@Override
						public String doInHibernate(Session session)
								throws HibernateException {
						
							Query q = 
session.createQuery("SELECT subCategoryName FROM "
		+ "QuestionSubCategory where id=:subcatid");
							
							q.setParameter("subcatid", subcatid);
							
							List<Object> lst = q.list();
							
							if(lst.size() > 0)
							{
								Object arr = lst.get(0);
								return (String) arr;
							}
							else
								return null;
						}
			});
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return null;
		}
		
		return subcatname;
	}
}








