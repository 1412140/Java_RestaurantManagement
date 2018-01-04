/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.OrderBill;
import Entity.UnexpectedCost;
import java.util.ArrayList;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author HaHai
 */
public class unexpectedDAO {
   public static java.util.List<UnexpectedCost> getUnexpectedCostList() {
        java.util.List<UnexpectedCost> customerList = new ArrayList<UnexpectedCost>();
        customerList = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String queryString = "from UnexpectedCost";
            Query query = session.createQuery(queryString);
            customerList = query.list();
        } catch (HibernateException ex) {
            System.err.println(ex);
        } finally {
            session.close();
        }
        return customerList;
    }
    
  
      public static UnexpectedCost getUnexpectedCostInfo(int costId) {
        UnexpectedCost cost = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            cost = (UnexpectedCost) session.get(UnexpectedCost.class, costId);
        } catch (HibernateException ex) {
            System.err.println(ex);
        } finally {
            session.close();
        }
        return cost;
    }
   

  

    public static boolean createUnexpectedCost(UnexpectedCost expectedcoast) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        boolean kq = true;
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.save(expectedcoast);
            transaction.commit();
        } catch (HibernateException ex) {
            transaction.rollback();
            System.err.println(ex);
            kq = false;
        } finally {
            session.close();
        }
        return kq;
    }
    public static boolean updateUnexpectedCost(UnexpectedCost expectedcoast) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        if (unexpectedDAO.getUnexpectedCostInfo(expectedcoast.getId()) == null) {
            return false;
        }
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.update(expectedcoast);
            transaction.commit();
        } catch (HibernateException ex) {
            transaction.rollback();
            System.err.println(ex);
        } finally {
            session.close();
        }
        return true;
    }
    
    
    
    public static java.util.List<UnexpectedCost> getCostList(int month, int year) {
        java.util.List<UnexpectedCost> customerList = new ArrayList<UnexpectedCost>();
        customerList = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String queryString = " from UnexpectedCost where month(createdAt)= " + month 
                     +" and year(createdAt)= " + year + " and delFlag = 2";
            Query query = session.createQuery(queryString);
            customerList = query.list();
        } catch (HibernateException ex) {
            System.err.println(ex);
        } finally {
            session.close();
        }
        return customerList;
    }
 
}
