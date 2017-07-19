package com.auuid.resourcemanager.dynamictable;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
	@Autowired CellDao cellDao;
	@Autowired ModuleDao moduleDao;
	
	@RequestMapping(value="/resourcemanager/defineTableView", method=RequestMethod.GET)
	@Transactional
	public ModelAndView addDefineTableView() {
		ModelAndView mv = new ModelAndView();
		List<Module> modules = moduleDao.getAll();
		mv.addObject("modules", modules);
		mv.setViewName("/resourcemanager/dynamicTable/defineTableView");
		return mv;
	}
	
	@RequestMapping(value="/resourcemanager/viewTablesView", method=RequestMethod.GET)
	@Transactional
	public ModelAndView viewTableView() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("dynamicTables", dynamicTableDao.getAll());
		mv.setViewName("/resourcemanager/dynamicTable/viewTablesView");
		return mv;
	}
	
	@RequestMapping(value="/resourcemanager/queryTable/{id}", method=RequestMethod.GET)
	@Transactional
	public ModelAndView viewTableView(@PathVariable("id") Long id, QueryColumnDto queryColumnDto) {
		ModelAndView mv = new ModelAndView();
		DynamicTable table = dynamicTableDao.getById(id);
		for (Column column : table.getColumns()) {
			if (queryColumnDto.getQueryColumnMap().get(column.getId()) != null) {
				List<Long> indexes = new ArrayList<Long>();
				for (int i = 0; i < column.getCells().size(); i++){
					if (!queryColumnDto.getQueryColumnMap().get(column.getId()).equals(column.getCells().get(i).getValue())) {
						indexes.add((long) i);
					}
				}
			}
		}
		
		List<DynamicTable> tables = new ArrayList<DynamicTable>();
		tables.add(table);
		mv.addObject("dynamicTables", tables);
		mv.setViewName("/resourcemanager/dynamicTable/viewTablesView");
		return mv;
	}
	
	@RequestMapping("/resourcemanager/defineTable")
	@Transactional
	public String addDynamicTable(DynamicTable dynamicTable) {
		for (Column column : dynamicTable.getColumns()) {
			columnDao.save(column);
		}
		dynamicTableDao.save(dynamicTable);
		return "redirect:/resourcemanager/defineTableView";
	}
	
	@RequestMapping("/resourcemanager/deleteTable/{id}")
	@Transactional
	public String deleteTable(@PathVariable("id") Long id) {
		DynamicTable table = dynamicTableDao.getById(id);
		for (Column column : table.getColumns()) {
			columnDao.delete(column);
		}
		dynamicTableDao.delete(table);
		return "redirect:/resourcemanager/viewTablesView";
	}
	
	@RequestMapping(value="/resourcemanager/addRecordView/{id}", method=RequestMethod.GET)
	@Transactional
	public ModelAndView addRecordView(@PathVariable("id") Long id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("dynamicTable", dynamicTableDao.getById(id));
		mv.setViewName("/resourcemanager/dynamicTable/addRecordView");
		return mv;
	}
	
	@RequestMapping(value="/resourcemanager/addRecord/{id}", method=RequestMethod.POST)
	@Transactional
	public String addRecordView(@PathVariable("id") Long id, String[] values) {
		DynamicTable table = dynamicTableDao.getById(id);
		for (int i = 0; i < values.length; i++) {
			Cell cell = new Cell(values[i]);
			table.getColumns().get(i).getCells().add(cell);
			cellDao.save(cell);
		}
		return "redirect:/resourcemanager/viewTablesView";
	}
}
