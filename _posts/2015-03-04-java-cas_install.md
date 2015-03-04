---
layout: post
title: Jasig CAS服务器安装，简单使用 
thread: 24
categories: java
tags: CAS
keywords: CAS，SSO，单点登录，Spring MVC
description: CAS服务端安装，为集成到spring做准备
---

SSO ： 单点登录（Single Sign On , 简称 SSO ） 

CAS ： CAS(Central Authentication Service)是一款不错的针对 Web 应用的单点登录框架 

##下载CAS server

登录官网下载最新版本CAS Server，下载ZIP包

[https://www.apereo.org/cas/download](https://www.apereo.org/cas/download)

## 解压下载的cas server压缩包

打开压缩包，内容很多

![](/assets/cas/cas01.jpg)

我们先不关注其它内容，单看这个modules，单看modules中的cas-server-webapp-4.0.0.war

![](/assets/cas/cas02.jpg)

复制cas-server-webapp-4.0.0.war到压缩包之外

##启动cas server

cas-server-webapp-4.0.0.war放入tomcat的webapps

启动tomcat

用地址：http://localhost:8080/cas-server-webapp-4.0.0/login，访问

![](/assets/cas/cas03.jpg)


##eclipse导入cas-server-webapp-4.0.0.war

可以导入eclipse，进行配置文件修改，并且通过eclipse启动

![](/assets/cas/cas04.jpg)

![](/assets/cas/cas05.jpg)

![](/assets/cas/cas06.jpg)

下一章记录怎么修改配置文件