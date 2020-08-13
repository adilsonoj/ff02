package br.mil.mar.amrj.conf;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.accept.ContentNegotiationManager;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "br.mil.mar.amrj.controller" })
public class WebConfiguration extends WebMvcConfigurationSupport {

	@Bean
	public InternalResourceViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");

		return resolver;
	}

	@Bean
	public MessageSource messageSource() { // configuracao de menssagens "messages.propierties"
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();

		messageSource.setBasename("/WEB-INF/messages");
		messageSource.setDefaultEncoding("UTF-8");
		messageSource.setCacheSeconds(1);

		return messageSource;
	}

//	@Bean // configurar o formato da data em todo sistema
//	public FormattingConversionService mvcConversionService() {
//		DefaultFormattingConversionService conversionService = new DefaultFormattingConversionService();
//		DateFormatterRegistrar registrar = new DateFormatterRegistrar();
//		registrar.setFormatter(new DateFormatter("dd/MM/yyyy"));
//		registrar.registerFormatters(conversionService);
//
//		return conversionService;
//	}

	@Bean // para trabalhar com upload arquivos
	public MultipartResolver multipartResolver() {
		return new StandardServletMultipartResolver();
	}

	@Bean
	public RestTemplate restTemplate() {
		return new RestTemplate();
	}

	@Override // liberar acesso ao tomcat acessar a pasta webapp/resource
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	@Bean // Para agrupar todos os viewResolver
	public ViewResolver contentNegotiationViewResolver(ContentNegotiationManager manager) {

		List<ViewResolver> viewResolvers = new ArrayList<>();
		viewResolvers.add(internalResourceViewResolver());
		viewResolvers.add(new JsonViewResolver());

		ContentNegotiatingViewResolver resolver = new ContentNegotiatingViewResolver();
		resolver.setViewResolvers(viewResolvers);
		resolver.setContentNegotiationManager(manager);

		return resolver;
	}

	
//security
	/*
	 * @Bean public HttpSessionEventPublisher httpSessionEventPublisher() { return
	 * new HttpSessionEventPublisher(); }
	 */

}
