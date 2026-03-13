package org.example.service;

import org.example.dao.ProductDAO;
import org.example.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl  implements  ProductService{
    @Autowired
    ProductDAO productDAO;
    @Override
    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }

    @Override
    public Product getProductById(int id) {
        return productDAO.getProductById(id);
    }

    @Override
    public void UpdateProduct(Product product) {

        productDAO.UpdateProduct(product);

    }

    @Override
    public void AddProduct(Product product) {
        productDAO.addProduct(product);
    }

    @Override
    public void deleteProduct(int id) {
        productDAO.delete(id);
    }

}
