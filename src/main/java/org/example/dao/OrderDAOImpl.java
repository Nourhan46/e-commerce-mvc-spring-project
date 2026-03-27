package org.example.dao;

import org.example.entity.Order;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAOImpl implements  OrderDAO{
    @Autowired
    SessionFactory sessionFactory;
    @Override
    public void saveOrder(Order order) {
        Session  session= sessionFactory.getCurrentSession();
        session.save(order);
    }
}
