/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.OrderDetail;
import java.util.ArrayList;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author HaHai
 */
public class orderDetailDAO {
   public static java.util.List<OrderDetail> getOrderDetailList(){
        java.util.List<OrderDetail> orderdetailList = new ArrayList<OrderDetail>();
       orderdetailList = null;
        Session session = HibernateUtil.getSessionFactory().openSession(); 
         try{
             String queryString = "from OrderDetail";
             Query query = session.createQuery(queryString);
             orderdetailList = query.list();
         }catch (HibernateException ex){
             System.err.println(ex);
         }finally{
             session.close();
         }
         return orderdetailList;
    }
        public static java.util.List OrderDetailList(){
        java.util.List list = new ArrayList();
        list = null;
        Session session = HibernateUtil.getSessionFactory().openSession(); 
         try{
             String queryString = "select od.id, c.name, c.phone ,c.address, d.name, d.price, ob.sumMoney, br.name, od.quanlity, od.createdAt "
                     + "from OrderBill ob, OrderDetail od ,Customer c ,Dish d, Branch br where ob.id = od.orderId and ob. branchId = br.id and ob.customerId = c.id ";
             Query query = session.createQuery(queryString);
             String s=queryString;
             list = query.list();
         }catch (HibernateException ex){
             System.err.println(ex);
         }finally{
             session.close();
         }
         return list;  
    }
        
        public static boolean updateOrderDetail(OrderDetail orderdetail) {
        Session session = HibernateUtil.getSessionFactory().openSession();
       
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.update(orderdetail);
            transaction.commit();
        } catch (HibernateException ex) {
            transaction.rollback();
            System.err.println(ex);
        } finally {
            session.close();
        }
        return true;
    }
     public static boolean createOrderDetail(OrderDetail orderdetail) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        boolean kq = true;
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.save(orderdetail);
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
     
     public static OrderDetail getOrderDetailInfo(int orderdetailId) {
        OrderDetail orderdetail = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            orderdetail = (OrderDetail) session.get(OrderDetail.class, orderdetailId);
        } catch (HibernateException ex) {
            System.err.println(ex);
        } finally {
            session.close();
        }
        return orderdetail;
    }
     
     public static boolean deleteOrderDetail(OrderDetail ordetail) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        if (orderDetailDAO.getOrderDetailInfo(ordetail.getId()) == null) {
            return false;
        }
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.delete(ordetail);
            transaction.commit();
        } catch (HibernateException ex) {
            transaction.rollback();
            System.err.println(ex);
        } finally {
            session.close();
        }
        return true;
    }
     
    
}
