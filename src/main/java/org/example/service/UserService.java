package org.example.service;

import org.example.entity.User;

import javax.naming.AuthenticationException;

public interface UserService {
    void addUser(User user);
    User getUser(String email, String password) throws AuthenticationException;
    User findUserById(int id);
}
