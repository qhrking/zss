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
  <title>最新最热微信小程序排行榜-haoapp国内领先微信小程序商店官网</title>
  <meta name="keywords" content="微信小程序,小程序商店,小程序市场,小程序排行榜,小程序热榜,小程序榜单" />
  <meta name="description" content="微信小程序商店官网（haoapp）为您提供全网最新、最全、最权威的微信小程序排行榜，体验优质小程序尽在haoapp" />
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/m/css/reset.min.css">
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/m/css/layout.css">
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/m/js/swiper/swiper.min.css">
  <script type="text/javascript" src="${g.domain}/resource/m/js/jquery.min.js"></script>
  <script type="text/javascript" src="${g.domain}/resource/m/js/adaptive-version.js"></script>
</head>
<body>
<div class="page">
  <div class="white m-top b-bottom-e5">
    <h2 class="black">排行榜</h2>
  </div>
  <div class="m-container top bottom b-top-e5">
    <div class="m-sub">
      <!-- hasMenu noMenu -->
      <div class="white" style=" height: auto;">
        <div class="ranking-nav b-bottom-e5">
        </div>
        <table class="ranking-table">
          <thead>
          <tr>
            <th class="b-bottom-e5" width="18%">排名</th>
            <th class="b-bottom-e5">图标</th>
            <th class="b-bottom-e5" width="35%">名称</th>
            <th class="b-bottom-e5" width="20%">体验</th>
          </tr>
          </thead>
        </table>
      </div>
      <table class="ranking-table" id="thelist">
        <c:forEach items="${page.content}" var="appVO"  varStatus="status">
        <tr>
          <td>
            <span class="order <c:if test="${status.index+1<=3}">color</c:if>">${status.index+1 }<c:if test="${status.index+1==1}"><i></i></c:if></span>
          </td>
          <td>
            <span class="icon"><a href="${g.domain}/app/${appVO.id}"><img src="${appVO.icon}" alt="${appVO.name}"></a></span>
          </td>
          <td width="35%">
            <a href="${g.domain}/app/${appVO.id}" class="name">${appVO.name}</a>
          </td>
          <td width="20%"><a href="javascript:;" class="btn copyBtn" onclick="showtip('${appVO.name}','${appVO.icon}','')" data-clipboard-text="${appVO.name}">进入</a></td>
        </tr>
        </c:forEach>
      </table>
    </div>
  </div>
  <jsp:include page="../common/footer.jsp" flush="false">
    <jsp:param name="index" value="2"/>
  </jsp:include>
  <div class="copy-laye"></div>
  <div class="copy-laye-content copy-laye-show-1">
    <span class="ewm"> <img src="" alt="" /> </span>
    <p class="name"></p>
    <p class="copy-tip">小程序名称复制成功</p>
    <p class="copy-tip">快到微信 - 搜索小程序体验吧</p>
    <div class="tip-img">
      <img src="${g.domain}/resource/m/img/copy-lay-img.jpg" alt="" />
    </div>
    <a href="weixin://" class="toweixin">前往微信</a>
  </div>
  <div class="copy-laye-content copy-laye-show-2">
    <span class="ewm"> <img src="" alt="" /> </span>
    <p class="name"></p>
    <p class="copy-tip">手动复制小程序名称</p>
    <p class="copy-tip">快到微信 - 搜索小程序体验吧</p>
    <div class="tip-img">
      <img src="${g.domain}/resource/m/img/copy-lay-img.jpg"  />
    </div>
    <a href="weixin://" class="toweixin">前往微信</a>
  </div>
</div>
<script type="text/javascript" src="${g.domain}/resource/m/js/touch-0.2.14.min.js"></script>
<script type="text/javascript" src="${g.domain}/resource/m/js/clipboard.min.js?1.0.14"></script>
<script type="text/javascript" src="${g.domain}/resource/m/js/common.min.js?1.0.24"></script>
<script type="text/javascript" src="${g.domain}/resource/m/js/swiper/swiper.min.js"></script>
<script type="text/javascript" src="${g.domain}/resource/js/template.js"></script>
<script type="text/javascript">
  $(function(){
    if(window.navigator.userAgent.match(/MicroMessenger/i) ? true : false){
      $('.toweixin').hide();
    }
  });

  new Clipboard('.copyBtn').on('success', function(e) {
    var e = e || window.event;
    setTop('.copy-laye-show-1');
    e.clearSelection();
  }).on('error', function(e) {
    var e = e || window.event;
    setTop('.copy-laye-show-2');
    e.clearSelection();
  });
  $('.copy-laye').on('click', function(e){
    $('.copy-laye').hide();
    $('.copy-laye-content').hide();
    $('body').removeAttr('ontouchmove');

    e.preventDefault();
  });

  $('.copy-laye').click(function(e){
    if( $(e.target).hasClass('copy-laye') ){
      $('.copy-laye').hide();
      $('body').removeAttr('ontouchmove');
    }
    e.stopPropagation();
  });

  function showtip(title, icon){
    $('.copy-laye-content .name').html(title);
    $('.copy-laye-content .ewm img').attr('src', icon);
  }
</script>
<script id="tpl_list" type="text/html">
  {{each data.content as appVO index}}
  <tr>
    <td>
      <span class="order {{if (data.pageIndex-1)*data.pageSize+index+1 <= 3}}color{{/if}}">{{(data.pageIndex-1)*data.pageSize+index+1}}{{if (data.pageIndex-1)*data.pageSize+index+1 == 1}}<i></i>{{/if}}</span>
    </td>
    <td>
      <span class="icon"><a href="${g.domain}/app/{{appVO.id}}"><img src="{{appVO.icon}}" alt="{{appVO.name}}"></a></span>
    </td>
    <td width="35%">
      <a href="${g.domain}/app/{{appVO.id}}" class="name">{{appVO.name}}</a>
    </td>
    <td width="20%"><a href="javascript:;" class="btn copyBtn" onclick="showtip('{{appVO.name}}','{{appVO.icon}}')" data-clipboard-text="{{appVO.name}}">进入</a></td>
  </tr>
  {{/each}}
</script>
<script>
  var page = 1;
  var rid = '2';
  var flag = true;

  get_list();
  $(function(){
    $('.m-container').loadToBottom({
      targetHeight: '.m-sub',
      scale: 0.88,
      callback: function(){
        page++;
        get_list(1);
      }
    });
  });

  //加载数据
  function get_list(callback) {
    if(!flag) return false;
    var params = get_params();
    $.get("${g.domain}/app/getRankList", {page: page},function (result) {
      if (result.status != 1) {
        if(page <= 1){
          $('#thelist').html('');
        }
        flag = false;
        return;
      }
      if (result.data.totalPage <= 20) {
        flag = false;
      }
      if (page > 1 && result.data.content == null) {
        flag = false;
      } else {
        var html = template('tpl_list', result);
        if(callback) {
          $('#thelist').append(html);
        } else {
          $('#thelist').html(html);
        }
      }
    }, 'json');
  }

  function get_params() {
    // 默认参数
    var params = {
      page: page,
      rid: rid
    }
    return params;
  }
</script>
</body>
<jsp:include page="../common/cnzz.jsp" />
</html>