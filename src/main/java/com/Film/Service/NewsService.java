package com.Film.Service;

import com.Film.entity.News;

import java.util.List;

public interface NewsService {
    public List<News> AllNews();
    public News SeachNewsID(String id);
    public News SeachNews(String title);
    public boolean SaveNews(News news);
    public boolean UpdateNews(News news);
    public boolean DeleteNews(News news);
    public List<News> FindNews(News news);
}
