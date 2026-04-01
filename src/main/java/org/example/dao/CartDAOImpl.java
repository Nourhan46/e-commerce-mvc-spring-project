package org.example.dao;

import org.example.entity.Cart;
import org.example.entity.Product;
import org.example.entity.User;
import org.example.entity.cartItem;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class CartDAOImpl  implements  CartDAO{
    @Autowired
    SessionFactory sessionFactory;



    @Override
    @Transactional
    public Cart findCartByUserId(int id) {
        Session session= sessionFactory.getCurrentSession();
        String st ="from Cart c  where c.user.id = :id";

        Query query= session.createQuery(st);
        query.setParameter("id",id);

        Cart cart= (Cart) query.uniqueResult();
        return  cart;

    }



    @Override
    public Cart getCartById(int id) {
        Session session= sessionFactory.getCurrentSession();
        String st ="from Cart c LEFT JOIN FETCH c.items where c.id = :id";

        Query query= session.createQuery(st);
        query.setParameter("id",id);

        Cart cart= (Cart) query.uniqueResult();
        return  cart;
    }

    @Override
    public void updateItem(cartItem cartItem) {
        Session session= sessionFactory.getCurrentSession();
        session.update(cartItem);
    }



    @Override
    @Transactional
    public void addCart(Cart cart) {
        Session session = sessionFactory.getCurrentSession();
        session.save(cart);

    }

}
