package com.adobe.mobile;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.os.Build.VERSION;
import com.google.android.gms.wearable.Asset;
import com.google.android.gms.wearable.DataMap;
import java.io.File;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

abstract class WearableDataRequest
{
  protected int timeOut;
  protected String uuid = UUID.randomUUID().toString();
  
  protected WearableDataRequest() {}
  
  protected WearableDataRequest(int paramInt)
  {
    this();
    timeOut = paramInt;
  }
  
  protected static WearableDataRequest createFileRequest(String paramString1, String paramString2, int paramInt)
  {
    return new Cache(paramString1, paramString2, paramInt);
  }
  
  protected static WearableDataRequest createGetRequest(String paramString, int paramInt)
  {
    return new Get(paramString, paramInt);
  }
  
  protected static WearableDataRequest createPostRequest(String paramString1, String paramString2, int paramInt)
  {
    return new Post(paramString1, paramString2, paramInt);
  }
  
  protected static WearableDataRequest createRequestFromDataMap(DataMap paramDataMap)
  {
    if (paramDataMap.getString("Type").equals("POST")) {
      return new Post(paramDataMap);
    }
    if (paramDataMap.getString("Type").equals("GET")) {
      return new Get(paramDataMap);
    }
    if (paramDataMap.getString("Type").equals("Config")) {
      return new ShareConfig(paramDataMap);
    }
    if (paramDataMap.getString("Type").equals("File")) {
      return new Cache(paramDataMap);
    }
    return null;
  }
  
  protected static WearableDataRequest createShareConfigRequest(int paramInt)
  {
    return new ShareConfig(paramInt);
  }
  
  /* Error */
  private static byte[] readFile(File paramFile)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 102	java/io/File:length	()J
    //   4: l2i
    //   5: newarray <illegal type>
    //   7: astore_3
    //   8: new 104	java/io/FileInputStream
    //   11: dup
    //   12: aload_0
    //   13: invokespecial 107	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   16: astore_2
    //   17: aload_2
    //   18: astore_0
    //   19: aload_2
    //   20: aload_3
    //   21: invokevirtual 113	java/io/InputStream:read	([B)I
    //   24: istore_1
    //   25: iload_1
    //   26: iconst_m1
    //   27: if_icmpne +25 -> 52
    //   30: aload_2
    //   31: ifnull +7 -> 38
    //   34: aload_2
    //   35: invokevirtual 116	java/io/InputStream:close	()V
    //   38: aconst_null
    //   39: areturn
    //   40: astore_0
    //   41: ldc 118
    //   43: iconst_0
    //   44: anewarray 4	java/lang/Object
    //   47: invokestatic 124	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   50: aconst_null
    //   51: areturn
    //   52: aload_2
    //   53: ifnull +7 -> 60
    //   56: aload_2
    //   57: invokevirtual 116	java/io/InputStream:close	()V
    //   60: aload_3
    //   61: areturn
    //   62: astore_0
    //   63: ldc 118
    //   65: iconst_0
    //   66: anewarray 4	java/lang/Object
    //   69: invokestatic 124	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   72: goto -12 -> 60
    //   75: astore_0
    //   76: aconst_null
    //   77: astore_0
    //   78: ldc 126
    //   80: iconst_0
    //   81: anewarray 4	java/lang/Object
    //   84: invokestatic 129	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   87: aload_0
    //   88: ifnull -50 -> 38
    //   91: aload_0
    //   92: invokevirtual 116	java/io/InputStream:close	()V
    //   95: aconst_null
    //   96: areturn
    //   97: astore_0
    //   98: ldc 118
    //   100: iconst_0
    //   101: anewarray 4	java/lang/Object
    //   104: invokestatic 124	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   107: aconst_null
    //   108: areturn
    //   109: astore_0
    //   110: aconst_null
    //   111: astore_2
    //   112: aload_2
    //   113: astore_0
    //   114: ldc 126
    //   116: iconst_0
    //   117: anewarray 4	java/lang/Object
    //   120: invokestatic 129	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   123: aload_2
    //   124: ifnull -86 -> 38
    //   127: aload_2
    //   128: invokevirtual 116	java/io/InputStream:close	()V
    //   131: aconst_null
    //   132: areturn
    //   133: astore_0
    //   134: ldc 118
    //   136: iconst_0
    //   137: anewarray 4	java/lang/Object
    //   140: invokestatic 124	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   143: aconst_null
    //   144: areturn
    //   145: astore_2
    //   146: aconst_null
    //   147: astore_0
    //   148: aload_0
    //   149: ifnull +7 -> 156
    //   152: aload_0
    //   153: invokevirtual 116	java/io/InputStream:close	()V
    //   156: aload_2
    //   157: athrow
    //   158: astore_0
    //   159: ldc 118
    //   161: iconst_0
    //   162: anewarray 4	java/lang/Object
    //   165: invokestatic 124	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   168: goto -12 -> 156
    //   171: astore_2
    //   172: goto -24 -> 148
    //   175: astore_2
    //   176: goto -28 -> 148
    //   179: astore_0
    //   180: goto -68 -> 112
    //   183: astore_0
    //   184: aload_2
    //   185: astore_0
    //   186: goto -108 -> 78
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	189	0	paramFile	File
    //   24	4	1	i	int
    //   16	112	2	localFileInputStream	java.io.FileInputStream
    //   145	12	2	localObject1	Object
    //   171	1	2	localObject2	Object
    //   175	10	2	localObject3	Object
    //   7	54	3	arrayOfByte	byte[]
    // Exception table:
    //   from	to	target	type
    //   34	38	40	java/io/IOException
    //   56	60	62	java/io/IOException
    //   8	17	75	java/io/IOException
    //   91	95	97	java/io/IOException
    //   8	17	109	java/lang/Exception
    //   127	131	133	java/io/IOException
    //   8	17	145	finally
    //   152	156	158	java/io/IOException
    //   19	25	171	finally
    //   114	123	171	finally
    //   78	87	175	finally
    //   19	25	179	java/lang/Exception
    //   19	25	183	java/io/IOException
  }
  
  protected abstract DataMap getDataMap();
  
  protected int getTimeOut()
  {
    return timeOut;
  }
  
  protected String getUUID()
  {
    return uuid;
  }
  
  protected abstract DataMap handle(Context paramContext);
  
  static class Cache
    extends WearableDataRequest
  {
    protected String fileName;
    protected String url;
    
    protected Cache(DataMap paramDataMap)
    {
      uuid = paramDataMap.getString("ID");
      fileName = paramDataMap.getString("FileName");
      url = paramDataMap.getString("URL");
    }
    
    protected Cache(String paramString1, String paramString2, int paramInt)
    {
      super();
      url = paramString1;
      fileName = paramString2;
    }
    
    protected DataMap getDataMap()
    {
      DataMap localDataMap = new DataMap();
      localDataMap.putString("Type", "File");
      localDataMap.putString("ID", uuid);
      localDataMap.putString("URL", url);
      localDataMap.putString("FileName", fileName);
      return localDataMap;
    }
    
    protected DataMap handle(Context paramContext)
    {
      paramContext = new DataMap();
      paramContext.putString("ID", uuid);
      paramContext.putString("Type", "File");
      Object localObject = RemoteDownload.getFileForCachedURL(url);
      if (localObject == null) {
        paramContext.putBoolean("FileFound", false);
      }
      do
      {
        return paramContext;
        paramContext.putBoolean("FileFound", true);
        if (((File)localObject).getName().equals(fileName))
        {
          paramContext.putBoolean("Updated", false);
          return paramContext;
        }
        paramContext.putBoolean("Updated", true);
        paramContext.putString("FileName", ((File)localObject).getName());
        localObject = WearableDataRequest.readFile((File)localObject);
      } while ((localObject == null) || (localObject.length <= 0));
      paramContext.putAsset("FileContent", Asset.createFromBytes((byte[])localObject));
      return paramContext;
    }
  }
  
  static class Get
    extends WearableDataRequest
  {
    protected String url;
    
    protected Get(DataMap paramDataMap)
    {
      url = paramDataMap.getString("URL");
      uuid = paramDataMap.getString("ID");
    }
    
    protected Get(String paramString, int paramInt)
    {
      super();
      url = paramString;
    }
    
    protected DataMap getDataMap()
    {
      DataMap localDataMap = new DataMap();
      localDataMap.putString("ID", uuid);
      localDataMap.putString("Type", "GET");
      localDataMap.putString("URL", url);
      return localDataMap;
    }
    
    protected String getURL()
    {
      return url;
    }
    
    protected DataMap handle(Context paramContext)
    {
      paramContext = new DataMap();
      paramContext.putByteArray("Result", RequestHandler.retrieveData(url, null, timeOut, "Wearable Request Forward"));
      paramContext.putString("ID", uuid);
      paramContext.putString("Type", "GET");
      return paramContext;
    }
  }
  
  static class Post
    extends WearableDataRequest
  {
    private static final Object _userAgentMutex = new Object();
    private static String userAgent = null;
    protected String body;
    protected String url;
    
    protected Post(DataMap paramDataMap)
    {
      url = paramDataMap.getString("URL");
      body = paramDataMap.getString("Body");
      uuid = paramDataMap.getString("ID");
    }
    
    protected Post(String paramString1, String paramString2, int paramInt)
    {
      super();
      url = paramString1;
      body = paramString2;
    }
    
    protected static String getDefaultAcceptLanguage(Context paramContext)
    {
      if (paramContext == null) {}
      do
      {
        do
        {
          do
          {
            return null;
            paramContext = paramContext.getResources();
          } while (paramContext == null);
          paramContext = paramContext.getConfiguration();
        } while (paramContext == null);
        paramContext = locale;
      } while (paramContext == null);
      return paramContext.toString().replace('_', '-');
    }
    
    protected static String getDefaultUserAgent(Context paramContext)
    {
      synchronized (_userAgentMutex)
      {
        if (userAgent == null) {
          userAgent = "Mozilla/5.0 (Linux; U; Android " + Build.VERSION.RELEASE + "; " + getDefaultAcceptLanguage(paramContext) + "; " + Build.MODEL + " Build/" + Build.ID + ")";
        }
        paramContext = userAgent;
        return paramContext;
      }
    }
    
    protected DataMap getDataMap()
    {
      DataMap localDataMap = new DataMap();
      localDataMap.putString("ID", uuid);
      localDataMap.putString("Type", "POST");
      localDataMap.putString("URL", url);
      localDataMap.putString("Body", body);
      return localDataMap;
    }
    
    protected String getURL()
    {
      return url;
    }
    
    protected DataMap handle(Context paramContext)
    {
      DataMap localDataMap = new DataMap();
      HashMap localHashMap = new HashMap();
      localHashMap.put("Accept-Language", getDefaultAcceptLanguage(paramContext));
      localHashMap.put("User-Agent", getDefaultUserAgent(paramContext));
      localDataMap.putBoolean("Result", RequestHandler.sendAnalyticsRequest(url, body, localHashMap, timeOut));
      localDataMap.putString("ID", uuid);
      localDataMap.putString("Type", "POST");
      return localDataMap;
    }
  }
  
  static class ShareConfig
    extends WearableDataRequest
  {
    protected ShareConfig(int paramInt)
    {
      super();
    }
    
    protected ShareConfig(DataMap paramDataMap)
    {
      uuid = paramDataMap.getString("ID");
    }
    
    protected DataMap getDataMap()
    {
      DataMap localDataMap = new DataMap();
      localDataMap.putString("Type", "Config");
      localDataMap.putString("ID", uuid);
      return localDataMap;
    }
    
    protected DataMap handle(Context paramContext)
    {
      paramContext = new DataMap();
      paramContext.putString("ID", uuid);
      paramContext.putString("Type", "Config");
      paramContext.putAll(ConfigSynchronizer.getSharedConfig());
      return paramContext;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.WearableDataRequest
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */