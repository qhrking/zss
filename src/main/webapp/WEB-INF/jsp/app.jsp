<%--
  Created by IntelliJ IDEA.
  User: huazhi
  Date: 2017/1/19
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <meta name="renderer" content="webkit">
    <title>微信小程序商店-微信小程序官方商店|微信小程序官方市场</title>
    <meta name="keywords" content="haoapp,好应用,好程序,小程序,微信小程序,小程序商店,微信小程序商店,小程序导航,小程序市场,小应用,微信公众号平台,开发,应用号,微信"/>
    <meta name="description"
          content="haoapp小程序商店（haoapp）拥有最新最全微信小程序应用和微信小程序资源、小程序资讯、小程序排行等，作为国内领先小程序商店，haoapp致力于为用户提供优质的微信小程序服务"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${g.domain}/resource/css/reseting.css">
    <link rel="stylesheet" type="text/css" href="${g.domain}/resource/css/app-common.css">
    <link rel="stylesheet" type="text/css" href="${g.domain}/resource/css/lite.css">
    <script type="text/javascript" src="${g.domain}/resource/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${g.domain}/resource/js/app-common.js" charset="utf-8"></script>
</head>
<body>
<script type="text/javascript" src="${g.domain}/resource/js/template.js"></script>
<div class="body-container">
    <%--选中导航第3个菜单--%>
    <jsp:include page="common/header.jsp">
        <jsp:param name="index" value="2"/>
    </jsp:include>

    <div class="title_common containers">
        <a href="${g.domain}/app">首页</a>
        <label></label>
        <c:choose>
            <c:when test="${categotyPath eq 'store'}">
                <span>小程序商店</span>
            </c:when>
            <c:otherwise>
                <a href="${g.domain}/app/store">小程序商店</a>
                <label></label>
                <span>
                    <c:forEach items="${categoryList}" var="category">
                        <c:if test="${category.path eq categotyPath}">${category.name}</c:if>
                    </c:forEach>
                </span>
            </c:otherwise>
        </c:choose>
    </div>
    <%--<div class="keysbox">
        <div class="containers clear">
            <a class="active" href="app">全部</a>
            <c:forEach items="${categoryList}" var="category">
                <li><a href="app/${category.path}">${category.name}</a></li>
            </c:forEach>
        </div>
    </div>--%>
    <div class="sort-top containers">
        <div class="keysbox">
            <div class="keys clear">
                <a href="${g.domain}/app/store"
                   <c:if test="${categotyPath eq 'store'}">class="active"</c:if> >全部</a>
                <c:forEach items="${categoryList}" var="category">
                    <li><a href="${g.domain}/app/${category.path}"
                           <c:if test="${category.path eq categotyPath}">class="active"</c:if> >${category.name}</a>
                    </li>
                </c:forEach>
            </div>
        </div>

        <div class="filterbox clear">
            <%--<div class="filterLeft fl clear">
                <a class="c-status active" data-value="1">已上架<label></label></a>
                <a class="c-status" data-value="0">未上架<label></label></a>
            </div>--%>
            <div class="filterRight fr clear" style="float: left;">
                <%-- <a class="c-order active" href="app/${categotyPath}/order/0">默认</a>
                 <label></label>--%>
                <a href="${g.domain}/app/${categotyPath}/order/1"
                   class="c-order <c:if test="${orderType eq '1'}">active</c:if>">按最新</a>
                <label></label>
                <a href="${g.domain}/app/${categotyPath}/order/2"
                   class="c-order <c:if test="${orderType eq '2'}">active</c:if>">按热度</a>
                <label></label>
                <a href="${g.domain}/app/${categotyPath}/order/3"
                   class="c-order <c:if test="${orderType eq '3'}">active</c:if>">按推荐</a>
            </div>
        </div>

        <input type="hidden" name="status" id="status" value="1">
        <input type="hidden" name="order" id="order" value="create_time DESC">
    </div>
    <div id="wrapper" class="showbox containers">
        <div id="thelist" class="show-content containers clear paddingTop">
            <c:forEach items="${page.content}" var="appVO">
                <a class="list" href="${g.domain}/app/${appVO.id}" title="${appVO.name}">
                    <div class="imgLeft"><span><img onload="setImgWH(this)" src="${appVO.icon}"
                                                    style="width: 100%;"></span></div>
                    <div class="dataRight">
                        <div class="title clear">
                            <h3 class="ellipsis">${appVO.name}</h3>
                            <span class="app-try">体验</span>
                        </div>
                        <p class="author">作者：${appVO.name}</p>
                        <p class="introduce">${appVO.description}</p>
                    </div>
                    <div class="list-bottom"><c:forEach items="${appVO.categorys}" var="categorys" begin="0"
                                                        end="2"><label>${categorys.name}</label></c:forEach><p
                            class="view-count"><label></label>${appVO.viewCount}</p></div>
                    <div class="qrcode" style="display: none;"><img src="${appVO.qrcode}">
                        <p>微信体验扫描</p></div>
                </a>
            </c:forEach>
        </div>
        <%--<div class="lookmore" style="display: none;"><a href="javascript:;">查看更多</a></div>--%>
        <jsp:include page="common/pagination.jsp" flush="false"/>
    </div>
    <jsp:include page="common/footer.jsp" flush="false"/>
    <div class="fixed_box" style="bottom: 120px; right: 321.5px;"><a class="to_top" style="display: block;"></a></div>
</div>
<script id="tpl_list" type="text/html">
    {{each data.list as value i}}
    <a class="list" href="{{value.url}}" title="{{value.title}}">
        <div class="imgLeft"><span><img onload="setImgWH(this)" src="{{value.icon}}" style="width: 100%;"></span></div>
        <div class="dataRight">
            <div class="title clear"><h3 class="ellipsis">{{value.title}}</h3><span class="app-try">体验</span></div>
            <p class="author">作者：{{value.author}}</p>

            <p class="introduce">{{value.content}}</p></div>
        <div class="list-bottom"><p class="view-count"><label></label>{{value.hits}}</p></div>
        <label>{{value.cat}}</label>

        <div class="qrcode"><img src="{{if value.qrcode}}{{value.qrcode}}{{else}}/resource/images/default.png{{/if}}">

            <p>{{if value.qrcode}}微信体验扫描{{else}}微信搜索{{/if}}</p></div>
    </a>
    {{/each}}
</script>
<script type="text/javascript">
    var page = 1;
    var cate = '';

    //get_list();

    $(function () {
//弹窗
        var H_ture = $(".switchbox .content").height();
        var flag = true;
        if (H_ture > 36) {
            $(".switchbox .content").css("height", "36px");
            $(".slideBtn a").click(function () {
                if (flag) {
                    $(".switchbox .content").animate({
                        "height": H_ture
                    });
                    $(this).addClass("active");
                } else {
                    $(".switchbox .content").animate({
                        "height": "36px"
                    });
                    $(this).removeClass("active");
                }
                flag = !flag;
            });
        }
// 点击标签的效果
        $(".switchbox .content a").click(function () {
            $(".switchbox .content a").removeClass("active");
            $(this).addClass("active");
        });

// 分类加载
        $('.cate').click(function () {
            var cate = $(this).text();
            var html = '<label></label>' + cate;
            $('#wrapper h2').html(html);

            var cid = $(this).attr('data-cid');
            document.getElementById("cid").value = cid;
            get_list();
        });

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
            $("body").scrollTop(0);
        }

        var params = get_params();
        $.get("cx/getList.html", params, function (msg) {
            if (msg.status == 0) {
                $('.lookmore').hide();
                $('#wrapper').hide();
                $('#thelist').html('');
                $('.m-container').removeClass('bg_ff');
                $('.nonebox').show();
                return;
            } else {
                $('.lookmore').show();
                $('.nonebox').hide();
            }
            if (msg.data.total <= 12) {
                $('.lookmore').hide();
            }
            if (callback) {
                callback(msg);
            }
            if (page > 1 && msg.data.list == null) {
                $('.lookmore').hide();
            } else {
                var html = template('tpl_list', msg);
                if (callback) {
                    $('#thelist').append(html);
                } else {
                    $('#thelist').html(html);
                }
                $('#wrapper').show();
            }
        }, 'json');
    }

    function get_params() {
// 默认参数
        var params = {
            page: page,
            cate: cate
        }
// 筛选参数
        var cid = $('#cid').val();

        if (cid != '' && cid != undefined) {
            params.cid = cid;
        }
        return params;
    }

</script>
<script type="text/javascript">
    $(function () {
        var $index = 0;
        $("#wrapper").on('mouseenter', '.list .app-try', function () {
            $index = $(this).parents(".list").index();
            $(".qrcode").hide().eq($index).fadeIn();
        });
        $("#wrapper").on('mouseleave', '.list .app-try', function () {
            $index = $(this).parents(".list").index();
            $(".qrcode").hide();
        });
    });
</script>
</body>
</html>
