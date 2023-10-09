---
title: Mockito
date: 2023-05-29 14:09:24
tags:
---
```java
    when(scaHandler.execute(any())).thenAnswer((Answer<Object>) invocation -> {
      return null;
    });
```

```java
  protected static void mockA() {
    MockedStatic<A> aMock = mockStatic(A.class);
    aMock.when(A.getA(eq(b))).thenReturn(c);
  }
```
