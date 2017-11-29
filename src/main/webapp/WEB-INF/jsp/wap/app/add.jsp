<%--
  Created by IntelliJ IDEA.
  User: huazhi
  Date: 2017/5/16
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta id="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
  <link rel="apple-touch-icon-precomposed" href="__PUBLIC__/images/favicon2.ico"/>
  <title>发布微信小程序-haoapp国内领先的微信小程序商店官网</title>
  <meta name="keywords" content="haoapp,发布小程序,提交小程序,推广小程序,小程序,微信小程序,小程序商店,微信小程序商店,小程序导航,小程序市场,小应用,应用号"/>
  <meta name="description" content="haoapp小程序商店（haoapp）免费发布微信小程序,免费推广小程序,免费提交小程序，haoapp致力于为用户提供优质的微信小程序服务"/>
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/m/css/reset.min.css">
  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/m/css/layout.css">
<%--  <link rel="stylesheet" type="text/css" href="${g.domain}/resource/m/js/swiper/swiper.min.css">--%>
  <script type="text/javascript" src="${g.domain}/resource/js/jquery-1.8.2.min.js"></script>
  <script type="text/javascript" src="${g.domain}/resource/js/jquery.cookie.js"></script>
  <script type="text/javascript" src="${g.domain}/resource/js/app-common.js" charset="utf-8"></script>
  <script type="text/javascript" src="${g.domain}/resource/js/uploadPreview.js"></script>
  <script type="text/javascript" src="${g.domain}/resource/js/ask.common.js"></script>
  <script type="text/javascript" src="${g.domain}/resource/m/js/adaptive-version.js"></script>
  <script src="http://apps.bdimg.com/libs/layer/2.0/layer.js"></script>
</head>
<body>
<div class="page">
  <form action="/app/add" method="post" enctype="multipart/form-data">
    <div class="m-container bottom">
      <div class="release scroll-tag">
        <div class="release-title b-bottom-e5">发布小程序</div>
        <div class="release-content">
          <div class="release-tag">
            <span>小程序 名称</span>
          </div>
          <div class="text">
            <input type="text" name="name" id="name" maxlength="15" placeholder="请输入小程序名称">
            <span>0/15</span>
          </div>

          <div class="release-tag">
            <span>小程序 作者</span>
          </div>
          <div class="text">
            <input type="text" name="author" id="author" maxlength="15" placeholder="请输入小程序作者">
            <span>0/15</span>
          </div>

          <div class="release-tag">
            <span>小程序 ICON/二维码</span>
            <small>建议尺寸：不小于 400×400px，且为正方形</small>
          </div>
          <div class="upload clear">
            <div id="filelist1" class="item">
                            <span id="filePicker1" class="file-btn">
                                <img id="img1" src="${g.domain}/resource/img/file1.png" alt="..." style="width: 100%">
                                <input type="file" name="iconFile">
                            </span>
              <p>上传ICON</p>
            </div>
            <div id="filelist2" class="item">
                            <span id="filePicker2" class="file-btn">
                                <img id="img2" src="${g.domain}/resource/img/file1.png" alt="..." style="width: 100%">
                                <input type="file" name="qrcodeFile">
                            </span>
              <p>上传二维码</p>
            </div>
            <%--<div id="filelist3" class="item">
                            <span id="filePicker3" class="file-btn">
                                <img id="img3" src="${g.domain}/resource/img/file1.png" alt="..." style="width: 100%">
                            </span>
              <p>上传公众号二维码</p>
            </div>--%>
          </div>

          <div class="release-tag"><span>小程序 介绍</span></div>
          <div class="text">
            <textarea name="description" id="description" class="textarea" maxlength="300" placeholder="请输入小程序介绍"></textarea>
            <span style="top: auto; bottom: 0;">0/300</span>
          </div>

          <div class="release-tag" style="margin-top: .1rem;"><span>小程序 分类</span></div>
          <div class="sorts">
            <!-- 选择分类 -->
            <c:forEach items="${categoryList}" var="category">
              <a data-id="${category.id}">${category.name}</a>
            </c:forEach>
            <div id="category-input">
            </div>
            <%--<input type="text" id="release-classify" value="" name="" readonly placeholder="选择分类">--%>
            <%--<i style=" position: absolute; top: .3rem; right: .1rem; border-left: .12rem solid transparent; border-right: .12rem solid transparent; border-top: .18rem solid #bbb;"></i>--%>
          </div>

          <div class="release-tag" style="margin-top: .1rem;"><span>小程序 标签</span></div>
          <div class="text">
            <input type="text" name="tags" id="tags" placeholder="输入小程序标签，多个用英文逗号隔开">
          </div>

          <div class="release-tag"><span>小程序 截图</span><small>建议尺寸：750x1334px（最多不超过五张)</small></div>
          <div class="cutimg-upload clear">
            <div class="item">
              <span  class="file-btn">
                  <img  src="${g.domain}/resource/img/file2.png" alt="...">
                  <input type="file" name="picFile">
              </span>
            </div>
            <div class="item" >
              <span  class="file-btn">
                  <img  src="${g.domain}/resource/img/file2.png" alt="...">
                  <input type="file" name="picFile">
              </span>
            </div>
            <div class="item" >
              <span  class="file-btn">
                  <img  src="${g.domain}/resource/img/file2.png" alt="...">
                  <input type="file" name="picFile">
              </span>
            </div>
            <div class="item" >
              <span  class="file-btn">
                  <img  src="${g.domain}/resource/img/file2.png" alt="...">
                  <input type="file" name="picFile">
              </span>
            </div>
          </div>

          <div class="release-tag" style="margin-top: .1rem;"><span>联系方式</span></div>
          <div class="text">
            <input type="text"  id="contactInfo" placeholder="输入联系QQ/手机号/邮箱">
          </div>
          <p class="release-contact">联系QQ：792424839，加快审核进度，获得独家曝光机会</p>
        </div>
      </div>
    </div>
    <input  type="hidden" name="remark">
    <div class="m-bottom">
      <input class="release-btn" type="submit" value="发布">
    </div>
  </form>
</div>
<%--<link rel="stylesheet" type="text/css" href="${g.domain}/resource/m/js/swiper/swiper.min.css">--%>
<%--<script type="text/javascript" src="${g.domain}/resource/common/js/jquery.min.js"></script>--%>
<script type="text/javascript" src="${g.domain}/resource/m/js/touch-0.2.14.min.js"></script>
<script type="text/javascript" src="${g.domain}/resource/m/js/clipboard.min.js?1.0.14"></script>
<%--<script type="text/javascript" src="${g.domain}/resource/m/js/swiper/swiper.min.js"></script>--%>
<script type="text/javascript" src="${g.domain}/resource/common/layer/layer.js"></script>
<script type="text/javascript" src="${g.domain}/resource/m/js/common.min.js?1.0.24"></script>
<script type="text/javascript">
  //处理图片的宽高
  function setImgWH(obj) {
    $(obj).removeAttr('style');
    if (obj.width < obj.height) {
      $(obj).css('height', '100%');
    } else {
      $(obj).css('width', '100%');
    }
  }
</script>
<%--<script type="text/javascript">
  var UPLOAD_URL = "/file/upload";
  var SWF_URL = '/static/common/js/webuplader/Uploader.swf';
</script>
<script type="text/javascript" src="static/common/js/webuploader/webuploader.js"></script>
<script type="text/javascript" src="static/m/js/public.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="static/common/js/layer/skin/layer.css">
<script type="text/javascript" src="static/common/js/layer/layer.js"></script>
<script type="text/javascript" src="static/m/js/picker.min.js"></script>
<script type="text/javascript">
  var city = [{"id":"1","pid":"0","title":"\u89c6\u9891","code":"shipin","icon":"http:\/\/ojyhagqv7.bkt.clouddn.com\/9cn_201701235a7ff168a6f0b548154705c9982c8d9c.png","status":"1","listorder":"0","sub":[{"id":"2","pid":"1","title":"\u5728\u7ebf\u89c6\u9891","code":"zaixianshipin","icon":"","status":"1","listorder":"0"}]},{"id":"3","pid":"0","title":"\u793e\u4ea4","code":"shejiao","icon":"http:\/\/ojyhagqv7.bkt.clouddn.com\/9cn_20170123f0c728c6f58487e5f35a3532a82d2db6.png","status":"1","listorder":"100","sub":[{"id":"4","pid":"3","title":"\u5a5a\u604b","code":"hunlian","icon":"","status":"1","listorder":"0"},{"id":"5","pid":"3","title":"\u793e\u533a","code":"shequ","icon":"","status":"1","listorder":"0"},{"id":"6","pid":"3","title":"\u8868\u60c5\u5934\u50cf","code":"biaoqingtouxiang","icon":"","status":"1","listorder":"0"},{"id":"59","pid":"3","title":"\u5a31\u4e50","code":"yule","icon":"","status":"1","listorder":"0"}]},{"id":"7","pid":"0","title":"\u9605\u8bfb","code":"yuedu","icon":"http:\/\/ojyhagqv7.bkt.clouddn.com\/9cn_201701235d8011d130040dbe7a4aed881d38b14f.png","status":"1","listorder":"0","sub":[{"id":"8","pid":"7","title":"\u8d44\u8baf","code":"zixun","icon":"","status":"1","listorder":"0"},{"id":"9","pid":"7","title":"\u6742\u5fd7","code":"zazhi","icon":"","status":"1","listorder":"0"},{"id":"10","pid":"7","title":"\u542c\u4e66","code":"tingshu","icon":"","status":"1","listorder":"0"},{"id":"11","pid":"7","title":"\u6f2b\u753b","code":"manhua","icon":"","status":"1","listorder":"0"},{"id":"67","pid":"7","title":"\u7535\u5b50\u4e66","code":"dianzhishu","icon":"","status":"1","listorder":"0"}]},{"id":"12","pid":"0","title":"\u8d2d\u7269","code":"gouwu","icon":"http:\/\/ojyhagqv7.bkt.clouddn.com\/9cn_2017012362cb5c798ca11fc089252bef99243eff.png","status":"1","listorder":"0","sub":[{"id":"13","pid":"12","title":"\u5546\u57ce","code":"shangcheng","icon":"","status":"1","listorder":"0"},{"id":"14","pid":"12","title":"\u56e2\u8d2d","code":"tuangou","icon":"","status":"1","listorder":"0"},{"id":"73","pid":"12","title":"\u798f\u5229","code":"fuli","icon":"","status":"1","listorder":"0"},{"id":"74","pid":"12","title":"\u4e8c\u624b","code":"ershou","icon":"","status":"1","listorder":"0"}]},{"id":"15","pid":"0","title":"\u65c5\u6e38","code":"lvyou","icon":"http:\/\/ojyhagqv7.bkt.clouddn.com\/9cn_20170123a2ad9690feb87e1f77cee1498956fabf.png","status":"1","listorder":"97","sub":[{"id":"16","pid":"15","title":"\u65c5\u884c","code":"lvxing","icon":"","status":"1","listorder":"0"},{"id":"17","pid":"15","title":"\u653b\u7565","code":"gonglue","icon":"","status":"1","listorder":"0"},{"id":"18","pid":"15","title":"\u9152\u5e97\u4f4f\u5bbf","code":"jiudianzhusu","icon":"","status":"1","listorder":"0"}]},{"id":"19","pid":"0","title":"\u97f3\u4e50","code":"yinyue","icon":"http:\/\/ojyhagqv7.bkt.clouddn.com\/9cn_2017012378937fe72580e6c3226630c88b271dee.png","status":"1","listorder":"99","sub":[{"id":"20","pid":"19","title":"\u5728\u7ebf\u97f3\u4e50","code":"zaixianyinyue","icon":"","status":"1","listorder":"0"}]},{"id":"21","pid":"0","title":"\u51fa\u884c","code":"chuxing","icon":"http:\/\/ojyhagqv7.bkt.clouddn.com\/9cn_201701234bd6cea2da25873b022c6bebaee84659.png","status":"1","listorder":"98","sub":[{"id":"22","pid":"21","title":"\u4ea4\u901a","code":"jiaotong","icon":"","status":"1","listorder":"0"},{"id":"23","pid":"21","title":"\u822a\u73ed","code":"hangbang","icon":"","status":"1","listorder":"0"}]},{"id":"24","pid":"0","title":"\u91d1\u878d","code":"jinrong","icon":"http:\/\/ojyhagqv7.bkt.clouddn.com\/9cn_20170123648ef23ccdbcce83416360f55c7bf107.png","status":"1","listorder":"0","sub":[{"id":"25","pid":"24","title":"\u7406\u8d22","code":"licai","icon":"","status":"1","listorder":"0"},{"id":"26","pid":"24","title":"\u521b\u6295","code":"chuangtou","icon":"","status":"1","listorder":"0"}]},{"id":"27","pid":"0","title":"\u6559\u80b2","code":"jiaoyu","icon":"http:\/\/ojyhagqv7.bkt.clouddn.com\/9cn_20170123711cdfc791a909e201c0396f7da50f80.png","status":"1","listorder":"0","sub":[{"id":"28","pid":"27","title":"\u5355\u8bcd\u5b57\u5178","code":"dancizidian","icon":"","status":"1","listorder":"0"},{"id":"29","pid":"27","title":"\u513f\u7ae5\u6559\u80b2","code":"ertongjiaoyu","icon":"","status":"1","listorder":"0"},{"id":"57","pid":"27","title":"\u9a7e\u8003","code":"jiakao","icon":"","status":"1","listorder":"0"},{"id":"58","pid":"27","title":"\u5b66\u4e60","code":"xuexi","icon":"","status":"1","listorder":"0"}]},{"id":"30","pid":"0","title":"\u56fe\u50cf","code":"tuxiang","icon":"http:\/\/ojyhagqv7.bkt.clouddn.com\/9cn_20170123396438eaa8b87bf7caead85d32b9ec14.png","status":"1","listorder":"0","sub":[{"id":"31","pid":"30","title":"\u7f8e\u5316\u6ee4\u955c","code":"meihualvjing","icon":"","status":"1","listorder":"0"},{"id":"63","pid":"30","title":"\u6444\u5f71","code":"sheying","icon":"","status":"1","listorder":"0"}]},{"id":"32","pid":"0","title":"\u5de5\u5177","code":"gongju","icon":"http:\/\/ojyhagqv7.bkt.clouddn.com\/9cn_20170123138db7717258bcb678147b2aa3c3f330.png","status":"1","listorder":"0","sub":[{"id":"33","pid":"32","title":"\u5929\u6c14","code":"tianqi","icon":"","status":"1","listorder":"0"},{"id":"34","pid":"32","title":"\u65e5\u5386","code":"rili","icon":"","status":"1","listorder":"0"},{"id":"35","pid":"32","title":"\u65f6\u949f","code":"shizhong","icon":"","status":"1","listorder":"0"},{"id":"51","pid":"32","title":"\u67e5\u8be2","code":"cahxun","icon":"","status":"1","listorder":"0"},{"id":"52","pid":"32","title":"\u8ba1\u7b97\u5668","code":"jisuanqi","icon":"","status":"1","listorder":"0"},{"id":"68","pid":"32","title":"\u540d\u7247","code":"mingpian","icon":"","status":"1","listorder":"0"},{"id":"72","pid":"32","title":"\u8d2d\u7968","code":"goupiao","icon":"","status":"1","listorder":"0"}]},{"id":"36","pid":"0","title":"\u751f\u6d3b","code":"shenghuo","icon":"http:\/\/ojyhagqv7.bkt.clouddn.com\/9cn_20170123d317b5f591707797f780370e1123614d.png","status":"1","listorder":"0","sub":[{"id":"37","pid":"36","title":"\u5bb6\u88c5","code":"jiazhuang","icon":"","status":"1","listorder":"0"},{"id":"38","pid":"36","title":"\u6c7d\u8f66","code":"qiche","icon":"","status":"1","listorder":"0"},{"id":"56","pid":"36","title":"\u7f8e\u98df","code":"meishi","icon":"","status":"1","listorder":"0"},{"id":"66","pid":"36","title":"\u7968\u52a1","code":"piaowu","icon":"","status":"1","listorder":"0"},{"id":"70","pid":"36","title":"\u623f\u4ea7","code":"fangchan","icon":"","status":"1","listorder":"0"},{"id":"71","pid":"36","title":"\u5bb6\u653f\u670d\u52a1","code":"jiazhengfuwu ","icon":"","status":"1","listorder":"0"}]},{"id":"39","pid":"0","title":"\u5065\u5eb7","code":"yundongjiankang","icon":"http:\/\/ojyhagqv7.bkt.clouddn.com\/9cn_201701239212fa5e0ab070d1209daf0b7c6f189f.png","status":"1","listorder":"0","sub":[{"id":"40","pid":"39","title":"\u8fd0\u52a8","code":"yundong","icon":"","status":"1","listorder":"0"},{"id":"41","pid":"39","title":"\u5065\u5eb7","code":"jiankang","icon":"","status":"1","listorder":"0"}]},{"id":"42","pid":"0","title":"\u6bcd\u5a74","code":"muying","icon":"http:\/\/ojyhagqv7.bkt.clouddn.com\/9cn_2017012309f7557bf6b17b8aafd2a212b119132c.png","status":"1","listorder":"0","sub":[{"id":"43","pid":"42","title":"\u7ecf\u671f","code":"jingqi","icon":"","status":"1","listorder":"0"},{"id":"44","pid":"42","title":"\u80b2\u513f","code":"yuer","icon":"","status":"1","listorder":"0"},{"id":"45","pid":"42","title":"\u7f8e\u5986","code":"meizhuang","icon":"","status":"1","listorder":"0"}]},{"id":"49","pid":"0","title":"\u4f53\u80b2","code":"tiyu","icon":"http:\/\/ojyhagqv7.bkt.clouddn.com\/9cn_20170123a6ad7b29d23a8e9ace91a976cc13e8ff.png","status":"1","listorder":"1","sub":[{"id":"50","pid":"49","title":"\u8db3\u7403","code":"zuqiu","icon":"","status":"1","listorder":"0"},{"id":"65","pid":"49","title":"\u7efc\u5408","code":"zonghe","icon":"","status":"1","listorder":"0"},{"id":"69","pid":"49","title":"\u7bee\u7403","code":"lanqiu","icon":"","status":"1","listorder":"0"}]},{"id":"53","pid":"0","title":"\u529e\u516c","code":"bangong","icon":"http:\/\/ojyhagqv7.bkt.clouddn.com\/9cn_201701236ca28671f5bd03641b879bc516eb97ff.png","status":"1","listorder":"0","sub":[{"id":"54","pid":"53","title":"\u5b58\u50a8","code":"cunchu","icon":"","status":"1","listorder":"0"},{"id":"55","pid":"53","title":"\u529e\u516c\u8f6f\u4ef6","code":"bangongruanjian","icon":"","status":"1","listorder":"0"}]}];
</script>
<script type="text/javascript" src="static/m/js/pick-common.js"></script>--%>
<script type="text/javascript">
  $(function () {
      if(${!empty success}){//success 不为空时 是add成功  为空时展示添加页面
          if(${empty success ?false:success}){//防止 success 报错 设置为空时则为false
              layer.msg('发布成功，请等待管理员审核！');
          }else{
              layer.msg('${msg}');
          }
      }


    //输入框字数赋值
    $("#title").keyup(function () {
      var len = $("#title").val().length;
      $("#title").siblings('span').text(len + '/15');
    });
    $("#author").keyup(function () {
      var len = $("#author").val().length;
      $("#author").siblings('span').text(len + '/15');
    });
    $("#content").keyup(function () {
      var len = $("#content").val().length;
      $("#content").siblings('span').text(len + '/300');
    });
    // 分类
    $(".device-border").click(function () {
      $(".device-border").removeClass("on");
      $(this).addClass("on");
      $("#cat_ids").val($(this).attr('data-cat-value'));
    });



    $(":file").uploadPreviewMulti({ Img: "none", Width: 120, Height: 120,Callback: function (obj) {
      /*obj.next().remove();*/
    }});

    var categoryCount=0;
    $(".sorts a").click(function () {
      if(categoryCount<5){
        if($(this).attr('class')!="active"){
          $(this).addClass("active");
          setCategoryIds();
        }else{
          $(this).removeClass("active");
          setCategoryIds();
        }

      }else  if(categoryCount==5&&$(this).attr('class')=="active"){
        $(this).removeClass("active");
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


    // 保存
    /*$('#save').click(function () {
      var params = get_params();
      $.post("/app/apply", params, function (msg) {
        if (msg.status == 1) {
          layer.msg('<p>发布成功</p><p>请等待管理员审核！</p>');
          setTimeout(function () {
            window.location.href = "/";
          }, 1000);
        } else {
          layer.msg(msg.info);
        }
      });
    });*/
  });

  function get_params() {
    var title = $('#title').val(),
            author = $('#author').val(),
            icon = $('#icon').val(),
            qrcode = $('#qrcode').val(),
            open_qrcode = $('#open_qrcode').val(),
            content = $('#content').val(),
            pid = $('#pid').val(),
            cid = $('#cid').val(),
            attr_imgs = $('#attr_imgs').val(),
            tags = $('#tags').val(),
            qq = $('#qq').val()
    var params = {
      title: title,
      author: author,
      icon: icon,
      qrcode: qrcode,
      open_qrcode: open_qrcode,
      content: content,
      pid: pid,
      cid: cid,
      attr_imgs: attr_imgs,
      tags: tags,
      qq: qq
    };

    return params;
  }

</script>
<jsp:include page="../common/cnzz.jsp" />
</body>
</html>