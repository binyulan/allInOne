package com.auuid.article.domain;

public enum ArticleType {
	JAVA("Java"),
	LINUX("Linux"),
	SPRING("Spring"),
	HIBERNATE("Hibernate");

	private String name;

	ArticleType(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}
}
