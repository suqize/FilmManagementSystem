<%--
  Created by IntelliJ IDEA.
  User: pin-needle
  Date: 2022/11/15
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../resources/css/common.css">
    <link rel="stylesheet" href="../resources/css/main.css">
    <script type="text/javascript" src="../resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="../resources/js/colResizable-1.3.min.js"></script>
    <script type="text/javascript" src="../resources/js/common.js"></script>
    <script type="text/javascript" src="../resources/prompt/ymPrompt.js"></script>
    <link rel="stylesheet" id='skin' type="text/css" href="../resources/prompt/skin/qq/ymPrompt.css"/>
</head>
<body>
<div class="container">
<%--    搜索栏  含新增按钮--%>
    <div id="search_bar" class="mt10">
        <div class="box">
            <div class="box_border">
                <%--搜索模块--%>
<%--@TODD--%>
                <div class="box_top"><b class="pl15">搜索</b></div>
                <div class="box_center pt10 pb10">
                    <form action="NewsFind.action" method="post">
                        <table class="form_table" border="0" cellpadding="0" cellspacing="0">
                            <s:set var="news2" value="#request.news2"/>
                            <tr>
                                <td>新闻标题</td>
                                <td>
                                    <input type="text" name="title" class="input-text lh25" size="20" value="${news2.title}">
                                </td>
                                <td>发布方</td>
                                <td>
                                    <input type="text" name="publisher" class="input-text lh25" size="20" value="${news2.publisher}">
                                </td>
                                <td>日期</td>
                                <td>
                                    <input type="date" name="date" pattern="yyyy-MM-dd" class="input-text lh25" size="20" value="${news2.date}">
                                </td>
                                <td>内容关键字</td>
                                <td>
                                    <input type="text" name="context" class="input-text lh25" size="20" value="${news2.context}">
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

    <%--新闻列表--%>
    <div id="table" class="mt10">
        <div class="box span10 oh">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
                <tr>
                    <th width="4%">序号</th>
                    <th width="6%">id号</th>
                    <th width="10%">新闻标题</th>
                    <th width="20%">新闻发布方</th>
                    <th width="10%">新闻日期</th>
                    <th width="10%">新闻内容</th>
                    <th>操作</th>
                </tr>
                <%--暂无记录显示--%>
                <s:if test="#request.ClientSize == 0">
                    <tr>
                        <td colspan="9" align="center">暂无记录</td>
                    </tr>
                </s:if>
                <s:iterator value="#request.NewsLists" var="news" status="row">
                    <tr class="tr">
                            <%--序号--%>
                        <td class="td_center"><s:property value="#row.index+1"/></td>
                            <%--id号--%>
                        <td class="td_center"><s:property value="#news.id"/></td>
                            <%--标题--%>
                        <td class="td_center"><s:property value="#news.title"/></td>
                            <%--作者--%>
                        <td class="td_center"><s:property value="#news.publisher"/></td>
                            <%--日期--%>
                        <td class="td_center"><s:property value="#news.date"/></td>
                            <%--简介--%>
                        <td class="td_center"><s:property value="#news.context"/></td>
                            <%--操作--%>
                        <td class="td_center">
                            <data value="${news.id}" id="edit" hidden="hidden"></data>
                            <input type="button" data="<s:property value="#news.id"/>"
                                   class="ext_btn ext_btn_success edit_" value="编辑">　
                            <input type="button" data="<s:property value="#news.id"/>"
                                   class="ext_btn ext_btn_success show_" value="详细信息">　
                            <input type="button" data="<s:property value="#news.id"/>"
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

        // 添加新闻
        $(".add_").click(function () {
            ymPrompt.win({
                title: '添加新闻',
                height: '400',
                width: '700',
                dragOut: false,
                iframe: true,
                message: '/News/NewsPublish.jsp',
                handler: reload
            });
        });

        // 编辑
        $(".edit_").click(function () {
            var id = $(this).attr("data");
            console.log(id)
            ymPrompt.win({
                title: '编辑信息',
                height: '400',
                width: '700',
                dragOut: false,
                iframe: true,
                message: '/NewsSeach.action?id=' + id,
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
                message: '/NewsSeach.action?id=' + id,
                handler: reload
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
                url: 'NewsDelete.action?id=' + delete_id,
                dataType: "text",
                success: function (result) {
                    reload();
                }
            });
        }
    }

    // 刷新页面
    function refresh() {
        self.location.href = "AllNewsList.action";
    }

    // 重载页面
    function reload() {
        window.location.reload();
    }

    //反馈
    $(function () {
        let msg="${requestScope.msg}"
        if(msg.length>6&&msg!==""){
            alert(msg);
        }
    })


</script>
</body>
</html>

