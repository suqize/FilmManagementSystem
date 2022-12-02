package com.Film.Service.impl;

import com.Film.Dao.FilmDao;
import com.Film.Service.FilmService;
import com.Film.entity.Film;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.List;

public class FilmServiceImpl implements FilmService {
    @Qualifier("FilmDao")
    @Autowired
    private FilmDao filmDao;
    public FilmDao getFilmDao() {
        return filmDao;
    }
    public void setFilmDao(FilmDao filmDao) {
        this.filmDao = filmDao;
    }
    @Override
    public List<Film> AllFilm() {
        return filmDao.AllFilm();
    }

    @Override
    public boolean addFilm(Film film) {
        return filmDao.addFilm(film);
    }

    @Override
    public boolean UpdateFilme(Film film) {
        return filmDao.UpdateFilme(film);
    }

    @Override
    public List<Film> FindFilm(Film film) {
        return filmDao.FindFilm(film);
    }

    @Override
    public boolean deleteFilm(String id) {
        return filmDao.deleteFilm(id);
    }

    @Override
    public Film FindFilmById(String film_id) {
        return filmDao.FindFilmById(film_id);
    }

}
