package music.com.vn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class Access {
    @GetMapping(value = "/access_dinied")
    public String user(Model model)
    {
        return "/access_dinied";
    }


}
