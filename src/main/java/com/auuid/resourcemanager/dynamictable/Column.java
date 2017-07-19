package com.auuid.resourcemanager.dynamictable;

import java.util.List;

public class Column {
	private Long id;
	private String name;
	private List<Cell> cells;
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
	public List<Cell> getCells() {
		return cells;
	}
	public void setCells(List<Cell> cells) {
		this.cells = cells;
	}
}
