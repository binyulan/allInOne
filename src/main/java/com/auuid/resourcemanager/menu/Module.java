package com.auuid.resourcemanager.menu;

import java.util.Set;

public class Module {
	private Long id;
	private String name;
	private Set<Module> children;
	private Module parentModule;
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
	public Set<Module> getChildren() {
		return children;
	}
	public void setChildren(Set<Module> children) {
		this.children = children;
	}
	
}
