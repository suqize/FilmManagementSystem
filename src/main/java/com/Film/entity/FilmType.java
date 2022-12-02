package com.Film.entity;


import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "filmtype", schema = "film")
public class FilmType {
    private int type_id;
    private String category;
    private Set<Film> films=new HashSet<Film>();

    @Id
    @GenericGenerator(name = "generator", strategy = "increment")
    @GeneratedValue(generator = "generator")
    @Column(name = "type_id", nullable = false)
    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    @Column(name = "category", nullable = false)
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @ManyToMany(cascade = { CascadeType. PERSIST,CascadeType. MERGE,CascadeType. REFRESH  },targetEntity=Film.class,fetch = FetchType.EAGER)
    @JoinTable(name = "filmtotype",
            joinColumns={@JoinColumn(name="id_type",referencedColumnName="type_id")},
            inverseJoinColumns={@JoinColumn(name="id_film",referencedColumnName="film_id")}
    )
    public Set<Film> getFilms() {
        return films;
    }

    public void setFilms(Set<Film> films) {
        this.films = films;
    }

    @Override
    public String toString() {
        return "FilmType{" +
                "type_id=" + type_id +
                ", category='" + category + '\'' +
                '}';
    }

    public FilmType() {
        super();
    }

    @Override
    public int hashCode() {
        return super.hashCode();
    }

    @Override
    public boolean equals(Object obj) {
        return super.equals(obj);
    }
}
