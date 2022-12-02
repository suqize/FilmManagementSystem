package com.Film.action;

import com.Film.Service.NewsService;
import com.Film.entity.News;
import com.Film.utils.FilmContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.List;
import java.util.Map;

public class NewsAction extends ActionSupport {
    private String message;
    @Qualifier("NewsService")
    @Autowired
    private NewsService newsService;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public NewsService getNewsService() {
        return newsService;
    }

    public void setNewsService(NewsService newsService) {
        this.newsService = newsService;
    }

    public String execute() throws Exception {
        return SUCCESS;
    }

    public Map getRequest(){
        Map request = (Map) ActionContext.getContext().get("request");
        return request;
    }

    public String list() throws Exception{
        List<News> news = newsService.AllNews();
        if (news.size()>0){
            for (News news_temp : news) {
                System.out.println(news_temp.toString());
            }
            getRequest().put("NewsLists",news);
            return SUCCESS;
        }else return ERROR;
    }

    public String NewsPublish() throws Exception{
        if (newsService.SaveNews(getNews())) {
            getRequest().put("msg","新闻发布成功");
            return SUCCESS;
        }
        else return ERROR;
    }

    public String NewsUpdate() throws Exception{
        News news = getNews();
        if (newsService.UpdateNews(news)){
            getRequest().put("msg","新闻更改成功");
            getRequest().put("news",news);
            return SUCCESS;
        }
        else return ERROR;
    }

    public String NewsSeach() throws Exception{
        News news = newsService.SeachNewsID(getId());
        if (news!=null) {
            getRequest().put("news",news);
            return SUCCESS;
        }else return ERROR;
    }

    public News getNews(){
        News news= (News) FilmContext.getBean("News");
        news.setDate(getDate());
        news.setId(getId());
        news.setContext(getContext());
        news.setTitle(getTitle());
        news.setPublisher(getPublisher());
        return news;
    }

    public String NewsDelete(){
        if (newsService.DeleteNews(newsService.SeachNewsID(getId()))) return SUCCESS;
        else return ERROR;
    }

//    搜索新闻
    public String NewsFind(){
        message = INPUT;
        News news = getNews();
        System.out.println(news.toString()+"查找ing");
        if (news.getTitle()!=null){
            List<News> newslist = newsService.FindNews(news);
            if (newslist!=null) {
                if (newslist.size()>0) {
                    getRequest().put("NewsLists", newslist);
                    getRequest().put("news2", news);
                    message = SUCCESS;
                }
            }
        }else {
            getRequest().put("msg", "未找到相关信息！");
        }
        return message;
    }

    private String id;
    private String title;
    private String context;
    private String date;
    private String publisher;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }
}
