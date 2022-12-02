package com.Film.Dao;

import com.Film.entity.News;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class NewsDao {
    @Qualifier("sessionFactory")
    @Autowired
    private SessionFactory sessionFactory = null;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession(){
        return sessionFactory.openSession();
    }

    public List<News> AllNews(){
        try {
            Session session=getSession();
            Transaction transaction=session.beginTransaction();
            String hql="from News";
            Query query = session.createQuery(hql);
            List list = (List<News>)query.list();
            transaction.commit();
            session.close();
            return list;
        } catch (Exception e) {
            System.out.println("获取失败");
            e.printStackTrace();
            return null;
        }
    };
    public News SeachNewsID(String id){
        try {
            Session session=getSession();
            News news = session.get(News.class, id);
            session.close();
            if (news==null) return null;
            return news;
        } catch (Exception e) {
            System.out.println("获取失败");
            e.printStackTrace();
            return null;
        }
    };

    public News SeachNews(String title){
        return null;
    };

    public boolean SaveNews(News news){
        try {
            Session session=getSession();
            Transaction transaction=session.beginTransaction();
            session.save(news);
            transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            System.out.println("更新失败");
            e.printStackTrace();
            return false;
        }
    }

    public boolean UpdateNews(News news) {
        try {
            Session session=getSession();
            Transaction transaction=session.beginTransaction();
            session.update(news);
            transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            System.out.println("更新失败");
            e.printStackTrace();
            return false;
        }
    }

    public boolean DeleteNews(News news){
        try {
            Session session=getSession();
            Transaction transaction=session.beginTransaction();
            session.delete(news);
            transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            System.out.println("更新失败");
            e.printStackTrace();
            return false;
        }
    }

//    查找news
    public List<News> FindNews(News news){
        try {
//            Set<News> set = new HashSet<News>();
            Session session=getSession();
            Transaction transaction=session.beginTransaction();
            String hql="from News as n where n.title like :title and n.context like :context and n.date like :date and n.publisher like :publisher";
            Query query = session.createQuery(hql);
            query.setParameter("title","%"+news.getTitle()+"%");
            query.setParameter("context","%"+news.getContext()+"%");
            query.setParameter("date","%"+news.getDate()+"%");
            query.setParameter("publisher","%"+news.getPublisher()+"%");
            List<News> list = (List<News>)query.list();
            transaction.commit();
            session.close();
            return list;
        } catch (Exception e) {
            System.out.println("获取失败");
            e.printStackTrace();
            return null;
        }
    }
}
