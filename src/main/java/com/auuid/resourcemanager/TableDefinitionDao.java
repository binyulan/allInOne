package com.auuid.resourcemanager;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

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
}
