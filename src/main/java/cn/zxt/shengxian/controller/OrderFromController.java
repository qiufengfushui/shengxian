package cn.zxt.shengxian.controller;

import cn.zxt.shengxian.service.OrderFromService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class OrderFromController {
    @Autowired
    private OrderFromService orderFromService;


}
