---
title: 'Spring Mvc Source code: Request Handling'
date: 2018-07-31 09:42:07
tags: [Spring]
categories: Computer Science
---
看看一个request过来是怎么调用到我定义的Controller的。
版本是sprin-webmvc:5.0.5.RELEASE
以https://github.com/fanjingdan012/ssm/tree/multi-tenant为例

# Call stack
从下往上读
```java
com.fjd.ssm.controller.LoginController.member(LoginController.java:28)
org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)
org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)
org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)
org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)
org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)
org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)
org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)
org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)
org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)
org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:866)
javax.servlet.http.HttpServlet.service(HttpServlet.java:635)
org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)
javax.servlet.http.HttpServlet.service(HttpServlet.java:742)
//3. Filter完，进入正文
org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)
org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)
org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)
org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)
org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)
org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.filterAndRecordMetrics(WebMvcMetricsFilter.java:158)
org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.filterAndRecordMetrics(WebMvcMetricsFilter.java:126)
org.springframework.boot.actuate.metrics.web.servlet.WebMvcMetricsFilter.doFilterInternal(WebMvcMetricsFilter.java:111)
org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)
org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)
org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)
org.springframework.boot.actuate.web.trace.servlet.HttpTraceFilter.doFilterInternal(HttpTraceFilter.java:84)
org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)
org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)
org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)
org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)
org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)
org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)
org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)
org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)
org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)
org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)
org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)
org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)
org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)
org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)
org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)
org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)
org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)
//2. 这里开始调用了6个OncePerRequestFilter
org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)
org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)
org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)
org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)
org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)
org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)
org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)
org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)
org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)
org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)
org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)
org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:790)
org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1459)
//1. ThreadPoolExecutor和NioEndpoint 可以看一下
org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)
java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)
java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)
org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)
java.lang.Thread.run(Thread.java:745)
```
- 使用ThreadPoolExecutor调用线程池，并且使用Nio
- 默认调用了6次OncePerRequestFilter

# 代码和数据

## filterChain
![filterChain](filterChain.PNG)
有7个filter，调用到自己写的Controller正好是第6个：WebMvcMetricsFilter，这7个Filter都可以去看看源代码，处理了什么。有几个很明显的处理Encoding，Context。

### 这个filterChain哪来的呢？
ApplicationFilterChain 193行
```java
//chain=this
filter.doFilter(request, response, this);
```
就是说filterChain就是ApplicationFilterChain
里面维护了一个`ApplicationFilterConfig[] filters`数组，确实里面就是7个Filter
这个数组的维护代码在`ApplicationFilterFactory.createFilterChain`115行和131行，调用了`ApplicationFilterChain.addFilter(filterConfig)`，这个`createFilterChain`也是每个request都要调用一遍
3个参数是什么呢？
- request不用说了吧
- wrapper
![wrapper](wrapper.PNG)
![wrapper2](wrapper2.PNG)
- servlet
![servlet](servlet.PNG)
这个时候filterChain里还是空的
`ApplicationFilterFactory.java`
```java
public static ApplicationFilterChain createFilterChain(ServletRequest request,
            Wrapper wrapper, Servlet servlet) {

        // If there is no servlet to execute, return null
        if (servlet == null)
            return null;

        // Create and initialize a filter chain object
        ApplicationFilterChain filterChain = null;
        if (request instanceof Request) {//1.这里=true
            Request req = (Request) request;
            if (Globals.IS_SECURITY_ENABLED) {//2.这里=false
                // Security: Do not recycle
                filterChain = new ApplicationFilterChain();
            } else {
                filterChain = (ApplicationFilterChain) req.getFilterChain();//3.其实就是走了这一句
                if (filterChain == null) {
                    filterChain = new ApplicationFilterChain();
                    req.setFilterChain(filterChain);
                }
            }
        } else {
            // Request dispatcher in use
            filterChain = new ApplicationFilterChain();
        }

        filterChain.setServlet(servlet);
        filterChain.setServletSupportsAsync(wrapper.isAsyncSupported());

        // Acquire the filter mappings for this Context
        //4.!!!这里挺关键的，拿到了wrapper.getParent(), 这个context就是
        StandardContext context = (StandardContext) wrapper.getParent();
        FilterMap filterMaps[] = context.findFilterMaps();

        // If there are no filter mappings, we are done
        if ((filterMaps == null) || (filterMaps.length == 0))
            return (filterChain);

        // Acquire the information we will need to match filter mappings
        DispatcherType dispatcher =//5.="REQUEST"
                (DispatcherType) request.getAttribute(Globals.DISPATCHER_TYPE_ATTR);

        String requestPath = null;
        Object attribute = request.getAttribute(Globals.DISPATCHER_REQUEST_PATH_ATTR);
        if (attribute != null){
            requestPath = attribute.toString();
        }//6.attribute="/members/fjd"

        String servletName = wrapper.getName();

        //7.这里就是匹配一下request，把相关的放进filterChain里，这次request是全部都放进去了
        // Add the relevant path-mapped filters to this filter chain
        for (int i = 0; i < filterMaps.length; i++) {
            if (!matchDispatcher(filterMaps[i] ,dispatcher)) {
                continue;
            }
            if (!matchFiltersURL(filterMaps[i], requestPath))
                continue;
            ApplicationFilterConfig filterConfig = (ApplicationFilterConfig)
                context.findFilterConfig(filterMaps[i].getFilterName());
            if (filterConfig == null) {
                // FIXME - log configuration problem
                continue;
            }
            filterChain.addFilter(filterConfig);
        }
        //8.这里filterChain已经有7个了
        // Add filters that match on servlet name second
        for (int i = 0; i < filterMaps.length; i++) {
            if (!matchDispatcher(filterMaps[i] ,dispatcher)) {
                continue;
            }
            //9.这里servletName=dispatcherServlet
            if (!matchFiltersServlet(filterMaps[i], servletName))
                continue;
            ApplicationFilterConfig filterConfig = (ApplicationFilterConfig)
                context.findFilterConfig(filterMaps[i].getFilterName());
            if (filterConfig == null) {
                // FIXME - log configuration problem
                continue;
            }
            //10.这里没走到
            filterChain.addFilter(filterConfig);
        }

        // Return the completed filter chain
        return filterChain;
    }

```
注释4这里拿到的context是TomcatEmbeddedContext，已经到了spring boot内嵌的tomcat的包里
![wrapperParentContext](wrapperParentContext.PNG)
后面一句话就直接拿到了7个filter：
![filterMaps](filterMaps.PNG)
也就是说filter全部都是来自TomcatEmbeddedContext，那这个是哪来的呢？(TODO)
## handler
在`DispatcherServlet.doDispatch` 991行正式去调用注册的controller
### 这个handler哪来的
```java
// Determine handler adapter for the current request.
 HandlerAdapter ha = getHandlerAdapter(mappedHandler.getHandler());
```
就是`mappedHandler.getHandler()`拿到的
mappedHandler是个HandlerExecutionChain，那里有什么东西呢
![mappedHandler](mappedHandler.PNG)
里面的东西有：
- handler，就是描述Controller里注册的那个方法的，还包含了它对应的beanFactory，就是DefaultListableBeanFactory
- interceptors，里面有两个intercepter，是Spring默认就注册了的
  - conversionService WebConversionService，看起来里面就注册了一个converter，就是处理Date和Long的转换的
  - resourceUriProvider resourceUriProvider，这里放了一些path mapper之类的东西，把基础的静态的path map了一下

### mappedHandler哪来的

```java
mappedHandler = getHandler(processedRequest);
```
看`DispatcherServlet.getHandler`代码，是`DispatcherServlet.handlerMappings`成员变量里根据request匹配到的
```java
protected HandlerExecutionChain getHandler(HttpServletRequest request) throws Exception {
        ...
            for (HandlerMapping hm : this.handlerMappings) {
                ...
                //1.核心就这一句
                HandlerExecutionChain handler = hm.getHandler(request);
                if (handler != null) {
                    return handler;
                }
            }
        ...
        return null;
    }
```

### handlerMappings里面有什么
![handlerMappings](handlerMappings.PNG)

### getHandler是怎么匹配的
这个`HandlerMapping`有两个implementation，这里是`AbstractHandlerMapping`，所以调用的是`AbstractHandlerMapping.getHandler`:
```java
    @Override
    @Nullable
    public final HandlerExecutionChain getHandler(HttpServletRequest request) throws Exception {
        //1.最核心就是这句
        Object handler = getHandlerInternal(request);
        ...
        //2.后面是handler还有个default，如果default也没有就返回null
        //3.再后面是从handler组装一个HandlerExecutionChain出来
    }
```
AbstractHandlerMapping.getHandlerInternal 是个Abstract方法，有4个实现，在这里call的是`AbstractUrlHandlerMapping.java`的`getHandlerInternal`
```java
    @Override
    @Nullable
    protected Object getHandlerInternal(HttpServletRequest request) throws Exception {
        String lookupPath = getUrlPathHelper().getLookupPathForRequest(request);//1. lookupPath="/members/fjd"
        Object handler = lookupHandler(lookupPath, request);//2.最核心就是这句
        ...
        //3.后面是handler找不到有个rootHandler，再没有有个defaultHandler,如果handler是以name表示的话再去context里getBean，再把这个root或者defaultHandler包一下，但是这些都不重要，大多数情况下都是在2这里就完成了
    }
```
然后就看一下lookupHandler的实现
```java
    @Nullable
    protected Object lookupHandler(String urlPath, HttpServletRequest request) throws Exception {
        //1. 是在handlerMap里找匹配，支持urlPath直接匹配，这个优先于pattern匹配
        // Direct match?
        Object handler = this.handlerMap.get(urlPath);
        if (handler != null) {
            // Bean name or resolved handler?
            if (handler instanceof String) {
                String handlerName = (String) handler;
                handler = obtainApplicationContext().getBean(handlerName);
            }
            validateHandler(handler, request);
            return buildPathExposingHandler(handler, urlPath, urlPath, null);
        }

        //2. 支持urlPath pattern 匹配
        // Pattern match?
        List<String> matchingPatterns = new ArrayList<>();
        for (String registeredPattern : this.handlerMap.keySet()) {
            if (getPathMatcher().match(registeredPattern, urlPath)) {
                matchingPatterns.add(registeredPattern);
            }
            else if (useTrailingSlashMatch()) {
                if (!registeredPattern.endsWith("/") && getPathMatcher().match(registeredPattern + "/", urlPath)) {
                    matchingPatterns.add(registeredPattern +"/");
                }
            }
        }

        String bestMatch = null;
        Comparator<String> patternComparator = getPathMatcher().getPatternComparator(urlPath);
        if (!matchingPatterns.isEmpty()) {
            matchingPatterns.sort(patternComparator);
            if (logger.isDebugEnabled()) {
                logger.debug("Matching patterns for request [" + urlPath + "] are " + matchingPatterns);
            }
            //3.如果有一堆匹配，只取第一个
            bestMatch = matchingPatterns.get(0);
        }
        if (bestMatch != null) {
            handler = this.handlerMap.get(bestMatch);
            if (handler == null) {
                //4.这里保证path结尾有没有"/"都一样
                if (bestMatch.endsWith("/")) {
                    handler = this.handlerMap.get(bestMatch.substring(0, bestMatch.length() - 1));
                }
                if (handler == null) {
                    throw new IllegalStateException(
                            "Could not find handler for best pattern match [" + bestMatch + "]");
                }
            }
            // Bean name or resolved handler?
            if (handler instanceof String) {
                String handlerName = (String) handler;
                handler = obtainApplicationContext().getBean(handlerName);
            }
            validateHandler(handler, request);
            String pathWithinMapping = getPathMatcher().extractPathWithinPattern(bestMatch, urlPath);

            // There might be multiple 'best patterns', let's make sure we have the correct URI template variables
            // for all of them
            Map<String, String> uriTemplateVariables = new LinkedHashMap<>();
            for (String matchingPattern : matchingPatterns) {
                if (patternComparator.compare(bestMatch, matchingPattern) == 0) {
                    Map<String, String> vars = getPathMatcher().extractUriTemplateVariables(matchingPattern, urlPath);
                    Map<String, String> decodedVars = getUrlPathHelper().decodePathVariables(request, vars);
                    uriTemplateVariables.putAll(decodedVars);
                }
            }
            if (logger.isDebugEnabled()) {
                logger.debug("URI Template variables for request [" + urlPath + "] are " + uriTemplateVariables);
            }
            return buildPathExposingHandler(handler, bestMatch, pathWithinMapping, uriTemplateVariables);
        }

        // No handler found...
        return null;
    }
```
this.handlerMap里其实不会有所有的注册的Mapping，比如本次进来就只有1条，是favico的路径，每次进去都是不一样的handlerMap。 

# 总结
到这里为止已经探究了filterChain的来源和handler怎么匹配的源代码。
这次就先到这儿吧。