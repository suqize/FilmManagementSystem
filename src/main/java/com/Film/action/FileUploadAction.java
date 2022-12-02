package com.Film.action;

import java.io.*;
import java.util.Set;


import com.Film.Service.FilmService;
import com.Film.Service.FilmTypeService;
import com.Film.entity.Film;
import com.Film.entity.FilmType;
import com.Film.utils.FilmContext;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

/**
 *
 * @author xiongjitao
 *
 * @version $Rev$
 */
public class FileUploadAction extends ActionSupport{
    @Qualifier("FilmService")
    @Autowired
    private FilmService filmService;
    @Qualifier("FilmTypeService")
    @Autowired
    private FilmTypeService filmTypeService;
    public FilmService getFilmService() {
        return filmService;
    }
    public void setFilmService(FilmService filmService) {
        this.filmService = filmService;
    }
    private String id;
    private String date;
    private String other;
    private String ico;
    private String author;
    private String type;
    //封装文件标题请求参数的属性
    private String title;
    //封装上传文件域的属性
    private File upload;
    //封装上传文件类型的属性
    private String uploadContentType;
    //封装上传文件名的属性
    private String uploadFileName;
    //文件标题的setter和getter方法
    public void setTitle(String title)
    {
        this.title = title;
    }
    public String getTitle()
    {
        return (this.title);
    }
    //上传文件对应文件内容的setter和getter方法
    public void setUpload(File upload)
    {
        this.upload = upload;
    }
    public File getUpload()
    {
        return (this.upload);
    }
    //上传文件的文件类型的setter和getter方法
    public void setUploadContentType(String uploadContentType)
    {
        this.uploadContentType = uploadContentType;
    }
    public String getUploadContentType()
    {
        return (this.uploadContentType);
    }
    //上传文件的文件名的setter和getter方法
    public void setUploadFileName(String uploadFileName)
    {
        this.uploadFileName = uploadFileName;
    }
    public String getUploadFileName()
    {
        return (this.uploadFileName);
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        if (other.equals("")||other==null) other="无";
        this.other = other;
    }

    public String getIco() {
        return ico;
    }

    public void setIco(String ico) {
        this.ico = ico;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Film getFilmInfo(){
        Film film= (Film) FilmContext.getBean("Film");
        film.setFilm_id(this.id);
        film.setName(getTitle());
        film.setDate(getDate());
        film.setIco("/resources/ico/error.png");
        film.setOther(getOther());
//        User user = (User) ActionContext.getContext().getSession().get("user");
        film.setAuthor(getAuthor());

        film.setMp4("/resources/mp4/"+getTitle()+".mp4");
        return film;
    }

    @Override
    public String execute() throws Exception
    {  return super.execute();
    }

    public String uploadFilm() throws Exception{
        Film film=getFilmInfo();
        //以服务器的文件保存地址和原文件名建立上传文件输出流
        String PathFile = ServletActionContext.getServletContext()
                .getRealPath("/resources/mp4/") + getTitle() + ".mp4";
        try {
            System.out.println("上传文件。");
            System.out.println(PathFile);
            File file = new File(PathFile);
            if (!file.exists()) {
//先得到文件的上级目录，并创建上级目录，在创建文件
                file.getParentFile().mkdir();
                try {
                    //创建文件
                    file.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
//        if (!file.exists()) file.createNewFile();
            FileOutputStream fos = new FileOutputStream(PathFile);
            FileInputStream fis = new FileInputStream(getUpload());
            byte[] buffer = new byte[1024];
            int len = 0;
            while ((len = fis.read(buffer)) > 0) {
                fos.write(buffer, 0, len);
            }
        }catch (NullPointerException e){
            e.printStackTrace();
            System.out.println(PathFile+"已存在！");
        }
//       保存至数据库
        try {
            String[] types = getType().split(";");
//            逐个检验影片类别，并将影片类别保存至film对象中
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
//            存入film对象
            filmService.UpdateFilme(film);
        }catch (Exception e){
            e.printStackTrace();
            return ERROR;
        }
        return SUCCESS;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public FilmTypeService getFilmTypeService() {
        return filmTypeService;
    }

    public void setFilmTypeService(FilmTypeService filmTypeService) {
        this.filmTypeService = filmTypeService;
    }
}

