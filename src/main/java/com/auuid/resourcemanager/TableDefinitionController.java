package com.auuid.resourcemanager;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.auuid.resourcemanager.menu.Module;
import com.auuid.resourcemanager.menu.ModuleDao;

@Controller
public class TableDefinitionController {
	
	@Autowired ModuleDao moduleDao;
	@Autowired TableDefinitionDao tableDefinitionDao;
	
	@RequestMapping(value="/resourcemanager/tableDefinition/defineTableView", method=RequestMethod.GET)
	@Transactional
	public ModelAndView defineTableView() {
		ModelAndView mv = new ModelAndView();
		List<Module> modules = moduleDao.getAll();
		mv.addObject("modules", modules);
		mv.setViewName("/resourcemanager/tableDefinition/defineTableView");
		return mv;
	}
	
	@RequestMapping("/resourcemanager/tableDefinition/defineTable")
	@Transactional
	public String defineTable(TableDefinition tableDefinition, Long[] moduleIds) {
		Set<Module> modules = new HashSet<Module>();
		for (Long moduleId : moduleIds) {
			modules.add(moduleDao.getById(moduleId));
		}
		tableDefinition.setModules(modules);
		tableDefinitionDao.createTable(tableDefinition);
		return "redirect:/resourcemanager/tableDefinition/defineTableView";
	}
	
	@RequestMapping(value="/resourcemanager/tableDefinition/viewTablesView", method=RequestMethod.GET)
	@Transactional
	public ModelAndView viewTableView() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("tableDefinitions", tableDefinitionDao.getAll());
		mv.setViewName("/resourcemanager/tableDefinition/viewTablesView");
		return mv;
	}
	
	@RequestMapping(value="/resourcemanager/addData/{tableId}", method=RequestMethod.POST)
	@Transactional
	public ModelAndView addData(@PathVariable("tableId")Long tableId, @RequestParam Map<String, String> columnNameToValue) {
		TableDefinition tableDefinition = tableDefinitionDao.getById(tableId);
		tableDefinitionDao.addData(tableDefinition.getTableName(), columnNameToValue);
		ModelAndView mv = new ModelAndView();
		mv.addObject("tableDefinition", tableDefinition);
		mv.addObject("tableData", tableDefinitionDao.getTableData(tableId));
		mv.addObject("modules", moduleDao.getRootModules());
		mv.setViewName("/resourcemanager/index");
		return mv;
	}
}
