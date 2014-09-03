---
layout: post
title : 谷歌Oauth认证操作日历
category: java
avatarimg: ""
tags : [ java ,技术]
---

##Oauth认证				
OAuth（开放授权）是一个开放标准，允许用户让第三方应用访问该用户在某一网站上存储的私密的资源（如照片，视频，联系人列表），而无需将用户名和密码提供给第三方应用	

		
OAuth允许用户提供一个令牌，而不是用户名和密码来访问他们存放在特定服务提供者的数据。	

		
每一个令牌授权一个特定的网站（例如，视频编辑网站)在特定的时段（例如，接下来的2小时内）内访问特定的资源（例如仅仅是某一相册中的视频）。

			
这样，OAuth让用户可以授权第三方网站访问他们存储在另外服务提供者的某些特定信息，而非所有内容。			
##前提					
* 1.去https://cloud.google.com/console/project地址下，创建一个project			
* 2.在project下的APIs里面，把需要操作的API的STATUS设置成ON			
* 3.在project的Credentials里面，Creat new Client ID，选择web application,	
    设定好Redirect URIs，这是验证成功后跳转的地址			

##所需要的jar包							
*		google-oauth-client-1.17.0-rc.jar					
*		google-http-client-1.17.0-rc.jar					
*		google-api-client-1.17.0-rc.jar					
*		google-oauth-client-java6-1.17.0-rc.jar					
*		google-oauth-client-jetty-1.17.0-rc.jar					
*		google-http-client-jackson2-1.17.0-rc.jar					
*		google-api-services-oauth2-v2-rev60-1.17.0-rc.jar					
*		google-api-services-calendar-v3-rev72-1.17.0-rc.jar	(根据要操作的应用选择，以下例子是操作谷歌日历)				
*		jackson-core-2.3.0.jar					

##Oauth认证，操作谷歌日历举例
	  private static final String APPLICATION_NAME = "xxx"; 		
			
	  /** Directory to store user credentials. */		
	  private static final java.io.File DATA_STORE_DIR =		
	      new java.io.File(System.getProperty("user.home"), ".store/calendar_sample");		
			
	  /**		
	   * Global instance of the {@link DataStoreFactory}. The best practice is to make it a single		
	   * globally shared instance across your application.		
	   */		
	  private static FileDataStoreFactory dataStoreFactory;		
	  		
	  /** Global instance of the HTTP transport. */		
	  private static HttpTransport httpTransport;		
			
	  /** Global instance of the JSON factory. */		
	  private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();		
			
	// 取得Oauth认证		
	  /** Authorizes the installed application to access user's protected data. */		
	  private static Credential authorize() throws Exception {		
	    // load client secrets		
	    GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY,		
	        new InputStreamReader(CalendarSample.class.getResourceAsStream("/client_secrets.json")));	//根目录下的文件	
	    if (clientSecrets.getDetails().getClientId().startsWith("Enter")	// 验证	
	        || clientSecrets.getDetails().getClientSecret().startsWith("Enter ")) {		
	      System.out.println(		
	          "Enter Client ID and Secret from https://code.google.com/apis/console/?api=calendar "		
	          + "into calendar-cmdline-sample/src/main/resources/client_secrets.json");		
	      System.exit(1);		
	    }		
	    // set up authorization code flow		
	    GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(		
	        httpTransport, JSON_FACTORY, clientSecrets,		
	        Collections.singleton(CalendarScopes.CALENDAR)).setDataStoreFactory(dataStoreFactory)		// CalendarScopes.CALENDAR为需要授权的操作权限
	        .build();		
	    // authorize		
	    LocalServerReceiver lr = new LocalServerReceiver.Builder().setHost("localhost").setPort(4682).build();		// 设定地址和端口
	    return new AuthorizationCodeInstalledApp(flow, lr).authorize("user");		
	  }		


##谷歌的一些sample	
[https://code.google.com/p/google-api-java-client/source/browse/?repo=samples&name=default]("https://code.google.com/p/google-api-java-client/source/browse/?repo=samples&name=default")
