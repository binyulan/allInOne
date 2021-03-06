<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>首页</title>
<link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="lib/syntaxhighlighter/styles/shCoreDefault.css"/>
<link rel="shortcut icon" type="images/x-icon" href="icon/person.ico" />  
<script type="text/javascript" src="http://cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>
<script type="text/javascript" src="lib/syntaxhighlighter/scripts/shCore.js"></script>
<script type="text/javascript" src="lib/syntaxhighlighter/scripts/shBrushXml.js"></script>
<script type="text/javascript" src="lib/syntaxhighlighter/scripts/shBrushJava.js"></script>
<script type="text/javascript">SyntaxHighlighter.all();</script>
</head>


<body style="background-color:#f5f5f5">
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <div>
            <ul class="nav navbar-nav">
                <li data-id="JAVA" class="active"><a href="#JAVA">Java</a></li>
                <li data-id="JAVASCRIPT"><a href="#JAVASCRIPT">Javascript</a></li>
                <li data-id="SPRING"><a href="#JAVASCRIPT">Spring</a></li>
                <li data-id="BACKBONEJS"><a href="#JAVASCRIPT">Hiberante</a></li>
                <li>
                    <form class="navbar-form">
                        <div class="form-group">
                            <input id="searchText" type="text" onkeypress="if(event.keyCode == 13)return false" class="form-control" placeholder="搜索">
                        </div>
                        <button id="searchArticle" type="button" class="btn btn-default">搜索</button>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div id="presentation" style="margin:15px">
<meta name="keywords" content="Hibernate 环境搭建, Hibernate, 环境搭建" />
<meta name="description" content="Hibernate 环境搭建" />
<div class="page-header">
    <h1>Hibernate 环境搭建</h1>
</div>
<p><strong>一. 新建Maven工程</strong></p>
<p>使用快捷键 <kbd>Ctrl + N</kbd> 打开窗口后，在Wizards框中输入maven，选择Maven Project。</p>
<p>点击Next，选择 maven-archetype-quickstart 1.1。点击Next，Group id输入com.companyname，Artifact输入hibernate。点击Finish。</p>
<a style="cursor: pointer;"
onclick='$("#video1").html("<video style=\"width:620px;\" controls=\"controls\" src=\"video/hibernate-1.1.mp4\"></video>")'>见视频操作，可最大化</a>
<p id="video1"></p>

<p><strong>二. 引入hibernate依赖</strong></p>
<pre class="brush: xml">
<dependency>
    <groupId>junit</groupId>
    <artifactId>junit</artifactId>
    <version>4.10</version>
    <scope>test</scope>
</dependency>
<dependency>
    <groupId>org.hibernate</groupId>
    <artifactId>hibernate-core</artifactId>
    <version>4.3.2.Final</version>
</dependency>
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>5.1.38</version>
</dependency>
</pre>
<a style="cursor: pointer;"
onclick='$("#video2").html("<video style=\"width:620px;\" controls=\"controls\" src=\"video/hibernate-1.2.mp4\"></video>")'>见视频操作，可最大化</a>
<p id="video2"></p>
<p><strong>三. hibernate配置文件</strong></p>
<pre class="brush: xml">
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE hibernate-configuration PUBLIC
        "-//Hibernate/Hibernate Configuration DTD 3.0//EN"
        "http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd">
<hibernate-configuration>
    <session-factory>
        <!-- 数据库驱动名称 -->
        <property name="hibernate.connection.driver_class">com.mysql.jdbc.Driver</property>
        <!-- 数据库链接地址 -->
        <property name="hibernate.connection.url">jdbc:mysql://localhost:3306/binyulan?rewriteBatchedStatements=true</property>
        <!-- 数据库用户名称 -->
        <property name="hibernate.connection.username">root</property>
        <!-- 数据库密码 -->
        <property name="connection.password">123456</property>
        <!-- 设置数据库SQL语言类型 -->
        <property name="hibernate.dialect">org.hibernate.dialect.MySQL5InnoDBDialect</property>
        <!-- 设置是否显示SQL语句-->
        <property name="show_sql">true</property>
        <!-- 设置是否格式化SQL语句 -->
        <property name="format_sql">true</property>
        <!-- 自动建表  取值有四种：
            create: 根据映射文件生成表， 每次执行都删除之前创建过的表
            create-drop: 根据映射文件生成表，每次执行完毕都会删除表
            update: 根据映射文件生成表，若以后表结构与映射文件不同，则更新表结构，但不会删除之前的记录，也不会删除映射文件中不存在的列
            validate: 不会根据映射文件生成表，只会校验映射文件和表结构是否一致，不一致则抛异常
        -->
        <property name="hbm2ddl.auto">update</property>
        <!-- 引入映射文件 -->
        <mapping resource="com/companyname/hibernate/domain/Article.hbm.xml"/>
    </session-factory>
</hibernate-configuration>
</pre>
<a style="cursor: pointer;"
onclick='$("#video3").html("<video style=\"width:620px;\" controls=\"controls\" src=\"video/hibernate-1.3.mp4\"></video>")'>见视频操作，可最大化</a>
<p id="video3"></p>
<p><strong>四. 编写测试domain对象</strong></p>
<pre class="brush: java">
package com.companyname.hibernate.domain;

public class Article {

    private Long id;
    private String title;
    private String content;
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
}
</pre>

Article的映射文件Article.hbm.xml
<pre class="brush: xml">
<?xml version="1.0"?>
<!DOCTYPE hibernate-mapping PUBLIC "-//Hibernate/Hibernate Mapping DTD 3.0//EN"
"http://hibernate.sourceforge.net/hibernate-mapping-3.0.dtd">
<hibernate-mapping>
    <class name="com.companyname.hibernate.domain.Article" table="articles">
        <id name="id" type="java.lang.Long">
            <column name="id" />
            <generator class="native" />
        </id>
        <property name="title" type="java.lang.String">
            <column name="title" />
        </property>
        <property name="content" type="java.lang.String">
            <column name="content" />
        </property>
    </class>
</hibernate-mapping>
</pre>
<a style="cursor: pointer;"
onclick='$("#video4").html("<video style=\"width:620px;\" controls=\"controls\" src=\"video/hibernate-1.4.mp4\"></video>")'>见视频操作，可最大化</a>
<p id="video4"></p>
<p><strong>五：编写测试类</strong></p>
<pre class="brush: java">
package com.companyname.hibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.companyname.hibernate.domain.Article;

public class SimpleTest {
    
    private Session session;
    private SessionFactory sessionFactory;
    private Transaction transaction;
    @Before
    public void init(){
        Configuration cfg = new Configuration().configure();
        ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties()).build();
        sessionFactory = cfg.buildSessionFactory(serviceRegistry);
        session = sessionFactory.openSession();
        transaction = session.beginTransaction();
    }

    @After
    public void destory(){
        transaction.commit();
        session.close();
        sessionFactory.close();
    }
    
    @Test
    public void testSave() {
        Article article = new Article();
        article.setTitle("title");
        article.setContent("content");
        session.save(article);
    }
    
}
</pre>
<a style="cursor: pointer;"
onclick='$("#video5").html("<video style=\"width:620px;\" controls=\"controls\" src=\"video/hibernate-1.5.mp4\"></video>")'>见视频操作，可最大化</a>
<p id="video5"></p>
</div>
</body>
</html>