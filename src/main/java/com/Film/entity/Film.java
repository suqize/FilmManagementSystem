package com.Film.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "film", schema = "film")
public class Film {
    private String film_id;
    private String name;
    private String author;
    private String date;
    private String other;
    private String ico;
    private String mp4;
    private Set<FilmType> filmTypes=new HashSet<FilmType>();
    @Id
    @GenericGenerator(name="myuuid",strategy="uuid")
    @GeneratedValue(generator="myuuid") //引入自定义主键生成策略
    @Column(name = "film_id", nullable = false)
    public String getFilm_id() {
        return film_id;
    }

    public void setFilm_id(String film_id) {
        this.film_id = film_id;
    }

    @Column(name = "name", nullable = false)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "author", nullable = false)
    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @Column(name = "date", nullable = false)
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Column(name = "other", nullable = false)
    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other;
    }

    @Column(name = "ico", nullable = false)
    public String getIco() {
        return ico;
    }

    public void setIco(String ico) {
        this.ico = ico;
    }

    @Column(name = "mp4", nullable = false)
    public String getMp4() {
        return mp4;
    }

    public void setMp4(String mp4) {
        this.mp4 = mp4;
    }

    @ManyToMany(cascade = { CascadeType. PERSIST,CascadeType. MERGE,CascadeType. REFRESH  }, targetEntity = FilmType.class, fetch = FetchType.EAGER)
    @JoinTable(name = "filmtotype",
            joinColumns={@JoinColumn(name="id_film",referencedColumnName="film_id")},
            inverseJoinColumns={@JoinColumn(name="id_type",referencedColumnName="type_id")}
    )
    public Set<FilmType> getFilmTypes() {
        return filmTypes;
    }

    public void setFilmTypes(Set<FilmType> filmTypes) {
        this.filmTypes = filmTypes;
    }

    @Override
    public String toString() {
        String types="";
        for (FilmType filmType : filmTypes) {
            if (filmType!=null)
            types+="["+filmType.toString()+"] ";
        }
        return "Film{" +
                "film_id='" + film_id + '\'' +
                ", name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", date='" + date + '\'' +
                ", other='" + other + '\'' +
                ", ico='" + ico + '\'' +
                ", mp4='" + mp4 + '\'' +
                ", filmTypes=" +
                "{"+types+ "}" +
                '}';
    }

    public Film() {
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
