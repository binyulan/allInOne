package com.auuid.resourcemanager.dynamictable;

public class Cell {
	private Long id;
	private String name;
	private String value;
	private Column column;
	
	public Cell() {}
	public Cell(String value) {
		super();
		this.value = value;
		//this.column = column;
	}
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
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public Column getColumn() {
		return column;
	}
	public void setColumn(Column column) {
		this.column = column;
	}
}
