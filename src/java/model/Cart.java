package model;
import java.util.HashMap;
import java.util.Map;

public class Cart {
    // Key là VariantID để phân biệt màu sắc
    private Map<Integer, CartItem> items = new HashMap<>();

    public void add(CartItem item) {
        // Nếu đã có variant này -> cộng dồn số lượng
        if (items.containsKey(item.getVariantID())) {
            CartItem existItem = items.get(item.getVariantID());
            existItem.setQuantity(existItem.getQuantity() + item.getQuantity());
        } else {
            // Nếu chưa có -> thêm mới
            items.put(item.getVariantID(), item);
        }
    }

    // Lấy tổng số lượng sản phẩm (để hiện lên icon)
    public int getTotalQuantity() {
        int total = 0;
        for (CartItem item : items.values()) {
            total += item.getQuantity();
        }
        return total;
    }

    // Trong file model/Cart.java
    public double getTotalMoney() {
        double total = 0;
        for (CartItem item : items.values()) {
            total += (item.getPrice() * item.getQuantity());
        }
        return total;
    }
    public Map<Integer, CartItem> getItems() {
        return items;
    }
}