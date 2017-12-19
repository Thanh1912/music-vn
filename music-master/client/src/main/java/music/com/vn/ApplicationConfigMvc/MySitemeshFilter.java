package music.com.vn.ApplicationConfigMvc;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class MySitemeshFilter extends ConfigurableSiteMeshFilter {

	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		builder
	  .addDecoratorPath("/vn-music/**", "/decorators/decorator.jsp")
						.addDecoratorPath("/vn-music", "/decorators/decorator.jsp")
						.addExcludedPath("/login/*")
				    .addExcludedPath("/resources/*")
						.addExcludedPath("/decorators/*")
		.addDecoratorPath("/admin/**", "/decoratorsAdmin/decorator.jsp")
		;
	}
}

