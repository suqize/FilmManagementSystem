
<%--
  Created by IntelliJ IDEA.
  User: pin-needle
  Date: 2022/11/15
  Time: 1:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="/struts-tags" %>
<!DOCTYPE html>
<%--<html>--%>
<%--<head>--%>
    <link rel="stylesheet" href="../resources/css/common.css">
    <link rel="stylesheet" href="../resources/css/main.css">
    <script type="text/javascript" src="../resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="../resources/js/colResizable-1.3.min.js"></script>
    <script type="text/javascript" src="../resources/js/common.js"></script>
    <script type="text/javascript" src="../resources/prompt/ymPrompt.js"></script>
    <link rel="stylesheet" id='skin' type="text/css" href="../resources/prompt/skin/qq/ymPrompt.css"/>
<%--</head>--%>
<%--<body>--%>
<div class="container">
<%--    搜索栏  含新增按钮--%>
        <div id="search_bar" class="mt10">
            <div class="box">
                <div class="box_border">
                    <%--搜索模块--%>
                    <div class="box_top"><b class="pl15">搜索</b></div>
                    <div class="box_center pt10 pb10">
                        <form action="FindFilm.action" method="post">
                            <table class="form_table" border="0" cellpadding="0" cellspacing="0">
                                <s:set var="film_seach" value="#request.FilmSeach"/>
                                <tr>
                                    <td>电影名称</td>
                                    <td>
                                        <input type="text" name="title" class="input-text lh25" size="20" value="${film_seach.name}">
                                    </td>
                                    <td>作者</td>
                                    <td>
                                        <input type="text" name="author" class="input-text lh25" size="20" value="${film_seach.author}">
                                    </td>
                                    <td>日期</td>
                                    <td>
                                        <input type="date" name="date" pattern="yyyy-MM-dd" class="input-text lh25" size="20" value="${film_seach.date}">
                                    </td>
                                    <td>备注</td>
                                    <td>
                                        <input type="text" name="other" class="input-text lh25" size="20" value="${film_seach.other}">
                                    </td>
                                    <td><input type="submit" name="button" class="btn btn82 btn_search" value="查询"></td>
                                    <td><input type="button" name="button" class="btn btn82 btn_res all_" value="清除"></td>
                                    <td><input type="button" name="button" class="btn btn82 btn_add add_" value="新增"></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    <%--学生列表--%>
    <div id="table" class="mt10">
        <div class="box span10 oh">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
                <tr>
                    <th width="4%">序号</th>
<%--                    <th width="6%">id号</th>--%>
                    <th width="10%">电影名称</th>
                    <th width="10%">电影封面</th>
                    <th width="10%">电影作者</th>
                    <th width="10%">电影日期</th>
<%--                    <th width="10%">电影资源</th>--%>
                    <th width="20%">电影简介</th>
                    <th width="10%">电影类别</th>
                    <th>操作</th>
                </tr>
                <%--暂无记录显示--%>
                <s:if test="#request.ClientSize == 0">
                    <tr>
                        <td colspan="9" align="center">暂无记录</td>
                    </tr>
                </s:if>
                <s:iterator value="#request.FilmLists" var="film" status="row">
                    <tr class="tr">
                            <%--序号--%>
                        <td class="td_center"><s:property value="#row.index+1"/></td>
                            <%--id号--%>
<%--                        <td class="td_center"><s:property value="#film.film_id"/></td>--%>
                            <%--名称--%>
                        <td class="td_center"><s:property value="#film.name"/></td>
                            <%--封面--%>
                        <td class="td_center" ><img width="200px" src="<s:property value="#film.ico"/>"></td>
                            <%--作者--%>
                        <td class="td_center"><s:property value="#film.author"/></td>
                            <%--日期--%>
                        <td class="td_center"><s:property value="#film.date"/></td>
                            <%--链接--%>
<%--                        <td class="td_center"><video width="200px">--%>
<%--                            <source src="${film.mp4}"  type="video/mp4">--%>
<%--                        </video></td>--%>
                            <%--简介--%>
                        <td class="td_center"><s:property value="#film.other"/></td>
                            <%--类别--%>
                        <s:set var="type_items" value="#film.filmTypes"/>
                        <td class="td_center">
                            <s:iterator value="#type_items" var="type_item" status="row">
                                <span>${type_item.category}</span><br>
                            </s:iterator>
                        </td>
                            <%--操作--%>
                        <td class="td_center">
                            <input type="button" data="<s:property value="#film.film_id"/>"
                                   class="ext_btn ext_btn_success edit_" value="编辑">　
                            <input type="button" data="<s:property value="#film.film_id"/>"
                                   class="ext_btn ext_btn_success show_" value="详细信息">　
                            <input type="button" data="<s:property value="#film.film_id"/>"
                                   class="ext_btn ext_btn_error delete_" value="删除">　

                        </td>
                    </tr>
                </s:iterator>

            </table>

        </div>
    </div>

</div>
<script type="text/javascript">
    <%--$(function () {--%>
    <%--    // 下拉框--%>
    <%--    $('#_cid').val('<s:property value="#student2.majorId"/>');--%>
    <%--    // 性别单选--%>
    <%--    $(":radio[name='student.gender'][value='<s:property value="#student2.gender"/>']").attr("checked", "checked");--%>
    <%--});--%>
    var delete_id;
    $(function () {
        // 添加学生
        $(".all_").click(function () {
            refresh();
        });

        // 添加电影
        $(".add_").click(function () {
            ymPrompt.win({
                title: '添加电影',
                height: '400',
                width: '700',
                dragOut: false,
                iframe: true,
                message: '/Films/FilmUpload.jsp',
                handler: reload
            });
        });

        // 编辑
        $(".edit_").click(function () {
            var id = $(this).attr("data");
            ymPrompt.win({
                title: '编辑信息',
                height: '400',
                width: '700',
                dragOut: false,
                iframe: true,
                message: 'FindFilmById.action?film_id=' + id,
                handler: reload
            });
        });

        // 查看
        $(".show_").click(function () {
            var id = $(this).attr("data");
            ymPrompt.win({
                title: '查看信息',
                height: '410',
                width: '700',
                dragOut: false,
                iframe: true,
                message: 'FilmInfo.action?film_id=' + id
            });
        });

        //删除
        $(".delete_").click(function () {
            delete_id = $(this).attr("data");
            ymPrompt.confirmInfo({
                title: '删除确认【1/2】',
                message: '您确定删除此信息？',
                handler: function () {
                    ymPrompt.confirmInfo({
                        title: '删除确认【2/2】',
                        message: '请再次确认：您真的要删除此信息吗？删除后不可恢复！',
                        handler: handlerDel
                    })
                }
                // handler: handlerDel
            });
        })
    });

    // 进行删除
    function handlerDel(tp) {
        if (tp === 'ok') {
            $.ajax({
                type: "GET",
                url: '/DeleteFilm.action?film_id=' + delete_id,
                dataType: "text",
                success: function (result) {
                    reload();
                }
            });
        }
    }

    // 刷新页面
    function refresh() {
        self.location.href = "FilmListAction.action";
    }

    // 重载页面
    function reload() {
        window.location.reload();
    }


</script>
<%--</body>--%>
<%--</html>--%>
