package com.Film.entity;

public class NewsData implements Comparable {
    private String newsDate;
    private int newsNum;

    public String getNewsDate() {
        return newsDate;
    }

    public void setNewsDate(String newsDate) {
        this.newsDate = newsDate;
    }

    public int getNewsNum() {
        return newsNum;
    }

    public void setNewsNum(int newsNum) {
        this.newsNum = newsNum;
    }

    @Override
    public String toString() {
        return "NewsData [" +
                "newsDate='" + newsDate + '\'' +
                ", newsNum=" + newsNum +
                ']';
    }

    @Override
    public int compareTo(Object o) {
        NewsData s = (NewsData) o;
        if (this.newsDate.compareTo(s.newsDate)>0) {
            return 1;
        } else{
            return -1;
        }
    }
}
