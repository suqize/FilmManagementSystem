package com.Film.Dao;

import com.Film.entity.Film;
import com.Film.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.List;

public class FilmDao {
    @Qualifier("sessionFactory")
    @Autowired
    private SessionFactory sessionFactory = null;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession(){
        return sessionFactory.openSession();
    }

    public List<Film> AllFilm() {
        Session session=getSession();
        try {
            Transaction transaction=session.beginTransaction();
            String hql="from Film";
            Query query = session.createQuery(hql);
            List list = (List<Film>)query.list();
            transaction.commit();
            return list;
        } catch (Exception e) {
            session.close();
            System.out.println("获取失败");
            e.printStackTrace();
            return null;
        }
    }

    public boolean addFilm(Film film) {
        try {
            Session session=getSession();
            Transaction transaction=session.beginTransaction();
            session.merge(film);
            transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            System.out.println("添加失败");
            e.printStackTrace();
            return false;
        }
    }

    public boolean UpdateFilme(Film film) {
        try {
            Session session=getSession();
            Transaction transaction=session.beginTransaction();
            session.merge(film);
            transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            System.out.println("更新失败");
            e.printStackTrace();
            return false;
        }
    }

    public List<Film> FindFilm(Film film) {
        Session session=getSession();
        try {
            Transaction transaction=session.beginTransaction();
            String hql="from Film as f where f.author like :author and f.name like :name and f.date like :date and f.other like :other";
            Query query = session.createQuery(hql);
            query.setParameter("author","%"+film.getAuthor()+"%");
            query.setParameter("name","%"+film.getName()+"%");
            query.setParameter("date","%"+film.getDate()+"%");
            query.setParameter("other","%"+film.getOther()+"%");
            List list = (List<Film>)query.list();
            transaction.commit();
            return list;
        } catch (Exception e) {
            session.close();
            System.out.println("获取失败");
            e.printStackTrace();
            return null;
        }
    }

    public boolean deleteFilm(String id) {
        try {
            Session session=getSession();
            Transaction transaction=session.beginTransaction();
            Film film = session.get(Film.class, id);
            session.delete(film);
            transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            System.out.println("更新失败");
            e.printStackTrace();
            return false;
        }
    }

    public Film FindFilmById(String film_id) {
        try {
            Session session=getSession();
            Transaction transaction=session.beginTransaction();
            System.out.println(film_id);
            Film film = session.get(Film.class, film_id);
            transaction.commit();
            session.close();
            return film;
        } catch (Exception e) {
            System.out.println("更新失败");
            e.printStackTrace();
            return null;
        }
    }
}
