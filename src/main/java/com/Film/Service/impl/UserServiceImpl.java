package com.Film.Service.impl;

import com.Film.Dao.UserDao;
import com.Film.Service.UserService;
import com.Film.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;


import java.util.List;

public class UserServiceImpl implements UserService {

    @Qualifier("UserDao")
    @Autowired
    private UserDao userDao;


    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public User findUser(User user) {
        return userDao.findUser(user);
    }

    @Override
    public boolean AddUser(User user) {
        return userDao.AddUser(user);
    }

    @Override
    public boolean UserIsEmpty(User user) {
        return userDao.UserIsEmpty(user);
    }

    @Override
    public boolean UpdateUser(User user) {
        return userDao.UpdateUser(user);
    }

    @Override
    public User findUser(int id) {
        return userDao.FindUser(id);
    }

    @Override
    public List<User> FindUsers(String name) {
        return userDao.FindUsers(name);
    }

    @Override
    public boolean DeleteUser(User user) {
        return userDao.DeleteUser(user);
    }

    @Override
    public User GetUser(String name,String email) {
        return userDao.GetUser(name,email);
    }

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
