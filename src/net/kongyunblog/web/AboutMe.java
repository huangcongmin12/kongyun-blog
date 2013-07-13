package net.kongyunblog.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class AboutMe {
	
	@RequestMapping(value = "/about-me", method = RequestMethod.GET)
	public String about() {
		return "default/about/about";
	}

}
