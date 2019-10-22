---
title: Aspectj Without Spring
date: 2018-08-06 16:24:28
tags:
categories: Computer Science
---
# Install and HelloWorld
Follow this  
http://zhoujingxian.iteye.com/blog/667214

# Src
`App.java`
```java
aspect AppAspect {
    void around():call(void App.sayHello()){
        System.out.println("before transaction....");
        proceed();
        System.out.println("after transaction....");
    }
}
public class App 
{
    public void sayHello(){
        System.out.println("Hello AspectJ.");
    }
    public static void main( String[] args )
    {
        App app = new App();
        app.sayHello();
    }
}
```

# Decompile
decompile 千万不要用idea原生的，反编译出来跟源代码没啥区别，要用JD-GUI http://jd.benow.ca/  
## AppAspect.class
```java
import org.aspectj.runtime.internal.AroundClosure;

public class AppAspect {
    public static AppAspect aspectOf() {
        if (ajc$perSingletonInstance == null)
            throw new org.aspectj.lang.NoAspectBoundException("AppAspect", ajc$initFailureCause);
        return ajc$perSingletonInstance;
    }

    public static boolean hasAspect() {
        return ajc$perSingletonInstance != null;
    }

    private static void ajc$postClinit() {
        ajc$perSingletonInstance = new AppAspect();
    }

    static {
        try {
        } catch (Throwable localThrowable) {
            ajc$initFailureCause = localThrowable;
        }
    }

    public void ajc$around$AppAspect$1$9ee7cbd2(AroundClosure ajc$aroundClosure) {
        System.out.println("before transaction....");
        ajc$around$AppAspect$1$9ee7cbd2proceed(ajc$aroundClosure);
        System.out.println("after transaction....");
    }

    private static Throwable ajc$initFailureCause;
    public static AppAspect ajc$perSingletonInstance;

    AppAspect() {
    }

    static void ajc$around$AppAspect$1$9ee7cbd2proceed(AroundClosure this)
            throws Throwable {
    }
}

```


## App.class
```java
import org.aspectj.runtime.internal.AroundClosure;

public class App {
    private static final void sayHello_aroundBody1$advice(App target, AppAspect ajc$aspectInstance, AroundClosure ajc$aroundClosure) {
        System.out.println("before transaction....");
        AroundClosure localAroundClosure = ajc$aroundClosure;
        sayHello_aroundBody0(target);
        System.out.println("after transaction....");
    }


    public void sayHello() {
        System.out.println("Hello AspectJ.");
    }

    public static void main(String[] args) {
        App app = new App();
        App localApp1 = app;
        sayHello_aroundBody1$advice(localApp1, AppAspect.aspectOf(), null);
    }

    private static final void sayHello_aroundBody0(App paramApp) {
        paramApp.sayHello();
    }

    public App() {
    }
}
```

