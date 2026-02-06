/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author huynhvminh
 */
public class API {
    public static String getName(String fullname){
        String s="";
        for(int i=fullname.length()-1;i>=0;i--){
            if(fullname.charAt(i)==' ') break;
            s=fullname.charAt(i)+s;
        }
        return s;
    }
    public static String getMD5(String input)
    {
        try{
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest=md.digest(input.getBytes());
            BigInteger no = new BigInteger(1,messageDigest);
            String hashtext = no.toString(16);
            while(hashtext.length()<32){
                hashtext="0"+hashtext;
            }
            return hashtext;
        }
        catch(NoSuchAlgorithmException e){
            throw new RuntimeException(e);
        }
    }
    
}