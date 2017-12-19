package music.com.vn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/vn-music")
public class HomeController {
	@GetMapping(value = "/")
	public String login() {
		return "redirect:/vn-mucsic";
	}

	@GetMapping(value = "/register")
	public String register(Model model) {
		return "excluded/register";
	}
	@GetMapping(value = "/example")
	public String example(Model model) {

		return "/example";
	}


	@GetMapping(value = "/player")
	public String player(Model model) {

		return "/player";
	}
	@GetMapping(value = "/album")
	public String album(Model model) {

		return "/album";
	}
	@GetMapping(value = "/profile")
	public String profile(Model model) {

		return "/profile";
	}
	@GetMapping(value = "/artist")
	public String artist(Model model) {

		return "/artist";
	}
	@GetMapping(value = "/song")
	public String song(Model model) {
		return "/song";
	}

}
