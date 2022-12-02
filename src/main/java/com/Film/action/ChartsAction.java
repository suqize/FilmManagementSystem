package com.Film.action;

import com.Film.Service.FilmTypeService;
import com.Film.Service.NewsService;
import com.Film.entity.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

public class ChartsAction extends ActionSupport implements ServletRequestAware,
        ServletResponseAware, SessionAware {
    private HttpServletRequest request;
    private HttpServletResponse response;
    private Map<String, Object> httpSession;
    @Autowired
    @Qualifier("FilmTypeService")
    private FilmTypeService filmTypeService;
    @Qualifier("NewsService")
    @Autowired
    private NewsService newsService;


    public String GetCharts() throws Exception{
//        电影类别
        //定义一个list集合
        List<FilmData> list = new ArrayList<FilmData>();
        // 数据添加到集合里面，这里可以改为获取sql数据信息，然后转为json字符串，然后存到list中。
        //这里把“类别名称”和“销量”作为两个属性封装在一个Product类里，
        //每个Product类的对象都可以看作是一个类别（X轴坐标值）与销量（Y轴坐标值）的集合。
        List<FilmType> filmTypes = filmTypeService.AllFilmType();
        for (FilmType filmType : filmTypes) {
            List<Film> typeFilms = filmTypeService.getTypeFilms(String.valueOf(filmType.getType_id()));
            FilmData filmData = new FilmData();
            filmData.setFilmtype(filmType.getCategory());
            if (typeFilms==null) filmData.setNum(0);
            else filmData.setNum(typeFilms.size());
            list.add(filmData);
        }
        ObjectMapper mapper = new ObjectMapper(); // 提供java-json相互转换功能的类
        String json = mapper.writeValueAsString(list); // 将list中的对象转换为Json字符串
        System.out.println(json);
        request.setAttribute("json",json);
        
//        新闻数量
        List<NewsData> newsDataList = new ArrayList<NewsData>();
        List<String> Dates = new ArrayList<String>();
        List<News> news = newsService.AllNews();
        for (News news_t : news) {
            int index = Dates.indexOf(news_t.getDate());
            if (index>-1) {
//                找到指定日期
                NewsData newsData = newsDataList.get(index);
                System.out.println("找到-》"+newsData.toString());
                newsData.setNewsDate(news_t.getDate());
                newsData.setNewsNum(newsData.getNewsNum()+1);
                newsDataList.set(index,newsData);
            }else {
//                未找到指定日期
                NewsData newsData = new NewsData();
                newsData.setNewsDate(news_t.getDate());
                newsData.setNewsNum(1);
                Dates.add(news_t.getDate());
                newsDataList.add(newsData);
            }
        }
        Collections.sort(newsDataList);

        ObjectMapper Newsmapper = new ObjectMapper(); // 提供java-json相互转换功能的类
        String News_json = Newsmapper.writeValueAsString(newsDataList); // 将list中的对象转换为Json字符串
        System.out.println(News_json);
        request.setAttribute("NewsData",News_json);

        // 将json字符串数据返回给前端
        return SUCCESS;
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        setRequest(httpServletRequest);
    }

    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        setResponse(httpServletResponse);
    }

    @Override
    public void setSession(Map<String, Object> map) {
        setHttpSession(map);
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public HttpServletResponse getResponse() {
        return response;
    }

    public void setResponse(HttpServletResponse response) {
        this.response = response;
    }

    public Map<String, Object> getHttpSession() {
        return httpSession;
    }

    public void setHttpSession(Map<String, Object> httpSession) {
        this.httpSession = httpSession;
    }

    public FilmTypeService getFilmTypeService() {
        return filmTypeService;
    }

    public void setFilmTypeService(FilmTypeService filmTypeService) {
        this.filmTypeService = filmTypeService;
    }

    public NewsService getNewsService() {
        return newsService;
    }

    public void setNewsService(NewsService newsService) {
        this.newsService = newsService;
    }
}
