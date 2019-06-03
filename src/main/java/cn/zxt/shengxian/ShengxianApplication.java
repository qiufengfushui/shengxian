package cn.zxt.shengxian;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication()
//自动生成
@EnableScheduling
@EnableCaching
@MapperScan("cn.zxt.shengxian.dao")
public class ShengxianApplication {

    public static void main(String[] args) {
        SpringApplication.run(ShengxianApplication.class, args);
    }

}
