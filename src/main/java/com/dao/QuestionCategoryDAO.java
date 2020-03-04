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

public class QuestionCategoryDAO {

	private HibernateTemplate htemplate;
	private SessionFactory sfact;
	
	public QuestionCategoryDAO() {
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
	
	
	public boolean addQuestionCategory(String qcat)
	{
		boolean b = false;
		Session s = sfact.openSession();
		Transaction tr = s.beginTransaction();
		
		try
		{
			QuestionCategory obj = new QuestionCategory();
			obj.setCategoryName(qcat);
			
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
	
	public boolean deleteQuestionCategory(int catid)
	{
		boolean b = false;
		Session s = sfact.openSession();
		Transaction tr = s.beginTransaction();
		
		try
		{
			Query q = s.createQuery("DELETE From "
							+ "QuestionCategory q where q.id=:qid");
					
					q.setParameter("qid", catid);
					
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
	
	public List<QuestionCategory> getAllQuestionCategories()
	{
		List<QuestionCategory> catlist = null;
		
		try
		{
			catlist = htemplate.execute(
					new HibernateCallback<List<QuestionCategory>>() {
						
						@Override
						public List<QuestionCategory> doInHibernate(
								Session session) throws HibernateException {
						
							Query q = 
									session.createQuery("FROM QuestionCategory");
							
							if(q.list().size() > 0)
								return q.list();
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
		
		return catlist;
	}

	public int getQuestionCategoryIDByName(String catname)
	{
		int catid = 0;
		
		try
		{
			catid = htemplate.execute(
					new HibernateCallback<Integer>() {
						
						@Override
						public Integer doInHibernate(Session session) 
								throws HibernateException {
							
							Query q = session.createQuery(
"SELECT id FROM QuestionCategory where "
+ "categoryName=:catname");
							
							q.setParameter("catname", catname);
							
							List<Object[]> lst = q.list();
							
							if(lst.size() > 0)
							{
								Object[] arr = lst.get(0);
								return (Integer) arr[0];
							}
							else
								return 0;
						}
					});
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return 0;
		}
		
		return catid;
	}
	
	
	public String getQuestionCategoryNameByID(int catid)
	{
		String catname = null;
		
		try
		{
			catname = htemplate.execute(
					new HibernateCallback<String>() {
						@Override
						public String doInHibernate(Session session) 
								throws HibernateException {
							
							Query q = session.createQuery(
"SELECT categoryName FROM QuestionCategory where "
+ "id=:catid");
							
							q.setParameter("catid", catid);
							
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
		
		return catname;
	}
	
	
	
}












