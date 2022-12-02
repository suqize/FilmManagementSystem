package com.Film.entity;

public class FilmData {
    private String filmtype;
    private int num;

    public String getFilmtype() {
        return filmtype;
    }

    public void setFilmtype(String filmtype) {
        this.filmtype = filmtype;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    @Override
    public String toString() {
        return "FilmData [filmtype=" + filmtype + ", num=" + num + "]";
    }
}
