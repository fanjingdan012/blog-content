---
title: CGLib Source Code Read
date: 2018-08-07 17:03:46
tags: 
categories: Computer Science
---
# Call Stack
```
    at net.sf.cglib.core.CodeEmitter.visitMaxs(CodeEmitter.java:842)
    at net.sf.cglib.core.CodeEmitter.end_method(CodeEmitter.java:138)
    at net.sf.cglib.proxy.Enhancer.emitMethods(Enhancer.java:1230)
    at net.sf.cglib.proxy.Enhancer.generateClass(Enhancer.java:630)
    at net.sf.cglib.core.DefaultGeneratorStrategy.generate(DefaultGeneratorStrategy.java:25)
    at net.sf.cglib.core.AbstractClassGenerator.generate(AbstractClassGenerator.java:329)
    at net.sf.cglib.proxy.Enhancer.generate(Enhancer.java:492)
    at net.sf.cglib.core.AbstractClassGenerator$ClassLoaderData$3.apply(AbstractClassGenerator.java:93)
    at net.sf.cglib.core.AbstractClassGenerator$ClassLoaderData$3.apply(AbstractClassGenerator.java:91)
    at net.sf.cglib.core.internal.LoadingCache$2.call(LoadingCache.java:54)
    at java.util.concurrent.FutureTask.run(FutureTask.java:266)
    at net.sf.cglib.core.internal.LoadingCache.createEntry(LoadingCache.java:61)
    at net.sf.cglib.core.internal.LoadingCache.get(LoadingCache.java:34)
    at net.sf.cglib.core.AbstractClassGenerator$ClassLoaderData.get(AbstractClassGenerator.java:116)
    at net.sf.cglib.core.AbstractClassGenerator.create(AbstractClassGenerator.java:291)
    at net.sf.cglib.proxy.Enhancer.createHelper(Enhancer.java:480)
    at net.sf.cglib.proxy.Enhancer.create(Enhancer.java:305)
    at basic.ATest.testFixedValue(ATest.java:34)
```
底层用的是ASM

Enhancer
create()
```java
private Object createHelper() {
        this.preValidate();
        Object key = KEY_FACTORY.newInstance(
            this.superclass != null ? this.superclass.getName() : null, //basic.A
            ReflectUtils.getNames(this.interfaces), //null
            this.filter == ALL_ZERO ? null : new WeakCacheKey(this.filter),//null
            this.callbackTypes, //[Lorg.objectweb.asm.Type;@6b9651f3]
            this.useFactory,//true
            this.interceptDuringConstruction, //true
            this.serialVersionUID//true
        );
        this.currentKey = key;
        Object result = super.create(key);
        return result;
}
```
- `this.superclass` = basic.A
- `this.filter`=ALL_ZERO=
  ```java
    new CallbackFilter() {
        public int accept(Method method) {
            return 0;
        }
    };
  ```
`AbstractClassGenerator.create(Object key)`
```java
    protected Object create(Object key) {
        try {
            ClassLoader loader = this.getClassLoader();
            Map<ClassLoader, AbstractClassGenerator.ClassLoaderData> cache = CACHE;
            AbstractClassGenerator.ClassLoaderData data = (AbstractClassGenerator.ClassLoaderData)cache.get(loader);
            if (data == null) {//这里一般data！=null，所以不走
                Class var5 = AbstractClassGenerator.class;
                synchronized(AbstractClassGenerator.class) {
                    cache = CACHE;
                    data = (AbstractClassGenerator.ClassLoaderData)cache.get(loader);
                    if (data == null) {
                        Map<ClassLoader, AbstractClassGenerator.ClassLoaderData> newCache = new WeakHashMap(cache);
                        data = new AbstractClassGenerator.ClassLoaderData(loader);
                        newCache.put(loader, data);
                        CACHE = newCache;
                    }
                }
            }

            this.key = key;
            Object obj = data.get(this, this.getUseCache());
            return obj instanceof Class ? this.firstInstance((Class)obj) : this.nextInstance(obj);
        } catch (RuntimeException var9) {
            throw var9;
        } catch (Error var10) {
            throw var10;
        } catch (Exception var11) {
            throw new CodeGenerationException(var11);
        }
    }
```
`AbstractClassGenerator.gen`
```java
        public Object get(AbstractClassGenerator gen, boolean useCache) {
            if (!useCache) {//这里=true，所以一直走else
                return gen.generate(this);
            } else {
                Object cachedValue = this.generatedClasses.get(gen);
                return gen.unwrapCachedValue(cachedValue);
            }
        }
```
这里只有`Object cachedValue = this.generatedClasses.get(gen);`最重要，这个get方法如下，其实就是里面维护了个map当cache，cache不命中就`this.createEntry(key, cacheKey, v);`
```java
    public V get(K key) {
        KK cacheKey = this.keyMapper.apply(key);
        Object v = this.map.get(cacheKey);
        return v != null && !(v instanceof FutureTask) ? v : this.createEntry(key, cacheKey, v);
    }
```

一开始进来是关于要创建的class A的，然后走到`Object obj = data.get(this, this.getUseCache());`的时候recursive call 自己
1. 第一次进来key=net.sf.cglib.core.MethodWrapper$MethodWrapperKey
   - gen=net.sf.cglib.core.KeyFactory$Generator@27f723
   - generatedClasses=
     ```
     {net.sf.cglib.proxy.Enhancer$EnhancerKey=java.lang.ref.WeakReference@7b69c6ba, basic.A, null, null, {Lnet/sf/cglib/proxy/FixedValue;}, true, true, null=java.util.concurrent.FutureTask@46daef40, 
     net.sf.cglib.core.MethodWrapper$MethodWrapperKey=java.lang.ref.WeakReference@12f41634}
     ```
   - 返回net.sf.cglib.core.MethodWrapper$MethodWrapperKey$$KeyFactoryByCGLIB$$d45e49f7
2. 第二次进来key=basic.A的一大串，gen=Enhancer,
Enhancer.generateClass
```java
   public void generateClass(ClassVisitor v) throws Exception {
        Class sc = this.superclass == null ? Object.class : this.superclass;
        if (TypeUtils.isFinal(sc.getModifiers())) {
            throw new IllegalArgumentException("Cannot subclass final class " + sc.getName());
        } else {
            List constructors = new ArrayList(Arrays.asList(sc.getDeclaredConstructors()));
            this.filterConstructors(sc, constructors);
            List actualMethods = new ArrayList();
            List interfaceMethods = new ArrayList();
            final Set forcePublic = new HashSet();
            getMethods(sc, this.interfaces, actualMethods, interfaceMethods, forcePublic);
            List methods = CollectionUtils.transform(actualMethods, new Transformer() {
                public Object transform(Object value) {
                    Method method = (Method)value;
                    int modifiers = 16 | method.getModifiers() & -1025 & -257 & -33;
                    if (forcePublic.contains(MethodWrapper.create(method))) {
                        modifiers = modifiers & -5 | 1;
                    }

                    return ReflectUtils.getMethodInfo(method, modifiers);
                }
            });
            ClassEmitter e = new ClassEmitter(v);
            if (this.currentData == null) {
                e.begin_class(46, 1, this.getClassName(), Type.getType(sc), this.useFactory ? TypeUtils.add(TypeUtils.getTypes(this.interfaces), FACTORY) : TypeUtils.getTypes(this.interfaces), "<generated>");
            } else {
                e.begin_class(46, 1, this.getClassName(), (Type)null, new Type[]{FACTORY}, "<generated>");
            }

            List constructorInfo = CollectionUtils.transform(constructors, MethodInfoTransformer.getInstance());
            e.declare_field(2, "CGLIB$BOUND", Type.BOOLEAN_TYPE, (Object)null);
            e.declare_field(9, "CGLIB$FACTORY_DATA", OBJECT_TYPE, (Object)null);
            if (!this.interceptDuringConstruction) {
                e.declare_field(2, "CGLIB$CONSTRUCTED", Type.BOOLEAN_TYPE, (Object)null);
            }

            e.declare_field(26, "CGLIB$THREAD_CALLBACKS", THREAD_LOCAL, (Object)null);
            e.declare_field(26, "CGLIB$STATIC_CALLBACKS", CALLBACK_ARRAY, (Object)null);
            if (this.serialVersionUID != null) {
                e.declare_field(26, "serialVersionUID", Type.LONG_TYPE, this.serialVersionUID);
            }

            for(int i = 0; i < this.callbackTypes.length; ++i) {
                e.declare_field(2, getCallbackField(i), this.callbackTypes[i], (Object)null);
            }

            e.declare_field(10, "CGLIB$CALLBACK_FILTER", OBJECT_TYPE, (Object)null);
            if (this.currentData == null) {
                this.emitMethods(e, methods, actualMethods);
                this.emitConstructors(e, constructorInfo);
            } else {
                this.emitDefaultConstructor(e);
            }

            this.emitSetThreadCallbacks(e);
            this.emitSetStaticCallbacks(e);
            this.emitBindCallbacks(e);
            if (this.useFactory || this.currentData != null) {
                int[] keys = this.getCallbackKeys();
                this.emitNewInstanceCallbacks(e);
                this.emitNewInstanceCallback(e);
                this.emitNewInstanceMultiarg(e, constructorInfo);
                this.emitGetCallback(e, keys);
                this.emitSetCallback(e, keys);
                this.emitGetCallbacks(e);
                this.emitSetCallbacks(e);
            }

            e.end_class();
        }
    }
```
从ClassVisitor名称来看，就是visitor模式，v= DebuggingClassWriter@1014
sc=basic.A
methods 拿到了所有A的方法，包括Object里继承的
methods.toString()=[
test(Ljava/lang/String;)Ljava/lang/String;,   
test1(Ljava/lang/String;)Ljava/lang/String;,   
equals(Ljava/lang/Object;)Z,   
toString()Ljava/lang/String;,  
hashCode()I,  
clone()Ljava/lang/Object;]

ClassEmitter e就是新生成的代理的信息
e.classInfo.toString()=basic.A$$EnhancerByCGLIB$$a593fb86
basic.A$$EnhancerByCGLIB$$a593fb86 extends A
e.fieldInfo={CGLIB$STATIC_CALLBACKS=net.sf.cglib.core.ClassEmitter$FieldInfo@d45d4ff9, CGLIB$CALLBACK_0=net.sf.cglib.core.ClassEmitter$FieldInfo@6cada385, CGLIB$THREAD_CALLBACKS=net.sf.cglib.core.ClassEmitter$FieldInfo@15b3f091, CGLIB$BOUND=net.sf.cglib.core.ClassEmitter$FieldInfo@4050e674, CGLIB$FACTORY_DATA=net.sf.cglib.core.ClassEmitter$FieldInfo@861434f0}

callbackTypes.toString()=[Lorg.objectweb.asm.Type;@50d0686]就是Lnet/sf/cglib/proxy/FixedValue;然后就交给FixedValueGenerator去generate


# ASM
ASM的包里面大量应用了visitor模式，visit package, class, field, method, code block, frame, TryCatchBlock, MultiANewArrayInsn, LocalVariable, LineNumber, MaxsEnd, TypeAnnotation, Parameter.反正就是很细
cglib里也有同一套，加了点null判断什么的，然后就调用了ASM对应的visit方法。
参考cglib的MethodVisitorTee和asm的MethodWriter

这些XXWriter里就是直接写字节码的了，充斥了各种ByteArray，还有硬编码的字符

不知道Frame是干什么用的，里面的execute方法很震撼。。。