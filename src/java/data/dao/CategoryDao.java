/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package data.dao;

import java.util.List;
import model.Category;

/**
 *
 * @author huynhvminh
 */
public interface CategoryDao {
    public List<Category> findAll();
    public void insert(String name);
    public void delete(int id);
    public void update(Category c);
}
