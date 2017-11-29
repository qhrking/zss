package com.zss.web.support;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

public class ServletRequestReaderArgumentsResolver implements HandlerMethodArgumentResolver{

  @Override
  public boolean supportsParameter(MethodParameter parameter){
    return parameter.getParameterType() == ServletRequestReader.class;
  }

  @Override
  public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
      NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception{
    return new ServletRequestReader(webRequest.getNativeRequest(HttpServletRequest.class));
  }
}
