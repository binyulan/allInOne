package com.auuid.security;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SecurityController {
	
	@Resource
	private UserDao userDao;
	@RequestMapping(value = { "loginView/**" })
	public ModelAndView loginView(HttpServletRequest request) {
		ModelAndView model = new ModelAndView();
		model.addObject("url", request.getRequestURI().replace("loginView/", ""));
		model.setViewName("login");
		return model;
	}

	@RequestMapping(value = "login")
	public ModelAndView login(UserDto userDto, HttpSession httpSession) {
		User user = userDao.findUserByUsernamePassword(userDto.getUsername(), userDto.getPassword());
		ModelAndView model = new ModelAndView();
		if (user != null) {
			httpSession.setAttribute("user", user);
			model.setViewName("redirect:" + userDto.getUrl());
			return model;
		} else {
			model.addObject("url", userDto.getUrl());
			model.setViewName("login");
			return model;
		}
	}
	
//	@RequestMapping(value="/logout", method = RequestMethod.GET)
//	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		if (auth != null){    
//			new SecurityContextLogoutHandler().logout(request, response, auth);
//		}
//		return "redirect:/login?logout";
//	}
}
