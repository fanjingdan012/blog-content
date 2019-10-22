---
title: Spring @PreAuthorize Source Code
date: 2019-06-06 14:41:57
tags: [Spring]
categories: Computer Science
---
在方法上打上@PreAuthorize就是创建了这个Controller的动态代理
会Call AbstractSecurityInterceptor的beforeInvocation方法
call AccessDecisionManager
	void decide(Authentication authentication, Object object,
			Collection<ConfigAttribute> configAttributes) throws AccessDeniedException,
			InsufficientAuthenticationException;

AffirmativeBased 肯定：一票通过制
只要有投通过（ACCESS_GRANTED）票，则直接判为通过。
如果没有投通过票且反对（ACCESS_DENIED）票在两个及其以上的，则直接判为不通过。
ConsensusBased 共识决策法

UnanimousBased 一致同意
一票否决
hasScope这里是AffirmativeBased

[EL](https://docs.spring.io/spring-security/site/docs/3.0.x/reference/el-access.html)

AffirmativeBased.decide
循环所有voter
看结果是ACCESS_ABSTAIN避免（弃权） ACCESS_GRANTED ACCESS_DENIED
PreInvocationAuthorizationAdviceVoter是去看PreAuthorize和PreFilter的，两个都没有就弃权，否则就去Evaluate这个 expression，这个expression是刚起来的时候拿到的annotation的attribute，就去了expression包
RoleVoter一定是ROLE_开头的
AuthenticatedVoter


ExpressionUtils.evaluateAsBoolean (Expression expr, EvaluationContext ctx)
`#oauth2.throwOnError(#oauth2.hasScope('Compliance.Configuration.View'))`
Call SpelExpression.getValue(EvaluationContext context, @Nullable Class<T> expectedResultType) 
