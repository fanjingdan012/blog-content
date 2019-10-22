---
title: 'Spring Source Code: DefaultListableBeanFactory'
date: 2018-08-01 14:51:43
tags: [Spring]
categories: Computer Science
---
# Call Stack
```
org.springframework.beans.factory.support.DefaultListableBeanFactory.registerBeanDefinition(DefaultListableBeanFactory.java:792)
org.springframework.context.support.GenericApplicationContext.registerBeanDefinition(GenericApplicationContext.java:321)
org.springframework.context.annotation.AnnotationConfigUtils.registerPostProcessor(AnnotationConfigUtils.java:219)
org.springframework.context.annotation.AnnotationConfigUtils.registerAnnotationConfigProcessors(AnnotationConfigUtils.java:164)
org.springframework.context.annotation.AnnotationConfigUtils.registerAnnotationConfigProcessors(AnnotationConfigUtils.java:135)
org.springframework.context.annotation.AnnotatedBeanDefinitionReader.<init>(AnnotatedBeanDefinitionReader.java:87)
org.springframework.context.annotation.AnnotatedBeanDefinitionReader.<init>(AnnotatedBeanDefinitionReader.java:70)
org.springframework.boot.web.servlet.context.AnnotationConfigServletWebServerApplicationContext.<init>(AnnotationConfigServletWebServerApplicationContext.java:73)
sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)
sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
java.lang.reflect.Constructor.newInstance(Constructor.java:423)
org.springframework.beans.BeanUtils.instantiateClass(BeanUtils.java:170)
org.springframework.beans.BeanUtils.instantiateClass(BeanUtils.java:124)
org.springframework.boot.SpringApplication.createApplicationContext(SpringApplication.java:595)
org.springframework.boot.SpringApplication.run(SpringApplication.java:321)
org.springframework.boot.SpringApplication.run(SpringApplication.java:1255)
org.springframework.boot.SpringApplication.run(SpringApplication.java:1243)
com.fjd.ssm.SSMApplication.main(SSMApplication.java:14)
```
