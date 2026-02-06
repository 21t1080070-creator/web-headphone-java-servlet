/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package data.dao;

import java.util.List;
import model.CartItem;
import model.Product;
import model.ProductDetailDTO;
import model.ProductHomeDTO;
import model.ProductVariantDTO;

/**
 *
 * @author huynhvminh
 */
public interface ProductDao {
    public boolean insertProduct(ProductDetailDTO product, int categoryId);
    public List<Product> findAll();
    public Product findProduct(int id_product);
    public List<ProductHomeDTO> getProductsForHomePage(int categoryID);
    public ProductDetailDTO getProductDetail(int productID);
    public CartItem getProductForCart(int variantId);
    public List<ProductHomeDTO> getAllProductsForAdmin();
    public List<ProductVariantDTO> getVariantsByProductId(int productId);
    public ProductDetailDTO getProductBasicInfo(int productId);
    public boolean deleteVariant(int variantId);
    public int getProductIdByVariantId(int variantId);
    public boolean deleteProductFull(int productId);
    public boolean updateProduct(int productId, String name, String desc, int cateId);
    public List<ProductHomeDTO> searchByName(String keyword);
}
