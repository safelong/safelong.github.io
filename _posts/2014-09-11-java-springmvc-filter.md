---
layout: post
title: Spring MVC中各个filter的用法
thread: 10
categories: java
tags: java,springMvc, filter
keywords: java,spring mvc, filter, CharacterEncodingFilter
description: Spring MVC中各个filter的用法
---

###过滤器相关类的结构
spring mvc的org.springframework.web.filter包下的Java文件如下：

![](/assets/filter/1.jpg)

类的结构如下：

![](/assets/filter/2.jpg)

###AbstractRequestLoggingFilter及其子类 

AbstractRequestLoggingFilter类定义了两个方法beforeRequest和afterRequest分别用于设定过滤前后执行的操作。

它有三个子类，分别是CommonsRequestLoggingFilter、ServletContextRequestLoggingFilter和Log4jNestedDiagnosticContextFilter，这三个子类分别实现了各自的beforeRequest和afterRequest。

其中，CommonsRequestLoggingFilter在过滤前后分别打印出一段debug的信息；

ServletContextRequestLoggingFilter在过滤前后分别向日志文件中写入一段日志信息，日志文件可由log4j.properties等指定；

Log4jNestedDiagnosticContextFilter则将日志信息存储到NDC中，NDC采用了一个类似栈的机制来push和pot上下文信息，每一个线程都独立地储存上下文信息，比如说一个servlet就可以针对 每一个request创建对应的NDC，储存客户端地址等信息。

###CharacterEncodingFilter
该过滤器是配置编码格式的，在web.xml中设置如下：

{% highlight xml %}
	<filter>
	  <filter-name>springCharacterEncodingFilter</filter-name>
	  <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
	  <init-param>
	     <param-name>forceEncoding</param-name>
	     <param-value>true</param-value>
	  </init-param>
	  <init-param>
	     <param-name>encoding</param-name>
	     <param-value>UTF-8</param-value>
	  </init-param>
	</filter>
	<filter-mapping>
	   <filter-name>springCharacterEncodingFilter</filter-name>
	   <url-pattern>/*</url-pattern>
	</filter-mapping>
{% endhighlight %}

###HiddenHttpMethodFilter
html中form表单只支持GET与POST请求，而DELETE、PUT等method并不支持，spring3添加了一个过滤器，可以将这些请求转换为标准的http方法，使得支持GET、POST、PUT与DELETE请求。

可以配置如下：

{% highlight xml %}
	<filter>
	    <filter-name>HiddenHttpMethodFilter</filter-name>
	    <filter-class>org.springframework.web.filter.HiddenHttpMethodFilter</filter-class>
	    <init-param>
	        <param-name>methodParam</param-name>
	        <param-value>_method_</param-value>
	    </init-param>
	</filter>
	<filter-mapping>
	    <filter-name>HiddenHttpMethodFilter</filter-name>
	    <url-pattern>/*</url-pattern>
	</filter-mapping>
{% endhighlight %}

在页面的form表单中设置method为Post，并添加一个如下的隐藏域：

	<input type="hidden" name="_method" value="put" />

查看HiddenHttpMethodFilter源码

{% highlight java %}
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
	        String paramValue = request.getParameter(methodParam);
	        if("POST".equals(request.getMethod()) && StringUtils.hasLength(paramValue)) {
	            String method = paramValue.toUpperCase(Locale.ENGLISH);
	            HttpServletRequest wrapper = new HttpMethodRequestWrapper(request, method);
	            filterChain.doFilter(wrapper, response);
	        } else
	        {
	            filterChain.doFilter(request, response);
	        }
	}
{% endhighlight %}

 由源码可以看出，filter只对Post方法进行过滤，且需要添加参数名为_method的隐藏域，也可以设置其他参数名，比如想设置为_method_，可以在HiddenHttpMethodFilter配置类中设置初始化参数： 

{% highlight xml %}
	<filter>
	     <filter-name>HiddenHttpMethodFilter</filter-name>
	     <filter-class>org.springframework.web.filter.HiddenHttpMethodFilter</filter-class>
	     <init-param>
	        <param-name>methodParam</param-name>
	        <param-value>_method_</param-value>
	     </init-param>
	</filter> 
{% endhighlight %}

###HttpPutFormContentFilter
由HiddenHttpMethodFilter可知，html中的form的method值只能为post或get，

我们可以通过HiddenHttpMethodFilter获取put表单中的参数键值对，而在Spring3中获取put表单的参数键值对还有另一种方法，即使用HttpPutFormContentFilter过滤器。


HttpPutFormContentFilter过滤器的作为就是获取put表单的值，并将之传递到Controller中标注了method为RequestMethod.put的方法中。


与HiddenHttpMethodFilter不同，在form中不用添加参数名为_method的隐藏域，且method不必是post，直接写成put，但该过滤器只能接受enctype值为application/x-www-form-urlencoded的表单，

也就是说，在使用该过滤器时，form表单的代码必须如下：

	<form action="" method="put" enctype="application/x-www-form-urlencoded">  
	XXXX 
	</form>  

配置如下：

{% highlight xml %}
	<filter>
	   <filter-name>httpPutFormcontentFilter</filter-name>
	   <filter-class>org.springframework.web.filter.HttpPutFormContentFilter</filter-class>
	</filter>
	<filter-mapping>
	   <filter-name>httpPutFormContentFilter</filter-name>
	   <url-pattern>/*</url-pattern>
	</filter-mapping>
{% endhighlight %}

###ShallowEtagHeaderFilter

ShallowEtagHeaderFilter是spring提供的支持ETag的一个过滤器，所谓ETag是指被请求变量的实体值，是一个可以与Web资源关联的记号，而Web资源可以是一个Web页，也可以是JSON或XML文档，服务器单独负责判断记号是什么及其含义，并在HTTP响应头中将其传送到客户端，以下是服务器端返回的格式：

	ETag:"50b1c1d4f775c61:df3"

客户端的查询更新格式是这样的：

	If-None-Match : W / "50b1c1d4f775c61:df3"  


   如果ETag没改变，则返回状态304然后不返回，这也和Last-Modified一样。


   ShallowEtagHeaderFilter会将JSP等的内容缓存，生成MD5的key，然后在response中作为Etage的header返回给客户端。下次客户端对相同的资源（或者说相同的url）发出请求时，客户端会将之前生成的key作为If-None-Match的值发送到server端。 Filter会客户端传来的值和服务器上的做比较，如果相同，则返回304；否则，将发送新的内容到客户端。


查看ShallowEtagHeaderFilter的源码如下：


{% highlight java %}
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException{
	  ShallowEtagResponseWrapper responseWrapper = new ShallowEtagResponseWrapper(response, null);
	  filterChain.doFilter(request, responseWrapper);
	  // 由此可知，服务器仍会处理请求
	  byte[] body = responseWrapper.toByteArray();
	  int statusCode = responseWrapper.getStatusCode();
	 
	  if (isEligibleForEtag(request, responseWrapper, statusCode, body)) {
	    String responseETag = generateETagHeaderValue(body);
	    response.setHeader(HEADER_ETAG, responseETag);
	 
	    String requestETag = request.getHeader(HEADER_IF_NONE_MATCH);
	    if (responseETag.equals(requestETag)) {
	      if (this.logger.isTraceEnabled()) {
	        this.logger.trace("ETag [" + responseETag + "] equal to If-None-Match, sending 304");
	      }
	      response.setStatus(304);
	    }
	    else {
	      if (this.logger.isTraceEnabled()) {
	        this.logger.trace("ETag [" + responseETag + "] not equal to If-None-Match [" + requestETag + "], sending normal response");
	      }
	      copyBodyToResponse(body, response);
	    }
	  }
	  else {
	    if (this.logger.isTraceEnabled()) {
	      this.logger.trace("Response with status code [" + statusCode + "] not eligible for ETag");
	    }
	    copyBodyToResponse(body, response);
	  }
	}
{% endhighlight %}

由源码可知，ShallowEtagHeaderFilter只能根据结果判断是否重新向客户端发送数据，并不会不处理请求，因此节省带宽，而不能提高服务器性能。


配置ShallowEtagHeaderFilter的代码如下：

{% highlight xml %}
	<filter>  
	   <filter-name>shallowEtagHeaderFilter</filter-name>  
	   <filter-class>org.springframework.web.filter.ShallowEtagHeaderFilter</fliter-class>  
	</filter>  
	<filter-mapping>  
	   <filter-name>shallowEtagHeaderFilter</filter-name>  
	   <servlet-name>spring</servlet-name>  
	</filter-mapping>
{% endhighlight %}

###RequestContextFilter
这是在Spring2.0时添加的类，通过LocaleContextHolder和RequestContextHolder把Http request对象基于LocalThread绑定到请求提供服务的线程上。现在一般使用DispatcherServlet这个中央分发器。现在RequestContextFilter过滤器主要用于第三方的Servlet，如JSF的FacesServlet。在Spring2.5之前都是使用该过滤器配置。

配置如下：

{% highlight xml %}
	<filter>  
	    <filter-name>RequestContextFilter</filter-name>  
	    <filter-class>org.springframework.web.filter.RequestContextFilter</filter-class>  
	</filter>  
	<filter-mapping>  
	    <filter-name>RequestContextFilter</filter-name>  
	    <servlet-name>Faces Servlet</servlet-name>  
	</filter-mapping>
{% endhighlight %}

###DelegatingFilterProxy

该类其实并不能说是一个过滤器，它的原型是FilterToBeanProxy，即将Filter作为spring的bean，由spring来管理。该类提供了在web.xml和application context之间的联系。

	Proxy for a standard Servlet 2.3 Filter, delegating to a Spring-managed bean that implements the Filter interface. 

有以下几个参数可以设置：

1. contextAttribute，使用委派Bean的范围，其值必须从org.springframework.context.ApplicationContext.WebApplicationContext中取得，默认值是session；其他可选的有request、globalSession和application
2. targetFilterLifecycle，是否调用Filter的init和destroy方法，默认为false。
3. targetBeanName，被代理的过滤器的bean的名字，该bean的类必须实现Filter接口。


在web.xml中配置如下：

{% highlight xml %}
	<filter>
	   <filter-name>testFilter</filter-name>
	   <filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
	   <init-param>
	      <param-name>targetBeanName</param-name>
	      <param-value>spring-bean-name</param-value>
	   </init-param>
	   <init-param>
	      <param-name>contextAttribute</param-name>
	     <param-value>session</param-value>
	   </init-param>
	   <init-param>
	      <param-name>targetFilterLifecycle</param-name>
	      <param-value>false</param-value>
	   </init-param>
	</filter>        
	<filter-mapping>
	   <filter-name>testFilter</filter-name>
	   <url-pattern>/*</url-pattern>
	</filter-mapping>
{% endhighlight %}

testBean是被spring容器管理的对象，对象的类实现了Filter接口。或者可以不用配置这个参数，这样spring容器中所有实现了Filter接口的类都被代理，实际就是把Servlet容器中的filters同spring容器中的bean关联起来，方便spring进行管理。


如果不配置DelegatingFilterProxy，则由于filter比bean先加载，也就是spring会先加载filter指定的类到container中，这样filter中注入的spring bean就为null了。如果将filter中加入DelegatingFilterProxy类，"targetFilterLifecycle"指明作用于filter的所有生命周期。原理是，DelegatingFilterProxy类是一个代理类，所有的请求都会首先发到这个filter代理，然后再按照"filter-name"委派到spring中的这个bean。


此外，spring bean实现了Filter接口，但默认情况下，是由spring容器来管理其生命周期的(不是由tomcat这种服务器容器来管理)。如果设置"targetFilterLifecycle"为True，则spring来管理Filter.init()和Filter.destroy()；若为false，则这两个方法失效。


在Spring Security中就是使用该类进行设置。即在web.xml中配置该过滤器，然后在spring security相关的配置中设置相应的过滤器bean。但是该类是spring-web包下的类，不属于Spring Security类。