/* 
 * File: web/assets/js/cart.js
 * Mô tả: Xử lý logic tăng/giảm số lượng và xóa sản phẩm trong giỏ hàng
 */

// Hàm định dạng tiền tệ (Sử dụng 'vi-VN' và 'VND' theo yêu cầu của bạn)
const formatCurrency = (amount) => {
    return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(amount);
};

// Hàm cập nhật số lượng
function updateQuantity(variantId, newQty) {
    if (newQty < 1) return; // Không cho phép giảm xuống dưới 1

    // Kiểm tra biến BASE_URL đã được định nghĩa ở JSP chưa
    var baseUrl = (typeof BASE_URL !== 'undefined') ? BASE_URL : '';
    var url = baseUrl + '/update-cart';

    fetch(url, {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: 'action=update&variantId=' + variantId + '&quantity=' + newQty
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        if(data.status === 'ok') {
            // Cập nhật giao diện: reload trang để JSP render lại số liệu mới nhất
            location.reload(); 
            
            /* 
             * Nếu muốn cập nhật mượt mà không reload (AJAX thuần), 
             * bạn có thể mở comment đoạn dưới đây và xóa dòng location.reload():
             * 
             * document.getElementById('qty-' + variantId).value = newQty;
             * document.getElementById('subTotalMoney').innerText = formatCurrency(data.totalMoney);
             * document.getElementById('finalTotalMoney').innerText = formatCurrency(data.totalMoney);
             * document.getElementById('headerTotalQty').innerText = data.totalQty;
             */
        } else {
            console.error('Server error:', data.message);
        }
    })
    .catch(error => {
        console.error('Fetch error:', error);
        alert('Có lỗi xảy ra khi cập nhật giỏ hàng.');
    });
}

// Hàm xóa sản phẩm
function removeItem(variantId) {
    if(!confirm("Bạn có chắc muốn xóa sản phẩm này?")) return;

    var baseUrl = (typeof BASE_URL !== 'undefined') ? BASE_URL : '';
    var url = baseUrl + '/update-cart';

    fetch(url, {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: 'action=delete&variantId=' + variantId
    })
    .then(response => {
        if (!response.ok) throw new Error('Network response was not ok');
        return response.json();
    })
    .then(data => {
         // Reload để cập nhật lại danh sách giỏ hàng
         location.reload();
    })
    .catch(error => {
        console.error('Fetch error:', error);
        alert('Không thể xóa sản phẩm. Vui lòng thử lại.');
    });
}
