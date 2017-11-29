package com.zss.core.tag;

import com.zss.core.plugin.PageModel;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class FirstTag extends AbstartTagSupport{
  private static final long serialVersionUID = 1L;

  @Override
  public int doStartTag() throws JspException{
    PageModel<?> model = getPagination().getModel();

    if(model.getPageIndex() > 2){
      setPageAttribute(1);
      return TagSupport.EVAL_BODY_INCLUDE;
    }else{
      return TagSupport.SKIP_BODY;
    }
  }

}
