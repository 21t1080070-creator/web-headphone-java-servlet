/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package data.dao;

import java.util.List;
import model.User;

/**
 *
 * @author huynhvminh
 */
public interface UserDao {
    public User findUser(String emailphone, String password);
    public User findUser(String emailphone);
    public void insertUser(String name, String email, String phone, String password, String adress);
    public List<User> getAllUsers();
    public void addUser(User u);
    public void updateUser(User u);
    public void deleteUser(int id);
}
