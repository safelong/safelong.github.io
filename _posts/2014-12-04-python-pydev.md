---
layout: post
title: eclipse+pydev 安装和配置 
thread: 22
categories: python
tags: python
keywords: pydev,eclipse, 安装和配置
description: eclipse+pydev 安装和配置 
---
#前提
在安装 PyDev 之前，要保证您已经安装了 Java 1.4 或更高版本、Eclipse 以及 Python。接下来，开始安装 PyDev 插件。

#安装

打开Eclipse，找到Help菜单栏，进入Install New Software…选项。

![](/assets/python/installsoftware.jpg)

点击work with:输入框的旁边点击Add…，Name可以随便是什么，我输入的是PyDev，Location是http://pydev.sourceforge.net/updates。点击OK。

![](/assets/python/pydev2.jpg)

等待一下，便可以在选择栏里看到各个选项。
选择PyDev，然后一路Next，进入安装路径选择界面，使用默认设置，然后 Finish。Eclipse将下载 PyDev，可以从 Eclipse任务栏中看到下载的进度。PyDev安装好后，需要重启Eclipse。

![](/assets/python/pydev3.jpg)

#配置
PyDev安装好之后，需要配置解释器。在 Eclipse 菜单栏中，选择Window > Preferences > Pydev > Interpreter – Python，在此配置 Python。首先需要添加已安装的解释器。

我使用的是Python3.x版本，Python安装在C:\Python34 路径下。单击 New，进入对话框。Interpreter Name可以随便命名，Interpreter Executable选择Python解释器python.exe。

![](/assets/python/pydev4.jpg)

点击OK后跳出一个有很多复选框的窗口，选择需要加入SYSTEM pythonpath的选项，点击Ok。全部选择就可以了！

![](/assets/python/pydev5.jpg)

然后在Python Interpreters的窗口，再次点击OK，即完成了Python解释器的配置。

到此PyDev就已经完成了配置，可以使用Eclipse开始编写Python。