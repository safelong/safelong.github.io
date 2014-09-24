---
layout: post
title : Mysql中查找所有外键
thread: 6
category: 数据库
avatarimg: ""
tags : [ 数据库 ,技术]
keywords: mysql, 外键，information_schema
description: Mysql中查找所有外键
---

今天修改数据库时，碰到有的表不能修改，提示有外键。
创建整个库的sql语句，并没有创建外键，很是纳闷。

最后找到原因，利用hibernate插入数据时，自动创建了外键。

麻烦来了。
我不知道有哪些外键啊，首先要删除外键，我才能修改表。

所有就用到了下面的办法，呵呵，查得英文，中文没有找到。


###一.查找所有库的存在的外键

{% highlight sql %}
	SELECT
	    CONCAT(table_name, '.', column_name) AS 'foreign key',
	    CONCAT(referenced_table_name, '.', referenced_column_name) AS 'references',
	    constraint_name AS 'constraint name'
	FROM
	    information_schema.key_column_usage
	WHERE
	    referenced_table_name IS NOT NULL;

{% endhighlight %}

###二.查找某个库的所有外键

{% highlight sql %}
	SELECT
	    CONCAT(table_name, '.', column_name) AS 'foreign key',
	    CONCAT(referenced_table_name, '.', referenced_column_name) AS 'references',
	    constraint_name AS 'constraint name'
	FROM
	    information_schema.key_column_usage
	WHERE
	    referenced_table_name IS NOT NULL
	    AND table_schema = 'your_database_name';
{% endhighlight %}

###三.查找库里某个表的所有外键

{% highlight sql %}
	SELECT *
	FROM
	  information_schema.KEY_COLUMN_USAGE
	WHERE
	  REFERENCED_TABLE_NAME = 'your_table_name'
	  AND TABLE_SCHEMA = 'your_database_name';
{% endhighlight %}

基本以上办法就能找到外键了。

有了上面的数据支持，修改表结构就简单了。

* 1.删除子表所有数据，然后修改目标结构
* 2.删除外键关联，修改母表结构
* 3.关闭外键检查 SET FOREIGN_KEY_CHECKS = 0

***
##关闭外键检查
关闭以后，删除表内的数据时，就不会有木有外键制约了

	SET FOREIGN_KEY_CHECKS = 0

##开启外键检查
修改表结束以后，如果还要使用外键，就要开启外键检查

	SET FOREIGN_KEY_CHECKS = 1


##单独删除某个表的外键

	ALTER TABLE your_table_name DROP FOREIGN KEY FK_name
