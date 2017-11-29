package com.zss.core.dal.mapper;

import com.zss.core.plugin.PageModel;
import com.zss.service.vo.AppVO;

import java.util.List;

public interface AppMapper extends BaseMapper{

    AppVO getAppVOById(Integer appId);

    List<AppVO> listByCondition(PageModel<AppVO> model);

    List<AppVO> listHot(PageModel<AppVO> model);

    List<AppVO> listByName(String name);

}
