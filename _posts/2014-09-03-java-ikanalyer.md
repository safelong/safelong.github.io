---
layout: post
title : 中文分词器IKAnalyzer简单说明
thread: 5
category: java
avatarimg: ""
tags : [ java ,技术]
keywords: 中文分词器,  IKAnalyzer,Lucene, java
description: java中文分词器IKAnalyzer简单说明
---

##IKAnalyzer的介绍		
IKAnalyzer是一个开源的，基于java语言开发的轻量级的中文分词语言包，它是以Lucene为应用主体，结合词典分词和文法分析算法的中文词组组件。

 
从3.0版本开始，IK发展为面向java的公用分词组件，独立Lucene项目，同时提供了对Lucene的默认优化实现。 


IKAnalyzer实现了简单的分词歧义排除算法，标志着IK分词器从单独的词典分词想模拟语义化分词衍生。

####IKAnalyzer 的新特性：

* 1、.采用了特有的“正向迭代最细粒度切分算法“，支持细粒度和智能分词两种切分模式；  			
* 2、在系统环境：Core2 i7 3.4G双核，4G内存，window 7 64位， Sun JDK 1.6_29 64位 普通pc环境测试，* IK2012具有160万字/秒（3000KB/S）的高速处理能力。 			
* 3、2012版本的智能分词模式支持简单的分词排歧义处理和数量词合并输出。  			
* 4、采用了多子处理器分析模式，支持：英文字母、数字、中文词汇等分词处理，兼容韩文、日文字符  		
* 5、优化的词典存储，更小的内存占用。支持用户词典扩展定义。特别的，在2012版本，词典支持中文，英文，数字混合词语。			

##IKAnalyzer的准备条件

* IKAnalyzer2012FF_u1.jar
* lucene-core-4.5.1.jar

以上jar包放入根目录的lib目录下

如果运行报错，请参照

[http://blog.csdn.net/tangpengtao/article/details/8670724](http://blog.csdn.net/tangpengtao/article/details/8670724)

##举例

下载IK Analyzer 2012FF_hf1.zip，解压到任意目录

其中IKAnalyzer2012FF_u1.jar放到lib目录下

IKAnalyzer.cfg.xml和stopword.dic放到根目录下，如src目录下

如果需要使用扩展字典，就要新建ext.dic，当然，名字可以随便取

####IKAnalyzer.cfg.xml
{% highlight xml %}
	<?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE properties SYSTEM "http://java.sun.com/dtd/properties.dtd">  
	<properties>  
	    <comment>IK Analyzer 扩展配置</comment>
	    <!--用户可以在这里配置自己的扩展字典 -->
	    <entry key="ext_dict">ext.dic;</entry>  //ext.dic，自己扩充的字典，追加一些项目特别需要的词汇
	
		<!--用户可以在这里配置自己的扩展停止词字典-->
		<entry key="ext_stopwords">stopword.dic;</entry>  // stopword.dic，停用词字典，里面的词汇，分词以后不显示
	</properties>
{% endhighlight %}

####测试代码

{% highlight java linenos %}
	package com.xxx.xxx.Common.Analyzer;
	
	import java.io.IOException;
	import java.io.StringReader;
	
	import org.apache.lucene.analysis.TokenStream;
	import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
	import org.wltea.analyzer.lucene.IKAnalyzer;
	
	public class AnalyzerTest {
	
		/**
		 * @param args
		 */
		public static void main(String[] args) {
		      // 待分词的字符串
		     String keyWords = "科比·布莱恩特（1978年8月23日－），美国职业篮球运动员，自1996年起效力于NBA洛杉矶湖人队，司职得分后卫。";
		     IKAnalyzerTest(keyWords);
		}
		
		private static void IKAnalyzerTest(String keyWords) {
		      IKAnalyzer analyzer = new IKAnalyzer();
	      	      //使用智能分词;true 时,使用智能分词。false时，进行最细颗粒度切分
	       	      analyzer.setUseSmart(true);
	       	      StringReader reader = new StringReader(keyWords); 
	        	      TokenStream ts;
		      try {
		            ts = analyzer.tokenStream("", reader);
		            CharTermAttribute term = ts.getAttribute(CharTermAttribute.class);
		            // 显示分词结果
		            while(ts.incrementToken()){  
						System.out.print(term.toString()+"|");  
		            }
		      } catch (IOException e1) {
		           e1.printStackTrace();
		      }  
		      finally
		      {
		           analyzer.close();  
		           reader.close();  
		      }
	    }
	
	}
{% endhighlight %}

####显示结果：

科|比|布莱恩特|1978年|8月|23日|美国|职业|篮球|运动员|自|1996年|起|效力|于|nba|洛杉矶|湖人队|司|职|得分|后卫|

***
####我们自己追加扩展字典，要根据项目建立自己的字典

ext.dic 追加：科比,司职

####显示结果：

科比|布莱恩特|1978年|8月|23日|美国|职业|篮球|运动员|自|1996年|起|效力|于|nba|洛杉矶|湖人队|司职|得分|后卫|


***
###参照网页：

[http://blog.csdn.net/chenghui0317/article/details/10281311](http://blog.csdn.net/chenghui0317/article/details/10281311)