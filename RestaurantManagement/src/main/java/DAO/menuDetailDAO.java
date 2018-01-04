/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.MenuDetail;
import java.util.ArrayList;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author hotha
 */
public class menuDetailDAO {
     public static java.util.List<MenuDetail> getMenuDetailListByMenuId(int menuId) {
        java.util.List<MenuDetail> menuDetailList = new ArrayList<MenuDetail>();
        menuDetailList = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String queryString = "from MenuDetail where menuId = " + menuId;
            Query query = session.createQuery(queryString);
            menuDetailList = query.list();
        } catch (HibernateException ex) {
            System.err.println(ex);
        } finally {
            session.close();
        }
        return menuDetailList;
    }
}
