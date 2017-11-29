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
    <title>微信小程序商店-haoapp国内领先的微信小程序商店官网</title>
    <meta name="keywords" content="haoapp,好应用,好程序,小程序,微信小程序,小程序商店,微信小程序商店,小程序导航,小程序市场,小应用,微信公众号平台,开发,应用号,微信"/>
    <meta name="description" content="haoapp小程序商店（haoapp）拥有最新最全微信小程序应用和微信小程序资源、小程序资讯、小程序排行等，作为国内领先小程序商店，haoapp致力于为用户提供优质的微信小程序服务"/>
    <meta name="baidu-site-verification" content="OIRKKfx613" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" type="text/css" href="${g.domain}/resource/css/reseting.css">
    <link rel="stylesheet" type="text/css" href="${g.domain}/resource/css/app-common.css">
    <link rel="stylesheet" type="text/css" href="${g.domain}/resource/css/lite.css">
    <script type="text/javascript" src="${g.domain}/resource/js/jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${g.domain}/resource/common/layer/skin/layer.css">
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/resource/common/html5shiv.js"></script>
    <![endif]-->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/resource/common/jquery-1.10.2.min.js"></script>
    <![endif]-->
    <!--[if gte IE 9]><!-->
    <script type="text/javascript" src="${g.domain}/resource/common/jquery-2.2.3.min.js"></script>
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
    <%--选中导航第1个菜单--%>
    <jsp:include page="common/header.jsp">
        <jsp:param name="index" value="0"/>
    </jsp:include>
    <!--登录弹窗的dom-->
    <div class="loginbox">
        <a href="">
            <img class="logo" src="${g.domain}/resource/img/logo.png"/>
        </a>
        <div class="hr">
            <p>
                登录/注册
            </p>
        </div>
        <div class="login-way">
            <a href="Xcx/Addons/execute/_addons/SyncLogin/_controller/Base/_action/login/type/qq">
                <span class="qq"></span>
                <p>
                    QQ
                </p>
            </a>
            <a href="Xcx/Addons/execute/_addons/SyncLogin/_controller/Base/_action/login/type/sina">
                <span class="wb"></span>
                <p>
                    微博
                </p>
            </a>
        </div>
    </div>
    <div class="banner">
        <div class="left">
            <a class="b-pre"><i></i></a>
        </div>
        <div class="right">
            <a class="b-next"><i></i></a>
        </div>
        <div class="dot">
            <%--<span class="active"></span><span></span><span></span>--%>
        </div>
        <%--<a href="news/356" target="_blank">
            <p>
                <img src="http://ojyhagqv7.bkt.clouddn.com/9cn_201703022ad3cc66f415ceda949c351b90bbd696.png"/>
            </p>
        </a>
        <a href="news/242/?from=banner" target="_blank">
            <p>
                <img src="http://ojyhagqv7.bkt.clouddn.com/9cn_20170214bf08b8ef110aece01f8e0e507cfbf3c2.png"/>
            </p>
        </a>--%>
        <a href="/app/apply" target="_blank">
            <p>
                <img src="http://ojyhagqv7.bkt.clouddn.com/9cn_20170302cc61180208640668ea141ebb2b0b2046.jpg"/>
            </p>
        </a>
    </div>
    <%--<div class="specialbox containers">
        <div class="title-common clear">
            <h2 class="fl"><label></label>特色专题</h2>
            <a href="special" class="fr rigth-more">查看更多<label></label></a>
        </div>
        <div class="special-content clear">
            <div class="scroll clear imgScale">
                <a class="content" href="special/31" target="_blank">
                    <img onload="setImgWH(this)" src="http://ojyhagqv7.bkt.clouddn.com/2017-03-07_58be338c27b36.png?imageView2/2/w/400"/>
                </a><a class="content" href="special/32" target="_blank">
                <img onload="setImgWH(this)" src="http://ojyhagqv7.bkt.clouddn.com/2017-03-07_58be760a585c8.png?imageView2/2/w/400"/>
            </a><a class="content" href="special/29" target="_blank">
                <img onload="setImgWH(this)" src="http://ojyhagqv7.bkt.clouddn.com/9cn_20170227b35b5ec481ab8ba768dff48d512f0a12.jpg?imageView2/2/w/400"/>
            </a><a class="content" href="special/25" target="_blank">
                <img onload="setImgWH(this)" src="http://ojyhagqv7.bkt.clouddn.com/9cn_201702066d6bdd5a213aaeb9975e44d188d1cb55.jpg?imageView2/2/w/400"/>
            </a><a class="content" href="special/23" target="_blank">
                <img onload="setImgWH(this)" src="http://ojyhagqv7.bkt.clouddn.com/9cn_20170214dc2c5e7393b8819ef6751586e9a7e7ce.jpg?imageView2/2/w/400"/>
            </a>
            </div>
        </div>
    </div>--%>
    <div class="showbox containers">
        <div class="title-common clear">
            <h2 class="fl"><label></label>精选小程序</h2>
            <a href="${g.domain}/app/store" class="fr rigth-more">查看更多<label></label></a>
        </div>
        <div class="show-content containers clear wrapper">
            <c:forEach items="${listRecommend.content}" var="recommendAppVO">
                <a class="list" href="${g.domain}/app/${recommendAppVO.id}" target="_blank">
                    <div class="imgLeft">
				<span>
				<img onload="setImgWH(this)" src="${recommendAppVO.icon}">
				</span>
                    </div>
                    <div class="dataRight">
                        <div class="title clear">
                            <h3 class="ellipsis">${recommendAppVO.name}</h3>
                            <span class="app-try">体验</span>
                        </div>
                        <%--<div class="score-show2">
                            <span>
                            <i style="width: 96%;"></i>
                            </span>
                            <p>
                                4
                            </p>
                        </div>--%>
                        <p class="introduce">
                                ${recommendAppVO.description}
                        </p>
                    </div>
                    <div class="list-bottom clear">
                        <%--<c:set value="${ fn:split(recommendAppVO.tags, ',') }" var="tag"/>
                        <c:forEach items="${ tag }" var="t">
                            <label>${ t }</label>
                        </c:forEach>--%>
                        <c:forEach items="${recommendAppVO.categorys}" var="categorys" begin="0" end="2"><label>${categorys.name}</label></c:forEach>
                        <c:if test="${recommendAppVO.categorys != null &&fn:length(recommendAppVO.categorys)>3}"><label>···</label></c:if>
                        <p class="view-count">
                            <label></label>${recommendAppVO.viewCount}
                        </p>
                    </div>
                    <div class="qrcode">
                        <img src="${recommendAppVO.qrcode}">
                        <p>
                            微信体验扫描
                        </p>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>

    <%--<div class="specialbox containers">
        <div class="special-content clear">
            <div class="scroll clear imgScale">
                <a class="content" href="special/22" target="_blank">
                    <img onload="setImgWH(this)" src="http://ojyhagqv7.bkt.clouddn.com/9cn_20170205dee7162a75ef59ea58440ea94daff433.jpg?imageView2/2/w/400"/>
                </a><a class="content" href="${g.domain}/app/120" target="_blank">
                <img onload="setImgWH(this)" src="http://ojyhagqv7.bkt.clouddn.com/9cn_20170120e4e952a135b45072d074434a1b729303.jpg?imageView2/2/w/400"/>
            </a><a class="content" href="special/19" target="_blank">
                <img onload="setImgWH(this)" src="http://ojyhagqv7.bkt.clouddn.com/9cn_2017012035a545a4d046843c8da6a3b2e4f336b9.jpg?imageView2/2/w/400"/>
            </a><a class="content" href="special/13" target="_blank">
                <img onload="setImgWH(this)" src="http://ojyhagqv7.bkt.clouddn.com/9cn_201701200928ca508b7b710ffe669e6e8de9964a.jpg?imageView2/2/w/400"/>
            </a><a class="content" href="special/14" target="_blank">
                <img onload="setImgWH(this)" src="http://ojyhagqv7.bkt.clouddn.com/9cn_20170205d19a308a05083569cda8b2b25c5ff86c.jpg?imageView2/2/w/400"/>
            </a>
            </div>
        </div>
    </div>--%>

    <%--<div class="showbox containers">
        <div class="title-common clear">
            <h2 class="fl"><label></label>音乐</h2>
            <a href="${g.domain}/app/yinyue" class="fr rigth-more">查看更多<label></label></a>
        </div>
        <div id="thelist" class="show-content containers clear">
            <a class="list" href="${g.domain}/app/260" target="_blank">
                <div class="imgLeft">
				<span>
				<img onload="setImgWH(this)" src="http://ojyhagqv7.bkt.clouddn.com/20170109/db6b03e1c95b6c50b851ea820301f529a5b4fed8-d9c6df01c7f110111457fc8a4ab6d2b624df5beb.png?imageView2/2/w/400">
				</span>
                </div>
                <div class="dataRight">
                    <div class="title clear">
                        <h3 class="ellipsis">爱弹唱</h3>
                        <span class="app-try">体验</span>
                    </div>
                    <div class="score-show2">
					<span>
					<i style="width: 100%;"></i>
					</span>
                        <p>
                            7
                        </p>
                    </div>
                    <p class="introduce">
                        爱弹唱 吉他曲谱 尤克里里曲谱 吉他教学 尤克里里教学 吉他 尤克里里
                    </p>
                </div>
                <div class="list-bottom clear">
                    <label>音乐</label><label>在线音乐</label>
                    <p class="view-count">
                        <label></label>34747
                    </p>
                </div>
                <div class="qrcode">
                    <img src="http://ojyhagqv7.bkt.clouddn.com/20170109/3e70535fb435d4a9e355ada21dc3eae1f0d333b9-d63746bd27877c078608eed00aaf31d6336f8b75.jpg?imageView2/2/w/400">
                    <p>
                        微信体验扫描
                    </p>
                </div>
            </a><a class="list" href="${g.domain}/app/773" target="_blank">
            <div class="imgLeft">
				<span>
				<img onload="setImgWH(this)" src="http://ojyhagqv7.bkt.clouddn.com/9cn_201701224a4edf0553ce6c66424b3f19eb4dfba1.png?imageView2/2/w/400">
				</span>
            </div>
            <div class="dataRight">
                <div class="title clear">
                    <h3 class="ellipsis">铃音DIY</h3>
                    <span class="app-try">体验</span>
                </div>
                <div class="score-show2">
					<span>
					<i style="width: 94%;"></i>
					</span>
                    <p>
                        10
                    </p>
                </div>
                <p class="introduce">
                    铃音DIY让天翼用户可通过语音录制、文字编辑等方式进行个性化彩铃制作，并设为专属彩铃。
                </p>
            </div>
            <div class="list-bottom clear">
                <label>音乐</label><label>在线音乐</label>
                <p class="view-count">
                    <label></label>8910
                </p>
            </div>
            <div class="qrcode">
                <img src="http://ojyhagqv7.bkt.clouddn.com/9cn_2017012295e7fd50acfddc09e2b011957c741579.png?imageView2/2/w/400">
                <p>
                    微信体验扫描
                </p>
            </div>
        </a><a class="list" href="${g.domain}/app/18" target="_blank">
            <div class="imgLeft">
				<span>
				<img onload="setImgWH(this)" src="http://ojyhagqv7.bkt.clouddn.com/20170109/26e04b82e1c42e4adcdec0be73ea143a5dad44f3-1f50826eb97557267e9bf48728c9874810833481.jpg?imageView2/2/w/400">
				</span>
            </div>
            <div class="dataRight">
                <div class="title clear">
                    <h3 class="ellipsis">芒果FUN</h3>
                    <span class="app-try">体验</span>
                </div>
                <div class="score-show2">
					<span>
					<i style="width: 92%;"></i>
					</span>
                    <p>
                        10
                    </p>
                </div>
                <p class="introduce">
                    芒果FUN是湖南卫视旗下，芒果互娱开发和运营的一款以湖南卫视节目IP为主的游戏、互动娱乐移动端产品。
                </p>
            </div>
            <div class="list-bottom clear">
                <label>音乐</label><label>在线音乐</label>
                <p class="view-count">
                    <label></label>14956
                </p>
            </div>
            <div class="qrcode">
                <img src="http://ojyhagqv7.bkt.clouddn.com/20170109/1666dfb5a3269a010ff50a555678b73b180e20c1-0908cb266206b20a1c41e98e6da3ecf990d60439.jpg?imageView2/2/w/400">
                <p>
                    微信体验扫描
                </p>
            </div>
        </a>
        </div>
    </div>--%>

    <div class="showbox containers">
        <div class="title-common clear">
            <h2 class="fl"><label></label>热门小程序</h2>
            <a href="${g.domain}/app/store" class="fr rigth-more">查看更多<label></label></a>
        </div>
        <div class="show-content containers clear wrapper">
            <c:forEach items="${listHot.content}" var="hotAppVO">
                <a class="list" href="${g.domain}/app/${hotAppVO.id}" target="_blank">
                    <div class="imgLeft">
				<span>
				<img onload="setImgWH(this)" src="${hotAppVO.icon}">
				</span>
                    </div>
                    <div class="dataRight">
                        <div class="title clear">
                            <h3 class="ellipsis">${hotAppVO.name}</h3>
                            <span class="app-try">体验</span>
                        </div>
                        <%--<div class="score-show2">
                        <span>
                        <i style="width: 96%;"></i>
                        </span>
                            <p>
                                4
                            </p>
                        </div>--%>
                        <p class="introduce">
                                ${hotAppVO.description}
                        </p>
                    </div>
                    <div class="list-bottom clear">
                        <%--<c:set value="${ fn:split(hotAppVO.tags, ',') }" var="tag"/>
                        <c:forEach items="${ tag }" var="t">
                            <label>${ t }</label>
                        </c:forEach>--%>
                        <c:forEach items="${hotAppVO.categorys}" var="categorys" begin="0" end="2"><label>${categorys.name}</label></c:forEach>
                        <c:if test="${hotAppVO.categorys != null &&fn:length(hotAppVO.categorys)>3}"><label>···</label></c:if>
                        <p class="view-count">
                            <label></label> ${hotAppVO.viewCount}
                        </p>
                    </div>
                    <div class="qrcode">
                        <img src="${hotAppVO.qrcode}">
                        <p>
                            微信体验扫描
                        </p>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>

    <div class="showbox containers">
        <div class="title-common clear">
            <h2 class="fl"><label></label>最新小程序</h2>
            <a href="${g.domain}/app/store" class="fr rigth-more">查看更多<label></label></a>
        </div>
        <div class="show-content containers clear wrapper">
            <c:forEach items="${listNew.content}" var="newAppVO">
                <a class="list" href="${g.domain}/app/${newAppVO.id}" target="_blank">
                    <div class="imgLeft">
				<span>
				<img onload="setImgWH(this)" src="${newAppVO.icon}">
				</span>
                    </div>
                    <div class="dataRight">
                        <div class="title clear">
                            <h3 class="ellipsis">${newAppVO.name}</h3>
                            <span class="app-try">体验</span>
                        </div>
                        <%--<div class="score-show2">
                            <span>
                            <i style="width: 96%;"></i>
                            </span>
                            <p>
                                4
                            </p>
                        </div>--%>
                        <p class="introduce">
                                ${newAppVO.description}
                        </p>
                    </div>
                    <div class="list-bottom clear">
                        <%--<c:set value="${ fn:split(newAppVO.tags, ',') }" var="tag"/>
                        <c:forEach items="${ tag }" var="t">
                            <label>${ t }</label>
                        </c:forEach>--%>
                        <c:forEach items="${newAppVO.categorys}" var="categorys" begin="0" end="2"><label>${categorys.name}</label></c:forEach>
                        <c:if test="${newAppVO.categorys != null &&fn:length(newAppVO.categorys)>3}"><label>···</label></c:if>
                        <p class="view-count">
                            <label></label>${newAppVO.viewCount}
                        </p>
                    </div>
                    <div class="qrcode">
                        <img src="${newAppVO.qrcode}">
                        <p>
                            微信体验扫描
                        </p>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>

    <%--<div id="wrapper-hot" class="hotbox containers clear">
        <div class="title-common clear">
            <h2 class="fl"><label></label>24小时热文</h2>
            <a class="fr rigth-more" href="news">查看更多<label></label></a>
        </div>
        <div class="content clear">
            <a href="news/31" target="_blank">
                <div class="img-hot">
                    <img onload="setImgWH(this)" src="http://ojyhagqv7.bkt.clouddn.com/2017/01/12/58771b2493083.jpg?imageView2/2/w/400"/>
                </div>
                <div class="data-hot">
                    <h3>回顾：张小龙首次公开解读小程序</h3>
                    <div class="foot-hot clear">
                        <label>张小龙</label><label>小程序</label>
                        <p class="view-count fr">
                            <label></label>2692
                        </p>
                    </div>
                </div>
            </a><a href="news/32" target="_blank">
            <div class="img-hot">
                <img onload="setImgWH(this)" src="http://ojyhagqv7.bkt.clouddn.com/2017/01/12/58771c8c123d9.jpg?imageView2/2/w/400"/>
            </div>
            <div class="data-hot">
                <h3>小程序上线首日表现如何？听听首批进驻的企业怎么说</h3>
                <div class="foot-hot clear">
                    <label>小程序</label>
                    <p class="view-count fr">
                        <label></label>3556
                    </p>
                </div>
            </div>
        </a><a href="news/33" target="_blank">
            <div class="img-hot">
                <img onload="setImgWH(this)" src="http://ojyhagqv7.bkt.clouddn.com/2017/01/12/58771d8931c3b.jpg?imageView2/2/w/400"/>
            </div>
            <div class="data-hot">
                <h3>小程序惊艳上线，但为什么我会看衰它</h3>
                <div class="foot-hot clear">
                    <label>小程序</label><label>互联网</label>
                    <p class="view-count fr">
                        <label></label>10472
                    </p>
                </div>
            </div>
        </a><a href="news/34" target="_blank">
            <div class="img-hot">
                <img onload="setImgWH(this)" src="http://ojyhagqv7.bkt.clouddn.com/2017/01/12/58771ecf87915.jpg?imageView2/2/w/400"/>
            </div>
            <div class="data-hot">
                <h3>小程序1月9号将上线，官方详解七大能力</h3>
                <div class="foot-hot clear">
                    <label>腾讯</label><label>小程序</label>
                    <p class="view-count fr">
                        <label></label>10616
                    </p>
                </div>
            </div>
        </a><a href="news/36" target="_blank">
            <div class="img-hot">
                <img onload="setImgWH(this)" src="http://ojyhagqv7.bkt.clouddn.com/2017/01/12/5877206cac68e.jpg?imageView2/2/w/400"/>
            </div>
            <div class="data-hot">
                <h3>高潮已退，再谈小程序的来龙去脉</h3>
                <div class="foot-hot clear">
                    <label>小程序，张小龙</label>
                    <p class="view-count fr">
                        <label></label>9558
                    </p>
                </div>
            </div>
        </a><a href="news/37" target="_blank">
            <div class="img-hot">
                <img onload="setImgWH(this)" src="http://ojyhagqv7.bkt.clouddn.com/2017/01/12/587723cf60fc0.jpg?imageView2/2/w/400"/>
            </div>
            <div class="data-hot">
                <h3>张小龙和小程序，到底想要什么？</h3>
                <div class="foot-hot clear">
                    <label>张小龙</label><label>小程序</label>
                    <p class="view-count fr">
                        <label></label>7514
                    </p>
                </div>
            </div>
        </a><a href="news/38" target="_blank">
            <div class="img-hot">
                <img onload="setImgWH(this)" src="http://ojyhagqv7.bkt.clouddn.com/2017/01/12/587724d279212.jpg?imageView2/2/w/400"/>
            </div>
            <div class="data-hot">
                <h3>小程序对腾讯短期价值提升有限，能否从“可有可无”到“必不可少”是关键</h3>
                <div class="foot-hot clear">
                    <label>小程序</label><label>腾讯</label>
                    <p class="view-count fr">
                        <label></label>10048
                    </p>
                </div>
            </div>
        </a><a href="news/39" target="_blank">
            <div class="img-hot">
                <img onload="setImgWH(this)" src="http://ojyhagqv7.bkt.clouddn.com/2017/01/12/587725d885c79.jpg?imageView2/2/w/400"/>
            </div>
            <div class="data-hot">
                <h3>腾讯的野心：用小程序敲开云时代的大门</h3>
                <div class="foot-hot clear">
                    <label>腾讯</label><label>小程序</label>
                    <p class="view-count fr">
                        <label></label>2700
                    </p>
                </div>
            </div>
        </a>
            <div class="lookmore">
                <a href="news">查看更多</a>
            </div>
        </div>
    </div>--%>
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
        // banner轮播
        var k = 0;
        $(".banner p").hide().eq(0).show();
        $(".dot span").removeClass("active").eq(0).addClass("active");
        $(".b-pre").click(function () {
            clearInterval(autoSlide);
            k--;
            if (k < 0) {
                k = $(".banner p").length - 1;
            }
            $(".banner p").hide().eq(k).fadeIn(800);
            $(".dot span").removeClass("active").eq(k).addClass("active");
        });
        $(".b-next").click(function () {
            clearInterval(autoSlide);
            k++;
            if (k > $(".banner p").length - 1) {
                k = 0;
            }
            $(".banner p").hide().eq(k).fadeIn(800);
            $(".dot span").removeClass("active").eq(k).addClass("active");
        });
        $(".dot span").mouseenter(function () {
            k = $(this).index();
            $(".banner p").hide().eq(k).fadeIn(800);
            $(".dot span").removeClass("active").eq(k).addClass("active");
        });
        var autoSlide = setInterval(function () {
            k++;
            if (k > $(".banner p").length - 1) {
                k = 0;
            }
            $(".banner p").hide().eq(k).fadeIn(800);
            $(".dot span").removeClass("active").eq(k).addClass("active");
        }, 5000);
        $(".banner").mouseenter(function () {
            clearInterval(autoSlide);
        });
        $(".banner").mouseleave(function () {
            autoSlide = setInterval(function () {
                k++;
                if (k > $(".banner p").length - 1) {
                    k = 0;
                }
                $(".banner p").hide().eq(k).fadeIn(800);
                $(".dot span").removeClass("active").eq(k).addClass("active");
            }, 5000);
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        $(".showbox").on('mouseenter', '.list .app-try', function () {
            $(this).parents(".list").find(".qrcode").stop(true, true).fadeIn();
        });
        $(".showbox").on('mouseleave', '.list .app-try', function () {
            $(this).parents(".list").find(".qrcode").hide();
        });
    });
    //图片变大变小
    $(function () {
        $("#wrapper-hot").on('mouseenter', '.content >a', function () {
            $(this).find("img").addClass("scale").removeClass("scale_return");
        });
        $("#wrapper-hot").on('mouseleave', '.content >a', function () {
            $(this).find("img").addClass("scale_return").removeClass("scale");
        });
    });
</script>
<!-- 用于加载js代码 -->
<!-- /底部 -->
</body>
</html>
