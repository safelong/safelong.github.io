---
layout: post
title: 上传第三方jar包到SonaType Nexus
thread: 15
categories: maven
tags: maven
keywords: Nexus,第三方jar包, maven仓库
description: 上传第三方jar包到SonaType Nexus
---

maven给我们构建工程，提供了极大的方便。

所有引用的jar包，通过maven的pom文件就能完全管理了，免去了我们一个一个去下载的过程。

但是，我们使用maven的过程中，也经常发现一些jar下载不到。

或者，我们公司内部的jar包，不能通过这种pom文件来管理。

当然，每个开发人员，可以自己手动引进jar包或者手动把该jar包放在自己本地仓库。

这样的话，就不能集中管理了。


##Nexus私有仓库的搭建和配置

公司内部做项目时，一般都会搭建自己的私有仓库，免费每个开发人员都自己去远程下载jar包。

具体怎么搭建，我就引用别人的文章了，大家可以去看一下。

[http://blog.csdn.net/ichsonx/article/details/14642897](http://blog.csdn.net/ichsonx/article/details/14642897)


##上传自己的jar包到私有仓库
这样的好处是，集中管理，免去大家分别去上传到自己的本地仓库。

按照以下图片步骤进行：

![](/assets/nexus/20140103140458218.jpg)

![](/assets/nexus/20140103141044875.jpg)

