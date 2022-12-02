package com.Film.Service;

import com.Film.entity.User;

import java.util.List;

public interface UserService {
    public List<User> findAll();

    public User findUser(User user);
    public boolean AddUser(User user);
    public boolean UserIsEmpty(User user);
    public boolean UpdateUser(User user);
    public User findUser(int id);
    public List<User> FindUsers(String name);
    public boolean DeleteUser(User user);

    public User GetUser(String name,String email);
}
