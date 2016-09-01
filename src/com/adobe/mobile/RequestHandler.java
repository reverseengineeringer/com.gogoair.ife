package com.adobe.mobile;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.net.ssl.HttpsURLConnection;
import org.apache.http.conn.ssl.StrictHostnameVerifier;

final class RequestHandler
{
  private static final int BUF_SIZE = 1024;
  private static final int CONNECTION_TIMEOUT = 2000;
  private static final Object _hostnameVerifierMutex = new Object();
  private static StrictHostnameVerifier _strictHostnameVerifier = null;
  
  private static HttpURLConnection requestConnect(String arg0)
  {
    try
    {
      URL localURL = new URL(???);
      if (localURL.getProtocol().equals("https")) {
        synchronized (_hostnameVerifierMutex)
        {
          if (_strictHostnameVerifier == null) {
            _strictHostnameVerifier = new StrictHostnameVerifier();
          }
          ??? = (HttpsURLConnection)localURL.openConnection();
          ???.setHostnameVerifier(_strictHostnameVerifier);
          return (HttpURLConnection)???;
        }
      }
      ??? = (HttpURLConnection)((URL)localObject).openConnection();
    }
    catch (Exception ???)
    {
      StaticMethods.logErrorFormat("Adobe Mobile - Exception opening URL(%s)", new Object[] { ???.getLocalizedMessage() });
      return null;
    }
    return (HttpURLConnection)???;
  }
  
  /* Error */
  protected static byte[] retrieveData(String paramString1, Map paramMap, int paramInt, String paramString2)
  {
    // Byte code:
    //   0: invokestatic 80	com/adobe/mobile/StaticMethods:isWearableApp	()Z
    //   3: ifeq +13 -> 16
    //   6: aload_0
    //   7: aload_1
    //   8: iload_2
    //   9: aload_3
    //   10: invokestatic 84	com/adobe/mobile/WearableFunctionBridge:retrieveData	(Ljava/lang/String;Ljava/util/Map;ILjava/lang/String;)[B
    //   13: astore_0
    //   14: aload_0
    //   15: areturn
    //   16: aload_0
    //   17: invokestatic 86	com/adobe/mobile/RequestHandler:requestConnect	(Ljava/lang/String;)Ljava/net/HttpURLConnection;
    //   20: astore_0
    //   21: aload_0
    //   22: sipush 2000
    //   25: invokevirtual 90	java/net/HttpURLConnection:setConnectTimeout	(I)V
    //   28: aload_0
    //   29: iload_2
    //   30: invokevirtual 93	java/net/HttpURLConnection:setReadTimeout	(I)V
    //   33: aload_1
    //   34: ifnull +114 -> 148
    //   37: aload_1
    //   38: invokeinterface 99 1 0
    //   43: invokeinterface 105 1 0
    //   48: astore 4
    //   50: aload 4
    //   52: invokeinterface 110 1 0
    //   57: ifeq +91 -> 148
    //   60: aload 4
    //   62: invokeinterface 114 1 0
    //   67: checkcast 116	java/util/Map$Entry
    //   70: astore_1
    //   71: aload_0
    //   72: aload_1
    //   73: invokeinterface 119 1 0
    //   78: checkcast 40	java/lang/String
    //   81: aload_1
    //   82: invokeinterface 122 1 0
    //   87: checkcast 40	java/lang/String
    //   90: invokevirtual 126	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   93: goto -43 -> 50
    //   96: astore 6
    //   98: aconst_null
    //   99: astore 5
    //   101: aload 5
    //   103: astore 4
    //   105: aload_0
    //   106: astore_1
    //   107: ldc -128
    //   109: iconst_2
    //   110: anewarray 4	java/lang/Object
    //   113: dup
    //   114: iconst_0
    //   115: aload_3
    //   116: aastore
    //   117: dup
    //   118: iconst_1
    //   119: aload 6
    //   121: invokevirtual 129	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   124: aastore
    //   125: invokestatic 132	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   128: aload_0
    //   129: ifnull +7 -> 136
    //   132: aload_0
    //   133: invokevirtual 135	java/net/HttpURLConnection:disconnect	()V
    //   136: aload 5
    //   138: ifnull +8 -> 146
    //   141: aload 5
    //   143: invokevirtual 140	java/io/InputStream:close	()V
    //   146: aconst_null
    //   147: areturn
    //   148: aload_0
    //   149: invokevirtual 144	java/net/HttpURLConnection:getResponseCode	()I
    //   152: sipush 200
    //   155: if_icmpne +142 -> 297
    //   158: aload_0
    //   159: invokevirtual 148	java/net/HttpURLConnection:getInputStream	()Ljava/io/InputStream;
    //   162: astore 5
    //   164: aload 5
    //   166: astore 4
    //   168: aload_0
    //   169: astore_1
    //   170: sipush 1024
    //   173: newarray <illegal type>
    //   175: astore 7
    //   177: aload 5
    //   179: astore 4
    //   181: aload_0
    //   182: astore_1
    //   183: new 150	java/io/ByteArrayOutputStream
    //   186: dup
    //   187: invokespecial 151	java/io/ByteArrayOutputStream:<init>	()V
    //   190: astore 6
    //   192: aload 5
    //   194: astore 4
    //   196: aload_0
    //   197: astore_1
    //   198: aload 5
    //   200: aload 7
    //   202: invokevirtual 155	java/io/InputStream:read	([B)I
    //   205: iconst_m1
    //   206: if_icmpeq +19 -> 225
    //   209: aload 5
    //   211: astore 4
    //   213: aload_0
    //   214: astore_1
    //   215: aload 6
    //   217: aload 7
    //   219: invokevirtual 159	java/io/ByteArrayOutputStream:write	([B)V
    //   222: goto -30 -> 192
    //   225: aload 5
    //   227: astore 4
    //   229: aload_0
    //   230: astore_1
    //   231: aload 5
    //   233: invokevirtual 140	java/io/InputStream:close	()V
    //   236: aload 5
    //   238: astore 4
    //   240: aload_0
    //   241: astore_1
    //   242: aload 6
    //   244: invokevirtual 163	java/io/ByteArrayOutputStream:toByteArray	()[B
    //   247: astore 6
    //   249: aload 6
    //   251: astore_1
    //   252: aload_0
    //   253: ifnull +7 -> 260
    //   256: aload_0
    //   257: invokevirtual 135	java/net/HttpURLConnection:disconnect	()V
    //   260: aload_1
    //   261: astore_0
    //   262: aload 5
    //   264: ifnull -250 -> 14
    //   267: aload 5
    //   269: invokevirtual 140	java/io/InputStream:close	()V
    //   272: aload_1
    //   273: areturn
    //   274: astore_0
    //   275: ldc -91
    //   277: iconst_2
    //   278: anewarray 4	java/lang/Object
    //   281: dup
    //   282: iconst_0
    //   283: aload_3
    //   284: aastore
    //   285: dup
    //   286: iconst_1
    //   287: aload_0
    //   288: invokevirtual 129	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   291: aastore
    //   292: invokestatic 132	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   295: aload_1
    //   296: areturn
    //   297: aload_0
    //   298: ifnull +7 -> 305
    //   301: aload_0
    //   302: invokevirtual 135	java/net/HttpURLConnection:disconnect	()V
    //   305: iconst_0
    //   306: ifeq +11 -> 317
    //   309: new 167	java/lang/NullPointerException
    //   312: dup
    //   313: invokespecial 168	java/lang/NullPointerException:<init>	()V
    //   316: athrow
    //   317: aconst_null
    //   318: areturn
    //   319: astore_0
    //   320: ldc -91
    //   322: iconst_2
    //   323: anewarray 4	java/lang/Object
    //   326: dup
    //   327: iconst_0
    //   328: aload_3
    //   329: aastore
    //   330: dup
    //   331: iconst_1
    //   332: aload_0
    //   333: invokevirtual 129	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   336: aastore
    //   337: invokestatic 132	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   340: goto -23 -> 317
    //   343: astore_0
    //   344: ldc -91
    //   346: iconst_2
    //   347: anewarray 4	java/lang/Object
    //   350: dup
    //   351: iconst_0
    //   352: aload_3
    //   353: aastore
    //   354: dup
    //   355: iconst_1
    //   356: aload_0
    //   357: invokevirtual 129	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   360: aastore
    //   361: invokestatic 132	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   364: goto -218 -> 146
    //   367: astore 6
    //   369: aconst_null
    //   370: astore 5
    //   372: aconst_null
    //   373: astore_0
    //   374: aload 5
    //   376: astore 4
    //   378: aload_0
    //   379: astore_1
    //   380: ldc -86
    //   382: iconst_2
    //   383: anewarray 4	java/lang/Object
    //   386: dup
    //   387: iconst_0
    //   388: aload_3
    //   389: aastore
    //   390: dup
    //   391: iconst_1
    //   392: aload 6
    //   394: invokevirtual 62	java/lang/Exception:getLocalizedMessage	()Ljava/lang/String;
    //   397: aastore
    //   398: invokestatic 132	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   401: aload_0
    //   402: ifnull +7 -> 409
    //   405: aload_0
    //   406: invokevirtual 135	java/net/HttpURLConnection:disconnect	()V
    //   409: aload 5
    //   411: ifnull +8 -> 419
    //   414: aload 5
    //   416: invokevirtual 140	java/io/InputStream:close	()V
    //   419: aconst_null
    //   420: areturn
    //   421: astore_0
    //   422: ldc -91
    //   424: iconst_2
    //   425: anewarray 4	java/lang/Object
    //   428: dup
    //   429: iconst_0
    //   430: aload_3
    //   431: aastore
    //   432: dup
    //   433: iconst_1
    //   434: aload_0
    //   435: invokevirtual 129	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   438: aastore
    //   439: invokestatic 132	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   442: goto -23 -> 419
    //   445: astore 6
    //   447: aconst_null
    //   448: astore 5
    //   450: aconst_null
    //   451: astore_0
    //   452: aload 5
    //   454: astore 4
    //   456: aload_0
    //   457: astore_1
    //   458: ldc -84
    //   460: iconst_2
    //   461: anewarray 4	java/lang/Object
    //   464: dup
    //   465: iconst_0
    //   466: aload_3
    //   467: aastore
    //   468: dup
    //   469: iconst_1
    //   470: aload 6
    //   472: invokevirtual 173	java/lang/Error:getLocalizedMessage	()Ljava/lang/String;
    //   475: aastore
    //   476: invokestatic 132	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   479: aload_0
    //   480: ifnull +7 -> 487
    //   483: aload_0
    //   484: invokevirtual 135	java/net/HttpURLConnection:disconnect	()V
    //   487: aload 5
    //   489: ifnull +8 -> 497
    //   492: aload 5
    //   494: invokevirtual 140	java/io/InputStream:close	()V
    //   497: aconst_null
    //   498: areturn
    //   499: astore_0
    //   500: ldc -91
    //   502: iconst_2
    //   503: anewarray 4	java/lang/Object
    //   506: dup
    //   507: iconst_0
    //   508: aload_3
    //   509: aastore
    //   510: dup
    //   511: iconst_1
    //   512: aload_0
    //   513: invokevirtual 129	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   516: aastore
    //   517: invokestatic 132	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   520: goto -23 -> 497
    //   523: astore 5
    //   525: aconst_null
    //   526: astore 4
    //   528: aconst_null
    //   529: astore_0
    //   530: aload_0
    //   531: ifnull +7 -> 538
    //   534: aload_0
    //   535: invokevirtual 135	java/net/HttpURLConnection:disconnect	()V
    //   538: aload 4
    //   540: ifnull +8 -> 548
    //   543: aload 4
    //   545: invokevirtual 140	java/io/InputStream:close	()V
    //   548: aload 5
    //   550: athrow
    //   551: astore_0
    //   552: ldc -91
    //   554: iconst_2
    //   555: anewarray 4	java/lang/Object
    //   558: dup
    //   559: iconst_0
    //   560: aload_3
    //   561: aastore
    //   562: dup
    //   563: iconst_1
    //   564: aload_0
    //   565: invokevirtual 129	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   568: aastore
    //   569: invokestatic 132	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   572: goto -24 -> 548
    //   575: astore 5
    //   577: aconst_null
    //   578: astore 4
    //   580: goto -50 -> 530
    //   583: astore 5
    //   585: aload_1
    //   586: astore_0
    //   587: goto -57 -> 530
    //   590: astore 6
    //   592: aconst_null
    //   593: astore 5
    //   595: goto -143 -> 452
    //   598: astore 6
    //   600: goto -148 -> 452
    //   603: astore 6
    //   605: aconst_null
    //   606: astore 5
    //   608: goto -234 -> 374
    //   611: astore 6
    //   613: goto -239 -> 374
    //   616: astore 6
    //   618: aconst_null
    //   619: astore 5
    //   621: aconst_null
    //   622: astore_0
    //   623: goto -522 -> 101
    //   626: astore 6
    //   628: goto -527 -> 101
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	631	0	paramString1	String
    //   0	631	1	paramMap	Map
    //   0	631	2	paramInt	int
    //   0	631	3	paramString2	String
    //   48	531	4	localObject1	Object
    //   99	394	5	localInputStream	InputStream
    //   523	26	5	localObject2	Object
    //   575	1	5	localObject3	Object
    //   583	1	5	localObject4	Object
    //   593	27	5	localObject5	Object
    //   96	24	6	localIOException1	IOException
    //   190	60	6	localObject6	Object
    //   367	26	6	localException1	Exception
    //   445	26	6	localError1	Error
    //   590	1	6	localError2	Error
    //   598	1	6	localError3	Error
    //   603	1	6	localException2	Exception
    //   611	1	6	localException3	Exception
    //   616	1	6	localIOException2	IOException
    //   626	1	6	localIOException3	IOException
    //   175	43	7	arrayOfByte	byte[]
    // Exception table:
    //   from	to	target	type
    //   21	33	96	java/io/IOException
    //   37	50	96	java/io/IOException
    //   50	93	96	java/io/IOException
    //   148	164	96	java/io/IOException
    //   267	272	274	java/io/IOException
    //   309	317	319	java/io/IOException
    //   141	146	343	java/io/IOException
    //   16	21	367	java/lang/Exception
    //   414	419	421	java/io/IOException
    //   16	21	445	java/lang/Error
    //   492	497	499	java/io/IOException
    //   16	21	523	finally
    //   543	548	551	java/io/IOException
    //   21	33	575	finally
    //   37	50	575	finally
    //   50	93	575	finally
    //   148	164	575	finally
    //   107	128	583	finally
    //   170	177	583	finally
    //   183	192	583	finally
    //   198	209	583	finally
    //   215	222	583	finally
    //   231	236	583	finally
    //   242	249	583	finally
    //   380	401	583	finally
    //   458	479	583	finally
    //   21	33	590	java/lang/Error
    //   37	50	590	java/lang/Error
    //   50	93	590	java/lang/Error
    //   148	164	590	java/lang/Error
    //   170	177	598	java/lang/Error
    //   183	192	598	java/lang/Error
    //   198	209	598	java/lang/Error
    //   215	222	598	java/lang/Error
    //   231	236	598	java/lang/Error
    //   242	249	598	java/lang/Error
    //   21	33	603	java/lang/Exception
    //   37	50	603	java/lang/Exception
    //   50	93	603	java/lang/Exception
    //   148	164	603	java/lang/Exception
    //   170	177	611	java/lang/Exception
    //   183	192	611	java/lang/Exception
    //   198	209	611	java/lang/Exception
    //   215	222	611	java/lang/Exception
    //   231	236	611	java/lang/Exception
    //   242	249	611	java/lang/Exception
    //   16	21	616	java/io/IOException
    //   170	177	626	java/io/IOException
    //   183	192	626	java/io/IOException
    //   198	209	626	java/io/IOException
    //   215	222	626	java/io/IOException
    //   231	236	626	java/io/IOException
    //   242	249	626	java/io/IOException
  }
  
  /* Error */
  protected static boolean sendAnalyticsRequest(String paramString1, String paramString2, Map paramMap, int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: ifnonnull +5 -> 6
    //   4: iconst_0
    //   5: ireturn
    //   6: invokestatic 80	com/adobe/mobile/StaticMethods:isWearableApp	()Z
    //   9: ifeq +11 -> 20
    //   12: aload_0
    //   13: aload_1
    //   14: aload_2
    //   15: iload_3
    //   16: invokestatic 179	com/adobe/mobile/WearableFunctionBridge:sendAnalyticsRequest	(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;I)Z
    //   19: ireturn
    //   20: aload_0
    //   21: invokestatic 86	com/adobe/mobile/RequestHandler:requestConnect	(Ljava/lang/String;)Ljava/net/HttpURLConnection;
    //   24: astore_0
    //   25: aload_0
    //   26: ifnonnull +5 -> 31
    //   29: iconst_0
    //   30: ireturn
    //   31: aload_0
    //   32: iload_3
    //   33: invokevirtual 90	java/net/HttpURLConnection:setConnectTimeout	(I)V
    //   36: aload_0
    //   37: iload_3
    //   38: invokevirtual 93	java/net/HttpURLConnection:setReadTimeout	(I)V
    //   41: aload_0
    //   42: ldc -75
    //   44: invokevirtual 184	java/net/HttpURLConnection:setRequestMethod	(Ljava/lang/String;)V
    //   47: aload_1
    //   48: ldc -70
    //   50: invokevirtual 190	java/lang/String:getBytes	(Ljava/lang/String;)[B
    //   53: astore 4
    //   55: aload_0
    //   56: aload 4
    //   58: arraylength
    //   59: invokevirtual 193	java/net/HttpURLConnection:setFixedLengthStreamingMode	(I)V
    //   62: aload_0
    //   63: ldc -61
    //   65: ldc -59
    //   67: invokevirtual 126	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   70: aload_2
    //   71: ifnull +91 -> 162
    //   74: aload_2
    //   75: invokeinterface 99 1 0
    //   80: invokeinterface 105 1 0
    //   85: astore_2
    //   86: aload_2
    //   87: invokeinterface 110 1 0
    //   92: ifeq +70 -> 162
    //   95: aload_2
    //   96: invokeinterface 114 1 0
    //   101: checkcast 116	java/util/Map$Entry
    //   104: astore 5
    //   106: aload_0
    //   107: aload 5
    //   109: invokeinterface 119 1 0
    //   114: checkcast 40	java/lang/String
    //   117: aload 5
    //   119: invokeinterface 122 1 0
    //   124: checkcast 40	java/lang/String
    //   127: invokevirtual 126	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   130: goto -44 -> 86
    //   133: astore_2
    //   134: ldc -57
    //   136: iconst_1
    //   137: anewarray 4	java/lang/Object
    //   140: dup
    //   141: iconst_0
    //   142: aload_1
    //   143: aastore
    //   144: invokestatic 202	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   147: invokestatic 208	com/adobe/mobile/MobileConfig:getInstance	()Lcom/adobe/mobile/MobileConfig;
    //   150: invokevirtual 211	com/adobe/mobile/MobileConfig:getSSL	()Z
    //   153: ifne +7 -> 160
    //   156: aload_0
    //   157: invokevirtual 135	java/net/HttpURLConnection:disconnect	()V
    //   160: iconst_0
    //   161: ireturn
    //   162: new 213	java/io/BufferedOutputStream
    //   165: dup
    //   166: aload_0
    //   167: invokevirtual 217	java/net/HttpURLConnection:getOutputStream	()Ljava/io/OutputStream;
    //   170: invokespecial 220	java/io/BufferedOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   173: astore_2
    //   174: aload_2
    //   175: aload 4
    //   177: invokevirtual 223	java/io/OutputStream:write	([B)V
    //   180: aload_2
    //   181: invokevirtual 224	java/io/OutputStream:close	()V
    //   184: aload_0
    //   185: invokevirtual 148	java/net/HttpURLConnection:getInputStream	()Ljava/io/InputStream;
    //   188: astore_2
    //   189: invokestatic 208	com/adobe/mobile/MobileConfig:getInstance	()Lcom/adobe/mobile/MobileConfig;
    //   192: invokevirtual 211	com/adobe/mobile/MobileConfig:getSSL	()Z
    //   195: ifeq +50 -> 245
    //   198: bipush 10
    //   200: newarray <illegal type>
    //   202: astore 4
    //   204: aload_2
    //   205: aload 4
    //   207: invokevirtual 155	java/io/InputStream:read	([B)I
    //   210: ifgt -6 -> 204
    //   213: aload_2
    //   214: invokevirtual 140	java/io/InputStream:close	()V
    //   217: ldc -30
    //   219: iconst_1
    //   220: anewarray 4	java/lang/Object
    //   223: dup
    //   224: iconst_0
    //   225: aload_1
    //   226: aastore
    //   227: invokestatic 202	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   230: invokestatic 208	com/adobe/mobile/MobileConfig:getInstance	()Lcom/adobe/mobile/MobileConfig;
    //   233: invokevirtual 211	com/adobe/mobile/MobileConfig:getSSL	()Z
    //   236: ifne +7 -> 243
    //   239: aload_0
    //   240: invokevirtual 135	java/net/HttpURLConnection:disconnect	()V
    //   243: iconst_1
    //   244: ireturn
    //   245: aload_0
    //   246: invokevirtual 144	java/net/HttpURLConnection:getResponseCode	()I
    //   249: pop
    //   250: goto -37 -> 213
    //   253: astore_1
    //   254: ldc -28
    //   256: iconst_1
    //   257: anewarray 4	java/lang/Object
    //   260: dup
    //   261: iconst_0
    //   262: aload_1
    //   263: invokevirtual 129	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   266: aastore
    //   267: invokestatic 202	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   270: invokestatic 208	com/adobe/mobile/MobileConfig:getInstance	()Lcom/adobe/mobile/MobileConfig;
    //   273: invokevirtual 211	com/adobe/mobile/MobileConfig:getSSL	()Z
    //   276: ifne +7 -> 283
    //   279: aload_0
    //   280: invokevirtual 135	java/net/HttpURLConnection:disconnect	()V
    //   283: iconst_0
    //   284: ireturn
    //   285: astore_1
    //   286: ldc -26
    //   288: iconst_1
    //   289: anewarray 4	java/lang/Object
    //   292: dup
    //   293: iconst_0
    //   294: aload_1
    //   295: invokevirtual 62	java/lang/Exception:getLocalizedMessage	()Ljava/lang/String;
    //   298: aastore
    //   299: invokestatic 68	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   302: invokestatic 208	com/adobe/mobile/MobileConfig:getInstance	()Lcom/adobe/mobile/MobileConfig;
    //   305: invokevirtual 211	com/adobe/mobile/MobileConfig:getSSL	()Z
    //   308: ifne -65 -> 243
    //   311: aload_0
    //   312: invokevirtual 135	java/net/HttpURLConnection:disconnect	()V
    //   315: goto -72 -> 243
    //   318: astore_1
    //   319: ldc -26
    //   321: iconst_1
    //   322: anewarray 4	java/lang/Object
    //   325: dup
    //   326: iconst_0
    //   327: aload_1
    //   328: invokevirtual 173	java/lang/Error:getLocalizedMessage	()Ljava/lang/String;
    //   331: aastore
    //   332: invokestatic 68	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   335: invokestatic 208	com/adobe/mobile/MobileConfig:getInstance	()Lcom/adobe/mobile/MobileConfig;
    //   338: invokevirtual 211	com/adobe/mobile/MobileConfig:getSSL	()Z
    //   341: ifne -98 -> 243
    //   344: aload_0
    //   345: invokevirtual 135	java/net/HttpURLConnection:disconnect	()V
    //   348: goto -105 -> 243
    //   351: astore_1
    //   352: invokestatic 208	com/adobe/mobile/MobileConfig:getInstance	()Lcom/adobe/mobile/MobileConfig;
    //   355: invokevirtual 211	com/adobe/mobile/MobileConfig:getSSL	()Z
    //   358: ifne +7 -> 365
    //   361: aload_0
    //   362: invokevirtual 135	java/net/HttpURLConnection:disconnect	()V
    //   365: aload_1
    //   366: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	367	0	paramString1	String
    //   0	367	1	paramString2	String
    //   0	367	2	paramMap	Map
    //   0	367	3	paramInt	int
    //   53	153	4	arrayOfByte	byte[]
    //   104	14	5	localEntry	Map.Entry
    // Exception table:
    //   from	to	target	type
    //   31	70	133	java/net/SocketTimeoutException
    //   74	86	133	java/net/SocketTimeoutException
    //   86	130	133	java/net/SocketTimeoutException
    //   162	204	133	java/net/SocketTimeoutException
    //   204	213	133	java/net/SocketTimeoutException
    //   213	230	133	java/net/SocketTimeoutException
    //   245	250	133	java/net/SocketTimeoutException
    //   31	70	253	java/io/IOException
    //   74	86	253	java/io/IOException
    //   86	130	253	java/io/IOException
    //   162	204	253	java/io/IOException
    //   204	213	253	java/io/IOException
    //   213	230	253	java/io/IOException
    //   245	250	253	java/io/IOException
    //   31	70	285	java/lang/Exception
    //   74	86	285	java/lang/Exception
    //   86	130	285	java/lang/Exception
    //   162	204	285	java/lang/Exception
    //   204	213	285	java/lang/Exception
    //   213	230	285	java/lang/Exception
    //   245	250	285	java/lang/Exception
    //   31	70	318	java/lang/Error
    //   74	86	318	java/lang/Error
    //   86	130	318	java/lang/Error
    //   162	204	318	java/lang/Error
    //   204	213	318	java/lang/Error
    //   213	230	318	java/lang/Error
    //   245	250	318	java/lang/Error
    //   31	70	351	finally
    //   74	86	351	finally
    //   86	130	351	finally
    //   134	147	351	finally
    //   162	204	351	finally
    //   204	213	351	finally
    //   213	230	351	finally
    //   245	250	351	finally
    //   254	270	351	finally
    //   286	302	351	finally
    //   319	335	351	finally
  }
  
  protected static void sendGenericRequest(String paramString1, Map paramMap, int paramInt, String paramString2)
  {
    if (paramString1 == null) {}
    for (;;)
    {
      return;
      if (StaticMethods.isWearableApp())
      {
        WearableFunctionBridge.sendGenericRequest(paramString1, paramMap, paramInt, paramString2);
        return;
      }
      try
      {
        HttpURLConnection localHttpURLConnection = requestConnect(paramString1);
        if (localHttpURLConnection == null) {
          continue;
        }
        localHttpURLConnection.setConnectTimeout(paramInt);
        localHttpURLConnection.setReadTimeout(paramInt);
        if (paramMap != null)
        {
          paramMap = paramMap.entrySet().iterator();
          while (paramMap.hasNext())
          {
            Map.Entry localEntry = (Map.Entry)paramMap.next();
            String str = (String)localEntry.getValue();
            if (str.trim().length() > 0) {
              localHttpURLConnection.setRequestProperty((String)localEntry.getKey(), str);
            }
          }
        }
        return;
      }
      catch (SocketTimeoutException paramMap)
      {
        StaticMethods.logWarningFormat("%s - Timed out sending request(%s)", new Object[] { paramString2, paramString1 });
        return;
        StaticMethods.logDebugFormat("%s - Request Sent(%s)", new Object[] { paramString2, paramString1 });
        localHttpURLConnection.getResponseCode();
        localHttpURLConnection.getInputStream().close();
        localHttpURLConnection.disconnect();
        return;
      }
      catch (IOException paramString1)
      {
        StaticMethods.logWarningFormat("%s - IOException while sending request, may retry(%s)", new Object[] { paramString2, paramString1.getLocalizedMessage() });
        return;
      }
      catch (Exception paramString1)
      {
        StaticMethods.logWarningFormat("%s - Exception while attempting to send hit, will not retry(%s)", new Object[] { paramString2, paramString1.getLocalizedMessage() });
        return;
      }
      catch (Error paramString1)
      {
        StaticMethods.logWarningFormat("%s - Exception while attempting to send hit, will not retry(%s)", new Object[] { paramString2, paramString1.getLocalizedMessage() });
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.RequestHandler
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */