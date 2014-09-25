---
layout: post
title: maven从本地仓库移除自己追加的jar包
thread: 16
categories: maven
tags: maven
keywords: maven,'mvn dependency', maven仓库
description: maven从本地仓库移除自己追加的jar包
---

以前没有用maven的时候，IK分词器的使用，就是直接把jar包放到bin目录下，也正常使用。

使用maven以后，发现远程仓库没有该jar包。

所以为了统一jar包的引用方法，就决定把jar包放到本地仓库去。

（该方法也适用于自己开发的jar包）

##安装jar到本地仓库
###第一步，把jar包放到一个本地目录，如：d:\mylib
###第二步，用命令安装jar包

	mvn install:install-file -Dfile=d:\mylib\IKAnalyzer.jar -DgroupId?=org.wltea.ik-analyzer -DartifactId?=ik-analyzer -Dversion=2012 -Dpackaging=jar

这样你就可以将IKAnalyzer.jar安装到您Maven本地的库文件夹相应目录中。

##从本地仓库删除安装的jar包

刚才的命令安装，是安装到了本地仓库。

后来，我想安装到我们项目的集中仓库里，这样就用不着每个人都去安装该jar包了，直接pom使用就行了。

所以，我就想在本地仓库删除该jar包。

经尝试，直接在仓库里面删除该jar包，在eclipse里面进行jar搜索时，还能搜索到，很是烦人。

几经搜索，终于找到了解决办法。

###解决办法
在某个工程的目录下，和pom文件同级目录下，执行以下命令

	mvn dependency:purge-local-repository -DreResolve=false

解决办法参考:
[http://stackoverflow.com/questions/15358851/how-to-remove-jar-file-from-local-maven-repository-which-was-added-with-install](http://stackoverflow.com/questions/15358851/how-to-remove-jar-file-from-local-maven-repository-which-was-added-with-install)

[dependency:purge-local-repository]参考：
[http://maven.apache.org/plugins/maven-dependency-plugin/purge-local-repository-mojo.html](http://maven.apache.org/plugins/maven-dependency-plugin/purge-local-repository-mojo.html)