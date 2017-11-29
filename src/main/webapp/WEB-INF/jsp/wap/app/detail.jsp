<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
  <meta charset="UTF-8">
  <meta id="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
  <meta name="applicable-device"content="mobile">
  <link rel="shortcut icon" href="static/common/img/favicon.ico" type="image/x-icon">
  <link rel="apple-touch-icon-precomposed" href="http://ojyhagqv7.bkt.clouddn.com/2017/01/12/58775781cc748.png"/>
  <title>${appVO.name}小程序_${appVO.name}微信小程序_${appVO.name}免费小程序体验-haoapp国内领先的微信小程序商店官网</title>
  <meta name="keywords" content="${appVO.name}小程序, ${appVO.name}微信小程序, ${appVO.name}小应用,微信公众号平台,开发,应用号,市场,小程序怎么用,小程序在哪里,微信" />
  <meta name="description" content="${appVO.description}" />
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/m/css/reset.min.css">
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource//js/layer/skin/layer.css">
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/m/css/layout.css?2.0.5">
  <script type="text/javascript" src="${g.domain}/resource/m/js/jquery.min.js"></script>
  <script type="text/javascript" src="${g.domain}/resource/m/js/adaptive-version.js"></script>
  <script type="text/javascript" src="${g.domain}/resource/js/app-common.js"></script>

</head>
<body>


<div class="page">

  <div class="headDropMenuLayer">
    <div class="headDropMenuContent clear">
      <div class="m-top b-bottom-e5" style="padding: .25rem .3rem; height: auto;">
        <h2><a href="" class="logo" style="left: 0; transform: translateX(0); position: relative;"><img src="${g.domain}/resource/m/img/head-logo-9cn.png" alt="..."></a></h2>
        <div class="m-t right">
          <a href="/search" class="btn"><i class="search"></i></a>
          <!-- 未登录 -->
          <a href="ucenter/login/" class="btn" style="margin-left: .64rem;">
            <div class="user">
                                    <span>
                                        <i>
                                          <img src="${g.domain}/resource/m/img/user-icon.png">
                                        </i>
                                    </span>
            </div>
          </a>                    </div>
      </div>
      <div class="d-head"><span>旗下产品</span></div>
      <div class="item">
        <a href="http://xcx.9.cn"><span class="d_xcx"><img src="${g.domain}/resource/m/img/logo-green.png" alt="..."></span><p>第九程序</p></a>
        <a href="http://yiding.9.cn"><span class="d_yd"><img src="${g.domain}/resource/m/img/logo-yd.png" alt="..."></span><p>一订</p></a>
        <a href="http://qing.9.cn"><span class="d_qd"><img src="${g.domain}/resource/m/img/logo-qd.png" alt="..."></span><p>轻点</p></a>
      </div>
    </div>
  </div>


  <div class="m-top white b-bottom-e5">
    <%--<div class="m-t left">
      <a href="javascript:;" class="btn headDropMenu"></a>
    </div>--%>
    <h2><a href="" class="logo"></a></h2><h2><a href="${g.domain}/app/" class="logo"></a></h2>
  </div>
  <div class="m-container top" style="bottom: 1.1rem;">
    <div class="m-sub">
      <div class="objects">
        <div class="list list13 b-bottom-e5">
          <a href="javascript:;" class="btn fr copyBtn" data-clipboard-text="${appVO.name}" onclick="showtip('${appVO.name}', '${appVO.icon}', '${appVO.qrcode}')">进入</a>
          <a href="javascript:;" title="${appVO.name}" class="left">
                        <span class="obj-img fl">
                            <img src="${appVO.icon}" alt="${appVO.name}">
                        </span>
            <div class="mid">
              <div class="title elps">${appVO.name}</div>
              <p class="author">分类：<c:forEach items="${appVO.categorys}" var="categorys"><label>${categorys.name}</label></c:forEach></p>
              <p class="author">热度：${appVO.viewCount+appVO.collectionCount*5}</p>
              <div class="author"><div class="star"><div class="star-inner" style="width: 92%;"></div></div></div>
            </div>
          </a>
        </div>
      </div>
      <div class="tag-title">
        <div class="color fl"></div>${appVO.name} 介绍
      </div>
      <div class="tag-content wx-info-content height">
        <p>${appVO.description}</p>
      </div>

      <div class="tag-title">
        <div class="color fl"></div>${appVO.name} 截图
      </div>
      <div class="cut-wrap">
        <div class="cut-imgs">
          <div class="line c-img"></div>
          <c:forEach items="${appVO.pics}" var="pic" varStatus="status">
            <span class="c-img">
              <img src="${pic}" onload="setImgWH(this)" alt="${appVO.name}-${status.index+1 }">
            </span>
          </c:forEach>
          <div class="line c-img"></div>
        </div>
      </div>

      <%--<div class="tag-title">
        <div class="color fl"></div>${appVO.name} 测评
      </div>
      <div class="evaluating">
        <a href="evaluate/8" title="腾讯视频">
          <span class="logo fl"><img src="${appVO.icon}" alt="${appVO.name}"></span>
          <div class="right fr">
            <span class="btn">查看</span>
          </div>
          <div class="m">
            <div class="title">腾讯视频小程序：追剧变得如此简单</div>
            <p>评价：腾讯视频致力于打造中国领先的在线视频媒体平台，以丰富的内容、极致的观看体验、便捷的登录方式、24小时</p>
          </div>
        </a>
      </div>--%>
      <div class="tag-title">
        <div class="color fl"></div>${appVO.name} 使用指南
      </div>
      <c:if test="${isweixin}">
        <div class="guide-wrap isweixin">
          <div class="guide">
            <div class="text">长按识别二维码,进入小程序</div>
          </div>
          <div class="" style="width:3rem;margin:.2rem auto;"><img src="${appVO.qrcode}" style="width:100%;"></div>

          <%--<a href="http://a.app.qq.com/o/simple.jsp?pkgname=cn.ninth" class="down-tip" style="margin: .15rem 0 .4rem 0; box-shadow: initial;">
            <span class="logo"><img src="${g.domain}/resource/m/img/logo-green.png" alt="${appVO.name}"></span>
            <div class="text">
              <b class="title">第九程序</b>
              <p>遇见更多精彩小程序</p>
            </div>
            <label>下载</label>
          </a>--%>
        </div>
      </c:if>
      <c:if test="${!isweixin}">
        <div class="guide-wrap noweixin">
          <div class="guide">
            <div class="text">长按保存二维码,在微信环境识别</div>
          </div>
          <div class="" style="width:3rem;margin:.2rem auto;"><img src="${appVO.qrcode}" style="width:100%;"></div>
          <div class="guide">
            <div class="text">复制小程序名称, 至微信最新版本客户端（6.5.3版本以上）小程序入口, 进行搜索</div>
          </div>
          <a href="javascript:;" class="copy copyBtn" data-clipboard-text="${appVO.name}" onclick="showtip('${appVO.name}', '${appVO.icon}', '${appVO.qrcode}')">一键复制</a>

          <%--<div class="guide">
            <div class="text">关注第九程序公众号，微信体验更便捷</div>
            <div style="margin: .4rem 0;">
              <img src="${g.domain}/resource/m/img/9cn-gzh.jpg" style="width: 100%;">
            </div>
          </div>--%>

          <%--<a href="http://a.app.qq.com/o/simple.jsp?pkgname=cn.ninth" class="down-tip" style="margin: .15rem 0 .4rem 0; box-shadow: initial;">
            <span class="logo"><img src="${g.domain}/resource/m/img/logo-green.png" alt="${appVO.name}"></span>
            <div class="text">
              <b class="title">第九程序</b>
              <p>遇见更多精彩小程序</p>
            </div>
            <label>下载</label>
          </a>--%>
        </div>
      </c:if>
      <%--<div class="tag-title" style="margin-bottom: .2rem;">
        <div class="color fl"></div>腾讯视频 评分
      </div>
      <div class="score-wrap clear">
        <div class="score-left">
          <span class="score">4.6</span>
          <div class="star-wrap">
            <div class="star"><div class="star-inner" style="width: 92%;"></div></div>
            <p>共13个评分</p>
          </div>
        </div>
        <div class="score-right">
          <div class="list"><label class="text">5星</label><div class="progress"><div class="inner" style="width: 84.615384615385%;"></div></div><label class="count">11条</label></div>
          <div class="list"><label class="text">4星</label><div class="progress"><div class="inner" style="width: 7.6923076923077%;"></div></div><label class="count">1条</label></div>
          <div class="list"><label class="text">3星</label><div class="progress"><div class="inner" style="width: 0%;"></div></div><label class="count">0条</label></div>
          <div class="list"><label class="text">2星</label><div class="progress"><div class="inner" style="width: 0%;"></div></div><label class="count">0条</label></div>
          <div class="list"><label class="text">1星</label><div class="progress"><div class="inner" style="width: 7.6923076923077%;"></div></div><label class="count">1条</label></div>
        </div>
      </div>

      <div class="big-score-model clear">
        <h2>请给小程序评分吧</h2>
        <div class="big-star">
          <span></span>
          <span></span>
          <span></span>
          <span></span>
          <span></span>
        </div>
      </div>
      <div class="tag-title clear discuss-model">
        <div class="color fl"></div>全部评论
      </div>
      <div class="discuss">
        <div id="thelist"></div>
      </div>--%>
    </div>
  </div>
  <%--<div class="m-bottom recommend b-top-e5">
    <div class="input">说说你的看法吧</div>
    <a href="javascript:;" class="btn "><label>6</label></a>
  </div>
  <div class="recommend-ios-lay">
    <div class="recommend-mode">
      <input type="hidden" name="pid" id="pid" value="0">
      <textarea name="content" id="content" class="b-e5" placeholder="说说你的看法吧"></textarea>
      <div class="bottom clear">
        <a href="javascript:;" class="btn active">评论</a>
      </div>
    </div>
  </div>--%>
  <jsp:include page="../common/footer.jsp" flush="false"/>
  <div class="cut-preivew">
    <span class="close"></span>
    <div class="bbb">
      <div class="swiper-container imgs-wrap">
        <div class="swiper-wrapper imgs">
          <c:forEach items="${appVO.pics}" var="pic" varStatus="status">
            <div class="swiper-slide"><img src="${pic}" alt="${appVO.name}-原图${status.index+1 }"></div>
          </c:forEach>
        </div>
        <div class="pagination"></div>
      </div>
    </div>
  </div>
  <div class="copy-laye"></div>
  <div class="copy-laye-content copy-laye-show-1">
			<span class="ewm">
				<img src="" alt="">
			</span>
    <p class="name"></p>
    <p class="copy-tip" id="copy-tip"></p>
    <p class="copy-tip">快到微信 - 搜索小程序体验吧</p>
    <div class="tip-img">
      <img src="${g.domain}/resource/m/img/copy-lay-img.jpg" alt="">
    </div>
    <a href="weixin://" class="toweixin">前往微信</a>
  </div>
  <div class="copy-laye-content copy-laye-show-2" style="padding-bottom:.3rem;">
			<span class="ewm" style="width: 1.8rem; height: 1.8rem;">
				<img src="" alt="">
			</span>
    <p class="copy-tip">长按识别二维码</p>
    <p class="copy-tip2" style="padding-bottom: .1rem;">打开小程序</p>
    <!-- <div class="tip-img">
        <img src="${g.domain}/resource/m/img/copy-lay-img2.png" alt="">
    </div> -->
  </div>


  <script type="text/javascript">
    $(function () {
      $('body').delegate('._ajax_btn_follow_un', 'click', function () {
        location.href = "http://a.app.qq.com/o/simple.jsp?pkgname=cn.ninth.wp";
        return;
        var obj = this;
        var param = {};
        param.obj_id = $(this).attr('data-id');
        param.type = $(this).attr('data-type');
        $.post('/ajax/addCloudDesktop', param, function (data) {
          if (data.status) {
            $(obj).removeClass('_ajax_btn_follow_un').removeClass('has').addClass('has _ajax_btn_follow');
            $(obj).attr('data-fid', data.data);
          } else {
            layer.msg(data.info);
          }
        });
      });

      $('body').delegate('._ajax_btn_follow', 'click', function () {
        location.href = "http://a.app.qq.com/o/simple.jsp?pkgname=cn.ninth.wp";
        return;
        var obj = this;
        var param = {};
        param.id = $(this).attr('data-fid');
        $.post('/ajax/delCloudDesktop', param, function (data) {
          if (data.status) {
            $(obj).removeClass('_ajax_btn_follow').removeClass('has').addClass('_ajax_btn_follow_un');
            $(obj).removeAttr('data-fid');
          } else {
            layer.msg(data.info);
          }
        });
      });
    });
  </script>

</div>


<link rel="stylesheet" type="text/css" href="${g.domain}/resource/m/js/swiper/swiper.min.css">
<script type="text/javascript" src="${g.domain}/resource/m/js/touch-0.2.14.min.js"></script>
<script type="text/javascript" src="${g.domain}/resource/m/js/clipboard.min.js?1.0.14"></script>
<script type="text/javascript" src="${g.domain}/resource/m/js/swiper/swiper.min.js"></script>
<script type="text/javascript" src="${g.domain}/resource/m/js/layer/layer.js"></script>
<script type="text/javascript" src="${g.domain}/resource/m/js/common.min.js?1.0.24"></script>

<script type="text/javascript">
  $(function(){
    var weixin = isWeixin();
    if(weixin){
      $('.toweixin').hide();
    }

    new Clipboard('.copyBtn').on('success', function(e) {
      var e = e || window.event;
      $('#copy-tip').html('小程序名称复制成功');
      if(weixin && $('.copy-laye-show-2 .ewm img').attr('src') != ''){
        setTop('.copy-laye-show-2');
      }else{
        setTop('.copy-laye-show-1');
      }
      e.clearSelection();
    }).on('error', function(e) {
      var e = e || window.event;
      $('#copy-tip').html('手动复制小程序名称');
      if(weixin && $('.copy-laye-show-2 .ewm img').attr('src') != ''){
        setTop('.copy-laye-show-2');
      }else{
        setTop('.copy-laye-show-1');
      }
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
  });

  function isWeixin(){
    return window.navigator.userAgent.match(/MicroMessenger/i) ? true : false;
  }

  function showtip(title, icon, qrcode){
    $('.copy-laye-show-1 .name').html(title);
    $('.copy-laye-show-1 .ewm img').attr('src', icon);
    if(isWeixin() && qrcode != ''){
      $('.copy-laye-show-2 .ewm img').attr('src', qrcode);
    }else{
      $('.copy-laye-show-2 .ewm img').attr('src', '');
    }
  }
</script>

<script id="tpl_list" type="text/html">
  {{each list as value i}}
  <div class="list" onclick="relpy('{{value.id}}','{{value.nickname}}')">
    <div class="list-top">
      <span class="user"><img src="{{value.avatar}}"></span>
      <div class="right">
        <div class="group">
          <div class="name">{{value.nickname}}<label class="reply">回复</label></div>
          <p class="time">{{value.create_time}}</p>
        </div>
      </div>
    </div>
    <div class="content">
      <p>{{value.content}}</p>
    </div>
    {{if value.reply_nickname}}
    <div class="one-reply">
      <div class="name">{{value.reply_nickname}}</div>
      <p>{{value.reply_content}}</p>
    </div>
    {{/if}}
  </div>
  {{/each}}
</script>

<script type="text/javascript">
  var uid = '0';
  var my_score = '';
  var id = '458';
  $(function () {
    if (my_score > 0) {
      $('.big-star span:lt(' + my_score + ')').addClass('active');
    }
    $('.cut-wrap').click(function () {
      $('.cut-preivew').show();
      for (i = 0; i < $('.cut-wrap img').length; i++) {
        $('.cut-preivew img').eq(i).attr("src", $('.cut-wrap img').eq(i).attr("bigimg"))
      }
      var mySwiper = new Swiper('.imgs-wrap', {
        calculateHeight: true,
        noSwiping: true,
        slidesPerView: 'auto',
        loop: true,
        pagination: '.pagination',
      });
    });
    $('.cut-preivew .close').click(function () {
      $('.cut-preivew').hide();
    });
    $('.recommend .btn').click(function () {
      $('.m-container').stop().animate({
        scrollTop: $('.discuss-model').position().top + $('.m-container').scrollTop()
      }, 500);
    });
    $('body').on('tap', '.big-star span', function () {
      if (uid <= 0) {
        window.location.href = '/ucenter/login';
        return false;
      }
      if (my_score > 0) {
        layer.msg('您已经给"腾讯视频"评分了');
        return false;
      }
      var score = $(this).index() + 1;
      if (!window.confirm('确认给我评' + score + '星？'))
        return;
      $.post("/ajax/appscore", {
        id: id,
        score: score
      }, function (msg) {
        if (msg.status == 1) {
          $('.big-star span').removeClass('active');
          $('.big-star span:lt(' + score + ')').addClass('active');
        } else {
          layer.msg(msg.info);
        }
      });
    });
    $('.recommend .input').click(function () {
      if (uid <= 0) {
        window.location.href = '/ucenter/login';
        return false;
      }
      $('#pid').val(0);
      $('#content').val('');
      $('#content').attr('placeholder', '说说你的看法吧');
      replayBoxShow();
    });
    $('.recommend-ios-lay').click(function (e) {
      replayBoxHide(e, true);
    });
    $('.recommend-ios-lay .btn').click(function (e) {
      comment(e);
    });
    $('.m-container').loadToBottom({
      targetHeight: '.m-sub',
      scale: 0.88,
      callback: function () {
        page++;
        get_list(1);
      }
    });
    if (browserkCheck() == 'weixin') {
      $('.noweixin').hide();
      $('.isweixin').show();
    } else {
      $('.noweixin').show();
      $('.isweixin').hide();
    }
  });
  var page = 1;
  var flag = true;
  get_list();
  function get_list(callback) {
    if (flag == false) {
      return;
    }
    $.get("/ajax/appcommentlist", {
      page: page,
      id: id
    }, function (msg) {
      if (msg.status == 0) {
        flag = false;
        return;
      }
      if (msg.data.total <= 10 || msg.data.list == null || msg.data.list.length < 10) {
        flag = false;
      }
      if (page > 1 && msg.data.list == null) {
        flag = false;
        return;
      } else {
        var html = template('tpl_list', msg.data);
        if (callback) {
          $('#thelist').append(html);
        } else {
          $('#thelist').html(html);
        }
      }
    }, 'json');
  }

  function relpy(id, nickname) {
    if (uid <= 0) {
      window.location.href = '/ucenter/login';
      return false;
    }

    $('#pid').val(id);
    $('#content').attr('placeholder', '回复：' + nickname);
    replayBoxShow();
  }

  function comment(e) {
    if (uid <= 0) {
      window.location.href = '/ucenter/login';
      return false;
    }

    var content = $('#content').val();
    var pid = $('#pid').val();
    if (content == '') {
      layer.msg('请输入评论内容');
      return false;
    }
    $.post("/ajax/appcomment", {
      id: id,
      content: content,
      pid: pid
    }, function (msg) {
      if (msg.status == 1) {
        replayBoxHide(e, true);
        $('.no-result').hide();
        page = 1;
        flag = true;
        get_list();
      } else {
        layer.msg(msg.info);
      }
    });
  }
</script>
<script type="text/javascript" src="${g.domain}/resource/js/template.js"></script>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
  $(function () {
    wx.config({
      debug: false,
      appId: 'wxc3c9ceef95f0ba0f',
      timestamp: '1494991499',
      nonceStr: 'NLjIgszz9BKTeOLh',
      signature: '30a244d8cbc29f35cb953d3215cd2c87f41aeab0',
      jsApiList: [
        'checkJsApi',
        'onMenuShareTimeline',
        'onMenuShareAppMessage',
        'onMenuShareQQ',
        'onMenuShareWeibo'
      ]
    });
    wx.ready(function () {
      // 1 判断当前版本是否支持指定 JS 接口，支持批量判断
      wx.checkJsApi({
        jsApiList: [
          'getNetworkType',
          'previewImage',
          'onMenuShareTimeline',
          'onMenuShareAppMessage',
          'onMenuShareQQ',
          'onMenuShareWeibo'
        ],
        success: function (res) {
          //layer.msg(JSON.stringify(res));
        }
      });
      var shareData = {
        title: '推荐使用「腾讯视频小程序」',
        desc: '众多顶级内容独家揽入，HBO独家官方授权播放平台，腾讯视频与你一起迎接崭新的2017！...',
        link: 'http://xcx.9.cn/app/458',
        imgUrl: 'http://ojyhagqv7.bkt.clouddn.com/2017/01/12/58775781cc748.png',
        trigger: function (res) {
          //alert('用户点击发送给朋友');
        },
        success: function (res) {
          layer.msg('已分享');
        },
        cancel: function (res) {
          layer.msg('已取消');
        },
        fail: function (res) {
          layer.msg(JSON.stringify(res));
        }
      };
      wx.onMenuShareAppMessage(shareData);
      wx.onMenuShareTimeline(shareData);
      wx.onMenuShareQQ(shareData);
      wx.onMenuShareWeibo(shareData);
    });
    wx.error(function (res) {
      //layer.msg(res.errMsg);
    });
  });
</script>

</body>
<jsp:include page="../common/cnzz.jsp" />
</html>