---
title: Spring Security
date: 2018-12-04 16:43:57
tags: [Spring]
categories: Computer Science
---
# SSO server Callstack
- 在Spring mvc里call Filter Chain, call到org.springframework.security.web.FilterChainProxy.doFilter （extends GenericFilterBean ）
  - 这里加装了一个HttpFirewall， 提供firewalledRequest和firewalledResponse，去掉一些危险的请求
- 然后Filter到熟悉的OncePerRequestFilter，有一个WebAsyncManagerIntegrationFilter继承自它
  - 就是添加了一个SecurityContextCallableProcessingInterceptor，在处理请求的前后包了一层securityContext，preProcess设置它，postProcess clear它
- SecurityContextPersistenceFilter 强制的session管理
- HeaderWriterFilter， 写了一些security相关的header
- CsrfFilter
  - 从csrf token repository里load这个request的csrf token， 如果没有csrf token的话，那就generate一个，存csrf token repository。 跟request里带的csrf token比对，不对的话就拦截。
  - 当然，可以设置不需要csrf保护，RequestMatcher requireCsrfProtectionMatcher来决定要不要
  - example:
  ```html
  <input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}' />
  ```
- LogoutFilter
  - Logout是专门用这个来做的
- AbstractAuthenticationProcessingFilter
  - ！核心部分，就是这里验证用户名、密码。
  - call UsernamePasswordAuthenticationFilter
  - call ProviderManager.authenticate
  - call AbstractUserDetailsAuthenticationProvider.authenticate
  - call DaoAuthenticationProvider.retrieveUser
  - call this.getUserDetailsService().loadUserByUsername(username)
    - 这里我们要自己写一个XXXUserDetailsService implements UserDetailsService，实现loadUserByUsername方法就可以。
	
	
oauth/confirm_access
前面是一样的，后面又call了：
- AbstractAuthenticationProcessingFilter
  - 可以设置需不需要authentication保护
  - 用了strategy模式，自己实现sessionSrategy.onAuthentication, 一般来说会检查session，保证不被fix session攻击
- DefaultLoginPageGeneratingFilter
  - 返回login成功以后的page的
- RequestCacheAwareFilter
  - 加cache
- SecurityContextHolderAwareRequestFilter 
  - 把request替换掉了， 用来处理servlet2.5和servlet3不同的request
  - 可以设置以下
    - rolePrefix
	- AuthenticationEntryPoint
	- AuthenticationManager
	- LogoutHandler
	- updateFactory
	- TrustResolver
- AnonymousAuthenticationFilter
  - 检查securityContext有没有authentication，没有就创建
- SessionManagementFilter
  - 检查authentication，如果有且不是匿名，就触发sessionAuthenticationStrategy.onAuthentication(authentication,request, response)
- ExceptionTranslationFilter
  - 翻译authentication的exception
- FilterSecurityInterceptor
- WsFilter 
  - 可忽略，only needs to handle WebSocket upgrade requests
- 然后就回到了正常spring web的FilterChain，经过doDispatch到Controller这里

# 通过 session/cookie 维护 authentication
请求 http://127.0.0.1:8060/client2/index.html 需要Cookie: 
- JSESSIONID=90AEBC55CFDCDFD9277A00E654C6A4B4; 
- PGADMIN_LANGUAGE=en; 
- PGADMIN_KEY=13d9a244-76c6-46aa-9c66-e32ab9c9e447; 
- pga4_session="7e6549b3-743a-4992-9b04-d423caa34fcc!51GhrQLaPDsFNZMsyrY0nD2Lx/g="

# SSO Client
@EnableOAuth2Sso
marks your service as an OAuth 2.0 Client. This means that it will be responsible for redirecting Resource Owner (end user) to the Authorization Server where the user has to enter their credentials. After it's done the user is redirected back to the Client with Authorization Code (don't confuse with Access Code). Then the Client takes the Authorization Code and exchanges it for an Access Token by calling Authorization Server. Only after that, the Client can make a call to a Resource Server with Access Token.

Also, if you take a look into the source code of @EnableOAuth2Sso annotation you will see two interesting things:

@EnableOAuth2Client. This is where your service becomes OAuth 2.0 Client. It makes it possible to forward access token (after it has been exchanged for Authorization Code) to downstream services in case you are calling those services via OAuth2RestTemplate.

@EnableConfigurationProperties(OAuth2SsoProperties.class). OAuth2SsoProperties has only one property String loginPath which is /login by default. This will intercept browser requests to the /login by OAuth2ClientAuthenticationProcessingFilter and will redirect the user to the Authorization Server.

`application.properties`
security.oauth2.client.client-id=client2
security.oauth2.client.client-secret=client2
security.oauth2.client.user-authorization-uri=http://127.0.0.1:9999/server/oauth/authorize
security.oauth2.client.access-token-uri=http://127.0.0.1:9999/server/oauth/token
security.oauth2.resource.jwt.key-uri=http://127.0.0.1:9999/server/oauth/token_key

## 请求
- client2/index.html
  - Cookie: JSESSIONID=F9D6E6701C3446256BBDD3536B4C37A2
  - response: 302 
- client2/login 
  - Cookie: JSESSIONID=F9D6E6701C3446256BBDD3536B4C37A2
  - response: 302
- server/oauth/authorize?client_id=client2&redirect_uri=http://127.0.0.1:8060/client2/login&response_type=code&state=FDAZ6f
  - Cookie: JSESSIONID=3E6CBEFE193913C53AC3AAA1C7687C89
  - response: 302
- server/login
  - Cookie: JSESSIONID=3E6CBEFE193913C53AC3AAA1C7687C89
  - response: 200 + login 页面
  
  
@EnableResourceServer

