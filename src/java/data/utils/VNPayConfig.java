/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data.utils;

/**
 *
 * @author huynhvminh
 */

public class VNPayConfig {
    public static final String vnp_TmnCode    = "L95D9W66";
    public static final String vnp_HashSecret = "JTLVUB6YY8NSEEOZTBFPB0LQIMXKV22K";
    public static final String vnp_PayUrl     = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";

    public static final String vnp_ReturnUrl  = "http://localhost:8080/YourApp/vnpay-return";
    public static final String vnp_IpnUrl     = "http://your-public-domain.com/vnpay-ipn";
}
