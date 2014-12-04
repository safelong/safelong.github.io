---
layout: post
title: windows环境下python的安装和配置
thread: 21
categories: python
tags: python
keywords: windows环境,python, 安装和配置
description: windows环境下python的安装和配置
---

Python几乎可以在任何平台下运行，如我们所熟悉的：Windows/Unix/Linux/Macintosh。

在这里我们说一下，在Windows操作系统中安装python。

我的操作系统为：Windows 7,32位

安装python的时候，我们既可以从源码安装，同时也可以用已经编译好并且打包好的二进制版本进行安装，这里我选择的是后者。

##步骤一:下载安装包

我们从python官方网站：[https://www.python.org/downloads/](https://www.python.org/downloads/)下载python的安装包

![](/assets/python/download.jpg)

这里我选择最新的版本了：python-3.4.2.msi

点击即可下载获取得到：python-3.4.2.msi安装包。

##步骤二：安装

下载获取到：python-3.4.2.msi安装包，我们双击python-3.4.2.msi即可进行安装操作

安装就简单了，不断的next就可以了。

我的安装路径是：C:\Python34

##步骤三：环境变量设置

一般情况下，我们安装好Python之后便可以直接使用。可以在命令行下输入Python看是否可以进入Python的交互模式，

如果不能进入，则有可能是环境变量问题，需要做一些调整。

在Windows的路径添加Python的目录：

命令提示符 : 类似于环境变量路径 %path%;C:Python ，回车；

或者您可以在图形界面下操作设置环境变量，计算机->属性->高级系统设置->高级->环境变量

![](/assets/python/path.jpg)

##步骤四：效果

打开windows命令行工具：cmd，输入python，如果能看到如下效果，就说明python安装成功了。

![](/assets/python/success.jpg)
