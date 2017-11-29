<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%--
<div id="footer" class="clearfix">
  <p id="copyright">
    <span class="copyright">版权所有 ©&nbsp;${g.year}&nbsp;<a href="${g.domain}">${g.title}</a></span>
    <span class="icp">鄂ICP备12046809号</span>
  </p>
  <a id="return_top" href="#">Return Top</a>
</div>
<script src="${g.domain}/resource/js/jscript.js"></script>--%>
<div class="n-foot">
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
  <%--<div class="n-foot-center clear">
    <div class="n-foot-left clear fl">
      <div class="">
        <h3>关于我们</h3>
        <a href="about" target="_blank">公司简介</a>
        <a href="media" target="_blank">媒体报道</a>
      </div>
      <div class="">
        <h3>联系我们</h3>
        <span class="n-qq"><i></i>3554537959</span>
        <a href="http://weibo.com/u/5983694044" target="_blank" class="n-wb"><i></i>关注微博</a>
      </div>
      <div class="">
        <h3>无线产品</h3>
        <a href="https://itunes.apple.com/cn/app/%E5%B0%8F%E7%A8%8B%E5%BA%8F%E5%95%86%E5%BA%97-%E7%AC%AC%E4%B9%9D%E7%A8%8B%E5%BA%8F9-cn/id1195491678" target="_blank">
          <span class="n-ios"><i></i>iPhone版</span>
        </a>
      </div>
    </div>
    <div class="n-foot-right fr">
      <div class="">
        <div class="n-code">
          <img src="/static/pc/images/code-weixin.png">
        </div>
        <p>扫一扫关注我们</p>
      </div>
      <div class="">
        <div class="n-code">
          <img src="/static/pc/images/code-tel.png">
        </div>
        <p>手机访问</p>
      </div>
    </div>
  </div>--%>
  <div class="n-foot-bottom text-center">
    <div>
      <a href="" target="_blank">好程序-小程序商店</a>
      <label></label>
      <a href="${g.domain}/app/rank" target="_blank">排行榜</a>
      <label></label>
      <a href="${g.domain}/app/store" target="_blank">小程序</a>
      <label></label>
      <a href="${g.domain}/app/apply" target="_blank">发布小程序</a>
      <%--<label></label>
      <a href="aboutus" target="_blank">关于我们</a>--%>
    </div>
    <p>Copyright © 2017 hapapp.mobi  京ICP备15045788号-2 <a href="http://www.haoapp.mobi/sitemap.xml">网站地图</a>
      <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1265661486'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s22.cnzz.com/z_stat.php%3Fid%3D1265661486%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script>
    </p>
  </div>
</div>
