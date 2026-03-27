package org.example.dao;

import org.example.entity.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;
@Repository
public class ProductDAOImpl  implements ProductDAO{
    @Autowired
    SessionFactory sessionFactory;
    @Override
    @Transactional
    public List<Product> getAllProducts() {
        Session session= sessionFactory.getCurrentSession();
        String st ="from Product";
        Query query= session.createQuery(st);
        List<Product>products=query.list();
        return products;
    }

    @Override
    @Transactional
    public Product getProductById(int id) {
        Session session= sessionFactory.getCurrentSession();
        String st ="from Product where id = :id";

        Query query= session.createQuery(st);
        query.setParameter("id",id);

        Product product= (Product) query.uniqueResult();
        return product;
    }

    @Override
    @Transactional
    public void UpdateProduct(Product product) {
        Session session = sessionFactory.getCurrentSession();

        session.update(product);
    }

    @Override
    @Transactional
    public void addProduct(Product product) {
        Session session = sessionFactory.getCurrentSession();

        session.save(product);
    }

    @Override
    @Transactional
    public void delete(int id) {
        Session session = sessionFactory.getCurrentSession();
        Product product = getProductById(id);
        product.setIs_active(false);
        session.update(product);
    }

}
