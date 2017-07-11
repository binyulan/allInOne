package com.auuid.resourcemanager.dynamictable;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.auuid.resourcemanager.menu.Module;
import com.auuid.resourcemanager.menu.ModuleDao;

@Controller
public class DynamicTableController {
	
	@Autowired DynamicTableDao dynamicTableDao;
	@Autowired ColumnDao columnDao;
	@Autowired ModuleDao moduleDao;
	
	@RequestMapping(value="/resourcemanager/addDefineTableView", method=RequestMethod.GET)
	@Transactional
	public ModelAndView addDefineTableView() {
		ModelAndView mv = new ModelAndView();
		List<Module> modules = moduleDao.getAll();
		mv.addObject("modules", modules);
		mv.setViewName("/resourcemanager/dynamicTable/defineTableView");
		return mv;
	}
	
	@RequestMapping(value="/resourcemanager/viewTableView/{menuId}", method=RequestMethod.GET)
	@Transactional
	public ModelAndView viewTableView(@PathVariable("id") Long menuId) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("dynamicTable", dynamicTableDao.getByMenuId(menuId));
		mv.setViewName("/resourcemanager/dynamicTable/defineTableView");
		return mv;
	}
	
	@RequestMapping("/resourcemanager/addDefineTable")
	@Transactional
	public String addDynamicTable(DynamicTable dynamicTable) {
		for (Column column : dynamicTable.getColumns()) {
			columnDao.save(column);
		}
		dynamicTableDao.save(dynamicTable);
		return "redirect:/resourcemanager/addDefineTableView";
	}
}
