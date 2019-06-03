package cn.zxt.shengxian.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * 监听器
 * 作用：用于web项目启动时向 application 作用域添加 APP_Path 参数
 * APP_Path ：项目根路径
 */
public class ServerStartupListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ServletContext application = servletContextEvent.getServletContext();
        String path = application.getContextPath();
        application.setAttribute("APP_Path",path);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
