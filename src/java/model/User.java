/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author huynhvminh
 */
public class User {
    public int UserID;
    public String Username, Password, Email, Phone, Address, Role;
    
    public User(ResultSet rs) throws SQLException {
        this.UserID = rs.getInt("UserID");
        this.Username = rs.getString("Username");
        this.Email = rs.getString("Email");
        this.Phone = rs.getString("Phone");
        this.Password = rs.getString("Password");
        this.Address = rs.getString("Address");
        this.Role = rs.getString("Role");
    }

    public User() {
    }

    public int getUserID() {
        return UserID;
    }

    public String getUsername() {
        return Username;
    }

    public String getPassword() {
        return Password;
    }

    public String getEmail() {
        return Email;
    }

    public String getPhone() {
        return Phone;
    }

    public String getAddress() {
        return Address;
    }

    public String getRole() {
        return Role;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public void setRole(String Role) {
        this.Role = Role;
    }
    
}
