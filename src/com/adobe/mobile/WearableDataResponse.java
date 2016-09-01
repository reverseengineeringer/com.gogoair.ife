package com.adobe.mobile;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.wearable.Asset;
import com.google.android.gms.wearable.DataMap;
import java.io.File;

class WearableDataResponse
{
  protected boolean success = false;
  
  protected static WearableDataResponse createResponseFromDataMap(DataMap paramDataMap, GoogleApiClient paramGoogleApiClient)
  {
    if (paramDataMap.getString("Type").equals("POST")) {
      return new PostResponse(paramDataMap);
    }
    if (paramDataMap.getString("Type").equals("GET")) {
      return new GetResponse(paramDataMap);
    }
    if (paramDataMap.getString("Type").equals("Config")) {
      return new ShareConfigResponse(paramDataMap);
    }
    if (paramDataMap.getString("Type").equals("File")) {
      return new CacheResponse(paramDataMap, paramGoogleApiClient);
    }
    return null;
  }
  
  /* Error */
  private static void saveFileFromAsset(Asset paramAsset, String paramString, GoogleApiClient paramGoogleApiClient)
  {
    // Byte code:
    //   0: aload_0
    //   1: ifnonnull +4 -> 5
    //   4: return
    //   5: aload_2
    //   6: ldc2_w 67
    //   9: getstatic 74	java/util/concurrent/TimeUnit:SECONDS	Ljava/util/concurrent/TimeUnit;
    //   12: invokeinterface 80 4 0
    //   17: invokevirtual 86	com/google/android/gms/common/ConnectionResult:isSuccess	()Z
    //   20: ifeq -16 -> 4
    //   23: getstatic 92	com/google/android/gms/wearable/Wearable:DataApi	Lcom/google/android/gms/wearable/DataApi;
    //   26: aload_2
    //   27: aload_0
    //   28: invokeinterface 98 3 0
    //   33: invokeinterface 104 1 0
    //   38: checkcast 106	com/google/android/gms/wearable/DataApi$GetFdForAssetResult
    //   41: invokeinterface 110 1 0
    //   46: astore 4
    //   48: aload_2
    //   49: invokeinterface 113 1 0
    //   54: aload 4
    //   56: ifnull -52 -> 4
    //   59: new 115	java/io/File
    //   62: dup
    //   63: aload_1
    //   64: invokespecial 118	java/io/File:<init>	(Ljava/lang/String;)V
    //   67: astore_1
    //   68: aconst_null
    //   69: astore_0
    //   70: new 120	java/io/FileOutputStream
    //   73: dup
    //   74: aload_1
    //   75: invokespecial 123	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   78: astore_1
    //   79: aload_1
    //   80: astore_0
    //   81: sipush 8192
    //   84: newarray <illegal type>
    //   86: astore_2
    //   87: aload_1
    //   88: astore_0
    //   89: aload 4
    //   91: aload_2
    //   92: invokevirtual 129	java/io/InputStream:read	([B)I
    //   95: istore_3
    //   96: iload_3
    //   97: iconst_m1
    //   98: if_icmpeq +47 -> 145
    //   101: aload_1
    //   102: astore_0
    //   103: aload_1
    //   104: aload_2
    //   105: iconst_0
    //   106: iload_3
    //   107: invokevirtual 135	java/io/OutputStream:write	([BII)V
    //   110: goto -23 -> 87
    //   113: astore_0
    //   114: aload_1
    //   115: astore_0
    //   116: ldc -119
    //   118: iconst_0
    //   119: anewarray 4	java/lang/Object
    //   122: invokestatic 143	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   125: aload_1
    //   126: ifnull -122 -> 4
    //   129: aload_1
    //   130: invokevirtual 146	java/io/OutputStream:close	()V
    //   133: return
    //   134: astore_0
    //   135: ldc -108
    //   137: iconst_0
    //   138: anewarray 4	java/lang/Object
    //   141: invokestatic 151	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   144: return
    //   145: aload_1
    //   146: ifnull -142 -> 4
    //   149: aload_1
    //   150: invokevirtual 146	java/io/OutputStream:close	()V
    //   153: return
    //   154: astore_0
    //   155: ldc -108
    //   157: iconst_0
    //   158: anewarray 4	java/lang/Object
    //   161: invokestatic 151	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   164: return
    //   165: astore_0
    //   166: aconst_null
    //   167: astore_1
    //   168: aload_1
    //   169: astore_0
    //   170: ldc -119
    //   172: iconst_0
    //   173: anewarray 4	java/lang/Object
    //   176: invokestatic 143	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   179: aload_1
    //   180: ifnull -176 -> 4
    //   183: aload_1
    //   184: invokevirtual 146	java/io/OutputStream:close	()V
    //   187: return
    //   188: astore_0
    //   189: ldc -108
    //   191: iconst_0
    //   192: anewarray 4	java/lang/Object
    //   195: invokestatic 151	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   198: return
    //   199: astore_2
    //   200: aload_0
    //   201: astore_1
    //   202: aload_2
    //   203: astore_0
    //   204: aload_1
    //   205: ifnull +7 -> 212
    //   208: aload_1
    //   209: invokevirtual 146	java/io/OutputStream:close	()V
    //   212: aload_0
    //   213: athrow
    //   214: astore_1
    //   215: ldc -108
    //   217: iconst_0
    //   218: anewarray 4	java/lang/Object
    //   221: invokestatic 151	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   224: goto -12 -> 212
    //   227: astore_2
    //   228: aload_0
    //   229: astore_1
    //   230: aload_2
    //   231: astore_0
    //   232: goto -28 -> 204
    //   235: astore_0
    //   236: goto -68 -> 168
    //   239: astore_0
    //   240: aconst_null
    //   241: astore_1
    //   242: goto -128 -> 114
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	245	0	paramAsset	Asset
    //   0	245	1	paramString	String
    //   0	245	2	paramGoogleApiClient	GoogleApiClient
    //   95	12	3	i	int
    //   46	44	4	localInputStream	java.io.InputStream
    // Exception table:
    //   from	to	target	type
    //   81	87	113	java/io/FileNotFoundException
    //   89	96	113	java/io/FileNotFoundException
    //   103	110	113	java/io/FileNotFoundException
    //   129	133	134	java/io/IOException
    //   149	153	154	java/io/IOException
    //   70	79	165	java/io/IOException
    //   183	187	188	java/io/IOException
    //   70	79	199	finally
    //   208	212	214	java/io/IOException
    //   81	87	227	finally
    //   89	96	227	finally
    //   103	110	227	finally
    //   116	125	227	finally
    //   170	179	227	finally
    //   81	87	235	java/io/IOException
    //   89	96	235	java/io/IOException
    //   103	110	235	java/io/IOException
    //   70	79	239	java/io/FileNotFoundException
  }
  
  protected boolean isSuccess()
  {
    return success;
  }
  
  static class CacheResponse
    extends WearableDataResponse
  {
    final boolean result;
    
    protected CacheResponse(DataMap paramDataMap, GoogleApiClient paramGoogleApiClient)
    {
      if (!paramDataMap.getBoolean("FileFound"))
      {
        RemoteDownload.deleteFilesInDirectory("adbdownloadcache");
        result = false;
      }
      Asset localAsset;
      File localFile;
      do
      {
        do
        {
          return;
          result = paramDataMap.getBoolean("Updated");
        } while (!result);
        RemoteDownload.deleteFilesInDirectory("adbdownloadcache");
        localAsset = paramDataMap.getAsset("FileContent");
        paramDataMap = paramDataMap.getString("FileName");
        localFile = RemoteDownload.getDownloadCacheDirectory("adbdownloadcache");
      } while (localFile == null);
      RemoteDownload.deleteFilesInDirectory("adbdownloadcache");
      WearableDataResponse.saveFileFromAsset(localAsset, localFile.getPath() + File.separator + paramDataMap, paramGoogleApiClient);
    }
    
    protected boolean getResult()
    {
      return result;
    }
  }
  
  static class GetResponse
    extends WearableDataResponse
  {
    protected byte[] result;
    
    protected GetResponse(DataMap paramDataMap)
    {
      result = paramDataMap.getByteArray("Result");
      if (result != null) {
        success = true;
      }
    }
    
    protected byte[] getResult()
    {
      return result;
    }
  }
  
  static class PostResponse
    extends WearableDataResponse
  {
    protected PostResponse(DataMap paramDataMap)
    {
      success = paramDataMap.getBoolean("Result");
    }
  }
  
  static class ShareConfigResponse
    extends WearableDataResponse
  {
    final DataMap result;
    
    protected ShareConfigResponse(DataMap paramDataMap)
    {
      result = paramDataMap;
    }
    
    protected DataMap getResult()
    {
      return result;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.WearableDataResponse
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */