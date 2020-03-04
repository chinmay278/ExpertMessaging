package com.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;

import com.dto.Customer;
import com.dto.Expert;
import com.dto.Question;

public class QuestionDAO {

	private HibernateTemplate htemplate;
	private SessionFactory sfact;
	
	public QuestionDAO() {
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
	
	public boolean addQuestion(Question obj)
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
	
	
	public List<Question> getAllQuestionsByCustomer(String custid)
	{
		List<Question> lst = null;
		
		Customer cust = new Customer();
		cust.setId(custid);
		
		try
		{
			lst = htemplate.execute(
					new HibernateCallback<List<Question>>() {
						
						@Override
						public List<Question> doInHibernate(Session session) 
								throws HibernateException {
						
							Query q = session.createQuery(
"FROM Question q where q.cust=:cust");
							
							q.setParameter("cust", cust);
							
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
		
		return lst;
	}
	
	
	public List<Question> getAllQuestionsByExpert(String expid)
	{
		List<Question> lst = null;
		
		Expert exp = new Expert();
		exp.setId(expid);
		
		try
		{
			lst = htemplate.execute(
					new HibernateCallback<List<Question>>() {
						
						@Override
						public List<Question> doInHibernate(Session session) 
								throws HibernateException {
						
							Query q = session.createQuery(
"FROM Question q where q.exp=:exp");
							
							q.setParameter("exp", exp);
							
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
		
		return lst;
	}

	
	public List<Question> 
	getAllUnansweredQuestionsForExpert(String expid)
	{
List<Question> lst = null;
		
		Expert exp = new Expert();
		exp.setId(expid);
		
		try
		{
			lst = htemplate.execute(
					new HibernateCallback<List<Question>>() {
						
						@Override
						public List<Question> doInHibernate(Session session) 
								throws HibernateException {
						
							Query q = session.createQuery(
"FROM Question q where q.exp=:exp AND q.status = false");
							
							q.setParameter("exp", exp);
							
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
		
		return lst;
	}
	
	
	
	public boolean changeQuestionStatus(int questid)
	{
		boolean b = false;
		Session s = sfact.openSession();
		Transaction tr = s.beginTransaction();
		
		try
		{
					Query q = s.createQuery("UPDATE Question q "
							+ "SET q.status = true where q.id=:qid");
					
					q.setParameter("qid", questid);
					
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
	
	
	public boolean deleteQuestion(int questid)
	{
		boolean b = false;
		Session s = sfact.openSession();
		Transaction tr = s.beginTransaction();
		
		try
		{
					Query q = s.createQuery("DELETE From Question q"
							+ " where q.id=:qid");
					
					q.setParameter("qid", questid);
					
					int count = q.executeUpdate();
					
					tr.commit();
					s.close();
					
					if(count > 0)
						b = true;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		return b;
	}
	
	
	public List<Question> 
	getAllUnansweredQuestionsForCustomer(String custid)
	{
List<Question> lst = null;
		
		Customer cust = new Customer();
		cust.setId(custid);
		
		try
		{
			lst = htemplate.execute(
					new HibernateCallback<List<Question>>() {
						
						@Override
						public List<Question> doInHibernate(Session session) 
								throws HibernateException {
						
							Query q = session.createQuery(
"FROM Question q where q.cust=:cust AND q.status = false");
							
							q.setParameter("cust", cust);
							
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
		
		return lst;
	}
	
	
	
	public List<Question> getQuestionSearchResult(String searchTerm)
	{
		List<Question> lst = null;
		
		try
		{
			lst = htemplate.execute(
					new HibernateCallback<List<Question>>() {
						
						@Override
						public List<Question> doInHibernate(Session session) 
								throws HibernateException {
						
							Query q = session.createQuery("FROM Question q "
+ "where q.visibility = true AND q.questionDesc LIKE '%"+
									searchTerm+"%' ");
							
							return q.list();
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
	
	
	public Question getQuestionById(int qid)
	{
		Question ref = null;
		
		try
		{
			ref = (Question) 
					htemplate.get(Question.class, qid);
					
			if(ref != null)
				return ref;
			else
				return null;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return null;
		}
	}
	
}














