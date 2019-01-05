package com.fxptw;

import com.fxptw.util.ParamSettings;
import com.fxptw.util.WebMvcConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import javax.sql.DataSource;

@SpringBootApplication
@EnableConfigurationProperties(ParamSettings.class)
public class FxptwebApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(FxptwebApplication.class, args);
	}

	@Bean
	public PlatformTransactionManager txManager(DataSource dataSource) {
		return new DataSourceTransactionManager(dataSource);
	}

	@Bean
	public WebMvcConfig sitemeshFilter() {
		return new WebMvcConfig();
	}


	//	//下面是设置跨域请求的
	private CorsConfiguration buildConfig() {
		CorsConfiguration corsConfiguration = new CorsConfiguration();
		corsConfiguration.addAllowedOrigin("*");
		corsConfiguration.addAllowedHeader("*");
		corsConfiguration.addAllowedMethod("*");
		corsConfiguration.addExposedHeader("token");
		return corsConfiguration;
	}


	//	public void addCorsMappings(CorsRegistry registry) {
//		registry.addMapping("/**")
//				.allowedOrigins("*")
//				.allowCredentials(true)
//				.allowedMethods("GET", "POST", "DELETE", "PUT")
//				.maxAge(3600);
//	}
//
//
//	/**
//	 * 跨域过滤器
//	 *
//	 * @return
//	 */
	@Bean
	public CorsFilter corsFilter() {
		UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
		source.registerCorsConfiguration("/**", buildConfig()); // 4
		return new CorsFilter(source);
	}

}

