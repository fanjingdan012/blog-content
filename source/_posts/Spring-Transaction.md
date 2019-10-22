---
title: Spring Transaction
date: 2019-04-16 19:19:08
tags: [Spring]
categories: Computer Science
---
# Propagation
![Propagation](https://fanjingdan012.github.io/2019/04/16/Spring-Transaction/propagation.png)

# 源代码
其实通过Interceptor加的。
`TransactionAspectSupport.java`
```java
/**
	 * General delegate for around-advice-based subclasses, delegating to several other template
	 * methods on this class. Able to handle {@link CallbackPreferringPlatformTransactionManager}
	 * as well as regular {@link PlatformTransactionManager} implementations.
	 * @param method the Method being invoked
	 * @param targetClass the target class that we're invoking the method on
	 * @param invocation the callback to use for proceeding with the target invocation
	 */
	@Nullable
	protected Object invokeWithinTransaction(Method method, @Nullable Class<?> targetClass,
			final InvocationCallback invocation) throws Throwable {

		// If the transaction attribute is null, the method is non-transactional.
		TransactionAttributeSource tas = getTransactionAttributeSource();
		final TransactionAttribute txAttr = (tas != null ? tas.getTransactionAttribute(method, targetClass) : null);
		final PlatformTransactionManager tm = determineTransactionManager(txAttr);
		final String joinpointIdentification = methodIdentification(method, targetClass, txAttr);

		if (txAttr == null || !(tm instanceof CallbackPreferringPlatformTransactionManager)) {
			// Standard transaction demarcation with getTransaction and commit/rollback calls.
			TransactionInfo txInfo = createTransactionIfNecessary(tm, txAttr, joinpointIdentification);
			Object retVal = null;
			try {
				// This is an around advice: Invoke the next interceptor in the chain.
				// This will normally result in a target object being invoked.
				retVal = invocation.proceedWithInvocation();
			}
			catch (Throwable ex) {
				// target invocation exception
				completeTransactionAfterThrowing(txInfo, ex);
				throw ex;
			}
			finally {
				cleanupTransactionInfo(txInfo);
			}
			commitTransactionAfterReturning(txInfo);
			return retVal;
		} else{...CallbackPreferringPlatformTransactionManager处理：可以定义transaction callback的}

	}
```

transactionInfoHolder 其实是个ThreadLocal bindToThread
# 提交点
java1.4
savepoint
a1
insert1
a2
insert2
a3
insert3

savepoint是在数据库事务处理中实现“子事务”（subtransaction），也称为嵌套事务的方法。事务可以回滚到savepoint而不影响savepoint创建前的变化。不需要放弃整个事务。

SQL语言国际标准中，SAVEPOINT name语句声明一个savepoint。ROLLBACK TO SAVEPOINT name语句回滚到savepoint。RELEASE SAVEPOINT name将使得命名的savepoint被放弃，但不影响其他savepoint。ROLLBACK或COMMIT导致所有savepoint被放弃。

支持savepoint的数据库有：PostgreSQL, Oracle数据库, Microsoft SQL Server, MySQL, DB2, SQLite (从3.6.8), Firebird, H2数据库, Informix (从11.50xC3).
