<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="renderer" content="webkit">
  <title>${keyword}_搜索结果-haoapp国内领先的微信小程序商店官网</title>
  <meta name="keywords" content="haoapp,好应用,好程序,小程序,微信小程序,小程序商店,微信小程序商店,小程序导航,小程序市场,小应用,微信公众号平台,开发,应用号,微信"/>
  <meta name="description" content="haoapp小程序商店（haoapp）拥有最新最全微信小程序应用和微信小程序资源、小程序资讯、小程序排行等，作为国内领先小程序商店，haoapp致力于为用户提供优质的微信小程序服务"/>
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/css/reseting.css" />
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/css/app-common.css" />
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/css/lite.css" />
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/common/layer/skin/layer.css">
  <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
  <!--[if lt IE 9]>
  <script type="text/javascript" src="/resource/common/html5shiv.js"></script>
  <![endif]-->

  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/css/list.css" />
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/css/page.css" />

  <!--[if lt IE 9]>
  <script type="text/javascript" src="/resource/common/jquery-1.10.2.min.js"></script>
  <![endif]-->
  <!--[if gte IE 9]><!-->
  <%--<script type="text/javascript" src="static/common/js/jquery-2.2.3.min.js"></script>--%>
  <script type="text/javascript" src="${g.domain}/resource/js/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="${g.domain}/resource/common/layer/layer.js"></script>

  <script type="text/javascript" src="${g.domain}/resource/js/app-common.js" charset="utf-8"></script>

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

  <%--选中导航第3个菜单--%>
  <jsp:include page="common/header.jsp">
    <jsp:param name="index" value="2"/>
  </jsp:include>
  <!--登录弹窗的dom-->
  <div class="loginbox">
    <a href="">
      <img class="logo" src="${g.domain}/resource/images/logo.png" />
      <%--<img class="logo1" src="${g.domain}/resource/images/logo2.png" />--%>
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


  <div class="title_common search-title">
    <a href="${g.domain}/app">首页</a>
    <label></label>
    <a href="${g.domain}/app/store">小程序商店</a>
    <label></label>
    <span><i>“${keyword}”</i>搜索结果：</span><span id="search_count">${page.totalCount}</span><span>个</span>
  </div>
  <%--<div class="search-switch clear">
    <a class="active" href="search/app/keyword/人">小程序</a>
    <a href="search/eva/keyword/人">测评</a>
    <a href="search/art/keyword/人">资讯</a>
  </div>--%>

  <div class="search-container">
    <div class="lite">
      <div id="thelist" class="show-content clear">
        <c:forEach items="${page.content}" var="appVO"  varStatus="status">
          <a class="list" href="${g.domain}/app/${appVO.id}" title="${appVO.name}" target="_blank">
            <div class="imgLeft">
                    <span>
                        <img onload="setImgWH(this)" src="${appVO.icon}" alt="${appVO.name}小程序" style="width: 100%;">
                    </span>
            </div>
            <div class="dataRight">
              <div class="title clear">
                <h3 class="ellipsis">${appVO.name}</h3>
                <span class="app-try">体验</span>
              </div>
              <div class="score-show2">
                        <span>
                            <i style="width: 0%;"></i>
                        </span>
                <p>0</p>
              </div>
              <p class="introduce">${appVO.description}</p>
            </div>
            <div class="list-bottom">
              <c:forEach items="${appVO.categorys}" var="category" begin="0" end="2"><label>${category.name}</label></c:forEach>
              <p class="view-count"><label></label>500</p>
            </div>
            <div class="qrcode" style="display: none;">
              <img src="${appVO.qrcode}" alt="${appVO.name}小程序二维码">
              <p>微信体验扫描</p>
            </div>
          </a>
        </c:forEach>
      </div>
      <%--<div class="lookmore" style="display: none;">
        <a href="javascript:;">查看更多</a>
      </div>--%>
      <c:if test="${page.totalCount==0}" >
        <div class="nonebox text-center">
          <img src="${g.domain}/resource/img/logo.png">
          <p>很抱歉，没有相应的小程序</p>
        </div>
      </c:if>
    </div>
    <c:if test="${page.totalCount>0}" >
        <jsp:include page="common/pagination.jsp" flush="false"/>
    </c:if>
  </div>

  <script type="text/javascript" src="${g.domain}/resource/js/template.js"></script>
  <script type="text/javascript">
    var page = 1;

    //get_list();

    $(function () {
      // 点击加载
      $('.lookmore').click(function () {
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
      var keyword = $('#search_input').val();
      $.get("xcx/search/getapplist", {page: page,keyword: keyword}, function (msg) {
        $('.lookmore').hide();
        $('.nonebox').hide();
        if (msg.status != 1) {
          $('#thelist').html('');
          $('.nonebox').show();
          return;
        }

        $('#search_count').html(msg.data.total);
        var html = template('tpl_list', msg);
        if (callback) {
          $('#thelist').append(html);
          callback(msg);
        } else {
          $('#thelist').html(html);
        }
        if (msg.info == 'nomore') {
          $('.lookmore').hide();
        } else {
          $('.lookmore').show();
        }
      }, 'json');
    }

  </script>


  <jsp:include page="common/footer.jsp" flush="false" />
</div>

<!-- /主体 -->

<!-- 底部 -->


<script type="text/javascript">
  $(function () {
    var $index = 0;
    $("#thelist").on('mouseenter', '.list .app-try', function () {
      $index = $(this).parents(".list").index();
      $(".qrcode").hide().eq($index).fadeIn();
    });
    $("#thelist").on('mouseleave', '.list .app-try', function () {
      $index = $(this).parents(".list").index();
      $(".qrcode").hide();
    });
  });
</script>
<!-- /底部 -->
</body>
</html>

