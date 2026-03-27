package org.example.dao;

import org.example.entity.Payment;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAOImpl  implements  PaymentDAO{
    @Autowired
    SessionFactory sessionFactory;
    @Override
    public void save(Payment payment) {
        Session session=sessionFactory.getCurrentSession();
        session.save(payment);
    }
}
