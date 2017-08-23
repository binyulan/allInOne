package com.auuid.resourcemanager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.jdbc.Work;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.auuid.base.dao.BaseDao;

@Repository
public class TableDefinitionDao extends BaseDao<TableDefinition>{
	
	@Autowired ColumnDefinitionDao columnDefinitionDao;
	
	public void createTable(TableDefinition tableDefinition) {
		save(tableDefinition);
		String tableName = "table" + tableDefinition.getId();
		List<ColumnDefinition> columnDefinitions = tableDefinition.getColumnDefinitions();
		tableDefinition.setTableName(tableName);
		sessionFactory.getCurrentSession().doWork(new Work() {
			@Override
			public void execute(Connection connection) throws SQLException {
				Statement statement = connection.createStatement();
				StringBuilder columnSql = new StringBuilder();
				int i = 0;
				for (ColumnDefinition columnDefinition : columnDefinitions) {
					columnSql.append("column" + i + " varchar(255) DEFAULT NULL,");
					columnDefinition.setColumnName("column" + i++);
				}
				String sql = "CREATE TABLE " + tableName + "("
								+ "id bigint(20) NOT NULL AUTO_INCREMENT,"
								+ columnSql
								+ "PRIMARY KEY (id)"
							+ ") ENGINE=InnoDB DEFAULT CHARSET=utf8";
				statement.executeUpdate(sql);
			}
		});
		columnDefinitionDao.batchSave(columnDefinitions);
	}
	
	public List<List<Object>> getTableData(Long tableId) {
		TableDefinition tableDefinition = this.getById(tableId);
		List<List<Object>> result = new ArrayList<List<Object>>();
		sessionFactory.getCurrentSession().doWork(new Work() {
			@Override
			public void execute(Connection connection) throws SQLException {
				String sql = "select * from " + tableDefinition.getTableName();
				Statement statement = connection.createStatement();
				ResultSet rs = statement.executeQuery(sql);
				while (rs.next()) {
					List<Object> data = new ArrayList<Object>();
					tableDefinition.getColumnDefinitions().stream().forEach(p -> {
						try {
							data.add(rs.getObject(p.getColumnName()));
						} catch (Exception e) {
							throw new RuntimeException(e);
						}
					});
					result.add(data);
				}
			}
		});
		return result;
	}
	
	public void addData(String tableName, Map<String, String> values) {
		sessionFactory.getCurrentSession().doWork(new Work() {
			@Override
			public void execute(Connection connection) throws SQLException {
				StringBuilder sql = new StringBuilder("insert into " + tableName + "(");
				for(String columnName : values.keySet()) {
					sql.append(columnName + ",");
				}
				sql.deleteCharAt(sql.length() - 1).append(") values(");
				for(String value : values.values()) {
					sql.append("'" + value + "',");
				}
				sql.deleteCharAt(sql.length() - 1).append(")");
				Statement statement = connection.createStatement();
				statement.executeUpdate(sql.toString());
			}
		});
	}
}
