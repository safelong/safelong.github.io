---
title: 关于
layout: default
comments: no
---

<p class="lotus-breadcrub">
    <a href="{{ site.url }}/index.html" rel="nofollow" rel="nofollow" title="首页">首页</a>
    <span> &gt; </span>
    {{ page.title }}
</p>

<h1 class="lotus-pagetit">关于我</h1>

{{ site.about }}

<p><a href="http://safelong.github.io">更加详细的了解我</a></p>
----

###联系方式：

{% if site.qq %}
ＱＱ：[{{ site.qq }}](tencent://message/?uin={{ site.qq }})
{% endif %}
网站：[{{ site.author.name }}]({{ site.url }})

邮箱：[{{ site.email }}](mailto:{{ site.email }})

GitHub : [http://github.com/{{ site.github }}](http://github.com/{{ site.github }})

----
{% if site.weibo %}
[![新浪微博](http://service.t.sina.com.cn/widget/qmd/{{ site.weibo }}/148917a8/1.png)](http://weibo.com/u/{{ site.weibo }})
{% endif %}