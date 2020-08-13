package br.mil.mar.amrj.conf;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement // Para o Spring gerenciar as transações
public class JPAConfiguration {
	@Bean
    public LocalContainerEntityManagerFactoryBean entityManagerFactory() {

        LocalContainerEntityManagerFactoryBean factoryBean = 
            new LocalContainerEntityManagerFactoryBean();

        JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();

        factoryBean.setJpaVendorAdapter(vendorAdapter);

        DriverManagerDataSource dataSource = new DriverManagerDataSource();

        
//        dataSource.setUsername("usprpc1a");
//        dataSource.setPassword("usprpc01"); 
//        dataSource.setUrl("jdbc:oracle:thin:@10.1.32.36:1521:amrjhom");
        
		/*
		 * dataSource.setUsername("usprpc1a"); dataSource.setPassword("usprpc01");
		 * dataSource.setUrl("jdbc:oracle:thin:@10.1.32.14:1521:amrj");
		 */
        
//        dataSource.setUsername("usdspc1u"); 
//        dataSource.setPassword("usdspc01");
//        dataSource.setUrl("jdbc:oracle:thin:@10.1.32.50:1521:amrjdsv");
        
        dataSource.setUsername("AMDBA");
        dataSource.setPassword("adminsystem"); // modifique para a senha do seu banco
        dataSource.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
        dataSource.setDriverClassName("oracle.jdbc.OracleDriver");
        factoryBean.setDataSource(dataSource);
        
//        	dataSource.setUsername("usdspc1u"); 
//        	dataSource.setPassword("");
//        	dataSource.setUrl("jdbc:oracle:thin:@10.1.32.50:1521:amrjdsv");
//        	factoryBean.setDataSource(dataSource);
        
        Properties props = new Properties();
        props.setProperty("hibernate.dialect", "org.hibernate.dialect.OracleDialect");
        props.setProperty("hibernate.show_sql", "true");
        props.setProperty("hibernate.format_sql", "true");
        props.setProperty("hibernate.default_schema", "AMDBA");
        props.setProperty("hibernate.hbm2ddl.auto", "update");
        factoryBean.setJpaProperties(props);

        factoryBean.setPackagesToScan("br.mil.mar.amrj.model");

        return factoryBean;
    }
	
	//gerenciador das transações
	@Bean
	public JpaTransactionManager transactionManager(EntityManagerFactory emf) {
	    return new JpaTransactionManager(emf);
	}
}
