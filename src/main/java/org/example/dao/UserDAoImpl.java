package org.example.dao;

import org.example.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public class UserDAoImpl  implements UserDAO {
    @Autowired
    SessionFactory sessionFactory;
    @Override
    @Transactional
    public void addUser(User user) {
      Session session= sessionFactory.getCurrentSession();
      session.save(user);
    }

    @Override
    @Transactional
    public User findByEmail(String email) {
           Session session = sessionFactory.getCurrentSession();
        String st = " from User";
        Query query = session.createQuery(st);

        List<User> users= query.list();

        for(User user: users)
        {
            if(email.equals(user.getEmail()))
                return user;

        }

        return null;
    }

    @Override
    public User findById(int id) {
        Session session= sessionFactory.getCurrentSession();
        String st ="from User where id = :id";
            Query query= session.createQuery(st);
            query.setParameter("id",id);
            return (User) query.uniqueResult();


    }


}
