package com.auuid.resourcemanager.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ModuleController {

	@Autowired private ModuleDao moduleDao;
	
	@RequestMapping("/resourcemanager")
	@Transactional
	public ModelAndView getModules() {
		List<Module> modules = moduleDao.getRootModules();
		ModelAndView mv = new ModelAndView();
		mv.addObject("modules", modules);
		mv.setViewName("resourcemanager/index");
		return mv;
	}
	
	@RequestMapping("/resourcemanager/addModule")
	@Transactional
	public String addModule(Module module) {
		if (module.getParentModule().getId() == null) {
			module.setParentModule(null);
		}
		moduleDao.save(module);
		return "redirect:/resourcemanager/addModuleView";
	}
	
	@RequestMapping(value="/resourcemanager/addModuleView", method=RequestMethod.GET)
	@Transactional
	public ModelAndView addModuleView() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("modules", moduleDao.getRootModules());
		mv.setViewName("/resourcemanager/menu/addModuleView");
		return mv;
	}
}
