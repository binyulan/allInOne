package com.auuid.resourcemanager.dynamictable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DynamicTableController {
	
	@Autowired DynamicTableDao dynamicTableDao;
	@Autowired ColumnDao columnDao;
	
	@RequestMapping(value="/resourcemanager/addDefineTableView", method=RequestMethod.GET)
	@Transactional
	public ModelAndView addDefineTableView() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/resourcemanager/dynamicTable/defineTableView");
		return mv;
	}
	
	@RequestMapping("/resourcemanager/addDefineTable")
	@Transactional
	public String addModule(DynamicTable dynamicTable) {
		for (Column column : dynamicTable.getColumns()) {
			columnDao.save(column);
		}
		dynamicTableDao.save(dynamicTable);
		return "redirect:/resourcemanager/addDefineTableView";
	}
}
