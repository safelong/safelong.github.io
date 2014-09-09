---
layout: post
title : Mysql,Oracle,Java数据类型对应
thread: 7
category: 数据库
avatarimg: ""
tags : [ java ,技术,数据库]
keywords: mysql, oracle, java, 数据类型
description: Mysql,Oracle,Java数据类型对应
---

<table class="table table-bordered table-striped table-condensed">
   <tr>
      <th class="span2">Mysql</th>
      <th class="span2">Oracle</th>
      <th class="span2">Java</th>
   </tr>
   <tr>
      <td>BIGINT</td>
      <td>NUMBER(19,0)</td>
      <td>java.lang.Long</td>
   </tr>
   <tr>
      <td>BIT</td>
      <td>RAW</td>
      <td>byte[]</td>
   </tr>
   <tr>
      <td>BLOB</td>
      <td>BLOB&#160;&#160; RAW</td>
      <td>byte[]</td>
   </tr>
   <tr>
      <td>CHAR</td>
      <td>CHAR</td>
      <td>java.lang.String</td>
   </tr>
   <tr>
      <td>DATE</td>
      <td>DATE</td>
      <td>java.sql.Date</td>
   </tr>
   <tr>
      <td>DATETIME</td>
      <td>DATE</td>
      <td>java.sql.Timestamp</td>
   </tr>
   <tr>
      <td>DECIMAL</td>
      <td>FLOAT (24)</td>
      <td>java.math.BigDecimal</td>
   </tr>
   <tr>
      <td>DOUBLE</td>
      <td>FLOAT (24)</td>
      <td>java.lang.Double</td>
   </tr>
   <tr>
      <td>DOUBLE PRECISION</td>
      <td>FLOAT (24)</td>
      <td>java.lang.Double</td>
   </tr>
   <tr>
      <td>ENUM</td>
      <td>VARCHAR2</td>
      <td>java.lang.String</td>
   </tr>
   <tr>
      <td>FLOAT</td>
      <td>FLOAT</td>
      <td>java.lang.Float</td>
   </tr>
   <tr>
      <td>INT</td>
      <td>NUMBER(10,0)</td>
      <td>java.lang.Integer</td>
   </tr>
   <tr>
      <td>INTEGER</td>
      <td>NUMBER(10,0)</td>
      <td>java.lang.Integer</td>
   </tr>
   <tr>
      <td>LONGBLOB</td>
      <td>BLOB RAW</td>
      <td>byte[]</td>
   </tr>
   <tr>
      <td>LONGTEXT</td>
      <td>CLOB RAW</td>
      <td>java.lang.String</td>
   </tr>
   <tr>
      <td>MEDIUMBLOB</td>
      <td>BLOB RAW</td>
      <td>byte[]</td>
   </tr>
   <tr>
      <td>MEDIUMINT</td>
      <td>NUMBER(7,0)</td>
      <td>java.lang.Integer</td>
   </tr>
   <tr>
      <td>MEDIUMTEXT</td>
      <td>CLOB RAW</td>
      <td>java.lang.String</td>
   </tr>
   <tr>
      <td>NUMERIC</td>
      <td>NUMBER</td>
      <td></td>
   </tr>
   <tr>
      <td>REAL</td>
      <td>FLOAT (24)</td>
      <td></td>
   </tr>
   <tr>
      <td>SET</td>
      <td>VARCHAR2</td>
      <td>java.lang.String</td>
   </tr>
   <tr>
      <td>SMALLINT</td>
      <td>NUMBER(5,0)</td>
      <td>java.lang.Integer</td>
   </tr>
   <tr>
      <td>TEXT</td>
      <td>VARCHAR2 CLOB</td>
      <td>java.lang.String</td>
   </tr>
   <tr>
      <td>TIME</td>
      <td>DATE</td>
      <td>java.sql.Time</td>
   </tr>
   <tr>
      <td>TIMESTAMP</td>
      <td>DATE</td>
      <td>java.sql.Timestamp</td>
   </tr>
   <tr>
      <td>TINYBLOB</td>
      <td>RAW</td>
      <td>byte[]</td>
   </tr>
   <tr>
      <td>TINYINT</td>
      <td>NUMBER(3,0)</td>
      <td>java.lang.Boolean</td>
   </tr>
   <tr>
      <td>TINYTEXT</td>
      <td>VARCHAR2</td>
      <td>java.lang.String</td>
   </tr>
   <tr>
      <td>VARCHAR</td>
      <td>VARCHAR2 CLOB</td>
      <td>java.lang.String</td>
   </tr>
   <tr>
      <td>YEAR</td>
      <td>NUMBER</td>
      <td>java.sql.Date</td>
   </tr>
   <tr>
      <td></td>
   </tr>
</table>