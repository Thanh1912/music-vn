package music.com.vn.ApplicationConfigMvc;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@ImportResource({ "classpath:hibernate4Config.xml" })
public class HibernateXmlConfig{
	
}