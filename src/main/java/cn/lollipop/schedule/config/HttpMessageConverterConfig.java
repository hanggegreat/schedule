package cn.lollipop.schedule.config;

import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import org.springframework.boot.autoconfigure.http.HttpMessageConverters;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;

import java.util.ArrayList;
import java.util.List;

@Configuration
public class HttpMessageConverterConfig {
    //引入FastJson解析json，不使用默认的jackson 需在pom.xml引入FastJson依赖
    @Bean
    public HttpMessageConverters fastJsonHttpMessageConverters() {
        // 创建FastJson信息转换对象
        FastJsonHttpMessageConverter fastJsonHttpMessageConverter = new FastJsonHttpMessageConverter();
        // 创建FastJson对象并设定序列化规则
        FastJsonConfig fastJsonConfig = new FastJsonConfig();
        fastJsonConfig.setSerializerFeatures(SerializerFeature.PrettyFormat);

        // 解决中文乱码
        List<MediaType> mediaTypes = new ArrayList<>();
        mediaTypes.add(MediaType.APPLICATION_JSON_UTF8); // 设置json编码格式为UTF-8
        fastJsonHttpMessageConverter.setSupportedMediaTypes(mediaTypes);
        // 向转换对象中添加配置信息
        fastJsonHttpMessageConverter.setFastJsonConfig(fastJsonConfig);
        return new HttpMessageConverters(fastJsonHttpMessageConverter);
    }
}
