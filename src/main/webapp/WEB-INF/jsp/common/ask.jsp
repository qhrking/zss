<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="${g.domain}/resource/css/ask.css">
<link rel="stylesheet" type="text/css" href="${g.domain}/resource/css/ask-common.css">
<script type="text/javascript" src="${g.domain}/resource/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${g.domain}/resource/js/jquery.cookie.js"></script>
<script src="${g.domain}/resource/js/ask.common.js"></script>

<div class="main-content"  style="width: 680px;">
  <div class="quiz">
    <div class="h2">提问5分钟后就有回答</div>
    <p class="ask-notice">清晰描述您的提问，可以获得更加准确的回答</p>
    <c:if test="${answerUser !=null}">
      <div class="quiz-target clear">
        <span class="qu1"></span>
        <span class="qu2">向</span>
        <div class="target">
          <a href="user/${answerUser.userId}" target="_blank" class="tar-name"> ${answerUser.platformUserName}</a>
            <%--<div class="User-W2">
              <div class="toparr"></div>
              <div class="botblock">
                <ul class="user-p">
                  <li><a href="#" class="pe1"><img ></a></li>
                  <li><a href="#" class="pe2">那片海yaya</a></li>
                  <li><a href="#" class="pe3">简介：留学e网、澳洲留学顾问</a></li>
                </ul>
                <div class="i-w">
                  <ul class="user-i clear">
                    <li><a href="#" class="pe4"><span>回答</span><span>214</span></a><span>&nbsp;&nbsp;|</span></li>
                    <li><a href="#" class="pe4"><span>提问</span><span>47</span></a><span>&nbsp;&nbsp;|</span></li>
                    <li><a href="#" class="pe4"><span>获赞</span><span>12</span></a></li>
                  </ul>
                  <div class="user-a"><a href="#" class="pe7">向TA提问</a></div>
                </div>
              </div>
            </div>--%>
        </div>
        <span class="qu2">提问</span>
      </div>
      <input type="hidden"  name="answerUserId" value="${answerUser.userId}">
    </c:if>
    <input type="text" placeholder="在这里简要描述您的问题" class="sim-sub" name="questionTitle">
    <p class="leftsideBar">补充说明 (选填)</p>
    <div class="area-wrap">
      <textarea placeholder="在这里可以详细描述您的问题，详细全面的问题有助于得到更专业的回答哦" class="my-co" name="questionContent" id="questionContent"></textarea>
    </div>

    <%--<div id="picker" class="add-p">
      <a href="#">+添加图片</a>
    </div>--%>
    <!--dom结构部分-->
    <div id="uploader">
      <i>（图片限制4张以内）</i>
      <div id="filePicker">添加图片</div>
      <!--用来存放item-->
      <div id="fileList" class="uploader-list"></div>
    </div>

    <p class="leftsideBar tag-selected">已选择标签：<i>标签限制6个以内，精准的标签更利于你的问题被回答</i>
    </p>
    <p class="leftsideBar tag-selectable" style="margin-top:0.25rem">可选择标签：</p>
    <c:if test="${msg != null }">
      <span class="error-tip" >*${msg}</span>
    </c:if>
    <input type="button" value="提交问题" class="submit" onclick="ask.question.add();">
  </div>
</div>

<!-- 提问 end-->

<script type="text/javascript" src="${g.domain}/resource/webuploader-0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="${g.domain}/resource/js/ask.ask.js"></script>
<script type="text/javascript" src="${g.domain}/resource/js/ask.upload.js"></script>
<script>
  //var index = parent.layer.getFrameIndex(window.name); //获取窗口索引

  //让层自适应iframe
  $('#add').on('click', function(){
    $('body').append('插入很多酱油。插入很多酱油。插入很多酱油。插入很多酱油。插入很多酱油。插入很多酱油。插入很多酱油。');
    parent.layer.iframeAuto(index);
  });
  //在父层弹出一个层
  $('#new').on('click', function(){
    parent.layer.msg('Hi, man', {shade: 0.3})
  });
  //给父页面传值
  $('#transmit').on('click', function(){
    parent.$('#parentIframe').text('我被改变了');
    parent.layer.tips('Look here', '#parentIframe', {time: 5000});
    parent.layer.close(index);
  });
  //关闭iframe
  window.domain="192.168.0.16";
  $('.ask-notice').click(function(){
    parent.location.reload(); // 父页面刷新
    var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
    parent.layer.close(index);
  });


</script>
