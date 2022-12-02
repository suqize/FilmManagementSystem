package com.Film.Service;

import com.Film.entity.Film;
import com.Film.entity.FilmType;

import java.util.List;

public interface FilmTypeService {
    public List<FilmType> AllFilmType();
    public boolean AddFilmType(FilmType filmType);

    public List<Film> getTypeFilms(String tid);
    public FilmType SeachType(String type);
    public boolean updateFilmType(FilmType filmType);

    Film UpdateType(String type, Film film);
}
