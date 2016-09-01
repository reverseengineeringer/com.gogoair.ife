package com.adobe.mobile;

import java.lang.reflect.Method;
import java.util.Map;

final class WearableFunctionBridge
{
  private static Class configSynchronizerClassLoader;
  private static Class wearableFunctionClassLoader;
  
  private static Class getConfigSynchronizerClass()
  {
    if (configSynchronizerClassLoader != null) {
      return configSynchronizerClassLoader;
    }
    try
    {
      configSynchronizerClassLoader = WearableFunctionBridge.class.getClassLoader().loadClass("com.adobe.mobile.ConfigSynchronizer");
      return configSynchronizerClassLoader;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        StaticMethods.logErrorFormat("Wearable - Failed to load class com.adobe.mobile.ConfigSynchronizer", new Object[] { localException.getLocalizedMessage() });
      }
    }
  }
  
  private static Class getWearableFunctionClass()
  {
    if (wearableFunctionClassLoader != null) {
      return wearableFunctionClassLoader;
    }
    try
    {
      wearableFunctionClassLoader = WearableFunctionBridge.class.getClassLoader().loadClass("com.adobe.mobile.WearableFunction");
      return wearableFunctionClassLoader;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        StaticMethods.logErrorFormat("Wearable - Failed to load class com.adobe.mobile.WearableFunction", new Object[] { localException.getLocalizedMessage() });
      }
    }
  }
  
  /* Error */
  protected static boolean isGooglePlayServicesEnabled()
  {
    // Byte code:
    //   0: iconst_1
    //   1: istore_1
    //   2: ldc 2
    //   4: invokevirtual 24	java/lang/Class:getClassLoader	()Ljava/lang/ClassLoader;
    //   7: ldc 57
    //   9: invokevirtual 32	java/lang/ClassLoader:loadClass	(Ljava/lang/String;)Ljava/lang/Class;
    //   12: astore_2
    //   13: aload_2
    //   14: ldc 59
    //   16: iconst_0
    //   17: anewarray 20	java/lang/Class
    //   20: invokevirtual 63	java/lang/Class:getDeclaredMethod	(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    //   23: aconst_null
    //   24: iconst_0
    //   25: anewarray 4	java/lang/Object
    //   28: invokevirtual 69	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    //   31: astore_3
    //   32: aload_2
    //   33: ldc 71
    //   35: iconst_1
    //   36: anewarray 20	java/lang/Class
    //   39: dup
    //   40: iconst_0
    //   41: ldc 73
    //   43: aastore
    //   44: invokevirtual 63	java/lang/Class:getDeclaredMethod	(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    //   47: aload_3
    //   48: iconst_1
    //   49: anewarray 4	java/lang/Object
    //   52: dup
    //   53: iconst_0
    //   54: invokestatic 77	com/adobe/mobile/StaticMethods:getSharedContext	()Landroid/content/Context;
    //   57: aastore
    //   58: invokevirtual 69	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    //   61: astore_2
    //   62: aload_2
    //   63: instanceof 79
    //   66: ifeq +36 -> 102
    //   69: aload_2
    //   70: checkcast 79	java/lang/Integer
    //   73: invokevirtual 83	java/lang/Integer:intValue	()I
    //   76: istore_0
    //   77: iload_0
    //   78: ifne +5 -> 83
    //   81: iconst_1
    //   82: ireturn
    //   83: iconst_0
    //   84: ireturn
    //   85: astore_2
    //   86: ldc 85
    //   88: iconst_1
    //   89: anewarray 4	java/lang/Object
    //   92: dup
    //   93: iconst_0
    //   94: aload_2
    //   95: invokevirtual 86	java/lang/IllegalStateException:getLocalizedMessage	()Ljava/lang/String;
    //   98: aastore
    //   99: invokestatic 89	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   102: ldc 2
    //   104: invokevirtual 24	java/lang/Class:getClassLoader	()Ljava/lang/ClassLoader;
    //   107: ldc 91
    //   109: invokevirtual 32	java/lang/ClassLoader:loadClass	(Ljava/lang/String;)Ljava/lang/Class;
    //   112: ldc 71
    //   114: iconst_1
    //   115: anewarray 20	java/lang/Class
    //   118: dup
    //   119: iconst_0
    //   120: ldc 73
    //   122: aastore
    //   123: invokevirtual 63	java/lang/Class:getDeclaredMethod	(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    //   126: aconst_null
    //   127: iconst_1
    //   128: anewarray 4	java/lang/Object
    //   131: dup
    //   132: iconst_0
    //   133: invokestatic 77	com/adobe/mobile/StaticMethods:getSharedContext	()Landroid/content/Context;
    //   136: aastore
    //   137: invokevirtual 69	java/lang/reflect/Method:invoke	(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    //   140: astore_2
    //   141: aload_2
    //   142: instanceof 79
    //   145: ifeq +39 -> 184
    //   148: aload_2
    //   149: checkcast 79	java/lang/Integer
    //   152: invokevirtual 83	java/lang/Integer:intValue	()I
    //   155: istore_0
    //   156: iload_0
    //   157: ifne +5 -> 162
    //   160: iload_1
    //   161: ireturn
    //   162: iconst_0
    //   163: istore_1
    //   164: goto -4 -> 160
    //   167: astore_2
    //   168: ldc 85
    //   170: iconst_1
    //   171: anewarray 4	java/lang/Object
    //   174: dup
    //   175: iconst_0
    //   176: aload_2
    //   177: invokevirtual 86	java/lang/IllegalStateException:getLocalizedMessage	()Ljava/lang/String;
    //   180: aastore
    //   181: invokestatic 89	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   184: iconst_0
    //   185: ireturn
    //   186: astore_2
    //   187: goto -3 -> 184
    //   190: astore_2
    //   191: goto -89 -> 102
    // Local variable table:
    //   start	length	slot	name	signature
    //   76	81	0	i	int
    //   1	163	1	bool	boolean
    //   12	58	2	localObject1	Object
    //   85	10	2	localIllegalStateException1	IllegalStateException
    //   140	9	2	localObject2	Object
    //   167	10	2	localIllegalStateException2	IllegalStateException
    //   186	1	2	localException1	Exception
    //   190	1	2	localException2	Exception
    //   31	17	3	localObject3	Object
    // Exception table:
    //   from	to	target	type
    //   2	77	85	java/lang/IllegalStateException
    //   102	156	167	java/lang/IllegalStateException
    //   102	156	186	java/lang/Exception
    //   2	77	190	java/lang/Exception
  }
  
  protected static byte[] retrieveData(String paramString1, Map paramMap, int paramInt, String paramString2)
  {
    try
    {
      paramString1 = getWearableFunctionClass().getDeclaredMethod("retrieveData", new Class[] { String.class, Map.class, Integer.TYPE, String.class }).invoke(null, new Object[] { paramString1, paramMap, Integer.valueOf(paramInt), paramString2 });
      if ((paramString1 instanceof byte[]))
      {
        paramString1 = (byte[])paramString1;
        return paramString1;
      }
    }
    catch (Exception paramString1)
    {
      StaticMethods.logErrorFormat("Wearable - Error sending request (%s)", new Object[] { paramString1.getLocalizedMessage() });
    }
    return null;
  }
  
  protected static boolean sendAnalyticsRequest(String paramString1, String paramString2, Map paramMap, int paramInt)
  {
    try
    {
      paramString1 = getWearableFunctionClass().getDeclaredMethod("sendAnalyticsRequest", new Class[] { String.class, String.class, Map.class, Integer.TYPE }).invoke(null, new Object[] { paramString1, paramString2, paramMap, Integer.valueOf(paramInt) });
      if ((paramString1 instanceof Boolean))
      {
        boolean bool = ((Boolean)paramString1).booleanValue();
        return bool;
      }
    }
    catch (Exception paramString1)
    {
      StaticMethods.logErrorFormat("Wearable - Error sending request (%s)", new Object[] { paramString1.getLocalizedMessage() });
    }
    return false;
  }
  
  protected static void sendGenericRequest(String paramString1, Map paramMap, int paramInt, String paramString2)
  {
    try
    {
      getWearableFunctionClass().getDeclaredMethod("sendGenericRequest", new Class[] { String.class, Map.class, Integer.TYPE, String.class }).invoke(null, new Object[] { paramString1, paramMap, Integer.valueOf(paramInt), paramString2 });
      return;
    }
    catch (Exception paramString1)
    {
      StaticMethods.logErrorFormat("Wearable - Error sending request (%s)", new Object[] { paramString1.getLocalizedMessage() });
    }
  }
  
  protected static boolean shouldSendHit()
  {
    if (!StaticMethods.isWearableApp()) {
      return true;
    }
    try
    {
      Object localObject = getWearableFunctionClass().getDeclaredMethod("shouldSendHit", new Class[0]).invoke(null, new Object[0]);
      if ((localObject instanceof Boolean))
      {
        boolean bool = ((Boolean)localObject).booleanValue();
        return bool;
      }
    }
    catch (Exception localException)
    {
      StaticMethods.logErrorFormat("Wearable - Error checking status of handheld app (%s)", new Object[] { localException.getLocalizedMessage() });
    }
    return true;
  }
  
  protected static void syncConfigFromHandheld()
  {
    if (!StaticMethods.isWearableApp()) {
      return;
    }
    try
    {
      getConfigSynchronizerClass().getDeclaredMethod("syncConfigFromHandheld", new Class[0]).invoke(null, new Object[0]);
      return;
    }
    catch (Exception localException)
    {
      StaticMethods.logErrorFormat("Wearable - Error syncing config (%s)", new Object[] { localException.getLocalizedMessage() });
    }
  }
  
  protected static void syncPrivacyStatusToWearable(int paramInt)
  {
    if ((StaticMethods.isWearableApp()) || (!MobileConfig.getInstance().mobileUsingGooglePlayServices())) {
      return;
    }
    try
    {
      getConfigSynchronizerClass().getDeclaredMethod("syncPrivacyStatus", new Class[] { Integer.TYPE }).invoke(null, new Object[] { Integer.valueOf(paramInt) });
      return;
    }
    catch (Exception localException)
    {
      StaticMethods.logErrorFormat("Wearable - Error syncing privacy status (%s)", new Object[] { localException.getLocalizedMessage() });
    }
  }
  
  protected static void syncVidServiceToWearable(String paramString1, String paramString2, String paramString3, long paramLong1, long paramLong2)
  {
    if ((StaticMethods.isWearableApp()) || (!MobileConfig.getInstance().mobileUsingGooglePlayServices())) {
      return;
    }
    try
    {
      getConfigSynchronizerClass().getDeclaredMethod("syncVidService", new Class[] { String.class, String.class, String.class, Long.TYPE, Long.TYPE }).invoke(null, new Object[] { paramString1, paramString2, paramString3, Long.valueOf(paramLong1), Long.valueOf(paramLong2) });
      return;
    }
    catch (Exception paramString1)
    {
      StaticMethods.logErrorFormat("Wearable - Error syncing vistor id service (%s)", new Object[] { paramString1.getLocalizedMessage() });
    }
  }
  
  protected static void syncVisitorIDToWearable(String paramString)
  {
    if ((StaticMethods.isWearableApp()) || (!MobileConfig.getInstance().mobileUsingGooglePlayServices())) {
      return;
    }
    try
    {
      getConfigSynchronizerClass().getDeclaredMethod("syncVisitorID", new Class[] { String.class }).invoke(null, new Object[] { paramString });
      return;
    }
    catch (Exception paramString)
    {
      StaticMethods.logErrorFormat("Wearable - Error syncing visitor id (%s)", new Object[] { paramString.getLocalizedMessage() });
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.WearableFunctionBridge
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */