<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="side">
    <s:set var="user" value="#session.user"/>
    <div class="sideMenu" style="margin:0 auto">
        <%--<div class="sideMenu" style="">--%>

        <h3>后台首页</h3>
        <ul>
            <li><a href="Charts.action" target="rightFrame">后台首页</a></li>
        </ul>

        <h3>用户管理</h3>
        <ul>
            <li><a href="ClientListAction.action" target="rightFrame">用户列表</a></li>
            <li><a href="http://www.baidu.com" target="rightFrame">其他功能</a></li>
        </ul>


        <h3>新闻管理</h3>
        <ul>
            <li><a href="AllNewsList.action" target="rightFrame">新闻列表</a></li>
            <li><a href="/News/NewsPublish.jsp" target="rightFrame">发布新闻</a></li>
            <li><a href="http://www.baidu.com" target="rightFrame">其他功能</a></li>
        </ul>

        <h3>影片管理</h3>
        <ul>
            <li><a href="FilmListAction.action" target="rightFrame">影片详情</a></li>
            <li><a href="Films/FilmClassify.jsp" target="rightFrame">影片分类</a></li>
            <li><a href="Films/FilmUpload.jsp" target="rightFrame">影片上传</a></li>
            <li><a href="http://www.baidu.com" target="rightFrame">其他功能</a></li>
        </ul>


        <h3>系统设置</h3>
        <ul>
            <li><a href="ClientFind.action?id=${user.id}&upPass=false" target="rightFrame">个人信息</a></li>
            <li><a href="#"
                   onclick="ymPrompt.win({title:'修改密码',height:'230',width:'500',dragOut:false,iframe:true,message:'ClientFind.action?id=${user.id}&upPass=true'});">密码修改</a>
            </li>
        </ul>

    </div>
</div>