package com.Film.utils;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class FilmContext {
    public static String file="applicationContext.xml";
    public static ApplicationContext context = new ClassPathXmlApplicationContext(file);
    public static Object getBean(String bean){
        return context.getBean(bean);
    }
    public static ApplicationContext getContext(){
        return context;
    }

}
