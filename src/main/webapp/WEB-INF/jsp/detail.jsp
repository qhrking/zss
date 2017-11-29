<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="renderer" content="webkit">
  <title>${appVO.name}小程序_${appVO.name}微信小程序_${appVO.name}免费小程序体验-haoapp国内领先的微信小程序商店官网</title>
  <meta name="keywords" content="${appVO.name}小程序, ${appVO.name}微信小程序, ${appVO.name}小应用,微信公众号平台,开发,应用号,市场,小程序怎么用,小程序在哪里,微信" />
  <meta name="description" content="${appVO.description}" />
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

  <jsp:include page="common/header.jsp" flush="false" />
  <script type="text/javascript">
    /* 导航选中“首页” */
    $(".n-nav>a").eq(0).addClass("active").siblings().removeClass("active");

      //导航高亮
      $(function () {
          // 导航高亮
          var index = "1";
          $('.nav').find('a').eq(index).addClass('active');

          // 搜索
          $("#search_btn").click(function () {
              var keyword = $('#search_input').val();
              if (keyword) {
                  window.location.href = 'http://www.haoapp.mobi/search/keyword/'+ keyword;
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


  <div class="title_common containers">
    <a href="${g.domain}/app">首页</a>
    <label></label>
    <a href="${g.domain}/app/store">小程序商店</a>
    <label></label>
    <span>${appVO.name}</span>
  </div>

  <div class="detailbox containers clear">
    <div class="detailLeft fl">
      <div class="data clear">
        <div class="img fl">
          <img onload="setImgWH(this)" src="${appVO.icon}">
        </div>
        <div class="dataList fl">
          <div class="clear">
            <h3 class="fl">${appVO.name}</h3>
            <div class="score-show2 fl" >
                                <span>
                                    <i style="width: 100%;"></i>
                                </span>
              <p>3</p>
            </div>                        <span class="fr view-count"><label></label>61</span>
          </div>
          <p>分类：<c:forEach items="${appVO.categorys}" var="categorys"><label>${categorys.name}</label></c:forEach></p>
          <p>标签：
            <c:set value="${ fn:split(appVO.tags, ',') }" var="tag"/>
            <c:forEach items="${ tag }" var="t">
              <span>${ t }</span>
            </c:forEach>
          </p>
        </div>
      </div>
      <div class="detaltext">
        <div class="lite_detail clear">
          <div class="lite-text fl">
            <h3><label></label>${appVO.name} 信息</h3>
            <div class="fl">
              <p>作者</p>
              <p>发布时间</p>
              <p>查看要求</p>
            </div>
            <div class="fl">
              <p>${appVO.author}</p>
              <p>${appVO.createTime}</p>
              <p>微信最新版本客户端，6.5.3 版本以上。</p>
            </div>
          </div>
          <div class="lite-code fr">
            <img src="${appVO.qrcode}">
            <p>微信扫描体验</p>
          </div>
        </div>
        <h3><label></label>${appVO.name} 介绍</h3>
        <p>${appVO.description}</p>
        <h3><label></label>${appVO.name} 截图</h3>
        <div class="imgbox">
          <ul class="imgsroll clear">
            <c:forEach items="${appVO.pics}" var="pic">
              <li><img onload="setImgWH(this)" src="${pic}" alt="${appVO.name}-${status.index+1 }"></li>
            </c:forEach>
          </ul>
        </div>
        <%--<h3><label></label>${appVO.name} 评分</h3>
        <div class="mark clear">
          <div class="mark-left fl">
            <div class="num fl">5.0</div>
            <div class="fl many">
              <div class="score-detail clear">
                <div class="scoreblack">
                  <div style="width: 100%;" class="scorelight"></div>
                </div>
              </div>
              <p>共3人参与评分</p>
            </div>
          </div>
          <div class="mark-right fl">
            <div>
              <label>5星</label>
              <div class="bar">
                <div style="width: 100%;" class="bar-active"></div>
              </div>
              <span>3条</span>
            </div>
            <div>
              <label>4星</label>
              <div class="bar">
                <div style="width: 0%;" class="bar-active"></div>
              </div>
              <span>0条</span>
            </div>
            <div>
              <label>3星</label>
              <div class="bar">
                <div style="width: 0%;" class="bar-active"></div>
              </div>
              <span>0条</span>
            </div>
            <div>
              <label>2星</label>
              <div class="bar">
                <div style="width: 0%;" class="bar-active"></div>
              </div>
              <span>0条</span>
            </div>
            <div>
              <label>1星</label>
              <div class="bar">
                <div style="width: 0%;" class="bar-active"></div>
              </div>
              <span>0条</span>
            </div>
          </div>
        </div>
        <div class="score-box text-center clear">
          <p class="fl">请给小程序评分吧</p>
          <ul class="grade clear score">
            <li title="很差"><span></span></li>
            <li title="较差"><span></span></li>
            <li title="还行"><span></span></li>
            <li title="推荐"><span></span></li>
            <li title="力荐"><span></span></li>
          </ul>
          <input type="hidden" value="" name="score" id="score">
          <a id="save" class="btn">确认评分</a>
          <script type="text/javascript">
            $(function () {
              // 评分的js
              var n = 0
              var m = 0
              $(".score li").click(function () {
                n = $(this).index()
                $(".score span").removeClass("active")
                $(".score span:lt(" + (n + 1) + ")").addClass('active')
                $('#score').val(n + 1);
              })
              $(".score li").mouseenter(function () {
                m = $(this).index()
                $(".score span:lt(" + (m + 1) + ")").addClass('active2')
              })
              $(".score li").mouseleave(function () {
                m = $(this).index()
                $(".score span:lt(" + (m + 1) + ")").removeClass('active2')
              })

              // 评分
              $('#save').click(function () {
                var cid = '1661';
                var score = $('#score').val();
                if (!score) {
                  layer.msg('您还未打分！');
                  return;
                }
                $.post("Xcx/Index/doScore", {cid: cid, score: score}, function (msg) {
                  if (msg.status == 2) {
                    showLogin();return;
                  }
                  if(msg.status == 1){
                    $('#save').remove();
                  }
                  layer.msg(msg.info);
                });
              });
            })
          </script>
        </div>
        <h3><label></label>实时NBA 评论</h3>
        <script type="text/javascript">
          var page = 1;
          var id = '1661';
          var type = 1;
        </script>

        <link rel="stylesheet" type="text/css" href="${g.domain}/resource/css/list.css" />
        <script type="text/javascript" src="static/common/js/template.js"></script>

        <div class="userdata">
        </div>
        <div class="editbox">
          <textarea id="comment" class="textarea" placeholder="说说你的看法吧"></textarea>
        </div>
        <div class="clear">
          <a class="editBtn fr commentBtn">评论</a>
        </div>
        <div id="thelist" class="comment-list">

        </div>
        <div class="comment-more lookmore" style="display: none;">
          <a>查看更多</a>
        </div>
        <div class="no-conment text-center nonebox" style="display: none;">
          <img src="${g.domain}/resource/images/no-comment.png">
          <p>暂无评论，快来抢沙发</p>
        </div>


        <script id="tpl_list" type="text/html">
          {{each data.rows as value i}}
          <div class="comment clear">
            <a class="avater-comment fl">
              <img onload="setImgWH(this)" src="${g.domain}/{{if value.user}}{{value.user.thumb}}{{/if}}">
            </a>
            <div class="data-comment">
              <div class="name-comment clear">
                <h4 class="fl">{{if value.user}}{{value.user.nickname}}{{/if}}</h4>
                <span class="fl">{{value.create_time}}</span>
                <a class="fr reply" data-pid="{{value.id}}" data-touid="{{value.uid}}">回复</a>
              </div>
              <p>{{value.content}}</p>
              {{if value.pid > 0}}
              <div class="has-reply">
                <p class="name">{{if value.parent.user}}{{value.parent.user.nickname}}{{/if}}</p>
                <p>{{value.parent.content}}</p>
              </div>
              {{/if}}
            </div>
          </div>
          {{/each}}
        </script>


        <script type="text/javascript">

          get_list();

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

            $.get("Xcx/Comment/getCommentList", {page: page, id: id, type: type}, function (msg) {
              $('.lookmore').hide();
              $('.nonebox').hide();
              if (msg.status == 0) {
                $('#thelist').html('');
                $('.nonebox').show();
                return;
              }
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
        <script type="text/javascript" src="${g.domain}/resource/js/autosize.min.js" charset="utf-8"></script>
        <script type="text/javascript">
          autosize($('.re-textarea'));
          $(function () {
            // textarea 获得焦点按钮激活
            $(".textarea").keyup(function () {
              if ($(this).val() != '') {
                $(".commentBtn").addClass("active");
              } else {
                $(".commentBtn").removeClass("active");
              }
            });

            // 回复弹窗
            $('body').on('click', '.reply', function () {
              var obj = $(this).parents('.data-comment');
              if (obj.find('.reply-content').length > 0) {
                return;
              }
              closeReply();
              var pid = $(this).attr('data-pid');
              var touid = $(this).attr('data-touid');
              var html = '<div class="reply-content">'
                      + '<textarea id="comment_' + pid + '" class="re-textarea" rows="1"></textarea>'
                      + '<div class="clear">'
                      + '<a class="editBtn fr active replayBtn" data-pid=' + pid + ' data-touid=' + touid + '>回复</a>'
                      + '<a class="cancel fr" onclick="closeReply();">取消</a>'
                      + '</div>'
                      + '</div>';
              $(this).parents('.data-comment').append(html);
            });

            // 评论
            $('body').on('click', '.commentBtn', function () {
              var pid = 0;
              var touid = 0;
              var content = $('#comment').val();
              var params = {id: id, pid: pid, touid: touid, content: content, type: type};
              doComment(params);
            });

            // 回复
            $('body').on('click', '.replayBtn', function () {
              var pid = $(this).attr('data-pid');
              var touid = $(this).attr('data-touid');
              var content = $('#comment_' + pid).val();
              var params = {id: id, pid: pid, touid: touid, content: content, type: type};
              doComment(params);
            });
          });

          function closeReply() {
            $('.reply-content').remove();
          }

          function doComment(params) {
            $.post("Xcx/Comment/doComment", params, function (msg) {
              if (msg.status == 2) {
                $('.login').click();
                return;
              }
              layer.msg(msg.info);
              if (msg.status == 1) {
                $('.textarea').val('');
                get_list();
              }
            });
          }
        </script>--%>

      </div>
    </div>
    <div class="detaiRitht fl articleRight">

      <div class="switch-right">
        <%--<div class="switch-tops clear">
          <a><span>发布</span></a>
          <a><span>关注我们</span></a>
          <a><span>下载app</span></a>
        </div>--%>
        <div class="content r-release">
          <a class="add-fixed">
            <label class="rse"></label>
            <p>发布小程序</p>
          </a>
        <span class="subBtn">
            <label class="ar"></label>
            <p>文章投稿</p>
        </span>
          <div class="submit-pop">
            <span class="closePOP"></span>
            <p>投稿邮箱：</p>
            <p>792424839@qqcom</p>
          </div>
        </div>
        <%--<div class="content r-attent">
        <span class="wxBtn">
            <label class="wx"></label>
            <p>官方微信</p>
        </span>
          <div class="wx-pop">
            <span class="closePOP"></span>
            <img src="${g.domain}/resource/images/code-weixin.png">
            <p>扫一扫关注 9.cn小程序官方微信</p>
          </div>
          <a href="http://weibo.com/u/5983694044" target="_blank">
            <label class="wb"></label>
            <p>新浪微博</p>
          </a>
        </div>
        <div class="content r-code">
          <img class="fl" src="${g.domain}/resource/images/load/code-load.png">
          <div class="fl">
            <p>扫一扫</p>
            <span>( 仅支持ios下载 )</span>
          </div>
        </div>--%>
      </div>
      <script type="text/javascript">
        $(function () {
          $(".switch-right .content").eq(0).show();
          $(".switch-tops a").eq(0).addClass("active");
          $(".switch-tops a").eq(2).find("span").addClass("active")
          var n = 0;
          var flag = true;
          var flag2 = true;
          $(".switch-tops a").click(function () {
            n = $(this).index();
            if (n == 0) {
              $(".switch-tops a span").removeClass("active")
              $(".switch-tops a").eq(2).find("span").addClass("active")
            } else if (n == 2) {
              $(".switch-tops a span").removeClass("active")
              $(".switch-tops a").eq(1).find("span").addClass("active")
            } else if (n == 1) {
              $(".switch-tops a span").removeClass("active")
            }
            $(".switch-right .content").hide().eq(n).show();
            $(".switch-tops a").removeClass("active").eq(n).addClass("active")
          })

          $(".closePOP").click(function (event) {
            event.stopPropagation()
            $(this).parent().hide()
            flag = !flag
          })
          $(".subBtn").click(function () {
            if (flag) {
              $(".submit-pop").show()
            } else {
              $(".submit-pop").hide()
            }
            flag = !flag
          })
          $(".wxBtn").click(function () {
            if (flag2) {
              $(".wx-pop").show()
            } else {
              $(".wx-pop").hide()
            }
            flag2 = !flag2
          })
        })
      </script>

      <div class="right-content">
        <h2><label></label>热门小程序</h2>
        <div class="lite-new">
          <c:forEach items="${listHot.content}" var="hotAppVO">
            <a href="${g.domain}/app/${hotAppVO.id}" class="clear">
              <div class="img-new">
                <img onload="setImgWH(this)"  src="${hotAppVO.icon}">
              </div>
              <div class="data-new">${hotAppVO.name}</div>
              <p>分类：<c:forEach items="${hotAppVO.categorys}" var="category" begin="0" end="2"><label>${category.name}</label></c:forEach></p>
            </a>
          </c:forEach>
        </div>
      </div>
      <div class="right-content2">
        <h2><label></label>最新小程序</h2>
        <div class="lite-new">
          <c:forEach items="${listNew.content}" var="newAppVO">
            <a href="${g.domain}/app/${newAppVO.id}" class="clear">
              <div class="img-new">
                <img onload="setImgWH(this)"  src="${newAppVO.icon}">
              </div>
              <div class="data-new">${newAppVO.name}</div>
              <p>分类：<c:forEach items="${newAppVO.categorys}" var="category" begin="0" end="2"><label>${category.name}</label></c:forEach></p>
            </a>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>
  <div class="alert">
    <div class="imgs">
      <div class="close"></div>
      <p>Image <span id="index"></span> of <span id="count"></span></p>
      <a class="pre"><span></span></a>
      <a class="next"><span></span></a>
      <img src="">
    </div>
  </div>
  <!-- JiaThis Button BEGIN -->
  <div class="jiathis_style_32x32 jiashare" style="display: none;">
    <a title="分享QQ空间" class="jiathis_button_qzone"></a>
    <a title="分享QQ好友" class="jiathis_button_cqq"></a>
    <a title="分享微博" class="jiathis_button_tsina"></a>
    <a title="分享微信" class="jiathis_button_weixin"></a>
    <a title="分享豆瓣" class="jiathis_button_douban"></a>
    <a title="复制地址" class="jiathis_button_copy"></a>
  </div>

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
    //图片弹窗
    var H = $(window).height()
    $(".imgs").css({"height": H * .7, "width": H * .7 / 1.78, "marginLeft": H * .7 / 1.78 / 2 * -1, "marginTop": H * .7 / 2 * -1})
    var $index = 0;
    var imgSrc = '';
    var flag = true
    $(".imgsroll li").click(function () {
      $(".imgs a").show()
      $index = $(this).index();
      $(".alert").fadeIn()
      imgSrc = $(".imgsroll li").eq($index).find("img").attr("src");
      $(".imgs img").attr("src", imgSrc)
      $("#index").html($index + 1)
      $("#count").html($(".imgsroll li").length)
      if ($index == 0) {
        $(".imgs .pre").hide()
      }
      if ($index == $(".imgsroll li").length - 1) {
        $(".imgs .next").hide()
      }
    })
    $(".imgs .next").click(function () {
      $index++;
      imgSrc = $(".imgsroll li").eq($index).find("img").attr("src");
      $(".imgs img").attr("src", imgSrc)
      if ($index == $(".imgsroll li").length - 1) {
        $(".imgs .next").hide()
      }
      $(".imgs .pre").show()
      $("#index").html($index + 1)
      $("#count").html($(".imgsroll li").length)
    })
    $(".imgs .pre").click(function () {
      $index--;
      if ($index == 0) {
        $(".imgs .pre").hide()
      }
      imgSrc = $(".imgsroll li").eq($index).find("img").attr("src");
      $(".imgs img").attr("src", imgSrc)
      $(".imgs .next").show()
      $("#index").html($index + 1)
      $("#count").html($(".imgsroll li").length)
    })
    $(".imgs a").click(function () {
      if (flag) {
        $(".imgs").addClass("opacityStyle")
        $(".imgs img").removeClass("opacityStyle")
      } else {
        $(".imgs img").addClass("opacityStyle")
        $(".imgs").removeClass("opacityStyle")
      }
      flag = !flag
    })
    $(".alert").click(function (e) {
      $(".alert").fadeOut()
    })
    $(".imgs .close").click(function () {
      $(".alert").fadeOut()
    })
    $(".imgs").click(function (e) {
      e.stopPropagation()
    })
  })
</script>

<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>

<script type="text/javascript">
  // 分享
  $(function () {
    var wWidth = $(window).width();
    var wHeight = $(window).height();
    var Top = wHeight / 2 - 98;
    if (wWidth < 980) {
      imgLeft = (wWidth - 980) - 118;
    } else {
      imgLeft = (wWidth - 980) / 2 - 118;
    }
    //$(".fixed_box").css("top", Top);
    $(".jiashare").css("left", imgLeft);
    $(window).resize(function () {
      var wHeight = $(window).height();
      var Top = wHeight / 2 - 98;
      var wWidth = $(window).width();
      if (wWidth < 980) {
        imgLeft = (wWidth - 980) - 118;
      } else {
        imgLeft = (wWidth - 980) / 2 - 118;
      }
      //$(".fixed_box").css("top", Top);
      $(".jiashare").css("left", imgLeft);
    });
    $(".jiashare").show();
  });
</script>
<!-- 用于加载js代码 -->
<!-- /底部 -->
</body>
</html>

