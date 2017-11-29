<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--尾部-->
<div class="m-bottom b-top-e5">
  <div class="bottom-menu">
    <a href="${g.domain}/app" class="recommend "> <span></span> <p>精选推荐</p> </a>
    <a href="${g.domain}/app/store" class="classify "> <span></span> <p>类别</p> </a>
    <a href="${g.domain}/app/rank" class="ranking "> <span></span> <p>排行榜</p> </a>
    <a href="${g.domain}/search/" class="search"> <span></span> <p>搜索</p> </a>
    <a href="${g.domain}/app/apply" class="apply"> <span></span> <p>发布</p> </a>
  </div>
</div>
<c:if test="${not empty param.index}">
  <script type="text/javascript">
    /* 导航选中 */
  $(".bottom-menu>a").eq(${param.index}).addClass("active").siblings().removeClass("active");
  </script>
</c:if>
<script>
    (function(){
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https'){
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else{
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
</script>

