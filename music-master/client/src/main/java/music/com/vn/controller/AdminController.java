package music.com.vn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/")
public class AdminController {
    @GetMapping(value = "/dashboard")
    public String dashboard(Model model) {
        return "/admin/dashboard";
    }
    @GetMapping(value = "/artist")
    public String artist(Model model) {
        return "/admin/artist";
    }

    @GetMapping(value = "/kind-of-music")
    public String kindofmusic(Model model) {
        return "/admin/kind";
    }
    @GetMapping(value = "/user")
    public String user(Model model) {
        return "/admin/user";
    }

}
