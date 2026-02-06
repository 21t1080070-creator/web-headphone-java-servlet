/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data.dao;

import data.impl.CategoryImpl;
import data.impl.ImportImpl;
import data.impl.OrderImpl;
import data.impl.ProductImpl;
import data.impl.SupplierImpl;
import data.impl.UserImpl;
import data.impl.VariantImpl;

/**
 *
 * @author huynhvminh
 */
public class Database {
    public static CategoryDao getCategoryDao()
    {
        return new CategoryImpl();
    }
    public static ProductDao getProductDao()
    {
        return new ProductImpl();
    }
    public static VariantDao getVariantDao()
    {
        return new VariantImpl();
    }
    public static UserDao getUserDao()
    {
        return new UserImpl();
    }
    public static OrderDao getOrderDao()
    {
        return new OrderImpl();
    }
    public static SupplierDao getSupplierDao()
    {
        return new SupplierImpl();
    }
    public static ImportDao getImportDao()
    {
        return new ImportImpl();
    }
    
}
