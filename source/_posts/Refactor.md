---
title: Refactor
date: 2018-08-17 12:36:38
tags: 
categories: Computer Science
---
# principles/checklist for refactor
- small
- safe
- improve
  - readable
    - meet with human god feelings
    - naming correctly
  - testable

# good practice
- don't modify param
- don't mass up input and output
  - e.g. 
  ```java
  Param someMethod(Param p){
     if(p.getA()){
        p.setB("a")
     }
     return p;
  }
  ```
- one responsibility for one method
- pass only the parameters needed by method
- keep smallest visibility
- use design pattern correctly
- UT
  - can run locally
  - fast
  - as doc to tell users how to use the method


# case study
## refactor long refreshUserGroup method
### Problem
- do update and conditional dispatch in one method
- modify parameter
- parse whole cmd but use part of the params
- no UT, just using testNG(integration test ~20 cases)
  - need to run tomcat to run cases
  - long time to run cases(~7 minutes)
  - dependency between cases(must run in a certain order)
  - dependency on db initial data
- no pipeline
- code too large
  - out of memory when running locally
  - long time to compile(~7 minutes)
- after dispached in one case, outside of that class, actually modify the param and call itself for update again
- misuse of parameter, eg isrefreshAll actually int, set to _99 to mean another case
- cmd execute is common way to implement a service, actually naming is bad, bacause not preventing any information...

## Actions
- separate update logic and dispatch logic
- separate input with output
- add UT
- only pass params that used to methods

# refactor 30000 line code UserDAO
## Problem
- too large
- own by multiple teams  
- user specific logics and application specific logics together
- referenced by other modules by jar dependency

## Actions
- remove unused methods
- move some to new user specific logic UserDAO and some to application DAO
- make original one a delegate to new ones
- add UT
- rely on interfaces between modules，interface be small
- adapters in caller,学习型测试

# UT for singlton RuleEngine 
## Problem
- different tests for different scenarios
- misuse of singleton
- class name XXFactory, actually not, it is a singleton and not producing XX Bean

## Actions
- modify UT to add mock for different scenarios

# UT for smart controller
## Problem
- too much logic done by smart widgets, not easy to test

## Actions
- verify if update methods called
- some logic move to service level to reuse code
- only test code written by you