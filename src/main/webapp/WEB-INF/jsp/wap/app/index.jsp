<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="page" uri="/WEB-INF/tld/pagination.tld" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta id="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
  <link rel="apple-touch-icon-precomposed" href="__PUBLIC__/images/favicon2.ico">
  <title>微信小程序商店-haoapp国内领先的微信小程序商店官网</title>
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
  <div class="m-top white b-bottom-e5">
    <h2><a href="" class="logo"></a></h2>
    <%--<a href="ucenter/login/" class="btn left">
      <div class="user">
			<span>
			<i>
              <img src="${g.domain}/resource/m/images/user-icon.png">
            </i>
			</span>
      </div>
    </a>--%>
  </div>
  <div class="m-container bottom top">
    <div class="m-sub">
      <div class="swiper-container banner">
        <div class="swiper-wrapper">
          <%--<div class="swiper-slide">
            <a href="activity/zm"><img src="http://ojyhagqv7.bkt.clouddn.com/9cn_20170302951a88925bb9acecafb93716edbc5491.png" alt="招募"></a>
          </div>
          <div class="swiper-slide">
            <a href="special/30"><img src="http://ojyhagqv7.bkt.clouddn.com/9cn_20170302db3f524dc8ca2f6890567ed2558555f4.jpg" alt="奥斯卡"></a>
          </div>
          <div class="swiper-slide">
            <a href="news/242"><img src="http://ojyhagqv7.bkt.clouddn.com/9cn_20170214e7ef1a01539ca54f606e5eb4ce5d864e.png" alt="超人"></a>
          </div>--%>
          <div class="swiper-slide">
            <a href="/app/apply"><img src="/upload/banner/20170302cc61180208640668ea141ebb2b0b2046.jpg" alt="发布小程序"></a>
          </div>
        </div>
        <div class="pagination">
        </div>
      </div>
      <%--<div class="tag-title-open">
        <span>专题推荐</span><a href="special/" class="all">显示全部</a>
      </div>
      <div class="scroll-module special-recommend clear">
        <span></span>
        <a href="http://9.cn/special/31" class=""><img src="http://ojyhagqv7.bkt.clouddn.com/2017-03-07_58be37be0c96e.png?imageView2/2/w/400" align="recommend" alt="女王节"></a><a href="http://9.cn/special/32" class=""><img src="http://ojyhagqv7.bkt.clouddn.com/2017-03-07_58be75a4553c2.png?imageView2/2/w/400" align="recommend" alt="相册"></a><a href="http://9.cn/special/29" class=""><img src="http://ojyhagqv7.bkt.clouddn.com/9cn_20170227d0474ad6d5a82c97040943a82e68077a.jpg?imageView2/2/w/400" align="recommend" alt="新闻阅读"></a><a href="http://9.cn/special/25" class=""><img src="http://ojyhagqv7.bkt.clouddn.com/9cn_20170206892e09ca0a64964a0dcccb235941490f.jpg?imageView2/2/w/400" align="recommend" alt="文艺新青年"></a><a href="http://9.cn/special/17" class=""><img src="http://ojyhagqv7.bkt.clouddn.com/9cn_2017020674e5bc9cfa7ec2f021fdebc495b1d717.jpg?imageView2/2/w/400" align="recommend" alt="生命在于运动"></a><a href="http://9.cn/special/23" class=""><img src="http://ojyhagqv7.bkt.clouddn.com/9cn_2017021499d65598e53b0aad05ee1db27f433cce.jpg?imageView2/2/w/400" align="recommend" alt="舌尖上的美味"></a><span></span>
      </div>
      <div class="line-one b-bottom-e5">
      </div>--%>
      <div class="tag-title-open">
        <span>精选小程序</span><a href="${g.domain}/app/store" class="all">显示全部</a>
      </div>
      <div class="scroll-module classify-module">
        <span></span>
        <c:forEach items="${listRecommend.content}" var="recommendAppVO">
          <a href="${g.domain}/app/${recommendAppVO.id}">
            <span class="icon"><img src="${recommendAppVO.icon}" alt="${recommendAppVO.name}"></span>
            <p class="name">
              ${recommendAppVO.name}
            </p>
            <p class="tag">
            </p>
          </a>
        </c:forEach>
        <span></span>
      </div>
      <div class="line-one b-bottom-e5">
      </div>
      <div class="tag-title-open">
        <span>热门小程序</span><a href="${g.domain}/app/store" class="all" title="热门小程序">显示全部</a>
      </div>
      <div class="scroll-module classify-module">
        <span></span>
        <c:forEach items="${listHot.content}" var="hotAppVO">
          <a href="${g.domain}/app/${hotAppVO.id}">
            <span class="icon"><img src="${hotAppVO.icon}" alt="${hotAppVO.name}"></span>
            <p class="name">
              ${hotAppVO.name}
            </p>
            <p class="tag">
            </p>
          </a>
        </c:forEach>
        <span></span>
      </div>
      <%--<div class="line-one b-bottom-e5">
      </div>
      <div class="scroll-module special-recommend clear">
        <span></span>
        <a href="http://9.cn/special/22" class=""><img src="http://ojyhagqv7.bkt.clouddn.com/9cn_201702051767d0ac883fe24d2717692f41cffc37.jpg?imageView2/2/w/400" align="recommend" alt="再美也要多运动"></a><a href="http://9.cn/app/120" class=""><img src="http://ojyhagqv7.bkt.clouddn.com/9cn_20170120e4e952a135b45072d074434a1b729303.jpg?imageView2/2/w/400" align="recommend" alt="宝妈俱乐部，新手妈妈速成"></a><a href="http://9.cn/special/19" class=""><img src="http://ojyhagqv7.bkt.clouddn.com/9cn_2017012035a545a4d046843c8da6a3b2e4f336b9.jpg?imageView2/2/w/400" align="recommend" alt="科技是第一生产力"></a><a href="http://9.cn/special/15" class=""><img src="http://ojyhagqv7.bkt.clouddn.com/9cn_2017012005670573515b3c9a5518e563902d414d.jpg?imageView2/2/w/400" align="recommend" alt="人丑多读书"></a><a href="http://9.cn/special/14" class=""><img src="http://ojyhagqv7.bkt.clouddn.com/9cn_201702051061f3157ff2bfcbc6c0a9b516b5354e.jpg?imageView2/2/w/400" align="recommend" alt="享乐主义"></a><span></span>
      </div>--%>
      <div class="line-one b-bottom-e5">
      </div>
      <div class="tag-title-open">
        <span>最新小程序</span><a href="${g.domain}/app/store" class="all" title="最新小程序">显示全部</a>
      </div>
      <div class="scroll-module classify-module">
        <span></span>
        <c:forEach items="${listNew.content}" var="newAppVO">
          <a href="${g.domain}/app/${newAppVO.id}">
            <span class="icon"><img src="${newAppVO.icon}" alt="${newAppVO.name}"></span>
            <p class="name">
              ${newAppVO.name}
            </p>
            <p class="tag">
            </p>
          </a>
        </c:forEach>
        <span></span>
      </div>
      <div class="line-one b-bottom-e5">
      </div>
      <div class="foot index">
        <p>
          Copyright © 2017 haoapp.mobi  京ICP备15045788号-2
        </p>
        <%--<p>
          商务合作联系QQ：3554537959
        </p>--%>
      </div>
    </div>
  </div>
  <jsp:include page="../common/footer.jsp" flush="false">
    <jsp:param name="index" value="0"/>
  </jsp:include>
</div>
  <script type="text/javascript" src="${g.domain}/resource/m/js/touch-0.2.14.min.js"></script>
  <script type="text/javascript" src="${g.domain}/resource/m/js/clipboard.min.js?1.0.14"></script>
  <script type="text/javascript" src="${g.domain}/resource/m/js/common.min.js?1.0.24"></script>
  <script type="text/javascript" src="${g.domain}/resource/m/js/swiper/swiper.min.js"></script>
  <script>
    $(function(){
      var mySwiper = new Swiper('.swiper-container', {
        autoplay: 3000,
        calculateHeight: true,
        noSwiping : true,
        slidesPerView: 'auto',
        loop: true,
        pagination : '.pagination'
      });
    });
  </script>
</body>
<jsp:include page="../common/cnzz.jsp" />
</html>
