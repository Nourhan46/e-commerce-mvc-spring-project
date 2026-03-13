package org.example.dao;

import org.example.entity.User;

public interface UserDAO {
    void addUser(User user);
    User findByEmail(String email);
}
