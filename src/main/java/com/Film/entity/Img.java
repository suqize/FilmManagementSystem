package com.Film.entity;

public class Img {
    public Img(String imgBase64) {
        ImgBase64 = imgBase64;
    }

    private String ImgBase64;

    public String getImgBase64() {
        return ImgBase64;
    }

    public void setImgBase64(String imgBase64) {
        ImgBase64 = imgBase64;
    }
}
