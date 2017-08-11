package com.auuid.resourcemanager.menu;

import java.util.List;

import com.auuid.resourcemanager.TableDefinition;

public class Module {
	private Long id;
	private String name;
	private List<Module> children;
	private Module parentModule;
	private List<TableDefinition> tableDefinitions;
	private Integer idx;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Module getParentModule() {
		return parentModule;
	}
	public void setParentModule(Module parentModule) {
		this.parentModule = parentModule;
	}
	public List<Module> getChildren() {
		return children;
	}
	public void setChildren(List<Module> children) {
		this.children = children;
	}
	public List<TableDefinition> getTableDefinitions() {
		return tableDefinitions;
	}
	public void setTableDefinitions(List<TableDefinition> tableDefinitions) {
		this.tableDefinitions = tableDefinitions;
	}
	public Integer getIdx() {
		return idx;
	}
	public void setIdx(Integer idx) {
		this.idx = idx;
	}
	
}
