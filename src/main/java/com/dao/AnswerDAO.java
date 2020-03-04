package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;

import com.dto.Answer;
import com.dto.Customer;
import com.dto.Expert;
import com.dto.Question;

public class AnswerDAO {

	private HibernateTemplate htemplate;
	private SessionFactory sfact;
	
	public AnswerDAO() {
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
	
	
	public boolean addAnswer(Answer ans)
	{
		boolean b = false;
		Session s = sfact.openSession();
		Transaction tr = s.beginTransaction();
		
		try
		{
			s.save(ans);
			
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
	
	
	public List<Object[]> getAllAnswersForCustomer(String custid)
	{
		List<Object[]> lst = null;
		
		Customer cust = new Customer();
		cust.setId(custid);
		
		try
		{
			lst = htemplate.execute(
					new HibernateCallback<List<Object[]>>() {
						
						@Override
						public List<Object[]> doInHibernate(Session session) 
								throws HibernateException {
						
//							Query q = session.createQuery(" Select A.id , "
//+ "A.ansDesc , A.postedDate , A.quest , A.exp FROM "
//+ "Question Q Right Outer Join Answer A "
//+ "ON Q.id = A.quest WHERE Q.cust=:cust");
							
//							Query q = session.createQuery(" Select A.id , "
//									+ "A.ansDesc , A.postedDate , A.quest , A.exp FROM "
//									+ "Answer A Right Outer Join A.quest Q "
//									+ "WHERE Q.cust=:cust");
							
//							Query q = session.createQuery(" FROM "
//									+ "Answer A Right Outer Join A.quest Q "
//									+ "WHERE Q.cust=:cust AND Q.status = true");
							
							Query q = session.createQuery(" FROM "
									+ "Answer A Inner Join A.quest Q "
									+ "WHERE Q.cust=:cust AND Q.status = true");
							
							q.setParameter("cust", cust);
							
							List<Object[]> lst = q.list();
							
							if(lst.size() > 0)
								return lst;
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
	
	
	public List<Answer> getAllAnswersForExpert(String expid)
	{
		List<Answer> lst = null;
		
		Expert exp = new Expert();
		exp.setId(expid);
		
		try
		{
			lst = htemplate.execute(
					new HibernateCallback<List<Answer>>() {
						
						@Override
						public List<Answer> doInHibernate(Session session) 
								throws HibernateException {
						
//							Query q = session.createQuery(" Select A.id , "
//+ "A.ansDesc , A.postedDate , A.quest , A.exp FROM "
//+ "Question Q Right Outer Join Answer A "
//+ "ON Q.id = A.quest WHERE Q.exp=:exp");
							
//							Query q = session.createQuery(" Select A.id , "
//									+ "A.ansDesc , A.postedDate , A.quest , A.exp FROM "
//									+ "Answer A Right Outer Join A.quest Q "
//									+ "WHERE Q.exp=:exp");
							
//							Query q = session.createQuery(" FROM "
//									+ "Answer A Right Outer Join A.quest Q "
//									+ "WHERE Q.exp=:exp AND Q.status = true");
							
							Query q = session.createQuery(" FROM "
									+ "Answer A Inner Join A.quest Q "
									+ "WHERE Q.exp=:exp AND Q.status = true");
							
							q.setParameter("exp", exp);
							
							List<Answer> lst = q.list();
							
							if(lst.size() > 0)
								return lst;
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
	
	
	
	public List<Object[]> 
					getAllQuestionsAndAnswersByExpert(String expid)
	{
		List<Object[]> lst = null;
		
		Expert exp = new Expert();
		exp.setId(expid);
		
		try
		{
			lst = htemplate.execute(
					new HibernateCallback<List<Object[]>>() {
						
						@Override
						public List<Object[]> doInHibernate(Session session) 
								throws HibernateException {
						
//Query q = session.createQuery(
//"Select A.id , A.ansDesc , A.postedDate , A.quest , A.exp From "
//+ "Question Q Right Outer Join Answer A "
//+ "On Q.id = A.quest Where Q.exp =:exp");

//							Query q = session.createQuery(" Select A.id , "
//									+ "A.ansDesc , A.postedDate , A.quest , A.exp FROM "
//									+ "Answer A Right Outer Join A.quest Q "
//									+ "WHERE Q.exp=:exp");
							
							Query q = session.createQuery(" FROM "
									+ "Answer A Right Outer Join A.quest Q "
									+ "WHERE Q.exp=:exp AND Q.status = true");
							
			q.setParameter("exp", exp);
			
//			List<Answer> lst = q.list();
//			
//			if(lst.size() > 0)
//				return lst;
//			else
//				return null;
			
			List<Object[]> lst = q.list();
			
			if(lst.size() > 0)
				return lst;
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
	
	
	public List<Answer> getAnswerSearchResult(List<Question> lst)
	{
		List<Answer> anslist = new ArrayList<>();
		
		for(Question q : lst)
		{
			Answer obj = getAnswerByQuestion(q);
			
			if(obj != null)
			anslist.add(obj);
		}
		
		return anslist;
	}
	
	
	public Answer getAnswerByQuestion(Question quest)
	{
		Answer ans = null;
		
		try
		{
			ans = htemplate.execute(
					new HibernateCallback<Answer>() {
						
						@Override
						public Answer doInHibernate(Session session) 
								throws HibernateException {
						
							Query q = session.createQuery("From Answer a "
									+ "where a.quest=:qst");
							
							q.setParameter("qst", quest);
							
							List<Answer> lst = q.list();
							
							if(lst.size() > 0)
								return lst.get(0);
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
		
		return ans;
	}
}










