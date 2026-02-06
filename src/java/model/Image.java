/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author huynhvminh
 */
public class Image {
    private int ImageID;
    private int VariantID;
    private String Image_url;
    private int Sort_order;

    public Image(int ImageID, int VariantID, String Image_url, int Sort_order) {
        this.ImageID = ImageID;
        this.VariantID = VariantID;
        this.Image_url = Image_url;
        this.Sort_order = Sort_order;
    }

    public int getImageID() {
        return ImageID;
    }

    public int getVariantID() {
        return VariantID;
    }

    public String getImage_url() {
        return Image_url;
    }

    public int getSort_order() {
        return Sort_order;
    }

    public void setImageID(int ImageID) {
        this.ImageID = ImageID;
    }

    public void setVariantID(int VariantID) {
        this.VariantID = VariantID;
    }

    public void setImage_url(String Image_url) {
        this.Image_url = Image_url;
    }

    public void setSort_order(int Sort_order) {
        this.Sort_order = Sort_order;
    }
    
}
