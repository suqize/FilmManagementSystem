package test;

import com.Film.Service.FilmService;
import com.Film.Service.UserService;
import com.Film.entity.Film;
import com.Film.entity.FilmType;
import com.Film.entity.User;
import org.hibernate.Session;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class manyTomany {
    @Test
    public void test1(){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        FilmService filmService = (FilmService)applicationContext.getBean("FilmService");
        Film film= (Film) applicationContext.getBean("Film");
        film.setName("测试影片2");
        film.setMp4("no2");
        film.setAuthor("苏启哲2");
        film.setOther("备注2");
        film.setIco("no2");
        film.setDate("2022.10.20");

        FilmType filmType=new FilmType();
        filmType.setCategory("爱情片");
        FilmType filmType1=new FilmType();
        filmType1.setCategory("悬疑片");

        film.getFilmTypes().add(filmType);
//        film.getFilmTypes().add(filmType1);
//        filmType.getFilms().add(film);
//        filmType.getFilms().add(film);
        filmService.addFilm(film);
        film.getFilmTypes().add(filmType1);
        filmService.UpdateFilme(film);
    }

    @Test
    public void FindFilmTest(){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        FilmService filmService = (FilmService)applicationContext.getBean("FilmService");
        Film f=new Film();
        f.setAuthor("苏");
        List<Film> films = filmService.FindFilm(f);
        System.out.println(films.size());
        for (Film film : films) {
            System.out.println(film.toString());
        }
    }

    @Test
    public void UserAdd(){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserService userService = (UserService)applicationContext.getBean("UserService");
        User user=new User();
        user.setName("苏启哲");
        user.setPassword("123456");
        userService.AddUser(user);

    }

}
