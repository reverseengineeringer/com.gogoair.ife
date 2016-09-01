package crittercism.android;

public final class ay
  implements Thread.UncaughtExceptionHandler
{
  private Thread.UncaughtExceptionHandler a;
  private final az b;
  
  public ay(az paramaz, Thread.UncaughtExceptionHandler paramUncaughtExceptionHandler)
  {
    b = paramaz;
    a = paramUncaughtExceptionHandler;
  }
  
  /* Error */
  public final void uncaughtException(Thread paramThread, Throwable paramThrowable)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 17	crittercism/android/ay:b	Lcrittercism/android/az;
    //   4: astore_1
    //   5: aload_1
    //   6: getfield 32	crittercism/android/az:q	Lcrittercism/android/dh;
    //   9: ifnonnull +39 -> 48
    //   12: ldc 34
    //   14: invokestatic 39	crittercism/android/dy:b	(Ljava/lang/String;)V
    //   17: aload_0
    //   18: getfield 19	crittercism/android/ay:a	Ljava/lang/Thread$UncaughtExceptionHandler;
    //   21: ifnull +26 -> 47
    //   24: aload_0
    //   25: getfield 19	crittercism/android/ay:a	Ljava/lang/Thread$UncaughtExceptionHandler;
    //   28: instanceof 2
    //   31: ifne +16 -> 47
    //   34: aload_0
    //   35: getfield 19	crittercism/android/ay:a	Ljava/lang/Thread$UncaughtExceptionHandler;
    //   38: invokestatic 45	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   41: aload_2
    //   42: invokeinterface 47 3 0
    //   47: return
    //   48: aload_1
    //   49: getfield 32	crittercism/android/az:q	Lcrittercism/android/dh;
    //   52: invokevirtual 51	crittercism/android/dh:b	()V
    //   55: aload_1
    //   56: getfield 55	crittercism/android/az:c	Landroid/content/Context;
    //   59: iconst_1
    //   60: invokestatic 60	crittercism/android/dr:a	(Landroid/content/Context;Z)V
    //   63: aload_1
    //   64: getfield 64	crittercism/android/az:f	Lcrittercism/android/dx;
    //   67: invokevirtual 69	crittercism/android/dx:b	()Z
    //   70: ifne -53 -> 17
    //   73: aload_1
    //   74: getfield 73	crittercism/android/az:t	Z
    //   77: ifeq +127 -> 204
    //   80: new 75	crittercism/android/bk
    //   83: dup
    //   84: aload_2
    //   85: invokestatic 45	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   88: invokevirtual 79	java/lang/Thread:getId	()J
    //   91: invokespecial 82	crittercism/android/bk:<init>	(Ljava/lang/Throwable;J)V
    //   94: astore_3
    //   95: new 84	org/json/JSONArray
    //   98: dup
    //   99: invokespecial 85	org/json/JSONArray:<init>	()V
    //   102: aload_3
    //   103: invokevirtual 88	crittercism/android/bk:a	()Lorg/json/JSONObject;
    //   106: invokevirtual 92	org/json/JSONArray:put	(Ljava/lang/Object;)Lorg/json/JSONArray;
    //   109: astore_3
    //   110: new 94	crittercism/android/dk
    //   113: dup
    //   114: new 96	crittercism/android/cv
    //   117: dup
    //   118: aload_1
    //   119: invokespecial 99	crittercism/android/cv:<init>	(Lcrittercism/android/au;)V
    //   122: getstatic 105	crittercism/android/br:e	Lcrittercism/android/br;
    //   125: invokevirtual 108	crittercism/android/br:f	()Ljava/lang/String;
    //   128: aload_3
    //   129: invokevirtual 111	crittercism/android/cv:a	(Ljava/lang/String;Lorg/json/JSONArray;)Lcrittercism/android/cv;
    //   132: new 113	crittercism/android/dd
    //   135: dup
    //   136: new 115	crittercism/android/dc
    //   139: dup
    //   140: aload_1
    //   141: getfield 119	crittercism/android/az:u	Lcrittercism/android/bb;
    //   144: invokevirtual 123	crittercism/android/bb:b	()Ljava/lang/String;
    //   147: ldc 125
    //   149: invokespecial 128	crittercism/android/dc:<init>	(Ljava/lang/String;Ljava/lang/String;)V
    //   152: invokevirtual 131	crittercism/android/dc:a	()Ljava/net/URL;
    //   155: invokespecial 134	crittercism/android/dd:<init>	(Ljava/net/URL;)V
    //   158: aconst_null
    //   159: invokespecial 137	crittercism/android/dk:<init>	(Lcrittercism/android/cx;Lcrittercism/android/dd;Lcrittercism/android/cz;)V
    //   162: invokevirtual 140	crittercism/android/dk:run	()V
    //   165: goto -148 -> 17
    //   168: astore_1
    //   169: aload_1
    //   170: athrow
    //   171: astore_1
    //   172: aload_0
    //   173: getfield 19	crittercism/android/ay:a	Ljava/lang/Thread$UncaughtExceptionHandler;
    //   176: ifnull +26 -> 202
    //   179: aload_0
    //   180: getfield 19	crittercism/android/ay:a	Ljava/lang/Thread$UncaughtExceptionHandler;
    //   183: instanceof 2
    //   186: ifne +16 -> 202
    //   189: aload_0
    //   190: getfield 19	crittercism/android/ay:a	Ljava/lang/Thread$UncaughtExceptionHandler;
    //   193: invokestatic 45	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   196: aload_2
    //   197: invokeinterface 47 3 0
    //   202: aload_1
    //   203: athrow
    //   204: aload_1
    //   205: aload_2
    //   206: invokevirtual 143	crittercism/android/az:a	(Ljava/lang/Throwable;)V
    //   209: goto -192 -> 17
    //   212: astore_1
    //   213: ldc -111
    //   215: aload_1
    //   216: invokestatic 148	crittercism/android/dy:a	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   219: aload_0
    //   220: getfield 19	crittercism/android/ay:a	Ljava/lang/Thread$UncaughtExceptionHandler;
    //   223: ifnull -176 -> 47
    //   226: aload_0
    //   227: getfield 19	crittercism/android/ay:a	Ljava/lang/Thread$UncaughtExceptionHandler;
    //   230: instanceof 2
    //   233: ifne -186 -> 47
    //   236: aload_0
    //   237: getfield 19	crittercism/android/ay:a	Ljava/lang/Thread$UncaughtExceptionHandler;
    //   240: invokestatic 45	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   243: aload_2
    //   244: invokeinterface 47 3 0
    //   249: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	250	0	this	ay
    //   0	250	1	paramThread	Thread
    //   0	250	2	paramThrowable	Throwable
    //   94	35	3	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   0	17	168	java/lang/ThreadDeath
    //   48	165	168	java/lang/ThreadDeath
    //   204	209	168	java/lang/ThreadDeath
    //   0	17	171	finally
    //   48	165	171	finally
    //   169	171	171	finally
    //   204	209	171	finally
    //   213	219	171	finally
    //   0	17	212	java/lang/Throwable
    //   48	165	212	java/lang/Throwable
    //   204	209	212	java/lang/Throwable
  }
}

/* Location:
 * Qualified Name:     crittercism.android.ay
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */