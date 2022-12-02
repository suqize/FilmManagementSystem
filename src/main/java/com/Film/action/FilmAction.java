package com.Film.action;

import com.Film.Service.FilmService;
import com.Film.Service.FilmTypeService;
import com.Film.entity.Film;
import com.Film.entity.FilmType;
import com.Film.entity.Img;
import com.Film.utils.FilmContext;
import com.Film.utils.ReadImgUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

public class FilmAction extends ActionSupport {
    private String message;
    @Qualifier("FilmService")
    @Autowired
    private FilmService filmService;

    @Qualifier("FilmTypeService")
    @Autowired
    private FilmTypeService filmTypeService;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public FilmService getFilmService() {
        return filmService;
    }

    public void setFilmService(FilmService filmService) {
        this.filmService = filmService;
    }

    public String execute() throws Exception {
        return SUCCESS;
    }


    public String list() throws Exception{
        List<Film> films = filmService.AllFilm();
        Map request = (Map) ActionContext.getContext().get("request");
        if (films.size()>0){
            for (Film film : films) {
                System.out.println(film.toString());
            }
            request.put("FilmLists",films);
            return SUCCESS;
        }else return ERROR;
    }

    public String FindFilm() throws Exception{
//        Set<Film> filmSet=new HashSet<Film>();
        Film film_seach=getFilm();
//        System.out.println(film_seach.toString());
        List<Film> films = filmService.FindFilm(film_seach);
        if (films==null){
            return ERROR;
        }else {
            Map request = (Map) ActionContext.getContext().get("request");
            if (films.size()>0){
                for (Film film : films) {
                    System.out.println(film.toString());
                }
                request.put("FilmLists",films);
                request.put("FilmSeach",film_seach);
                return SUCCESS;
            }else return ERROR;
        }
    }

    public String FindFilmById(){
        Film film=filmService.FindFilmById(getFilm_id());
        if (film == null) return ERROR;
        else {
            Map request = (Map) ActionContext.getContext().get("request");
            Set<FilmType> filmTypes = film.getFilmTypes();
            StringBuilder types = new StringBuilder();
            for (FilmType filmType : filmTypes) {
                types.append(filmType.getCategory()+";");
            }
            request.put("film",film);
            request.put("filmtypes",types);
            return SUCCESS;
        }
    }

    public String DeleteFilm(){
        if (!getFilm_id().equals("null")) {
            System.out.println(getFilm_id()+"删除ing");
            boolean key = filmService.deleteFilm(getFilm_id());
            if (key) return SUCCESS;
        }
        return ERROR;
    }

    public String UpdateFilm() throws Exception {
        if (!getFilm_id().equals("null")) {
            Film film = getFilm();
            boolean b = filmService.UpdateFilme(film);
            if (b) {
                Map request = (Map) ActionContext.getContext().get("request");
                request.put("film",film);
                request.put("msg","更新成功！");
                return SUCCESS;
            }
            else return ERROR;
        }
        else return ERROR;
    }

    public Film getFilm(){
        Film film= (Film) FilmContext.getBean("Film");
        film.setDate(getDate());
        film.setIco(getIco());
        film.setOther(getOther());
        film.setAuthor(getAuthor());
        film.setMp4(getMp4());
        film.setFilm_id(getFilm_id());
        film.setName(getTitle());
        try{
            if (getTypes()!=null) {
                String[] types = getTypes().split(";");
                //        filmService.addFilm(film);
                for (String type : types) {
                    FilmType filmType = filmTypeService.SeachType(type);
                    if (filmType==null) {
                        filmType = new FilmType();
                        filmType.setCategory(type);
                        filmTypeService.AddFilmType(filmType);
                        filmType = filmTypeService.SeachType(type);
                    }
                    filmType.getFilms().add(film);
                    film.getFilmTypes().add(filmType);
                }
            }else return film;
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("修改报错");
            return film;
        }
        return film;
    }

    private String film_id;
    private String name;
    private String author;
    private String date;
    private String other;
    private String ico;
    private String mp4;
    private String types;
    //封装文件标题请求参数的属性
    private String title;
    //封装上传文件域的属性
    private File upload;
    //封装上传文件类型的属性
    private String uploadContentType;
    //封装上传文件名的属性
    private String uploadFileName;

    public String getFilm_id() {
        return film_id;
    }

    public void setFilm_id(String film_id) {
        this.film_id = film_id;
    }

    public String getName() {
        if (name ==null) name="";
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        if (author == null) author="";
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDate() {
        if (date==null) date="";
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getOther() {
        if (other == null) other="";
        return other;
    }

    public void setOther(String other) {
        this.other = other;
    }

    public String getIco() {
        return ico;
    }

    public void setIco(String ico) {
        this.ico = ico;
    }

    public String getMp4() {
        return mp4;
    }

    public void setMp4(String mp4) {
        this.mp4 = mp4;
    }

    public String getTypes() {
        return types;
    }

    public void setTypes(String types) {
        this.types = types;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public FilmTypeService getFilmTypeService() {
        return filmTypeService;
    }

    public void setFilmTypeService(FilmTypeService filmTypeService) {
        this.filmTypeService = filmTypeService;
    }
}
