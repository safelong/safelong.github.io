---
layout: post
title: github pages绑定新网申请的域名
thread: 13
categories: github
tags: github
keywords: github,免费博客, 免费主页, 新网, 域名
description: github pages创建的个人主页，绑定新网申请域名
---

在github上创建个人博客也有半个月时间了。

获知github可以绑定域名，就决定申请一个个人域名来绑定。

以后大家访问我的博客，就不需要github的二级域名了，直接用我的域名访问就行了。

结果很美好，但是过程很繁琐，下面就记录一下我的这个整个过程吧。

##一.申请域名
域名服务商，国内基本就是万网和新网，我也没研究国外那些服务商。

我的选择是新网，因为我要申请的cc后缀域名，新网优惠价28一年。

万网的价格是400一年，看在钱的份上，我只能妥协了。

>PS：申请以后，通过操作，我发现，新网真的没有万网好。

>新网的服务器经常出异常，一个普通的操作界面都经常打不开。

>而且画面没有万网的友好。


具体的申请过程我就不说了，大家按照页面操作就行了。

我申请的域名是safelong.cc，后缀的选择的也看个人爱好了，没多大区别

##二.GitHub下创建CNAME
* （1）登陆访问github。
* （2）进入github中需要关联域名的相应项目。
* （3）在该项目下创建CNAME，其CNAME内容即是域名。

![](/assets/domain/domain01.jpg)

![](/assets/domain/domain02.jpg)


* （3）查看CNAME设置是否正确。

![](/assets/domain/domain03.jpg)

![](/assets/domain/domain04.jpg)

####以上几步，github这边就设置好了

##三.新网下配置DNS

* 1.用申请域名的账号，登陆新网，进入域名管理。操作-->管理

![](/assets/domain/domain05.jpg)

* 2.选择My DNS 功能

![](/assets/domain/domain06.jpg)

* 3.追加几条A记录

主机名就是申请到的域名

IP地址为github的ip：192.30.252.153和192.30.252.154

![](/assets/domain/domain07.jpg)


##四.查看结果
利用申请的域名访问。

浏览器输入"safelong.cc"或者"www.safelong.cc"

能够正常显示safelong.github.io的网页，就说明成功了。

如果显示404，那就多等一会，可能第三步的配置dns解析需要一些时间。