package com.fxptw.util;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import java.nio.charset.Charset;
import java.util.List;


/**
 * Created by animal
 * on 2016/11/30.
 */
@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {
    /**
     * 拦截器
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry
                .addInterceptor(new WebInterceptor())//要拦截的请求
                .addPathPatterns("/user/**")
                .addPathPatterns("/ug/**")
                .addPathPatterns("/goods/**")
                .excludePathPatterns("/").excludePathPatterns("/main/**").excludePathPatterns("/user/login").excludePathPatterns("/user/request");//不拦截的请求
        super.addInterceptors(registry);

    }

    /**
     * 转向
     * @param registry
     */
    @Override
    public void addViewControllers( ViewControllerRegistry registry ) {
        registry.addViewController( "/" ).setViewName( "forward:/main/index" );
        registry.setOrder( Ordered.HIGHEST_PRECEDENCE );
        super.addViewControllers( registry );
    }




    //下面是设置接口返回乱码的问题

    @Bean
    public HttpMessageConverter<String> responseBodyConverter(){
        StringHttpMessageConverter converter = new StringHttpMessageConverter(Charset.forName("UTF-8"));
        return converter;
    }

    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        super.configureMessageConverters(converters);

        converters.add(responseBodyConverter());
    }

}