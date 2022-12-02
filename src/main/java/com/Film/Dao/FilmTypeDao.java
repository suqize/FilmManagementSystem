package com.Film.Dao;

import com.Film.entity.Film;
import com.Film.entity.FilmType;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.ArrayList;
import java.util.List;

public class FilmTypeDao {
    @Qualifier("sessionFactory")
    @Autowired
    private SessionFactory sessionFactory = null;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession(){
        return sessionFactory.openSession();
    }

    public List<FilmType> AllFilmType() {
        try {
            Session session=getSession();
            Transaction transaction=session.beginTransaction();
            String hql="from FilmType";
            Query query = session.createQuery(hql);
            List list = (List<FilmType>)query.list();
            transaction.commit();
            session.close();
            return list;
        } catch (Exception e) {
            System.out.println("获取失败");
            e.printStackTrace();
            return null;
        }
    }

    public boolean AddFilmType(FilmType filmType) {
        try {
            Session session=getSession();
            Transaction transaction=session.beginTransaction();
            session.save(filmType);
            transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            System.out.println("获取失败");
            e.printStackTrace();
            return false;
        }
    }

    public List<Film> getTypeFilms(String tid) {
        try {
            Session session=getSession();
            FilmType filmType = session.get(FilmType.class, Integer.valueOf(tid));
            if (filmType==null) return null;
            else {
                List<Film> films=new ArrayList<Film>(filmType.getFilms());
                session.close();
                if (films.size()<=0) return null;
                else return films;
            }
        } catch (Exception e) {
            System.out.println("获取失败");
            e.printStackTrace();
            return null;
        }
    }

    public FilmType seachFilmType(String type){
        try {
            Session session=getSession();
            Transaction transaction=session.beginTransaction();
            String hql="from FilmType as ft where ft.category = ?";
            Query query = session.createQuery(hql);
            query.setParameter(0,type);
            List list = (List<FilmType>)query.list();
            transaction.commit();
            session.close();
            if (list.size()>0) return (FilmType) list.get(0);
            else return null;
        } catch (Exception e) {
            System.out.println("获取失败");
            e.printStackTrace();
            return null;
        }
    }

    public boolean updateFilmType(FilmType filmType){
        try {
            Session session=getSession();
            Transaction transaction=session.beginTransaction();
            session.update(filmType);
            transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            System.out.println("更新失败");
            e.printStackTrace();
            return false;
        }
    }

    public Film UpdateType(String type, Film film) {
        Session session=getSession();
        try {
            Transaction transaction=session.beginTransaction();
            String hql="from FilmType as ft where ft.category = ?";
            Query query = session.createQuery(hql);
            query.setParameter(0,type);
            List list = (List<FilmType>)query.list();
            transaction.commit();

            if (list!=null){
                if (list.size()>0){
                    FilmType filmType= (FilmType) list.get(0);
                    filmType.getFilms().add(film);
                    session.update(filmType);
                    film.getFilmTypes().add(filmType);
                }
            }else {
                FilmType filmType=new FilmType();
                filmType.setCategory(type);
                filmType.getFilms().add(film);
                System.out.println("新加入"+filmType.toString());
                session.save(filmType);
                film.getFilmTypes().add(filmType);
            }
            session.close();
            return film;
        } catch (Exception e) {
            session.close();
            e.printStackTrace();
            return film;
        }
    }
}
