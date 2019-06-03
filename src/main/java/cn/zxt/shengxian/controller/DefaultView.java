package cn.zxt.shengxian.controller;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
 
/**
 * 
 * <p>类描述：项目默认访问路径  </p>
 * <p>创建人：wanghonggang </p>
 * <p>创建时间：2018年12月27日 上午11:29:03  </p>
 */
@Configuration
public class DefaultView extends WebMvcConfigurerAdapter {
	
    @Override
    public void addViewControllers(ViewControllerRegistry reg) {
    	reg.addViewController("/").setViewName("login");//默认访问页面
        reg.setOrder(Ordered.HIGHEST_PRECEDENCE);//最先执行过滤
        super.addViewControllers(reg);
    }
}