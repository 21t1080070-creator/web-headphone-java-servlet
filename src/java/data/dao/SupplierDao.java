/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package data.dao;

import java.util.List;
import model.Supplier;

public interface SupplierDao {
    public List<Supplier> getAllSuppliers();
    public boolean insertSupplier(Supplier s);
    public boolean updateSupplier(Supplier s);
    public boolean deleteSupplier(int id);
}
