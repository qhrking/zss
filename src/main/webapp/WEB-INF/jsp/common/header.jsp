<%--
  Created by IntelliJ IDEA.
  User: huazhi
  Date: 2017/3/8
  Time: 18:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<div class="top_fixed">
  <div class="top containers clear">
    <a href="">
      <img class="logo" src="resource/img/logo.png">
      <img class="logo1" src="resource/img/logo2.png">
    </a>
    <div class="nav clear">
      <a href="app" target="_self">首页</a>
      <a href="app/rank" target="_self" class="active">排行榜</a>
      <a href="app/store" target="_self">小程序商店</a>
      &lt;%&ndash;<a href="special" target="_self">专题</a>&ndash;%&gt;
      &lt;%&ndash;<a href="news" target="_self">文章</a>
      <a href="evaluate" target="_self">测评</a>&ndash;%&gt;
    </div>
    <div class="fr">
      <a class="fr login">登录</a>
      <div class="searchbox">
        <input type="text" name="keyword" id="search_input" placeholder="搜索微信小程序" value="">
        <a id="search_btn"><label></label></a>
      </div>
    </div>
  </div>
</div>--%>

<div class="n-top">

  <div class="n-top-center containers clear">
    <a class="logo" href="${g.domain}/app">
      <img class="logo" src="${g.domain}/resource/img/logo.png">
      <%--<img class="logo1" src="resource/img/logo2.png">--%>
    </a>
    <div class="n-nav clear">
      <a href="${g.domain}/app" target="_self">首页</a>
      <a href="${g.domain}/app/rank" target="_self">排行榜</a>
      <a href="${g.domain}/app/store" target="_self">小程序商店</a>
    </div>
    <a class="n-login" href="${g.domain}/app/apply"  target="_blank">发布</a>
    <div class="searchbox">
    <input type="text" name="keyword" id="search_input" placeholder="搜索微信小程序" value="${keyword}">
    <a id="search_btn"><label></label></a>
    </div>
  </div>
</div>
<c:if test="${not empty param.index}">
  <%--导航选中--%>
  <script type="text/javascript">
    $(".n-nav>a").eq(${param.index}).addClass("active").siblings().removeClass("active");
  </script>
</c:if>
<script type="text/javascript">
    //导航高亮
    $(function () {
        // 导航高亮
        var index = "1";
        $('.nav').find('a').eq(index).addClass('active');

        // 搜索
        $("#search_btn").click(function () {
            var keyword = $('#search_input').val();
            if (keyword) {
                window.location.href = '${g.domain}/search/keyword/'+ keyword;
            }
        });
        $('#search_input').bind('keyup', function (event) {
            if (event.keyCode == "13") {
                //回车执行查询
                $('#search_btn').click();
            }
        });

        //登录弹窗
        $(".login").click(function () {
            showLogin();
        })
    });
</script>
