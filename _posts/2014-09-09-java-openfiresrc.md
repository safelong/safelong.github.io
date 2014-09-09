---
layout: post
title: openfire源代码编译
thread: 2
categories: java
tags: java,openfire
keywords: java,openfire
description: openfire源代码编译和问题解决
---

##准备源文件
首先，将下载的源代码压缩包解压出来的 openfire_src 目录 copy 至 eclipse 的 workspace 下面。


把 openfire_src\build\eclipse 目录下的文件夹setting、文件classpth、文件project全部copy到 openfire_src\ 目录下，

然后把openfire_src\classpth、openfire_src\project修改成Eclipse工程配置文件格式：

     openfire_src\.classpath
     openfire_src\.project 、

（如果无法修改文件名，copy任一现有项目的文件后修改其内容亦可，或者 cmd 内使用 move 命令修改）。

##导入工程&解决编译问题
然后打开Eclipse，选择 File –> Import… –> Existing Projects into Workspace  选择 openfire_src 目录导入即可。


自动编译是可能发生错误：

![](/assets/Openfire/Image9.png)

需要从 classpath 里面把对 bouncycastle.jar 的依赖删除，然后追加以下几个 jar 到 classpath

（文件都在 \openfire_src\build\lib\dist\）：

![](/assets/Openfire/Image10.png)

这个主要是因为 openfire 新版本对 bouncycastle 的依赖版本升级到了 1.49。


接下来如果项目编译后产生编译错误，主要是缺少 coherence 相应的包，可从官网下载以下文件（需登录。CSDN 上也有）：

     coherence.jar
     coherence-work.jar

[http://www.oracle.com/technetwork/middleware/coherence/downloads/index.html](http://www.oracle.com/technetwork/middleware/coherence/downloads/index.html)


将文件放入 openfire_src\src\plugins\clustering\lib 目录，然后加入 classpath：

![](/assets/Openfire/Image11.png)

此外还需要 tangosol.jar ，可从 CSDN 下载，如上放入同一目录并添加到 classpath。

接下来如果报错找不到：org.eclipse.jetty.jmx，则需要把如下 jetty-jmx.jar 加入到 classpath：

![](/assets/Openfire/Image12.png)

如果报错 org.apache.mina.integration 找不到，则需要同样添加以下文件到 classpath：

      \openfire_src\build\lib\merge\mina-integration-jmx.jar

如果 SipCommRouter，SipManager 报错说有些 abstract 方法没实装，可以让 eclipse 自动修复即可。

最后在 SipManager 中 line 452 还有一个错：Unhandled exception type InvalidArgumentException

只要使用 eclipse 修复，自动加一个 throw 声明即可。

至此，编译 OK。


##生成目标文件
然后可以使用 **Ant 来生成目标文件**：

![](/assets/Openfire/Image13.png)


会在 /openfire_src/ 的目录下生成两个新的文件夹：target 和 work 。

在Build Path配置中把以下三个文件夹添加到 Source 中：

     /openfire_src/src/i18n 
     /openfire_src/src/resources/jar
     /openfire_src/build/lib/dist

![](/assets/Openfire/Image14.png)

注意追加这个以后需要重新编译，Ant 一下整个 project，否则下面 Run 的时候控制台可能会报错：

     Can't find bundle for base name openfire_i18n, locale en

##配置启动参数
最后需要**配置启动参数**：

选择Run –> Run Configurations… 左边的Java Application，单击右键，选择 New，创建一个，

然后设定 project 和 Main Class：

![](/assets/Openfire/Image15.png)

需要设置 VM 参数：

![](/assets/Openfire/Image16.png)

设置 Common 属性：

![](/assets/Openfire/Image17.png)

然后即可运行成功，输出窗口显示：

	Openfire 3.9.1 [Mar 6, 2014 2:27:11 PM]
	Admin console listening at http://127.0.0.1:9090


然后在浏览器输入：http://127.0.0.1:9090 即可访问。


要注意，如果访问前有以前启动 openfire 失败的 javaw 进程存在，

或者以前开启着别的 openfire 程序（可能是编译 openfire src 前执行的 exe），

那么访问上述网站可能会出现 500 错误。此时需要把关联的 process 都结束掉再试即可。



***
####参考：

* [http://www.micmiu.com/opensource/openfire/openfire-src-config/](http://www.micmiu.com/opensource/openfire/openfire-src-config/)
* [http://gao-xianglong.iteye.com/blog/1944234](http://gao-xianglong.iteye.com/blog/1944234)
* [http://blog.sina.com.cn/s/blog_414cc36d0101fmqo.html](http://blog.sina.com.cn/s/blog_414cc36d0101fmqo.html)