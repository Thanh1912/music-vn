package music.com.vn.controller.api;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Access {
    @GetMapping(value = "/accessdenied")
    public String accessdenied(Model model)
    {
        return "access_dinied";
    }
}
