package com.Film.Dao;

import com.Film.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate5.HibernateTemplate;

import java.util.List;

public class UserDao {
    private HibernateTemplate ht = null;
    @Qualifier("sessionFactory")
    @Autowired
    private SessionFactory sessionFactory = null;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession(){
        return sessionFactory.openSession();
    }

    public List<User> findAll() {
        try {
            Session session=getSession();
            Transaction transaction=session.beginTransaction();
            List<User> list =(List<User>)getSession().createQuery("FROM User").list();
            return list;
        } catch (Exception e) {
            System.out.println("获取失败");
            e.printStackTrace();
            return null;
        }
    }

    public User findUser(User user) {
        try {
            Session session=getSession();
            Transaction transaction=session.beginTransaction();
            String hql="from User as u where u.name=? and u.password=?";
            Query query = session.createQuery(hql);
            query.setParameter(0,user.getName());
            query.setParameter(1,user.getPassword());
            List list = (List<User>)query.list();
            transaction.commit();
            session.close();
            if (list!=null){
//                登录成功
                if (list.size()>0){
                    return (User)list.get(0);
                }
            }else return null;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
        return null;
    }

    public boolean AddUser(User user){
        try {
            Session session=getSession();
            Transaction transaction=session.beginTransaction();
            session.save(user);
            transaction.commit();
            session.close();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public boolean UserIsEmpty(User user){
        try {
            Session session=getSession();
            Transaction transaction=session.beginTransaction();
            String hql="from User as u where u.name=?";
            Query query = session.createQuery(hql);
            query.setParameter(0,user.getName());
            List list = (List<User>)query.list();
            transaction.commit();
            session.close();
            if (list!=null){
//                登录成功
                if (list.size()>0){
                    return true;
                }
            }else return false;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return false;
    }

    public boolean UpdateUser(User user){
        try {
            Session session=getSession();
            Transaction transaction=session.beginTransaction();
            session.update(user);
            transaction.commit();
            session.close();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public User FindUser(int id){
        try {
            Session session=getSession();
            Transaction transaction=session.beginTransaction();
            User user = session.get(User.class, id);
            transaction.commit();
            session.close();
            return user;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public List<User> FindUsers(String name){
        try {
            Session session=getSession();
            Transaction transaction=session.beginTransaction();
            String hql="from User as u where u.name like :name";
            Query query = session.createQuery(hql);
            query.setParameter("name","%"+name+"%");
            List list = (List<User>)query.list();
            transaction.commit();
            session.close();
            if (list!=null){
//                登录成功
                if (list.size()>0){
                    return list;
                }
            }else return null;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
        return null;
    }

    public boolean DeleteUser(User user){
        try {
            Session session=getSession();
            Transaction transaction=session.beginTransaction();
            session.delete(user);
            transaction.commit();
            session.close();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public User GetUser(String name,String email) {
        try {
            Session session=getSession();
            Transaction transaction=session.beginTransaction();
            String hql="from User as u where u.name = :name and u.email = :email";
            Query query = session.createQuery(hql);
            query.setParameter("name",name);
            query.setParameter("email",email);
            List list = (List<User>)query.list();
            transaction.commit();
            session.close();
            if (list!=null){
//                登录成功
                if (list.size()>0) return (User) list.get(0);
                else return null;
            }else return null;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
