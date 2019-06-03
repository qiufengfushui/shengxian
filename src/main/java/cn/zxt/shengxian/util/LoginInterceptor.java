package cn.zxt.shengxian.util;


import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
  * 拦截器
  * 作用：用于验证是否登录
  */
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        Object obj = request.getSession().getAttribute("userSession");
        //本次请求的url
        String requestURI = request.getRequestURI();

        if (obj == null || obj == ""){
            response.sendRedirect(request.getContextPath()+"/loginException");
            return false;
        }
        return true;
    }
}
