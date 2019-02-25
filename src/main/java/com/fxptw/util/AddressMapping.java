package com.fxptw.util;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import java.util.Properties;

/**
 * Created by james on 2019/2/25.
 */
@Configuration
public class AddressMapping extends WebMvcConfigurerAdapter {



    //    @Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        /**
//         * @Description: 对文件的路径进行配置, 创建一个虚拟路径/templates/** ，即只要在<img src="/templates/picName.jpg" />便可以直接引用图片
//         *这是图片的物理路径  "file:/+本地图片的地址"
//         */
//        registry.addResourceHandler("/templates/**").addResourceLocations
//                ("file:/E:/IdeaProjects/gaygserver/src/main/resources/static/");
////        registry.addResourceHandler("/templates/**").addResourceLocations("classpath:/static/");
//        super.addResourceHandlers(registry);
//    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        Properties props=System.getProperties(); //获得系统属性集
        String osName = props.getProperty("os.name");
        String path="";
        if (osName.toLowerCase().startsWith("win")) {  //如果是Windows系统
            //path = "C://gjimage";
            registry.addResourceHandler("/img_index/**")
                    // /apple/**表示在磁盘apple目录下的所有资源会被解析为以下的路径
                    .addResourceLocations("file:D://fxpt_upload//index//") //媒体资源
                    .addResourceLocations("classpath:/WEB-INF/gjimage/");  //swagger2页面

            registry.addResourceHandler("/img_material/**")
                    // /apple/**表示在磁盘apple目录下的所有资源会被解析为以下的路径
                    .addResourceLocations("file:D://fxpt_upload//material//") //媒体资源
                    .addResourceLocations("classpath:/WEB-INF/gjimage/");  //swagger2页面

        } else {  //linux 和mac
            //path = "/usr/home/gjimage";
            registry.addResourceHandler("/img/**")
                    .addResourceLocations("file:/usr/home/gjimage/")  //媒体资源
                    .addResourceLocations("classpath:/WEB-INF/gjimage/");  //swagger2页面;
        }

    }
}

