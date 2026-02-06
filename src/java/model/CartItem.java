    package model;

    public class CartItem {
        private int variantID;
        private int productID;
        private String productName; // VD: Tai nghe Sony
        private String colorName;   // VD: Màu Đen
        private String imageUrl;    // VD: /assets/images/...
        private double price;
        private int quantity;

        public CartItem() {
        }

        public CartItem(int variantID, int productID, String productName, String colorName, String imageUrl, double price, int quantity) {
            this.variantID = variantID;
            this.productID = productID;
            this.productName = productName;
            this.colorName = colorName;
            this.imageUrl = imageUrl;
            this.price = price;
            this.quantity = quantity;
        }

        // Tính tổng tiền của item này
        public double getTotalPrice() {
            return this.price * this.quantity;
        }

        // --- GETTER & SETTER ---
        public int getVariantID() { return variantID; }
        public void setVariantID(int variantID) { this.variantID = variantID; }
        public int getProductID() { return productID; }
        public void setProductID(int productID) { this.productID = productID; }
        public String getProductName() { return productName; }
        public void setProductName(String productName) { this.productName = productName; }
        public String getColorName() { return colorName; }
        public void setColorName(String colorName) { this.colorName = colorName; }
        public String getImageUrl() { return imageUrl; }
        public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
        public double getPrice() { return price; }
        public void setPrice(double price) { this.price = price; }
        public int getQuantity() { return quantity; }
        public void setQuantity(int quantity) { this.quantity = quantity; }
    }