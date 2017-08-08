package com.auuid.resourcemanager;

import java.util.List;

public class TableDefinition {
	private Long id;
	private String description;
	private String tableName;
	private List<ColumnDefinition> columnDefinitions;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public List<ColumnDefinition> getColumnDefinitions() {
		return columnDefinitions;
	}
	public void setColumnDefinitions(List<ColumnDefinition> columnDefinitions) {
		this.columnDefinitions = columnDefinitions;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
