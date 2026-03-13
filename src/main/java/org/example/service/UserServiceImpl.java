package org.example.service;

import org.example.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.example.dao.UserDAO;

import javax.naming.AuthenticationException;

@Service
public class UserServiceImpl  implements  UserService{
    @Autowired
   private UserDAO userDAO ;
    @Override
    public void addUser(User user) {
       userDAO.addUser(user);
    }

    @Override
    public User getUser(String email, String password) throws AuthenticationException {
       User user= userDAO.findByEmail(email);
       if(user ==null || !password.equals(password))
           throw  new AuthenticationException("invalid email or password");
       return  user;



    }
}
