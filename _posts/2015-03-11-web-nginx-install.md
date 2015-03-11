---
layout: post
title: windows下Nginx安装
thread: 25
categories: web
tags: nginx
keywords: nginx安装，10013，windows
description: nginx的初步接触和安装
---

##Nginx简介
Nginx ("engine x") 是一个高性能的 HTTP 和 反向代理 服务器，也是一个 IMAP/POP3/SMTP 代理服务器。 Nginx 是由 Igor Sysoev 为俄罗斯访问量第二的 Rambler.ru 站点开发的，第一个公开版本0.1.0发布于2004年10月4日。其将源代码以类BSD许可证的形式发布，因它的稳定性、丰富的功能集、示例配置文件和低系统资源的消耗而闻名。2011年6月1日，nginx 1.0.4发布。

在高连接并发的情况下，Nginx是Apache服务器不错的替代品。能够支持高达 50,000 个并发连接数的响应，感谢Nginx为我们选择了 epoll and kqueue作为开发模型。
Nginx作为负载均衡服务器：Nginx 既可以在内部直接支持 Rails 和 PHP 程序对外进行服务，也可以支持作为 HTTP代理服务器对外进行服务。Nginx采用C进行编写，不论是系统资源开销还是CPU使用效率都比 Perlbal 要好很多。

作为邮件代理服务器：Nginx 同时也是一个非常优秀的邮件代理服务器（最早开发这个产品的目的之一也是作为邮件代理服务器），Last. fm 描述了成功并且美妙的使用经验。
Nginx 是一个安装非常的简单，配置文件非常简洁（还能够支持perl语法），Bugs非常少的服务器：Nginx 启动特别容易，并且几乎可以做到7*24不间断运行，即使运行数个月也不需要重新启动。你还能够不间断服务的情况下进行软件版本的升级。

更多内容，请阅读[http://baike.baidu.com/link?url=qN9jmZAlaewLyhr4vKgOAvTpyXDCkDe5dActqg13MXWnT1PF59tXZYaswY08IgazR2TOhxjC3Y0JD9BJybOdYa](http://baike.baidu.com/link?url=qN9jmZAlaewLyhr4vKgOAvTpyXDCkDe5dActqg13MXWnT1PF59tXZYaswY08IgazR2TOhxjC3Y0JD9BJybOdYa)

##下载
移步官网下载[http://nginx.org/en/download.html](http://nginx.org/en/download.html)

这里我们下载的版本是Stable version，nginx/Windows-1.6.2 

##安装起动

解压缩nginx-1.6.2.zip到任何目录，

这里我放到了D盘的根目录下。

起动cmd，命令进入

	
	D:\>cd nginx-1.6.2
	
	D:\nginx-1.6.2>nginx.exe
	nginx: [emerg] bind() to 0.0.0.0:80 failed (10013: An attempt was made to access
	 a socket in a way forbidden by its access permissions)

直接报错，不要着急，这个错误就是提示80端口被占用了。

修改conf目录下的nginx.conf，找到以下位置

        listen       80;
        server_name  localhost;

改为任意没有占用的端口，我改成了8088

        listen       8088;
        server_name  localhost;

再用命令起动，没有报任何错误
	D:\>cd nginx-1.6.2

##验证
任意浏览器，地址栏输入 

http://localhost:8088/

出现以下界面，就说明Nginx运行正常了

![](/assets/nginx/nginx.jpg)