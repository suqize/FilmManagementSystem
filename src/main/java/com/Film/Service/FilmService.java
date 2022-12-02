package com.Film.Service;

import com.Film.entity.Film;

import java.util.List;

public interface FilmService {
    public List<Film> AllFilm();
    public boolean addFilm(Film film);

    public boolean UpdateFilme(Film film);

    public List<Film> FindFilm(Film film);

    public boolean deleteFilm(String id);

    Film FindFilmById(String film_id);
}
