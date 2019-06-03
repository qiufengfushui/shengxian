package cn.zxt.shengxian.config;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
@RunWith(SpringRunner.class)
@SpringBootTest
public class MySpringBootApplicationTests {
    @Resource
    private RedisTemplate redisTemplate;

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    @Test
    public void testRedis(){
        redisTemplate.opsForValue().set("name","ay");
        String name = (String)redisTemplate.opsForValue().get("name");
        System.out.println(name);
        redisTemplate.delete("name");
        redisTemplate.opsForValue().set("name","al");
        name = (String)redisTemplate.opsForValue().get("name");
        System.out.println(name);
        name = stringRedisTemplate.opsForValue().get("name");
        System.out.println(name);
    }



}
