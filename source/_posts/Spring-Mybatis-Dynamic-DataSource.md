---
title: Spring + Mybatis Dynamic DataSource
date: 2018-07-27 13:36:33
tags: [Spring, Mybatis]
categories: Computer Science
---
为了做隔离性比较好的multi-tenant app，决定做schema based multi-tenant，这就需要
- Runtime切换DataSource
- 为了使添加新tenant不用重启，最好还能实现Runtime添加DataSource  

所以分2步实现这两个功能。  

代码：https://github.com/fanjingdan012/ssm  
目前有3个branch
- master是基础版Spring+Mybatis+Mariadb，能Read一个DataSource
- multi-data-source是实现Runtime切换DataSource的
- multi-tenant是实现现Runtime添加DataSource的  

# 预先定义DataSource，Runtime切换

## 效果
- 数据库准备，这里用了mariadb，用了两个schema， test和test2，里面是同样的一张member表，插入一点不同的数据
![这里写图片描述](https://img-blog.csdn.net/201807231521545?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2ZhbmppbmdkYW4=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
- 用header控制Tenant-ID，从而访问不同的DataSource
![这里写图片描述](https://img-blog.csdn.net/20180723152505201?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2ZhbmppbmdkYW4=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
## 代码
写一个MultitenantDataSource.java, `MultitenantDataSource extends AbstractRoutingDataSource`  

看一下`AbstractRoutingDataSource`的源代码
```java
	protected DataSource determineTargetDataSource() {
		Assert.notNull(this.resolvedDataSources, "DataSource router not initialized");
		Object lookupKey = determineCurrentLookupKey();
		DataSource dataSource = this.resolvedDataSources.get(lookupKey);
		if (dataSource == null && (this.lenientFallback || lookupKey == null)) {
			dataSource = this.resolvedDefaultDataSource;
		}
		if (dataSource == null) {
			throw new IllegalStateException("Cannot determine target DataSource for lookup key [" + lookupKey + "]");
		}
		return dataSource;
	}
```
里面有一个`resolvedDataSources`的Map，存储了多个DataSource，会调用`determineCurrentLookupKey()`来Runtime决定使用哪个DataSource，如果没有指定的那个Key，那么就会使用DefaultDataSource  
所以使用它就是需要
- Override `determineCurrentLookupKey()`方法，定义tenantId作为key
```java
public class MultitenantDataSource extends AbstractRoutingDataSource {
    @Override
    protected Object determineCurrentLookupKey() {
        return TenantContext.getCurrentTenant();
    }
}
```
- 调用`setTargetDataSources`方法去把Map填进去
- 调用`setDefaultTargetDataSource` 方法把DefaultDataSource设置好，最好是将DefaultDataSource设置成tenant管理数据库，保存tenant相关信息，但是作为一个demo，本项目就比较简单，直接把它设为一个tenant数据库
```java
@Configuration
public class MultitenantConfiguration {

    @Bean
    public MultitenantDataSource multitenantDataSource() {
        Map<Object,Object> resolvedDataSources = new HashMap<>();
        //db1
        DataSourceBuilder dataSourceBuilder = DataSourceBuilder.create()
                .url("jdbc:mysql://localhost/test")
                .username("root")
                .password("******");
        resolvedDataSources.put("tenant1",dataSourceBuilder.build());
        resolvedDataSources.put("Default",dataSourceBuilder.build());

        //db2
        DataSourceBuilder dataSourceBuilder2 = DataSourceBuilder.create()
                .url("jdbc:mysql://localhost/test2")
                .username("root")
                .password("******");
        resolvedDataSources.put("tenant2",dataSourceBuilder2.build());


        MultitenantDataSource dataSource = new MultitenantDataSource();
        dataSource.setDefaultTargetDataSource(resolvedDataSources.get("Default"));
        dataSource.setTargetDataSources(resolvedDataSources);


        dataSource.afterPropertiesSet();

        return dataSource;
    }

```
- 在Controller里添加从header读取tenantId的逻辑
`XXController.java`
```java
	public Member member(@PathVariable("name") String name, @RequestHeader("X-TenantID") String tenantName){
		TenantContext.setCurrentTenant(tenantName);
	...
	}
```


# Runtime 添加DataSource

## 效果
- 注册新的tenant，直接把jdbc url，username， password通过request parameter传入，返回success
- 通过header控制tenantId，访问新的tenant（DataSource）的数据
![这里写图片描述](https://img-blog.csdn.net/20180723152120781?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2ZhbmppbmdkYW4=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
## 代码
- 写一个`MultitenantDataSourceRegister.java ` (`implements ImportBeanDefinitionRegistrar`), 就要实现 ` registerBeanDefinitions`方法 
```java
    public void registerBeanDefinitions(AnnotationMetadata annotaion, BeanDefinitionRegistry registry) {
        System.out.println("registerBeanDefinitions");
        GenericBeanDefinition beanDefinition = new GenericBeanDefinition();
        beanDefinition.setBeanClass(MultitenantDataSource.class);
        beanDefinition.setSynthetic(true);
        MutablePropertyValues mpv = beanDefinition.getPropertyValues();

        mpv.addPropertyValue("defaultTargetDataSource", getDefaultDataSources().get("Default"));
        mpv.addPropertyValue("targetDataSources",getDefaultDataSources());
        registry.registerBeanDefinition("dataSource", beanDefinition);
    }
```
- 在 `MultitenantConfiguration`上添加`@Import(MultitenantDataSourceRegister.class)`
```java
@Configuration
@Import(MultitenantDataSourceRegister.class)
public class MultitenantConfiguration {

    @Autowired
    private MultitenantDataSource multitenantDataSource;

}
```
- 在`MultitenantDataSource`里维护一个Map用来管理DataSources
```java
public class MultitenantDataSource extends AbstractRoutingDataSource {
    @Override
    protected Object determineCurrentLookupKey() {
        return TenantContext.getCurrentTenant();
    }
    private ConcurrentHashMap<String, DataSource> backupTargetDataSources = new ConcurrentHashMap<>();

    public void addDataSourceToTargetDataSource(String key ,DataSource ds){
        this.backupTargetDataSources.put(key, ds);
        this.setTargetDataSource(this.backupTargetDataSources);
    }


    public void setTargetDataSource(Map targetDataSource){
        super.setTargetDataSources(targetDataSource);
        this.afterPropertiesSet();
    }
}
```
- 在`XXController`里添加注册DataSource的API
```java
	@GetMapping("/api/tenant/register")
	@ResponseBody
	public String tenantRegister(@RequestParam String username, @RequestParam String password, @RequestParam String url, @RequestParam String tenantName) {
		MultitenantDataSource multitenantDataSource = ctx.getBean(MultitenantDataSource.class);
		DataSourceBuilder dataSourceBuilder = DataSourceBuilder.create()
				.url(url)
				.username(username)
				.password(password);
		multitenantDataSource.addDataSourceToTargetDataSource(tenantName, dataSourceBuilder.build());
		return "success";
	}
```