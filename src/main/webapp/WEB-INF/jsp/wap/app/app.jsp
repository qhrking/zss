<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="page" uri="/WEB-INF/tld/pagination.tld" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta id="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
  <link rel="shortcut icon" href="${g.domain}/resource/common/images/favicon.ico" type="image/x-icon">
  <link rel="apple-touch-icon-precomposed" href="__PUBLIC__/images/favicon2.ico">
  <title>微信小程序商店-微信小程序官方商店|微信小程序官方市场</title>
  <meta name="keywords" content="haoapp,好应用,好程序,小程序,微信小程序,小程序商店,微信小程序商店,小程序导航,小程序市场,小应用,微信公众号平台,开发,应用号,微信"/>
  <meta name="description" content="haoapp小程序商店（haoapp）拥有最新最全微信小程序应用和微信小程序资源、小程序资讯、小程序排行等，作为国内领先小程序商店，haoapp致力于为用户提供优质的微信小程序服务"/><meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/m/css/reset.min.css">
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/m/css/layout.css?1.0.48">
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/m/js/swiper/swiper.min.css">
  <script type="text/javascript" src="${g.domain}/resource/m/js/jquery.min.js"></script>
  <script type="text/javascript" src="${g.domain}/resource/m/js/adaptive-version.js"></script>
</head>
<body>

<div class="page">
  <div class="m-top b-bottom-e5" style="background: #fff;">
    <%--<a href="javascript:;" class="btn left slideMenuBtn"></a>--%>
    <h2 style="color:#505050;">
      <c:if test="${categotyPath eq 'store'}">全部</c:if>
      <c:forEach items="${categoryList}" var="cat">
          <c:if test="${cat.path eq categotyPath}">${cat.name}</c:if>
      </c:forEach>
    </h2>
  </div>
  <div class="navbar b-bottom-e5 b-top-e5 clear" style="position: absolute; top: .88rem; z-index: 12;">
    <div class="navbar-left fl">
      <a href="${g.domain}/app/store" data-value="shejiao" class="list <c:if test="${categotyPath eq 'store'}">active</c:if>">
        <span>全部</span>
      </a>
    </div>
    <div class="navbar-right navbar-list">
      <c:forEach items="${categoryList}" var="category">
        <a href="${g.domain}/app/${category.path}"  class="list <c:if test="${category.path eq categotyPath}">active</c:if>">
          <span>${category.name}</span>
        </a>
      </c:forEach>
    </div>
  </div>
  <div class="m-container bottom b-top-e5" style="top: 1.6rem;">
    <div class="m-sub">
      <div class="operation b-bottom-e5">
        <%--<div class="turn">
          <span class="c-status active" data-value="1">已上架<i></i></span>
          <span class="c-status" data-value="2">未上架<i></i></span>
        </div>--%>
        <div class="order">
          <a href="${g.domain}/app/${categotyPath}/order/1"><span class="c-order <c:if test="${orderType eq '1'}">active</c:if>">最新</span></a>
          <i></i>
          <a href="${g.domain}/app/${categotyPath}/order/2" ><span class="c-order <c:if test="${orderType eq '2'}">active</c:if>">热度</span></a>
          <i></i>
          <a href="${g.domain}/app/${categotyPath}/order/3" ><span class="c-order <c:if test="${orderType eq '3'}">active</c:if>">推荐</span></a>
        </div>
      </div>
      <input type="hidden" name="status" id="status" value="1">
      <input type="hidden" name="order" id="order" value="1">
      <input type="hidden" name="cate" id="cate" value="shejiao">
      <div class="objects" id="thelist">
        <c:forEach items="${page.content}" var="appVO">
          <div class="list b-bottom-e5">
            <a href="javascript:;" class="btn fr copyBtn" title="${appVO.name}" onclick="showtip('群成员','${appVO.icon}','')" data-clipboard-text="${appVO.name}">进入</a>
            <a href="${g.domain}/app/${appVO.id}" title="${appVO.name}" class="left">
                  <span class="obj-img fl">
                      <img src="${appVO.icon}" alt="${appVO.name}">
                  </span>
              <div class="mid">
                <div href="javascript:;" class="title elps">${appVO.name}</div>
                <div class="author">
                  <p class="fl" style="margin-right: .5rem;">分类：<c:forEach items="${appVO.categorys}" var="categorys" begin="0" end="2"><label>${categorys.name}</label></c:forEach></p>
                  <p>热度：${appVO.viewCount+appVO.collectionCount*5}</p>
                </div>
                <%--<div class="author"><div class="star"><div class="star-inner" style="width: 100%;"></div></div><label></label></div>--%>
              </div>
            </a>
          </div>
        </c:forEach>
      </div>
      <div class="nonebox" style="display:none;">
        <img src="${g.domain}/resource/m/img/none.png">
        <p>很抱歉，没有相应的小程序</p>
      </div>
      <jsp:include page="../common/pagination.jsp" flush="false"/>
    </div>
  </div>
  <jsp:include page="../common/footer.jsp" flush="false">
    <jsp:param name="index" value="1"/>
  </jsp:include>
  <%--<div class="slideMenuContent">
    <div class="m-top" style="background: #fff; border-bottom: 1px solid #e5e5e5;">
      <a href="javascript:;" class="btn left slideMenuBtn active"></a>
      <h2 style="font-size: .34rem; color: #303030;">分类筛选</h2>
    </div>
    <div class="typebox content bod clear">
      <a class="b-bottom-e5 b-right-e5" href="${g.domain}/app/" title="全部">
        <img src="${g.domain}/resource/m/img/all.png">
        <p>全部</p>
      </a>
      <a class="b-bottom-e5 b-right-e5" href="${g.domain}/app/shejiao/">
        <img src="http://ojyhagqv7.bkt.clouddn.com/9cn_20170123f0c728c6f58487e5f35a3532a82d2db6.png" alt="社交">
        <p>社交</p>
      </a><a class="b-bottom-e5 b-right-e5" href="${g.domain}/app/yinyue/">
      <img src="http://ojyhagqv7.bkt.clouddn.com/9cn_2017012378937fe72580e6c3226630c88b271dee.png" alt="音乐">
      <p>音乐</p>
    </a><a class="b-bottom-e5 b-right-e5" href="${g.domain}/app/chuxing/">
      <img src="http://ojyhagqv7.bkt.clouddn.com/9cn_201701234bd6cea2da25873b022c6bebaee84659.png" alt="出行">
      <p>出行</p>
    </a><a class="b-bottom-e5 b-right-e5" href="${g.domain}/app/lvyou/">
      <img src="http://ojyhagqv7.bkt.clouddn.com/9cn_20170123a2ad9690feb87e1f77cee1498956fabf.png" alt="旅游">
      <p>旅游</p>
    </a><a class="b-bottom-e5 b-right-e5" href="${g.domain}/app/tiyu/">
      <img src="http://ojyhagqv7.bkt.clouddn.com/9cn_20170123a6ad7b29d23a8e9ace91a976cc13e8ff.png" alt="体育">
      <p>体育</p>
    </a><a class="b-bottom-e5 b-right-e5" href="${g.domain}/app/shipin/">
      <img src="http://ojyhagqv7.bkt.clouddn.com/9cn_201701235a7ff168a6f0b548154705c9982c8d9c.png" alt="视频">
      <p>视频</p>
    </a><a class="b-bottom-e5 b-right-e5" href="${g.domain}/app/yuedu/">
      <img src="http://ojyhagqv7.bkt.clouddn.com/9cn_201701235d8011d130040dbe7a4aed881d38b14f.png" alt="阅读">
      <p>阅读</p>
    </a><a class="b-bottom-e5 b-right-e5" href="${g.domain}/app/gouwu/">
      <img src="http://ojyhagqv7.bkt.clouddn.com/9cn_2017012362cb5c798ca11fc089252bef99243eff.png" alt="购物">
      <p>购物</p>
    </a><a class="b-bottom-e5 b-right-e5" href="${g.domain}/app/jinrong/">
      <img src="http://ojyhagqv7.bkt.clouddn.com/9cn_20170123648ef23ccdbcce83416360f55c7bf107.png" alt="金融">
      <p>金融</p>
    </a><a class="b-bottom-e5 b-right-e5" href="${g.domain}/app/jiaoyu/">
      <img src="http://ojyhagqv7.bkt.clouddn.com/9cn_20170123711cdfc791a909e201c0396f7da50f80.png" alt="教育">
      <p>教育</p>
    </a><a class="b-bottom-e5 b-right-e5" href="${g.domain}/app/tuxiang/">
      <img src="http://ojyhagqv7.bkt.clouddn.com/9cn_20170123396438eaa8b87bf7caead85d32b9ec14.png" alt="图像">
      <p>图像</p>
    </a><a class="b-bottom-e5 b-right-e5" href="${g.domain}/app/gongju/">
      <img src="http://ojyhagqv7.bkt.clouddn.com/9cn_20170123138db7717258bcb678147b2aa3c3f330.png" alt="工具">
      <p>工具</p>
    </a><a class="b-bottom-e5 b-right-e5" href="${g.domain}/app/shenghuo/">
      <img src="http://ojyhagqv7.bkt.clouddn.com/9cn_20170123d317b5f591707797f780370e1123614d.png" alt="生活">
      <p>生活</p>
    </a><a class="b-bottom-e5 b-right-e5" href="${g.domain}/app/yundongjiankang/">
      <img src="http://ojyhagqv7.bkt.clouddn.com/9cn_201701239212fa5e0ab070d1209daf0b7c6f189f.png" alt="健康">
      <p>健康</p>
    </a><a class="b-bottom-e5 b-right-e5" href="${g.domain}/app/muying/">
      <img src="http://ojyhagqv7.bkt.clouddn.com/9cn_2017012309f7557bf6b17b8aafd2a212b119132c.png" alt="母婴">
      <p>母婴</p>
    </a><a class="b-bottom-e5 b-right-e5" href="${g.domain}/app/bangong/">
      <img src="http://ojyhagqv7.bkt.clouddn.com/9cn_201701236ca28671f5bd03641b879bc516eb97ff.png" alt="办公">
      <p>办公</p>
    </a>
    </div>
  </div>--%>

  <div class="copy-laye"></div>
  <div class="copy-laye-content copy-laye-show-1">
			<span class="ewm">
				<img src="" alt="">
			</span>
    <p class="name"></p>
    <p class="copy-tip">小程序名称复制成功</p>
    <p class="copy-tip">快到微信 - 搜索小程序体验吧</p>
    <div class="tip-img">
      <img src="${g.domain}/resource/m/img/copy-lay-img.jpg" alt="">
    </div>
    <a href="weixin://" class="toweixin">前往微信</a>
  </div>
  <div class="copy-laye-content copy-laye-show-2">
			<span class="ewm">
				<img src="" alt="">
			</span>
    <p class="name"></p>
    <p class="copy-tip">手动复制小程序名称</p>
    <p class="copy-tip">快到微信 - 搜索小程序体验吧</p>
    <div class="tip-img">
      <img src="${g.domain}/resource/m/img/copy-lay-img.jpg" alt="">
    </div>
    <a href="weixin://" class="toweixin">前往微信</a>
  </div>
</div>
<script type="text/javascript" src="${g.domain}/resource/m/js/touch-0.2.14.min.js"></script>
<script type="text/javascript" src="${g.domain}/resource/m/js/clipboard.min.js?1.0.14"></script>
<script type="text/javascript" src="${g.domain}/resource/m/js/common.min.js?1.0.24"></script>
<script type="text/javascript" src="${g.domain}/resource/m/js/swiper/swiper.min.js"></script>
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

  function showtip(title, icon, qrcode){
    $('.copy-laye-content .name').html(title);
    $('.copy-laye-content .ewm img').attr('src', icon);
  }
</script>

<script id="tpl_list" type="text/html">
  {{each data.rows as value i}}
  <div class="list b-bottom-e5">
    {{if value.status == 1}}
    <a href="javascript:;" class="btn fr copyBtn" title="{{value.title}}" onclick="showtip('{{value.title}}','{{value.icon}}','{{value.open_qrcode}}')" data-clipboard-text="{{value.title}}">进入</a>
    {{else}}
    <a href="javascript:;" class="btn fr" style="background:none;color:#757474">未上架</a>
    {{/if}}
    <a href="${g.domain}/app/{{value.id}}" title="{{value.title}}" class="left">
				<span class="obj-img fl">
					<img src="{{value.icon}}" alt="{{value.title}}">
				</span>
      <div class="mid">
        <div href="javascript:;" class="title elps">{{value.title}}</div>
        {{if value.status == 1}}
        <div class="author"><span class="fl" style="margin-right: .5rem;">分类：{{value.cat}}</span><span>热度：{{value.hits}}</span></div>
        <div class="author"><div class="star"><div class="star-inner" style="width: {{value.score*20}}%;"></div></div><label>{{value.score_num}}</label></div>
        {{else}}
        <div class="author">分类：{{value.cat}}</div>
        <div class="author">热度：{{value.hits}}</div>
        {{/if}}
      </div>
    </a>
  </div>
  {{/each}}
</script>

<script>
  var page = 1;
  var flag = true;
  //get_list();

  /*$(function(){
    $('.m-container').loadToBottom({
      targetHeight: '.m-sub',
      scale: 0.88,
      callback: function(){
        page++;
        get_list(1);
      }
    });
  });*/

  //加载数据
  function get_list(callback) {
    if(!flag) return false;
    var params = get_params();
    $.get("ajax/getAppList", params, function (msg) {
      if (msg.status == 0) {
        if(page <= 1){
          $('#thelist').html('');
          $('.nonebox').show();
          $('.objects').hide();
        }
        flag = false;
        return;
      }else{
        $('.nonebox').hide();
        $('.objects').show();
      }
      if (msg.data.total <= 20) {
        flag = false;
      }

      if (page > 1 && msg.data.rows == null) {
        flag = false;
      } else {
        var html = template('tpl_list', msg);
        if(callback) {
          $('#thelist').append(html);
        } else {
          $('#thelist').html(html);
        }
      }
    }, 'json');
  }

  function get_params() {
    var status = $('#status').val();
    var order = $('#order').val();
    var cate = $('#cate').val();
    var params = {
      page: page,
      cate: cate,
      status: status,
      order: order
    }
    return params;
  }

  // 筛选
  $('.c-status').click(function () {
    flag = true;
    page = 1;
    $('.turn span').removeClass('active');
    $(this).addClass('active');

    $('#status').val($(this).attr('data-value'));

    if($('#status').val() != 1){
      $('.order').hide();
    } else {
      $('.order').show();
    }
    //get_list();
  });

  // 排序
  $('.c-order').click(function () {
    flag = true;
    page = 1;
    $('.order span').removeClass('active');
    $(this).addClass('active');

    $('#order').val($(this).attr('data-value'));
    //get_list();
  });

  $('.navbar-right a,.navbar-left a').click(function () {
    flag = true;
    page = 1;
    $(".scrollArea").scrollTop(0);
    $('#cate').val($(this).attr('data-value'));
    //get_list();
  });

  $('.slideMenuBtn').click(function(){
    $('html').addClass('noScroll');
    $('.slideMenuContent').show();
  });
  $('.slideMenuBtn.active').click(function(){
    $('html').removeClass('noScroll');
    $('.slideMenuContent').fadeOut();
  });
</script>
<script type="text/javascript" src="${g.domain}/resource/js/template.js"></script>
<jsp:include page="../common/cnzz.jsp" />
</body>
</html>
