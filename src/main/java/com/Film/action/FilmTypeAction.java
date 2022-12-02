package com.Film.action;

import com.Film.Service.impl.FilmTypeServiceImpl;
import com.Film.entity.Film;
import com.Film.entity.FilmType;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.List;
import java.util.Map;

public class FilmTypeAction extends ActionSupport {
    @Qualifier("FilmTypeService")
    @Autowired
    private FilmTypeServiceImpl filmTypeService;

    public FilmTypeServiceImpl getFilmTypeService() {
        return filmTypeService;
    }

    public void setFilmTypeService(FilmTypeServiceImpl filmTypeService) {
        this.filmTypeService = filmTypeService;
    }

    public String getAllType(){
        try {
            List<FilmType> filmTypes = filmTypeService.AllFilmType();
            Map request = (Map) ActionContext.getContext().get("request");
            request.put("filmTypes", filmTypes);
            request.put("typeslen", filmTypes.size());
            return SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ERROR;
        }
    }

    //    获取不同类别的电影
    public String TypeFilms() throws Exception{
        List<Film> filmList = filmTypeService.getTypeFilms(getTid());
        Map request = (Map) ActionContext.getContext().get("request");
        if (filmList!=null) {
            request.put("FilmLists",filmList);
            request.put("ClientSize",filmList.size());
        }
        else return ERROR;
        return SUCCESS;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    private String tid;
}
