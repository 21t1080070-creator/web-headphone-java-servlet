/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package data.dao;

import java.util.List;
import model.CartItem;
import model.ProductVariantDTO;
import model.Variant;

/**
 *
 * @author huynhvminh
 */
public interface VariantDao {
    public CartItem getCartItemInfo(int variantId);
    public boolean insertVariant(int productId, String color, double price, int stock);
    public ProductVariantDTO getVariantById(int variantId);
    public boolean updateVariant(int variantId, String color, double price, int stock);
    public List<ProductVariantDTO> getAllVariantsFullInfo();
}
