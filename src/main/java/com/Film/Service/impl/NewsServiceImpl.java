package com.Film.Service.impl;

import com.Film.Dao.NewsDao;
import com.Film.Service.NewsService;
import com.Film.entity.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.List;

public class NewsServiceImpl implements NewsService {
    @Qualifier("NewsDao")
    @Autowired
    private NewsDao newsDao;

    @Override
    public List<News> AllNews() {
        return newsDao.AllNews();
    }

    @Override
    public News SeachNewsID(String id) {
        return newsDao.SeachNewsID(id);
    }

    @Override
    public News SeachNews(String title) {
        return newsDao.SeachNews(title);
    }

    public NewsDao getNewsDao() {
        return newsDao;
    }

    public void setNewsDao(NewsDao newsDao) {
        this.newsDao = newsDao;
    }

    @Override
    public boolean SaveNews(News news) {
        return newsDao.SaveNews(news);
    }

    @Override
    public boolean UpdateNews(News news) {
        return newsDao.UpdateNews(news);
    }

    @Override
    public boolean DeleteNews(News news){
        return newsDao.DeleteNews(news);
    }

    @Override
    public List<News> FindNews(News news) {
        return newsDao.FindNews(news);
    }
}
