/**
 * Copyright (c) 2015-2016, Michael Yang 杨福海 (fuhai999@gmail.com).
 *
 * Licensed under the GNU Lesser General Public License (LGPL) ,Version 3.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.gnu.org/licenses/lgpl-3.0.txt
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.zss.web.front.controller;

import com.zss.biz.AppManager;
import com.zss.core.dal.entity.App;
import com.zss.core.util.DateUtils;
import com.zss.core.util.FileUtils;
import com.zss.core.util.ServletUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/sitemap")
public class SitemapController  {
	@Autowired
	private AppManager appManager;
	private static final String contentType = "text/xml; charset=UTF-8";

	static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:ss:mm'Z'");

	@RequestMapping(method = RequestMethod.GET)
	public void index(HttpServletResponse response) throws IOException {
		StringBuilder xmlBuilder = new StringBuilder();
		buildUrlsetHeader(xmlBuilder);
		String domain = "http://www.haoapp.mobi";
		List<App> apps = appManager.listBySitemap();
		if (apps != null && !apps.isEmpty()) {
			for (App app : apps) {
				String changefreq = "daily";
				String priority = "1.0";
				int dayDiff = DateUtils.getDayDiff(new Date(), app.getUpdateTime());
				if (dayDiff > 30) {
					changefreq = "monthly";
					priority = "0.3";
				} else if (dayDiff > 7) {
					changefreq = "weekly";
					priority = "0.9";
				}
				buildUrl(xmlBuilder, domain + "/app/"+app.getId(), format.format(app.getUpdateTime()), changefreq, priority);
			}
		}
		buildUrlsetFooter(xmlBuilder);
		FileUtils.createFile(new File("").getCanonicalPath(),"sitemap",xmlBuilder.toString(),"xml");
		response.setContentType(contentType);
		ServletUtils.sendText(response, xmlBuilder.toString());
	}

	private void buildSitemapHeader(StringBuilder xmlBuilder) {
		buildHeader(xmlBuilder);
		xmlBuilder.append("<sitemapindex ");
		xmlBuilder.append(" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" ");
		xmlBuilder.append(" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9\" ");
		xmlBuilder.append(" xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\" ");
		xmlBuilder.append(" > ");
	}

	private void buildSitemapFooter(StringBuilder xmlBuilder) {
		xmlBuilder.append("</sitemapindex>");
		buildFooter(xmlBuilder);
	}

	private void buildUrlsetHeader(StringBuilder xmlBuilder) {
		buildHeader(xmlBuilder);
		xmlBuilder.append("<urlset");
		xmlBuilder.append(" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" ");
		xmlBuilder.append(" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9\" ");
		xmlBuilder.append(" xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\" ");
		xmlBuilder.append(" > ");
	}

	private void buildUrlsetFooter(StringBuilder xmlBuilder) {
		xmlBuilder.append("</urlset>");
		buildFooter(xmlBuilder);
	}

	private void buildHeader(StringBuilder xmlBuilder) {
		xmlBuilder.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
	}

	private void buildFooter(StringBuilder xmlBuilder) {
		xmlBuilder.append("<!-- This sitemap was generated by JPress --> ");
	}

	private void buildSitemap(StringBuilder xmlBuilder, String loc, String lastmod) {
		xmlBuilder.append("<sitemap>");
		xmlBuilder.append("<loc>" + loc + "</loc>");
		xmlBuilder.append("<lastmod>" + lastmod + "</lastmod>");
		xmlBuilder.append("</sitemap>");
	}

	private void buildUrl(StringBuilder xmlBuilder, String loc, String lastmod, String changefreq, String priority) {
		xmlBuilder.append("<url>");
		xmlBuilder.append("<loc>" + loc + "</loc>");
		xmlBuilder.append("<lastmod>" + lastmod + "</lastmod>");
		xmlBuilder.append("<changefreq>" + changefreq + "</changefreq>");
		xmlBuilder.append("<priority>" + priority + "</priority>");
		xmlBuilder.append("</url>");
	}

}
