<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="page" uri="/WEB-INF/tld/pagination.tld" %>
<!DOCTYPE HTML>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="renderer" content="webkit">
  <title>最新最热微信小程序排行榜-haoapp国内领先微信小程序商店官网</title>
  <meta name="keywords" content="微信小程序,小程序商店,小程序市场,小程序排行榜,小程序热榜,小程序榜单" />
  <meta name="description" content="微信小程序商店官网（haoapp）为您提供全网最新、最全、最权威的微信小程序排行榜，体验优质小程序尽在haoapp" />
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />

<%--  <link rel="stylesheet" type="text/css" href="static/pc/css/reseting.css" />
  <link rel="stylesheet" type="text/css" href="static/pc/css/common.css" />
  <link rel="stylesheet" type="text/css" href="static/pc/css/lite.css" />
  <link rel="stylesheet" type="text/css" href="static/common/js/layer/skin/layer.css">--%>

  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/css/reseting.css">
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/css/app-common.css">
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/css/lite.css">
  <script type="text/javascript" src="${g.domain}/resource/js/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="${g.domain}/resource/js/app-common.js" charset="utf-8"></script>
  <script type="text/javascript" src="${g.domain}/resource/js/template.js" charset="utf-8"></script>

  <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
  <!--[if lt IE 9]>
  <script type="text/javascript" src="/resource/common/html5shiv.js"></script>
  <![endif]-->

  <!--[if lt IE 9]>
  <script type="text/javascript" src="/resource/common/jquery-1.10.2.min.js"></script>
  <![endif]-->
  <!--[if gte IE 9]><!-->
  <script type="text/javascript" src="${g.domain}/resource/common/jquery-2.2.3.min.js"></script>
  <!--<![endif]-->
  <!-- 页面header钩子，一般用于加载插件CSS文件和代码 -->

</head>
<body>
<!-- 头部 -->
<script type="text/javascript">
  $(function(){
    $('.release-zb').remove();
  });

  $(function () {
    $('.add-fixed').click(function () {
      window.open('${g.domain}/app/apply', '_blank');
    });
  });
</script>
<!-- /头部 -->

<!-- 主体 -->
<div class="body-container">
  <%--选中导航第2个菜单--%>
  <jsp:include page="common/header.jsp">
    <jsp:param name="index" value="1"/>
  </jsp:include>
  <!--登录弹窗的dom-->
  <div class="loginbox">
    <a href="">
      <img class="logo" src="${g.domain}/resource/images/logo.png" />
      <%--<img class="logo1" src="${g.domain}/static/pc/images/logo2.png" />--%>
    </a>
    <div class="hr">
      <p>登录/注册</p>
    </div>
    <div class="login-way">
      <a href="Xcx/Addons/execute/_addons/SyncLogin/_controller/Base/_action/login/type/qq">
        <span class="qq"></span>
        <p>QQ</p>
      </a>
      <a href="Xcx/Addons/execute/_addons/SyncLogin/_controller/Base/_action/login/type/sina">
        <span class="wb"></span>
        <p>微博</p>
      </a>
    </div>
  </div>

  <div class="banner2">
    <p class="hotCount">5626118</p>
    <img src="${g.domain}/resource/img/banner2.jpg">
  </div>

  <div class="title_common containers">
    <a href="${g.domain}/app">首页</a>
    <label></label>
    <span>排行榜</span>
  </div>

  <div class="rankList containers ">
    <div class="menu text-center">
      <a href="${g.domain}/app/charts/code/hot" class="active">热门排行</a>
    </div>
    <div id="wrapper3" class="rankHot clear">
      <c:forEach items="${page.content}" var="appVO" begin="0" end="2" varStatus="status">
      <a href="${g.domain}/app/${appVO.id}" class="clear" target="_blank">
        <label class="rankIcon "></label>
        <div class="qrcode">
          <img src="${appVO.qrcode}" />
          <p>微信体验扫描</p>
        </div>
        <div class="order">${status.index+1 }</div>
        <div class="img-rank">
          <img onload="setImgWH(this)" src="${appVO.icon}" />
        </div>
        <div class="data-rank">
          <h2 class="ellipsis">${appVO.name}</h2>
          <p>分类：<c:forEach items="${appVO.categorys}" var="categorys" begin="0" end="2"><label>${categorys.name}</label></c:forEach></p>
          <div class="bottom-rank">
            <p class="fl">热度：${appVO.viewCount+appVO.collectionCount*5}</p>
            <span class="try fr">体验</span>
          </div>
        </div>
      </a>
      </c:forEach>
    </div>
    <table id="wrapper4" class="rankTable">
      <thead>
      <tr>
        <th>排名</th>
        <th><label></label>ICON</th>
        <th><label></label>小程序名</th>
        <th><label></label>分类</th>
        <th><label></label>热度</th>
        <th><label></label>二维码</th>
      </tr>
      </thead>
      <tbody id="thelist">
      <c:forEach items="${page.content}" var="appVO" begin="3" end="10" varStatus="status">
        <tr>
          <td>${ status.index+1 }</td>
          <td><a href="${g.domain}/app/${appVO.id}" class="img-table"><img onload="setImgWH(this)" src="${appVO.icon}" target="_blank"></a></td>
          <td><a href="${g.domain}/app/${appVO.id}" class="name-table ellipsis" target="_blank">${appVO.name}</a></td>
          <td><c:forEach items="${appVO.categorys}" var="categorys" begin="0" end="2"><label>${categorys.name}</label></c:forEach></td>
          <td>${appVO.viewCount+appVO.collectionCount*5}</td>
          <td>
            <div class="code-table">
              <span></span>
              <div class="qrcode">
                <img src="${appVO.qrcode}">
                <p>微信体验扫描</p>
              </div>
            </div>
          </td>
        </tr>
      </c:forEach>
       </tbody>
    </table>
    <div class="more">
      <a>更多</a>
    </div>
  </div>

  <script type="text/javascript" src="${g.domain}/resource/js/template.js"></script>


  <script id="tpl_list" type="text/html">
    {{each data.content as appVO index}}
    <tr>
      <td>{{(data.pageIndex-1)*data.pageSize+index+1}}</td>
      <td><a href="${g.domain}/app/{{appVO.id}}" class="img-table"><img onload="setImgWH(this)" src="{{appVO.icon}}" target="_blank"></a></td>
      <td><a href="${g.domain}/app/{{appVO.id}}" class="name-table ellipsis" target="_blank">{{appVO.name}}</a></td>
      <td>{{each appVO.categorys as category i}}<label>{{category.name}}</label> {{/each}}</td>
      <td>{{appVO.viewCount+appVO.collectionCount*5}}</td>
      <td>
        <div class="code-table">
          <span></span>
          <div class="qrcode">
            <img src="{{appVO.qrcode}}" />
            <p>微信体验扫描</p>
          </div>
        </div>
      </td>
    </tr>
    {{/each}}
  </script>


  <script type="text/javascript">
    var page = 1;

    $(function () {
      // 点击加载
      $('.more').click(function () {
        //模拟加载数据方法
        $('.dragLoadMore').show();
        page++;
        get_list(function () {
          $('.dragLoadMore').hide();
        });
      });
    });

    //加载数据
    function get_list(callback) {
      if (!callback) {
        page = 1;
      }
      var rid = '2';
      $.get("${g.domain}//app/getRankList", {page: page}, function (result) {
        $('.more').hide();
        if (result.status != 1) {
          return;
        }
        var html = template('tpl_list', result);
        if (callback) {
          $('#thelist').append(html);

          callback(result.msg);
        } else {
          $('#thelist').html(html);
        }
        if (result.data.totalPage == page||result.data.pageIndex==10) {
          $('.more').hide();
        } else {
          $('.more').show();
        }
      }, 'json');
    }
  </script>


  <jsp:include page="common/footer.jsp" flush="false" />

</div>




<!-- /主体 -->

<!-- 底部 -->
<script type="text/javascript">
  (function(){
    var ThinkPHP = window.Think = {
      "ROOT"   : "", //当前网站地址
      "APP"    : "", //当前项目地址
      "PUBLIC" : "Public", //项目公共目录地址
      "DEEP"   : "", //PATHINFO分割符
      "MODEL"  : ["2", "", ""],
      "VAR"    : ["m", "c", "a"]
    }
  })();
</script>

<script type="text/javascript">
  $(function () {
    var $index = 0;
    $("#wrapper3").on('mouseenter', '.try', function () {
      $index = $(this).parents("a").index();
      $(".rankHot a").eq($index).find(".qrcode").stop(true, true).fadeIn();
    });
    $("#wrapper3").on('mouseleave', '.try', function () {
      $index = $(this).parents("a").index();
      $(".rankHot a").eq($index).find(".qrcode").stop(true, true).hide();
    });
    var n = 0;
    $("#wrapper4").on('mouseenter', '.code-table span', function () {
      n = $(this).parents("tr").index();
      $(".rankTable tr").eq(n + 1).find(".qrcode").stop(true, true).fadeIn();
    });
    $("#wrapper4").on('mouseleave', '.code-table span', function () {
      n = $(this).parents("tr").index();
      $(".rankTable tr").eq(n + 1).find(".qrcode").stop(true, true).hide();
    });
  });
</script>
<!-- 用于加载js代码 -->
<!-- /底部 -->
</body>
</html>
