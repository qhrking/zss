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
  <title>${keyword}_搜索结果-haoapp国内领先的微信小程序商店官网</title>
  <meta name="keywords" content="haoapp,好应用,好程序,小程序,微信小程序,小程序商店,微信小程序商店,小程序导航,小程序市场,小应用,微信公众号平台,开发,应用号,微信"/>
  <meta name="description" content="haoapp小程序商店（haoapp）拥有最新最全微信小程序应用和微信小程序资源、小程序资讯、小程序排行等，作为国内领先小程序商店，haoapp致力于为用户提供优质的微信小程序服务"/>
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/m/css/reset.min.css">
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/m/css/layout.css?1.0.48">
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/m/js/swiper/swiper.min.css">
  <script type="text/javascript" src="${g.domain}/resource/m/js/jquery.min.js"></script>
  <script type="text/javascript" src="${g.domain}/resource/m/js/adaptive-version.js"></script>
</head>
<body>
<div class="page">
  <div class="m-top b-bottom-e5" style="background: #f8f8f8;">
    <div class="i-search">
      <form id="search_form" action="${g.domain}/search/" method="get">
        <span class="fl"></span>
        <input class="input" type="text" name="keyword" id="keyword" value="${keyword}" placeholder="${keyword==null?'搜点啥啊...':keyword}" />
      </form>
      <a href="javascript:;" class="search-close"></a>
      <div class="search-lay" style="background:none;"></div>
    </div>
  </div>
  <%--<div class="search-sesult-tab b-bottom-e5">
    <div class="tab">
      <a href="javascript:;" class="active">小程序</a>
      <a href="search/eva/keyword/新">测评</a>
      <a href="search/art/keyword/新">资讯</a>
    </div>
  </div>--%>
  <div class="m-container top bottom" <%--style="top: 1.89rem;"--%>>
    <div class="m-sub">
      <div class="search-result">为你找到<span id="search_count">${page.totalCount}</span>个结果:</div>
      <div class="objects" id="thelist">
        <c:forEach items="${page.content}" var="appVO"  varStatus="status">
          <div class="list b-bottom-e5">
            <a href="javascript:;" class="btn fr copyBtn" title="${appVO.name}" onclick="showtip('小新任务','http://ojyhagqv7.bkt.clouddn.com/9cn_20170120bc9668ab98e9d964d39e2e81331ff705.png?imageView2/2/w/400','')" data-clipboard-text="小新任务">进入</a>
            <a href="${g.domain}/app/${appVO.id}" title="${appVO.name}" class="left">
                  <span class="obj-img fl">
                      <img src="${appVO.icon}" alt="${appVO.name}">
                  </span>
              <div class="mid">
                <div href="javascript:;" class="title elps">${appVO.name}</div>
                <div class="author"><span class="fl" style="margin-right: .5rem;">分类：<c:forEach items="${appVO.categorys}" var="category" begin="0" end="2"><label>${category.name}</label></c:forEach></span><span>热度：${appVO.viewCount+appVO.collectionCount*5}</span></div>
                <div class="author"><div class="star"><div class="star-inner" style="width: 94%;"></div></div></div>
              </div>
            </a>
          </div>
        </c:forEach>
      </div>
      <jsp:include page="../common/pagination.jsp" flush="false"/>
    </div>
  </div>

  <jsp:include page="../common/footer.jsp" flush="false">
    <jsp:param name="index" value="3"/>
  </jsp:include>
</div>
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