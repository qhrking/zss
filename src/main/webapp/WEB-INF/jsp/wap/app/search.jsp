<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="page" uri="/WEB-INF/tld/pagination.tld" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta id="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
  <link rel="apple-touch-icon-precomposed" href="__PUBLIC__/images/favicon2.ico" />
  <title>微信小程序搜索-haoapp国内领先的微信小程序商店官网</title>
  <meta name="keywords" content="haoapp,好应用,好程序,小程序,微信小程序,小程序商店,微信小程序商店,小程序导航,小程序市场,小应用,微信公众号平台,开发,应用号,微信"/>
  <meta name="description" content="haoapp小程序商店（haoapp）拥有最新最全微信小程序应用和微信小程序资源、小程序资讯、小程序排行等，作为国内领先小程序商店，haoapp致力于为用户提供优质的微信小程序服务"/>
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/m/css/reset.min.css">
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/m/css/layout.css">
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/m/js/swiper/swiper.min.css">
  <script type="text/javascript" src="${g.domain}/resource/m/js/jquery.min.js"></script>
  <script type="text/javascript" src="${g.domain}/resource/m/js/adaptive-version.js"></script>
  <script type="text/javascript" src="${g.domain}/resource/js/app-common.js" charset="utf-8"></script>
</head>
<body>
<div class="page">
  <div class="m-top b-bottom-e5" style="background: #f8f8f8;">
    <div class="i-search">
      <form id="search_form" action="${g.domain}/search/" method="get">
        <span class="fl"></span>
        <input class="input" type="text" name="keyword" id="keyword" value="${keyword}" placeholder="搜点啥啊..." />
      </form>
      <a href="javascript:;" class="search-close"></a>
      <div class="search-lay"></div>
    </div>
  </div>
  <div class="hot-search">
    <div class="inner">
      <h2>热门搜索</h2>
      <p><a href="/search/app/keyword/腾讯">腾讯</a></p>
      <p><a href="/search/app/keyword/斗图">斗图</a></p>
      <p><a href="/search/app/keyword/单车">单车</a></p>
      <p><a href="/search/app/keyword/小程序">小程序</a></p>
      <p><a href="/search/app/keyword/宝宝">宝宝</a></p>
      <p><a href="/search/app/keyword/视频">视频</a></p>
      <p><a href="/search/app/keyword/壁纸">壁纸</a></p>
      <p><a href="/search/app/keyword/阅读">阅读</a></p>
    </div>
  </div>
  <jsp:include page="../common/footer.jsp" flush="false">
    <jsp:param name="index" value="3"/>
  </jsp:include>
</div>
<script type="text/javascript" src="${g.domain}/resource/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${g.domain}/resource/m/js/touch-0.2.14.min.js"></script>
<script type="text/javascript" src="${g.domain}/resource/m/js/clipboard.min.js?1.0.14"></script>
<script type="text/javascript" src="${g.domain}/resource/m/js/common.min.js?1.0.24"></script>
<script type="text/javascript" src="${g.domain}/resource/m/js/swiper/swiper.min.js"></script>
<script>
  $(function(){
    $('.i-search .search-lay').click(function(){
      $(this).hide();
      $('.i-search input').focus();
    });
    $('.i-search input').blur(function(){
      if( $(this).val() == '' ){
        $('.i-search .search-lay').show();
      }
    });
    $('.i-search .search-close').click(function(){
      $('.i-search input').val('').focus();
      $('.i-search input').attr('placeholder','搜点啥啊...')
      $('.hot-search').show();
    });
  });
</script>
</body>
<jsp:include page="../common/cnzz.jsp" />
</html>