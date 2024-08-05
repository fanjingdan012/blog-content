---
title: Hibernate
date: 2024-07-16 14:47:54
tags:
---
# Code

    at org.hibernate.type.descriptor.java.LongTypeDescriptor.unwrap(LongTypeDescriptor.java:19) ~[hibernate-core-5.6.1.Final.jar:5.6.1.Final]
    at org.hibernate.type.descriptor.sql.BigIntTypeDescriptor$1.doBind(BigIntTypeDescriptor.java:46) ~[hibernate-core-5.6.1.Final.jar:5.6.1.Final]
    at org.hibernate.type.descriptor.sql.BasicBinder.bind(BasicBinder.java:73) ~[hibernate-core-5.6.1.Final.jar:5.6.1.Final]
    at org.hibernate.type.AbstractStandardBasicType.nullSafeSet(AbstractStandardBasicType.java:276) ~[hibernate-core-5.6.1.Final.jar:5.6.1.Final]
    at org.hibernate.type.AbstractStandardBasicType.nullSafeSet(AbstractStandardBasicType.java:271) ~[hibernate-core-5.6.1.Final.jar:5.6.1.Final]
    at org.hibernate.loader.Loader.bindPositionalParameters(Loader.java:2246) ~[hibernate-core-5.6.1.Final.jar:5.6.1.Final]
    at org.hibernate.loader.Loader.bindParameterValues(Loader.java:2215) ~[hibernate-core-5.6.1.Final.jar:5.6.1.Final]
    at org.hibernate.loader.Loader.bindPreparedStatement(Loader.java:2150) ~[hibernate-core-5.6.1.Final.jar:5.6.1.Final]
    at org.hibernate.loader.Loader.prepareQueryStatement(Loader.java:2127) ~[hibernate-core-5.6.1.Final.jar:5.6.1.Final]
    at org.hibernate.loader.Loader.executeQueryStatement(Loader.java:2059) ~[hibernate-core-5.6.1.Final.jar:5.6.1.Final]
    at org.hibernate.loader.Loader.executeQueryStatement(Loader.java:2037) ~[hibernate-core-5.6.1.Final.jar:5.6.1.Final]
    at org.hibernate.loader.Loader.doQuery(Loader.java:956) ~[hibernate-core-5.6.1.Final.jar:5.6.1.Final]
    at org.hibernate.loader.Loader.doQueryAndInitializeNonLazyCollections(Loader.java:357) ~[hibernate-core-5.6.1.Final.jar:5.6.1.Final]
    at org.hibernate.loader.Loader.doList(Loader.java:2868) ~[hibernate-core-5.6.1.Final.jar:5.6.1.Final]
    at org.hibernate.loader.Loader.doList(Loader.java:2850) ~[hibernate-core-5.6.1.Final.jar:5.6.1.Final]
    at org.hibernate.loader.Loader.listIgnoreQueryCache(Loader.java:2682) ~[hibernate-core-5.6.1.Final.jar:5.6.1.Final]
    at org.hibernate.loader.Loader.list(Loader.java:2677) ~[hibernate-core-5.6.1.Final.jar:5.6.1.Final]
    at org.hibernate.loader.criteria.CriteriaLoader.list(CriteriaLoader.java:109) ~[hibernate-core-5.6.1.Final.jar:5.6.1.Final]
    at org.hibernate.internal.SessionImpl.list(SessionImpl.java:1931) ~[hibernate-core-5.6.1.Final.jar:5.6.1.Final]
    at org.hibernate.internal.CriteriaImpl.list(CriteriaImpl.java:370) ~[hibernate-core-5.6.1.Final.jar:5.6.1.Final]
    QueryBuilder.getResultList

# Config
