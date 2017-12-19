package music.com.vn.ApplicationConfigMvc;

import music.com.vn.filter.MySitemeshFilter;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.*;
import java.util.EnumSet;

public class ApplicationInitializer implements WebApplicationInitializer {

	public void onStartup(ServletContext servletContext) throws ServletException {

		createAppRootContext(servletContext);

		addSitemeshFilterToServletContext(servletContext);

		registerDispatcherServlet(servletContext);
	}

	private void createAppRootContext(ServletContext servletContext) {
		// Create the 'root' Spring application context
		AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
		rootContext.register(ApplicationConfiguration.class);

		// Manage the life-cycle of the root application context
		servletContext.addListener(new ContextLoaderListener(rootContext));
	}

	private void addSitemeshFilterToServletContext(ServletContext servletContext) {
		FilterRegistration.Dynamic sitemesh = servletContext.addFilter("sitemesh", new MySitemeshFilter());
		EnumSet<DispatcherType> sitemeshDispatcherTypes = EnumSet.of(DispatcherType.REQUEST, DispatcherType.FORWARD);
		sitemesh.addMappingForUrlPatterns(sitemeshDispatcherTypes, true, "/*");
	}

	private void registerDispatcherServlet(ServletContext servletContext) {
		ServletRegistration.Dynamic dispatcher = servletContext.addServlet("dispatcher", new DispatcherServlet(
				new AnnotationConfigWebApplicationContext()));
		dispatcher.setLoadOnStartup(1);
		dispatcher.addMapping("/");
		FilterRegistration corsFilterReg = servletContext.addFilter("simpleCORSFilter", SimpleCORSFilter.class);
		corsFilterReg.addMappingForUrlPatterns(null, false, "/*");
	}


}
