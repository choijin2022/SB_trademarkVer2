package com.cji.exam.trademark.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.cji.exam.trademark.interceptor.BeforeActionInterceptor;
import com.cji.exam.trademark.interceptor.NeedLoginInterceptor;
import com.cji.exam.trademark.interceptor.NeedLogoutInterceptor;

@Configuration
public class MyWebMvcConfigurer implements WebMvcConfigurer {

	private BeforeActionInterceptor beforeActionInterceptor;
	private NeedLoginInterceptor needLoginInterceptor;
	private NeedLogoutInterceptor needLogoutInterceptor;
	
	/*
	@Value("${custom.genFileDirPath}")
	private String genFileDirPath;
*/
	@Autowired
	public MyWebMvcConfigurer(BeforeActionInterceptor beforeActionInterceptor,
			NeedLoginInterceptor needLoginInterceptor, NeedLogoutInterceptor needLogoutInterceptor) {
		this.beforeActionInterceptor = beforeActionInterceptor;
		this.needLoginInterceptor = needLoginInterceptor;
		this.needLogoutInterceptor = needLogoutInterceptor;
	}
	/*
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/gen/**").addResourceLocations("file:///" + genFileDirPath + "/")
				.setCachePeriod(20);
	}
*/
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		InterceptorRegistration ir;
		
		ir = registry.addInterceptor(beforeActionInterceptor);
		ir.addPathPatterns("/**");
		ir.addPathPatterns("/favicon.ico");
		ir.excludePathPatterns("/resource/**");
		ir.excludePathPatterns("/error");

		ir = registry.addInterceptor(needLoginInterceptor);
//		ir.addPathPatterns("/usr/article/write");
//		ir.addPathPatterns("/usr/article/doWrite");
//		ir.addPathPatterns("/usr/article/doDelete");
//		ir.addPathPatterns("/usr/article/modify");
//		ir.addPathPatterns("/usr/article/doModify");
		ir.addPathPatterns("/usr/member/doLogout");
		ir.addPathPatterns("/usr/member/myPage");
		ir.addPathPatterns("/usr/member/checkPassword");
		ir.addPathPatterns("/usr/member/doCheckPassword");
		ir.addPathPatterns("/usr/member/modify");
		ir.addPathPatterns("/usr/member/doModify");
		ir.addPathPatterns("/usr/member/passWordModify");
		ir.addPathPatterns("/usr/member/doPassWordModify");
//		ir.addPathPatterns("/adm/**");
		ir.addPathPatterns("/usr/workspace/main");
		ir.addPathPatterns("/usr/workspace/download");
		ir.addPathPatterns("/usr/workspace/list");
		ir.addPathPatterns("/usr/workspace/myWork");
		ir.addPathPatterns("/usr/project/getProject");
		ir.addPathPatterns("/usr/project/getSubProject");
		ir.addPathPatterns("/usr/project/getAllProject");
		ir.addPathPatterns("/usr/project/createProject");
		
		ir = registry.addInterceptor(needLogoutInterceptor);
		ir.addPathPatterns("/usr/member/login");
		ir.addPathPatterns("/usr/member/doLogin");
		ir.addPathPatterns("/usr/member/join");
		ir.addPathPatterns("/usr/member/doJoin");
	}

}