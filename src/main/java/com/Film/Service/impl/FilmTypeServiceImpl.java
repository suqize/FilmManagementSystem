package com.Film.Service.impl;

import com.Film.Dao.FilmTypeDao;
import com.Film.Service.FilmTypeService;
import com.Film.entity.Film;
import com.Film.entity.FilmType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.List;

public class FilmTypeServiceImpl implements FilmTypeService {
    @Qualifier("FilmTypeDao")
    @Autowired
    private FilmTypeDao filmTypeDao;

    @Override
    public List<FilmType> AllFilmType() {
        return filmTypeDao.AllFilmType();
    }

    @Override
    public boolean AddFilmType(FilmType filmType) {
        return filmTypeDao.AddFilmType(filmType);
    }

    @Override
    public List<Film> getTypeFilms(String tid) {
        return filmTypeDao.getTypeFilms(tid);
    }

    public FilmTypeDao getFilmTypeDao() {
        return filmTypeDao;
    }

    public void setFilmTypeDao(FilmTypeDao filmTypeDao) {
        this.filmTypeDao = filmTypeDao;
    }

    public FilmType SeachType(String type){
        return filmTypeDao.seachFilmType(type);
    }

    @Override
    public boolean updateFilmType(FilmType filmType) {
        return filmTypeDao.updateFilmType(filmType);
    }

    @Override
    public Film UpdateType(String type, Film film) {
        return filmTypeDao.UpdateType(type,film);
    }
}
