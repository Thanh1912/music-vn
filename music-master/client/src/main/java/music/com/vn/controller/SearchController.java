package music.com.vn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class SearchController {
    @GetMapping(value = "/search")
    public String search(Model model) {
        return "/search";
    }
    @GetMapping(value = "/login")
    public String login(Model model) {
        return "excluded/login";
    }
}
