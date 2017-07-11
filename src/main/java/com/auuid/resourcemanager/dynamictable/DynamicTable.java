package com.auuid.resourcemanager.dynamictable;

import java.util.List;

import com.auuid.resourcemanager.menu.Module;

public class DynamicTable {
	private Long id;
	private String name;
	private Module module;
	private List<Column> columns;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Module getModule() {
		return module;
	}
	public void setModule(Module module) {
		this.module = module;
	}
	public List<Column> getColumns() {
		return columns;
	}
	public void setColumns(List<Column> columns) {
		this.columns = columns;
	}
}
