package com.auuid.base;

import org.hibernate.dialect.MySQL5InnoDBDialect;

public class CustomMySQL5InnoDBDialect extends MySQL5InnoDBDialect {

	@Override
	public String getTableTypeString() {
		return " ENGINE=InnoDB DEFAULT CHARSET=UTF8";
	}
}
