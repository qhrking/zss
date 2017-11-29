<%--
  Created by IntelliJ IDEA.
  User: huazhi
  Date: 2017/1/19
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <title>发布微信小程序-haoapp国内领先的微信小程序商店官网</title>
    <meta name="keywords" content="haoapp,发布小程序,提交小程序,推广小程序,小程序,微信小程序,小程序商店,微信小程序商店,小程序导航,小程序市场,小应用,应用号"/>
    <meta name="description" content="haoapp小程序商店（haoapp）免费发布微信小程序,免费推广小程序,免费提交小程序，haoapp致力于为用户提供优质的微信小程序服务"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="${g.domain}/resource/css/reseting.css" />
    <link rel="stylesheet" type="text/css" href="${g.domain}/resource/css/app-common.css" />
    <link rel="stylesheet" type="text/css" href="${g.domain}/resource/css/lite.css" />

    <script type="text/javascript" src="${g.domain}/resource/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${g.domain}/resource/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="${g.domain}/resource/js/app-common.js" charset="utf-8"></script>
    <script type="text/javascript" src="${g.domain}/resource/js/uploadPreview.js"></script>
    <script type="text/javascript" src="${g.domain}/resource/js/ask.common.js"></script>
    <%--<script type="text/javascript" src="${g.domain}/resource/webuploader-0.1.5/webuploader.min.js"></script>--%>
    <%--<script type="text/javascript" src="${g.domain}/resource/js/app.upload.js"></script>--%>
    <script src="http://apps.bdimg.com/libs/layer/2.0/layer.js"></script>
</head>

<body>

<%--<script type="text/javascript" src="static/common/js/webuploader/webuploader.js"></script>
<script type="text/javascript" src="static/common/js/layer/layer.js"></script>--%>

<div class="body-container">

    <jsp:include page="common/header.jsp" flush="false" />

    <div class="title_common containers">
        <a href="">首页</a>
        <label></label>
        <a href="${g.domain}/app">小程序商店</a>
        <label></label>
        <a>发布</a>
    </div>

    <div class="releasebox containers">
        <div class="title">发布小程序</div>
        <form action="/app/add" method="post" enctype="multipart/form-data">
        <div class="release-content">
            <h2>小程序 &nbsp;&nbsp;名称</h2>
            <div class="lite_name">
                <!--<span>0/10</span>-->
                <input class="am-g" type="text" name="name" id="name" maxlength="10" placeholder="请输入小程序名称">
            </div>
            <h2>小程序 &nbsp;&nbsp;作者</h2>
            <div class="lite_name">
                <!--<span>0/10</span>-->
                <input class="am-g" type="text" name="author" id="author" maxlength="10" placeholder="请输入小程序作者">
            </div>

            <h2>小程序 &nbsp;&nbsp;ICON / 二维码<span>建议尺寸：不小于 400×400px，并且为正方形</span></h2>
            <div class="clear oneimg">
                <div id="filelist1" class="files fl">
                    <span id="filePicker1" class="file-btn">
                        <img id="iconImg" onload="setImgWH(this)" src="${g.domain}/resource/img/file1.png">
                        <input type="file" name="iconFile">
                    </span>
                    <p>上传ICON</p>
                </div>
                <div id="filelist2" class="files fl">
                    <span id="filePicker2" class="file-btn">
                        <img id="qrcodeImg" onload="setImgWH(this)" src="${g.domain}/resource/img/file1.png">
                        <input type="file" name="qrcodeFile">
                    </span>
                    <p>上传二维码</p>
                </div>
            </div>
            <h2>小程序 &nbsp;&nbsp;介绍</h2>
            <div class="lite_content">
                <!--<span>0/30</span>-->
                <textarea class="am-g" name="description" id="description" maxlength="30" placeholder="请输入小程序介绍"></textarea>
            </div>
            <h2 class="special">小程序 &nbsp;&nbsp;分类</h2>
            <div class="sorts clear">
                <c:forEach items="${categoryList}" var="category">
                    <a data-id="${category.id}">${category.name}</a>
                </c:forEach>
                <div id="category-input">
                </div>
            </div>
            <h2 class="special2">小程序 &nbsp;&nbsp;标签<span>（选填）每个标签字数不超 6个字,多个用井号（#）隔开</span></h2>
            <div class="lite_name">
                <input class="am-g" type="text" name="tags" id="tags" placeholder="请输入小程序标签">
            </div>
            <h2>小程序 &nbsp;&nbsp;截图<span>建议尺寸：750x1334px（最多不超过五张)</span></h2>
            <div class="upload2 clear">
                <div class="files4">
                    <span  class="file-btn3">
                        <img  onload="setImgWH(this)" src="${g.domain}/resource/img/file2.png">
                        <input type="file" name="picFile">
                    </span>
                </div>
                <div class="files4">
                    <span  class="file-btn3">
                        <img  onload="setImgWH(this)" src="${g.domain}/resource/img/file2.png">
                        <input type="file" name="picFile">
                    </span>
                </div>
                <div class="files4">
                    <span  class="file-btn3">
                        <img  onload="setImgWH(this)" src="${g.domain}/resource/img/file2.png">
                        <input type="file" name="picFile">
                    </span>
                </div>
                <div class="files4">
                    <span  class="file-btn3">
                        <img  onload="setImgWH(this)" src="${g.domain}/resource/img/file2.png">
                        <input type="file" name="picFile">
                    </span>
                </div>
                <div class="files4">
                    <span  class="file-btn3">
                        <img  onload="setImgWH(this)" src="${g.domain}/resource/img/file2.png">
                        <input type="file" name="picFile">
                    </span>
                </div>
            </div>
            <h2>联系方式</h2>
            <div class="lite_name">
                <input class="am-g" type="text" maxlength="50"  id="contactInfo" placeholder="输入联系QQ/手机号/邮箱">
            </div>
            <input  type="hidden" name="remark">
            <div class="release-save">
                <p>联系QQ：792424839，加快审核进度，获得独家曝光机会</p>
                <div class="text-center">
                    <input class="save" type="submit" value="保存并上传">
                    <a class="cancel" onclick="history.back();">取消</a>
                </div>
            </div>
        </div>
        </form>
    </div>

    <jsp:include page="common/footer.jsp" flush="false" />
    <div class="fixed_box" style="bottom: 120px; right: 321.5px;"><a class="to_top" style="display: block;"></a></div>
    <%--<script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?8cc9de2a3236780c668bf1a63e533ab2";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>--%>

</div>

<%--<script type="text/javascript">
    var UPLOAD_URL = "file/upload.html";
    var SWF_URL = 'static/common/js/webuplader/Uploader.swf';
    var LOADING_IMG = '/loading.gif';
</script>--%>

<%--<script type="text/javascript" src="static/common/js/common.js" charset="utf-8"></script>--%>

<script>
    $(function () {
        if(${!empty success}){//success 不为空时 是add成功  为空时展示添加页面
            if(${empty success ?false:success}){//防止 success 报错 设置为空时则为false
                layer.msg('发布成功，请等待管理员审核！');
            }else{
                layer.msg('${msg}');
            }
        }

        /*upload1();
        upload2();
        upload3();
        upload4();*/

        $(":file").uploadPreviewMulti({ Img: "none", Width: 120, Height: 120,Callback: function (obj) {
            /*obj.next().remove();*/
        }});


        var categoryCount=0;
        $(".sorts a").click(function () {
            if(categoryCount<5){
                if($(this).attr('class')!="active"){
                    $(this).addClass("active").append("<span style='margin-left: 6px;'>✖</span>");
                    setCategoryIds();
                }else{
                    $(this).removeClass("active");
                    $(this).find("span").remove();
                    setCategoryIds();
                }

            }else  if(categoryCount==5&&$(this).attr('class')=="active"){
                    $(this).removeClass("active");
                    $(this).find("span").remove();
                    setCategoryIds();
            }else{
                layer.msg("最多可以选择5个分类");
            }

        });

        function setCategoryIds(){
            $("#category-input").empty();
            categoryCount=0;
            $(".sorts a").each(function(){
                if($(this).attr('class')=="active"){
                    var input = document.createElement('input');  //创建input节点
                    input.setAttribute('type', 'hidden');  //定义类型是文本输入
                    input.setAttribute('name', 'categoryId');  //定义类型是文本输入
                    input.setAttribute('value', $(this).attr('data-id'));  //定义类型是文本输入
                    $("#category-input").append(input);
                    categoryCount++;
                }
            })
        }

        // 保存
        $('#save').click(function () {
            var params = get_params();
            $.post(ask.getDomainLink('app/add'), params, function (data) {
                if (data.success) {
                    layer.msg('发布成功，请等待管理员审核！');
                    setTimeout(function () {
                        window.location.href = "";
                    }, 1000);
                } else {
                    layer.msg(data.msg);
                }
            });
        });
    });

    function get_params() {
        var name = $('#name').val(),
                author = $('#author').val(),
                description = $('#description').val(),
                categoryId = $('#categoryId').val(),
                tags = $('#tags').val();
        var params = {
            name: name,
            author: author,
            description: description,
            categoryId: categoryId,
            tags: tags
        };


        return params;
    }
</script>

</body>
</html>

