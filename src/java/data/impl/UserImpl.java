/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data.impl;

import data.dao.Database;
import data.dao.UserDao;
import data.driver.MySQLDriver;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author huynhvminh
 */
public class UserImpl implements UserDao {

    @Override
    public User findUser(String emailphone, String password) {
        String s;
        if(emailphone.contains("@"))
            s="select * from user where Email='"+emailphone+"' and Password ='"+password+"'";
        else s="select * from user where Phone='"+emailphone+"' and Password ='"+password+"'";
        try {
            Connection Con = MySQLDriver.getConnection();
            PreparedStatement sttm = Con.prepareStatement(s);
            ResultSet rs= sttm.executeQuery();
            if(rs.next()) return new User(rs);
        } catch (SQLException ex) {
            Logger.getLogger(UserImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public User findUser(String emailphone) {
        String s;
        if(emailphone.contains("@"))
            s="select * from user where Email='"+emailphone+"'";
        else s="select * from user where Phone='"+emailphone+"'";
        try {
            Connection Con = MySQLDriver.getConnection();
            PreparedStatement sttm = Con.prepareStatement(s);
            ResultSet rs= sttm.executeQuery();
            if(rs.next()) return new User(rs);
        } catch (SQLException ex) {
            Logger.getLogger(UserImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    @Override
    public void insertUser(String name, String email, String phone, String password, String address) {
        String sql ="insert into user(Username, Email, Phone, Password, Address, Role) values('"+name+"','"+email;
        sql=sql+"','"+phone+"','"+password+"','"+address+"','Customer')";
        try {
            Connection con = MySQLDriver.getConnection();
            PreparedStatement sttm = con.prepareStatement(sql);
            sttm.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM user";
        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new User(rs));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
    public void addUser(User u) {
        String sql = "INSERT INTO user (Username, Password, Email, Phone, Address, Role) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getPhone());
            ps.setString(5, u.getAddress());
            ps.setString(6, u.getRole());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
    public void updateUser(User u) {
        // Chỉ cho sửa Info cơ bản, không sửa Password ở đây (để an toàn)
        String sql = "UPDATE user SET Username=?, Email=?, Phone=?, Address=?, Role=? WHERE UserID=?";
        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPhone());
            ps.setString(4, u.getAddress());
            ps.setString(5, u.getRole());
            ps.setInt(6, u.getUserID());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
    public void deleteUser(int id) {
        String sql = "DELETE FROM user WHERE UserID=?";
        try (Connection conn = MySQLDriver.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
        // Thêm hàm này vào cuối file UserDAO.java
    

}

