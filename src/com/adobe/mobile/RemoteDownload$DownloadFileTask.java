package com.adobe.mobile;

import java.net.HttpURLConnection;
import java.net.URL;
import javax.net.ssl.HttpsURLConnection;
import org.apache.http.conn.ssl.StrictHostnameVerifier;

class RemoteDownload$DownloadFileTask
  implements Runnable
{
  private final RemoteDownload.RemoteDownloadBlock callback;
  private final int connectionTimeout;
  private final String directory;
  private final int readTimeout;
  private final String url;
  
  private RemoteDownload$DownloadFileTask(String paramString1, RemoteDownload.RemoteDownloadBlock paramRemoteDownloadBlock, int paramInt1, int paramInt2, String paramString2)
  {
    url = paramString1;
    callback = paramRemoteDownloadBlock;
    connectionTimeout = paramInt1;
    readTimeout = paramInt2;
    directory = paramString2;
  }
  
  protected static HttpURLConnection requestConnect(String paramString)
  {
    try
    {
      paramString = new URL(paramString);
      if (paramString.getProtocol().equals("https"))
      {
        paramString = (HttpsURLConnection)paramString.openConnection();
        paramString.setHostnameVerifier(new StrictHostnameVerifier());
        return paramString;
      }
      paramString = (HttpURLConnection)paramString.openConnection();
      return paramString;
    }
    catch (Exception paramString)
    {
      StaticMethods.logErrorFormat("Cached Files - Exception opening URL(%s)", new Object[] { paramString.getLocalizedMessage() });
    }
    return null;
  }
  
  /* Error */
  public void run()
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_3
    //   2: aload_0
    //   3: getfield 24	com/adobe/mobile/RemoteDownload$DownloadFileTask:url	Ljava/lang/String;
    //   6: ifnonnull +31 -> 37
    //   9: ldc 92
    //   11: iconst_0
    //   12: anewarray 4	java/lang/Object
    //   15: invokestatic 95	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   18: aload_0
    //   19: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   22: ifnull +14 -> 36
    //   25: aload_0
    //   26: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   29: iconst_0
    //   30: aconst_null
    //   31: invokeinterface 101 3 0
    //   36: return
    //   37: aload_0
    //   38: getfield 24	com/adobe/mobile/RemoteDownload$DownloadFileTask:url	Ljava/lang/String;
    //   41: invokestatic 105	com/adobe/mobile/RemoteDownload:stringIsUrl	(Ljava/lang/String;)Z
    //   44: ifne +38 -> 82
    //   47: ldc 107
    //   49: iconst_1
    //   50: anewarray 4	java/lang/Object
    //   53: dup
    //   54: iconst_0
    //   55: aload_0
    //   56: getfield 24	com/adobe/mobile/RemoteDownload$DownloadFileTask:url	Ljava/lang/String;
    //   59: aastore
    //   60: invokestatic 95	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   63: aload_0
    //   64: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   67: ifnull -31 -> 36
    //   70: aload_0
    //   71: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   74: iconst_0
    //   75: aconst_null
    //   76: invokeinterface 101 3 0
    //   81: return
    //   82: aload_0
    //   83: getfield 24	com/adobe/mobile/RemoteDownload$DownloadFileTask:url	Ljava/lang/String;
    //   86: aload_0
    //   87: getfield 32	com/adobe/mobile/RemoteDownload$DownloadFileTask:directory	Ljava/lang/String;
    //   90: invokestatic 111	com/adobe/mobile/RemoteDownload:getFileForCachedURL	(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    //   93: astore 5
    //   95: invokestatic 115	com/adobe/mobile/RemoteDownload:access$100	()Ljava/text/SimpleDateFormat;
    //   98: astore 6
    //   100: aload_0
    //   101: getfield 24	com/adobe/mobile/RemoteDownload$DownloadFileTask:url	Ljava/lang/String;
    //   104: invokestatic 117	com/adobe/mobile/RemoteDownload$DownloadFileTask:requestConnect	(Ljava/lang/String;)Ljava/net/HttpURLConnection;
    //   107: astore 7
    //   109: aload 7
    //   111: ifnonnull +22 -> 133
    //   114: aload_0
    //   115: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   118: ifnull -82 -> 36
    //   121: aload_0
    //   122: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   125: iconst_0
    //   126: aconst_null
    //   127: invokeinterface 101 3 0
    //   132: return
    //   133: aload 7
    //   135: aload_0
    //   136: getfield 28	com/adobe/mobile/RemoteDownload$DownloadFileTask:connectionTimeout	I
    //   139: invokevirtual 121	java/net/HttpURLConnection:setConnectTimeout	(I)V
    //   142: aload 7
    //   144: aload_0
    //   145: getfield 30	com/adobe/mobile/RemoteDownload$DownloadFileTask:readTimeout	I
    //   148: invokevirtual 124	java/net/HttpURLConnection:setReadTimeout	(I)V
    //   151: aload 5
    //   153: ifnull +64 -> 217
    //   156: aload 5
    //   158: invokevirtual 129	java/io/File:getPath	()Ljava/lang/String;
    //   161: invokestatic 133	com/adobe/mobile/RemoteDownload:access$200	(Ljava/lang/String;)Ljava/lang/String;
    //   164: invokestatic 136	com/adobe/mobile/StaticMethods:hexToString	(Ljava/lang/String;)Ljava/lang/String;
    //   167: astore_2
    //   168: aload 5
    //   170: invokevirtual 129	java/io/File:getPath	()Ljava/lang/String;
    //   173: invokestatic 140	com/adobe/mobile/RemoteDownload:access$300	(Ljava/lang/String;)J
    //   176: invokestatic 146	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   179: astore 4
    //   181: aload 4
    //   183: invokevirtual 150	java/lang/Long:longValue	()J
    //   186: lconst_0
    //   187: lcmp
    //   188: ifeq +17 -> 205
    //   191: aload 7
    //   193: ldc -104
    //   195: aload 6
    //   197: aload 4
    //   199: invokevirtual 158	java/text/SimpleDateFormat:format	(Ljava/lang/Object;)Ljava/lang/String;
    //   202: invokevirtual 162	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   205: aload_2
    //   206: ifnull +11 -> 217
    //   209: aload 7
    //   211: ldc -92
    //   213: aload_2
    //   214: invokevirtual 162	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   217: aload 7
    //   219: invokevirtual 167	java/net/HttpURLConnection:connect	()V
    //   222: aload 7
    //   224: invokevirtual 171	java/net/HttpURLConnection:getResponseCode	()I
    //   227: sipush 304
    //   230: if_icmpne +86 -> 316
    //   233: ldc -83
    //   235: iconst_1
    //   236: anewarray 4	java/lang/Object
    //   239: dup
    //   240: iconst_0
    //   241: aload_0
    //   242: getfield 24	com/adobe/mobile/RemoteDownload$DownloadFileTask:url	Ljava/lang/String;
    //   245: aastore
    //   246: invokestatic 95	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   249: aload_0
    //   250: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   253: ifnull +15 -> 268
    //   256: aload_0
    //   257: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   260: iconst_0
    //   261: aload 5
    //   263: invokeinterface 101 3 0
    //   268: iconst_0
    //   269: ifeq +11 -> 280
    //   272: new 175	java/lang/NullPointerException
    //   275: dup
    //   276: invokespecial 176	java/lang/NullPointerException:<init>	()V
    //   279: athrow
    //   280: iconst_0
    //   281: ifeq +11 -> 292
    //   284: new 175	java/lang/NullPointerException
    //   287: dup
    //   288: invokespecial 176	java/lang/NullPointerException:<init>	()V
    //   291: athrow
    //   292: aload 7
    //   294: invokevirtual 179	java/net/HttpURLConnection:disconnect	()V
    //   297: return
    //   298: astore_2
    //   299: ldc -75
    //   301: iconst_1
    //   302: anewarray 4	java/lang/Object
    //   305: dup
    //   306: iconst_0
    //   307: aload_2
    //   308: invokevirtual 182	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   311: aastore
    //   312: invokestatic 185	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   315: return
    //   316: aload 7
    //   318: invokevirtual 171	java/net/HttpURLConnection:getResponseCode	()I
    //   321: sipush 404
    //   324: if_icmpne +86 -> 410
    //   327: ldc -69
    //   329: iconst_1
    //   330: anewarray 4	java/lang/Object
    //   333: dup
    //   334: iconst_0
    //   335: aload_0
    //   336: getfield 24	com/adobe/mobile/RemoteDownload$DownloadFileTask:url	Ljava/lang/String;
    //   339: aastore
    //   340: invokestatic 95	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   343: aload_0
    //   344: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   347: ifnull +15 -> 362
    //   350: aload_0
    //   351: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   354: iconst_0
    //   355: aload 5
    //   357: invokeinterface 101 3 0
    //   362: iconst_0
    //   363: ifeq +11 -> 374
    //   366: new 175	java/lang/NullPointerException
    //   369: dup
    //   370: invokespecial 176	java/lang/NullPointerException:<init>	()V
    //   373: athrow
    //   374: iconst_0
    //   375: ifeq +11 -> 386
    //   378: new 175	java/lang/NullPointerException
    //   381: dup
    //   382: invokespecial 176	java/lang/NullPointerException:<init>	()V
    //   385: athrow
    //   386: aload 7
    //   388: invokevirtual 179	java/net/HttpURLConnection:disconnect	()V
    //   391: return
    //   392: astore_2
    //   393: ldc -75
    //   395: iconst_1
    //   396: anewarray 4	java/lang/Object
    //   399: dup
    //   400: iconst_0
    //   401: aload_2
    //   402: invokevirtual 182	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   405: aastore
    //   406: invokestatic 185	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   409: return
    //   410: aload 7
    //   412: invokevirtual 171	java/net/HttpURLConnection:getResponseCode	()I
    //   415: sipush 200
    //   418: if_icmpeq +105 -> 523
    //   421: ldc -67
    //   423: iconst_3
    //   424: anewarray 4	java/lang/Object
    //   427: dup
    //   428: iconst_0
    //   429: aload_0
    //   430: getfield 24	com/adobe/mobile/RemoteDownload$DownloadFileTask:url	Ljava/lang/String;
    //   433: aastore
    //   434: dup
    //   435: iconst_1
    //   436: aload 7
    //   438: invokevirtual 171	java/net/HttpURLConnection:getResponseCode	()I
    //   441: invokestatic 194	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   444: aastore
    //   445: dup
    //   446: iconst_2
    //   447: aload 7
    //   449: invokevirtual 197	java/net/HttpURLConnection:getResponseMessage	()Ljava/lang/String;
    //   452: aastore
    //   453: invokestatic 185	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   456: aload_0
    //   457: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   460: ifnull +15 -> 475
    //   463: aload_0
    //   464: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   467: iconst_0
    //   468: aload 5
    //   470: invokeinterface 101 3 0
    //   475: iconst_0
    //   476: ifeq +11 -> 487
    //   479: new 175	java/lang/NullPointerException
    //   482: dup
    //   483: invokespecial 176	java/lang/NullPointerException:<init>	()V
    //   486: athrow
    //   487: iconst_0
    //   488: ifeq +11 -> 499
    //   491: new 175	java/lang/NullPointerException
    //   494: dup
    //   495: invokespecial 176	java/lang/NullPointerException:<init>	()V
    //   498: athrow
    //   499: aload 7
    //   501: invokevirtual 179	java/net/HttpURLConnection:disconnect	()V
    //   504: return
    //   505: astore_2
    //   506: ldc -75
    //   508: iconst_1
    //   509: anewarray 4	java/lang/Object
    //   512: dup
    //   513: iconst_0
    //   514: aload_2
    //   515: invokevirtual 182	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   518: aastore
    //   519: invokestatic 185	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   522: return
    //   523: aload 5
    //   525: ifnull +15 -> 540
    //   528: aload_0
    //   529: getfield 24	com/adobe/mobile/RemoteDownload$DownloadFileTask:url	Ljava/lang/String;
    //   532: aload_0
    //   533: getfield 32	com/adobe/mobile/RemoteDownload$DownloadFileTask:directory	Ljava/lang/String;
    //   536: invokestatic 201	com/adobe/mobile/RemoteDownload:access$400	(Ljava/lang/String;Ljava/lang/String;)Z
    //   539: pop
    //   540: new 203	java/util/Date
    //   543: dup
    //   544: aload 7
    //   546: invokevirtual 206	java/net/HttpURLConnection:getLastModified	()J
    //   549: invokespecial 209	java/util/Date:<init>	(J)V
    //   552: astore 5
    //   554: aload 7
    //   556: ldc -45
    //   558: invokevirtual 214	java/net/HttpURLConnection:getHeaderField	(Ljava/lang/String;)Ljava/lang/String;
    //   561: astore 4
    //   563: aload 4
    //   565: astore_2
    //   566: aload 4
    //   568: ifnull +9 -> 577
    //   571: aload 4
    //   573: invokestatic 217	com/adobe/mobile/StaticMethods:getHexString	(Ljava/lang/String;)Ljava/lang/String;
    //   576: astore_2
    //   577: aload_0
    //   578: getfield 24	com/adobe/mobile/RemoteDownload$DownloadFileTask:url	Ljava/lang/String;
    //   581: aload 5
    //   583: aload_2
    //   584: aload_0
    //   585: getfield 32	com/adobe/mobile/RemoteDownload$DownloadFileTask:directory	Ljava/lang/String;
    //   588: invokestatic 221	com/adobe/mobile/RemoteDownload:access$500	(Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    //   591: astore 6
    //   593: aload 6
    //   595: ifnonnull +69 -> 664
    //   598: aload_0
    //   599: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   602: ifnull +14 -> 616
    //   605: aload_0
    //   606: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   609: iconst_0
    //   610: aconst_null
    //   611: invokeinterface 101 3 0
    //   616: iconst_0
    //   617: ifeq +11 -> 628
    //   620: new 175	java/lang/NullPointerException
    //   623: dup
    //   624: invokespecial 176	java/lang/NullPointerException:<init>	()V
    //   627: athrow
    //   628: iconst_0
    //   629: ifeq +11 -> 640
    //   632: new 175	java/lang/NullPointerException
    //   635: dup
    //   636: invokespecial 176	java/lang/NullPointerException:<init>	()V
    //   639: athrow
    //   640: aload 7
    //   642: invokevirtual 179	java/net/HttpURLConnection:disconnect	()V
    //   645: return
    //   646: astore_2
    //   647: ldc -75
    //   649: iconst_1
    //   650: anewarray 4	java/lang/Object
    //   653: dup
    //   654: iconst_0
    //   655: aload_2
    //   656: invokevirtual 182	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   659: aastore
    //   660: invokestatic 185	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   663: return
    //   664: aload 7
    //   666: invokevirtual 225	java/net/HttpURLConnection:getInputStream	()Ljava/io/InputStream;
    //   669: astore_2
    //   670: new 227	java/io/FileOutputStream
    //   673: dup
    //   674: aload 6
    //   676: invokespecial 230	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   679: astore 5
    //   681: aload 5
    //   683: astore 4
    //   685: aload_2
    //   686: astore_3
    //   687: sipush 4096
    //   690: newarray <illegal type>
    //   692: astore 8
    //   694: aload 5
    //   696: astore 4
    //   698: aload_2
    //   699: astore_3
    //   700: aload_2
    //   701: aload 8
    //   703: invokevirtual 236	java/io/InputStream:read	([B)I
    //   706: istore_1
    //   707: iload_1
    //   708: iconst_m1
    //   709: if_icmpeq +99 -> 808
    //   712: aload 5
    //   714: astore 4
    //   716: aload_2
    //   717: astore_3
    //   718: aload 5
    //   720: aload 8
    //   722: iconst_0
    //   723: iload_1
    //   724: invokevirtual 242	java/io/OutputStream:write	([BII)V
    //   727: goto -33 -> 694
    //   730: astore_3
    //   731: aload 5
    //   733: astore_3
    //   734: ldc -12
    //   736: iconst_1
    //   737: anewarray 4	java/lang/Object
    //   740: dup
    //   741: iconst_0
    //   742: aload_0
    //   743: getfield 24	com/adobe/mobile/RemoteDownload$DownloadFileTask:url	Ljava/lang/String;
    //   746: aastore
    //   747: invokestatic 185	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   750: aload_0
    //   751: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   754: ifnull +14 -> 768
    //   757: aload_0
    //   758: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   761: iconst_0
    //   762: aconst_null
    //   763: invokeinterface 101 3 0
    //   768: aload_3
    //   769: ifnull +7 -> 776
    //   772: aload_3
    //   773: invokevirtual 247	java/io/OutputStream:close	()V
    //   776: aload_2
    //   777: ifnull +7 -> 784
    //   780: aload_2
    //   781: invokevirtual 248	java/io/InputStream:close	()V
    //   784: aload 7
    //   786: invokevirtual 179	java/net/HttpURLConnection:disconnect	()V
    //   789: return
    //   790: astore_2
    //   791: ldc -75
    //   793: iconst_1
    //   794: anewarray 4	java/lang/Object
    //   797: dup
    //   798: iconst_0
    //   799: aload_2
    //   800: invokevirtual 182	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   803: aastore
    //   804: invokestatic 185	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   807: return
    //   808: aload 5
    //   810: astore 4
    //   812: aload_2
    //   813: astore_3
    //   814: ldc -6
    //   816: iconst_1
    //   817: anewarray 4	java/lang/Object
    //   820: dup
    //   821: iconst_0
    //   822: aload_0
    //   823: getfield 24	com/adobe/mobile/RemoteDownload$DownloadFileTask:url	Ljava/lang/String;
    //   826: aastore
    //   827: invokestatic 95	com/adobe/mobile/StaticMethods:logDebugFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   830: aload 5
    //   832: astore 4
    //   834: aload_2
    //   835: astore_3
    //   836: aload_0
    //   837: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   840: ifnull +21 -> 861
    //   843: aload 5
    //   845: astore 4
    //   847: aload_2
    //   848: astore_3
    //   849: aload_0
    //   850: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   853: iconst_1
    //   854: aload 6
    //   856: invokeinterface 101 3 0
    //   861: aload 5
    //   863: ifnull +8 -> 871
    //   866: aload 5
    //   868: invokevirtual 247	java/io/OutputStream:close	()V
    //   871: aload_2
    //   872: ifnull +7 -> 879
    //   875: aload_2
    //   876: invokevirtual 248	java/io/InputStream:close	()V
    //   879: aload 7
    //   881: invokevirtual 179	java/net/HttpURLConnection:disconnect	()V
    //   884: return
    //   885: astore_2
    //   886: ldc -75
    //   888: iconst_1
    //   889: anewarray 4	java/lang/Object
    //   892: dup
    //   893: iconst_0
    //   894: aload_2
    //   895: invokevirtual 182	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   898: aastore
    //   899: invokestatic 185	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   902: return
    //   903: astore 6
    //   905: aconst_null
    //   906: astore_2
    //   907: aconst_null
    //   908: astore 5
    //   910: aload 5
    //   912: astore 4
    //   914: aload_2
    //   915: astore_3
    //   916: ldc -4
    //   918: iconst_1
    //   919: anewarray 4	java/lang/Object
    //   922: dup
    //   923: iconst_0
    //   924: aload 6
    //   926: invokevirtual 182	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   929: aastore
    //   930: invokestatic 185	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   933: aload 5
    //   935: astore 4
    //   937: aload_2
    //   938: astore_3
    //   939: aload_0
    //   940: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   943: ifnull +20 -> 963
    //   946: aload 5
    //   948: astore 4
    //   950: aload_2
    //   951: astore_3
    //   952: aload_0
    //   953: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   956: iconst_0
    //   957: aconst_null
    //   958: invokeinterface 101 3 0
    //   963: aload 5
    //   965: ifnull +8 -> 973
    //   968: aload 5
    //   970: invokevirtual 247	java/io/OutputStream:close	()V
    //   973: aload_2
    //   974: ifnull +7 -> 981
    //   977: aload_2
    //   978: invokevirtual 248	java/io/InputStream:close	()V
    //   981: aload 7
    //   983: invokevirtual 179	java/net/HttpURLConnection:disconnect	()V
    //   986: return
    //   987: astore_2
    //   988: ldc -75
    //   990: iconst_1
    //   991: anewarray 4	java/lang/Object
    //   994: dup
    //   995: iconst_0
    //   996: aload_2
    //   997: invokevirtual 182	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   1000: aastore
    //   1001: invokestatic 185	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   1004: return
    //   1005: astore 6
    //   1007: aconst_null
    //   1008: astore_2
    //   1009: aconst_null
    //   1010: astore 5
    //   1012: aload 5
    //   1014: astore 4
    //   1016: aload_2
    //   1017: astore_3
    //   1018: ldc -2
    //   1020: iconst_1
    //   1021: anewarray 4	java/lang/Object
    //   1024: dup
    //   1025: iconst_0
    //   1026: aload 6
    //   1028: invokevirtual 77	java/lang/Exception:getLocalizedMessage	()Ljava/lang/String;
    //   1031: aastore
    //   1032: invokestatic 185	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   1035: aload 5
    //   1037: astore 4
    //   1039: aload_2
    //   1040: astore_3
    //   1041: aload_0
    //   1042: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   1045: ifnull +20 -> 1065
    //   1048: aload 5
    //   1050: astore 4
    //   1052: aload_2
    //   1053: astore_3
    //   1054: aload_0
    //   1055: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   1058: iconst_0
    //   1059: aconst_null
    //   1060: invokeinterface 101 3 0
    //   1065: aload 5
    //   1067: ifnull +8 -> 1075
    //   1070: aload 5
    //   1072: invokevirtual 247	java/io/OutputStream:close	()V
    //   1075: aload_2
    //   1076: ifnull +7 -> 1083
    //   1079: aload_2
    //   1080: invokevirtual 248	java/io/InputStream:close	()V
    //   1083: aload 7
    //   1085: invokevirtual 179	java/net/HttpURLConnection:disconnect	()V
    //   1088: return
    //   1089: astore_2
    //   1090: ldc -75
    //   1092: iconst_1
    //   1093: anewarray 4	java/lang/Object
    //   1096: dup
    //   1097: iconst_0
    //   1098: aload_2
    //   1099: invokevirtual 182	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   1102: aastore
    //   1103: invokestatic 185	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   1106: return
    //   1107: astore 6
    //   1109: aconst_null
    //   1110: astore_2
    //   1111: aconst_null
    //   1112: astore 5
    //   1114: aload 5
    //   1116: astore 4
    //   1118: aload_2
    //   1119: astore_3
    //   1120: ldc_w 256
    //   1123: iconst_1
    //   1124: anewarray 4	java/lang/Object
    //   1127: dup
    //   1128: iconst_0
    //   1129: aload 6
    //   1131: invokevirtual 257	java/lang/Error:getLocalizedMessage	()Ljava/lang/String;
    //   1134: aastore
    //   1135: invokestatic 185	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   1138: aload 5
    //   1140: astore 4
    //   1142: aload_2
    //   1143: astore_3
    //   1144: aload_0
    //   1145: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   1148: ifnull +20 -> 1168
    //   1151: aload 5
    //   1153: astore 4
    //   1155: aload_2
    //   1156: astore_3
    //   1157: aload_0
    //   1158: getfield 26	com/adobe/mobile/RemoteDownload$DownloadFileTask:callback	Lcom/adobe/mobile/RemoteDownload$RemoteDownloadBlock;
    //   1161: iconst_0
    //   1162: aconst_null
    //   1163: invokeinterface 101 3 0
    //   1168: aload 5
    //   1170: ifnull +8 -> 1178
    //   1173: aload 5
    //   1175: invokevirtual 247	java/io/OutputStream:close	()V
    //   1178: aload_2
    //   1179: ifnull +7 -> 1186
    //   1182: aload_2
    //   1183: invokevirtual 248	java/io/InputStream:close	()V
    //   1186: aload 7
    //   1188: invokevirtual 179	java/net/HttpURLConnection:disconnect	()V
    //   1191: return
    //   1192: astore_2
    //   1193: ldc -75
    //   1195: iconst_1
    //   1196: anewarray 4	java/lang/Object
    //   1199: dup
    //   1200: iconst_0
    //   1201: aload_2
    //   1202: invokevirtual 182	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   1205: aastore
    //   1206: invokestatic 185	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   1209: return
    //   1210: astore 5
    //   1212: aconst_null
    //   1213: astore_2
    //   1214: aconst_null
    //   1215: astore 4
    //   1217: aload 4
    //   1219: ifnull +8 -> 1227
    //   1222: aload 4
    //   1224: invokevirtual 247	java/io/OutputStream:close	()V
    //   1227: aload_2
    //   1228: ifnull +7 -> 1235
    //   1231: aload_2
    //   1232: invokevirtual 248	java/io/InputStream:close	()V
    //   1235: aload 7
    //   1237: invokevirtual 179	java/net/HttpURLConnection:disconnect	()V
    //   1240: aload 5
    //   1242: athrow
    //   1243: astore_2
    //   1244: ldc -75
    //   1246: iconst_1
    //   1247: anewarray 4	java/lang/Object
    //   1250: dup
    //   1251: iconst_0
    //   1252: aload_2
    //   1253: invokevirtual 182	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   1256: aastore
    //   1257: invokestatic 185	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   1260: goto -20 -> 1240
    //   1263: astore 5
    //   1265: aconst_null
    //   1266: astore 4
    //   1268: goto -51 -> 1217
    //   1271: astore 5
    //   1273: aload_3
    //   1274: astore_2
    //   1275: goto -58 -> 1217
    //   1278: astore 5
    //   1280: aload_3
    //   1281: astore 4
    //   1283: goto -66 -> 1217
    //   1286: astore 6
    //   1288: aconst_null
    //   1289: astore 5
    //   1291: goto -177 -> 1114
    //   1294: astore 6
    //   1296: goto -182 -> 1114
    //   1299: astore 6
    //   1301: aconst_null
    //   1302: astore 5
    //   1304: goto -292 -> 1012
    //   1307: astore 6
    //   1309: goto -297 -> 1012
    //   1312: astore 6
    //   1314: aconst_null
    //   1315: astore 5
    //   1317: goto -407 -> 910
    //   1320: astore 6
    //   1322: goto -412 -> 910
    //   1325: astore_2
    //   1326: aconst_null
    //   1327: astore_2
    //   1328: goto -594 -> 734
    //   1331: astore 4
    //   1333: goto -599 -> 734
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1336	0	this	DownloadFileTask
    //   706	18	1	i	int
    //   167	47	2	str	String
    //   298	10	2	localIOException1	java.io.IOException
    //   392	10	2	localIOException2	java.io.IOException
    //   505	10	2	localIOException3	java.io.IOException
    //   565	19	2	localObject1	Object
    //   646	10	2	localIOException4	java.io.IOException
    //   669	112	2	localInputStream	java.io.InputStream
    //   790	86	2	localIOException5	java.io.IOException
    //   885	10	2	localIOException6	java.io.IOException
    //   906	72	2	localObject2	Object
    //   987	10	2	localIOException7	java.io.IOException
    //   1008	72	2	localObject3	Object
    //   1089	10	2	localIOException8	java.io.IOException
    //   1110	73	2	localObject4	Object
    //   1192	10	2	localIOException9	java.io.IOException
    //   1213	19	2	localObject5	Object
    //   1243	10	2	localIOException10	java.io.IOException
    //   1274	1	2	localObject6	Object
    //   1325	1	2	localSocketTimeoutException1	java.net.SocketTimeoutException
    //   1327	1	2	localObject7	Object
    //   1	717	3	localObject8	Object
    //   730	1	3	localSocketTimeoutException2	java.net.SocketTimeoutException
    //   733	548	3	localObject9	Object
    //   179	1103	4	localObject10	Object
    //   1331	1	4	localSocketTimeoutException3	java.net.SocketTimeoutException
    //   93	1081	5	localObject11	Object
    //   1210	31	5	localObject12	Object
    //   1263	1	5	localObject13	Object
    //   1271	1	5	localObject14	Object
    //   1278	1	5	localObject15	Object
    //   1289	27	5	localObject16	Object
    //   98	757	6	localObject17	Object
    //   903	22	6	localIOException11	java.io.IOException
    //   1005	22	6	localException1	Exception
    //   1107	23	6	localError1	Error
    //   1286	1	6	localError2	Error
    //   1294	1	6	localError3	Error
    //   1299	1	6	localException2	Exception
    //   1307	1	6	localException3	Exception
    //   1312	1	6	localIOException12	java.io.IOException
    //   1320	1	6	localIOException13	java.io.IOException
    //   107	1129	7	localHttpURLConnection	HttpURLConnection
    //   692	29	8	arrayOfByte	byte[]
    // Exception table:
    //   from	to	target	type
    //   272	280	298	java/io/IOException
    //   284	292	298	java/io/IOException
    //   292	297	298	java/io/IOException
    //   366	374	392	java/io/IOException
    //   378	386	392	java/io/IOException
    //   386	391	392	java/io/IOException
    //   479	487	505	java/io/IOException
    //   491	499	505	java/io/IOException
    //   499	504	505	java/io/IOException
    //   620	628	646	java/io/IOException
    //   632	640	646	java/io/IOException
    //   640	645	646	java/io/IOException
    //   687	694	730	java/net/SocketTimeoutException
    //   700	707	730	java/net/SocketTimeoutException
    //   718	727	730	java/net/SocketTimeoutException
    //   814	830	730	java/net/SocketTimeoutException
    //   836	843	730	java/net/SocketTimeoutException
    //   849	861	730	java/net/SocketTimeoutException
    //   772	776	790	java/io/IOException
    //   780	784	790	java/io/IOException
    //   784	789	790	java/io/IOException
    //   866	871	885	java/io/IOException
    //   875	879	885	java/io/IOException
    //   879	884	885	java/io/IOException
    //   217	268	903	java/io/IOException
    //   316	362	903	java/io/IOException
    //   410	475	903	java/io/IOException
    //   528	540	903	java/io/IOException
    //   540	563	903	java/io/IOException
    //   571	577	903	java/io/IOException
    //   577	593	903	java/io/IOException
    //   598	616	903	java/io/IOException
    //   664	670	903	java/io/IOException
    //   968	973	987	java/io/IOException
    //   977	981	987	java/io/IOException
    //   981	986	987	java/io/IOException
    //   217	268	1005	java/lang/Exception
    //   316	362	1005	java/lang/Exception
    //   410	475	1005	java/lang/Exception
    //   528	540	1005	java/lang/Exception
    //   540	563	1005	java/lang/Exception
    //   571	577	1005	java/lang/Exception
    //   577	593	1005	java/lang/Exception
    //   598	616	1005	java/lang/Exception
    //   664	670	1005	java/lang/Exception
    //   1070	1075	1089	java/io/IOException
    //   1079	1083	1089	java/io/IOException
    //   1083	1088	1089	java/io/IOException
    //   217	268	1107	java/lang/Error
    //   316	362	1107	java/lang/Error
    //   410	475	1107	java/lang/Error
    //   528	540	1107	java/lang/Error
    //   540	563	1107	java/lang/Error
    //   571	577	1107	java/lang/Error
    //   577	593	1107	java/lang/Error
    //   598	616	1107	java/lang/Error
    //   664	670	1107	java/lang/Error
    //   1173	1178	1192	java/io/IOException
    //   1182	1186	1192	java/io/IOException
    //   1186	1191	1192	java/io/IOException
    //   217	268	1210	finally
    //   316	362	1210	finally
    //   410	475	1210	finally
    //   528	540	1210	finally
    //   540	563	1210	finally
    //   571	577	1210	finally
    //   577	593	1210	finally
    //   598	616	1210	finally
    //   664	670	1210	finally
    //   1222	1227	1243	java/io/IOException
    //   1231	1235	1243	java/io/IOException
    //   1235	1240	1243	java/io/IOException
    //   670	681	1263	finally
    //   687	694	1271	finally
    //   700	707	1271	finally
    //   718	727	1271	finally
    //   814	830	1271	finally
    //   836	843	1271	finally
    //   849	861	1271	finally
    //   916	933	1271	finally
    //   939	946	1271	finally
    //   952	963	1271	finally
    //   1018	1035	1271	finally
    //   1041	1048	1271	finally
    //   1054	1065	1271	finally
    //   1120	1138	1271	finally
    //   1144	1151	1271	finally
    //   1157	1168	1271	finally
    //   734	768	1278	finally
    //   670	681	1286	java/lang/Error
    //   687	694	1294	java/lang/Error
    //   700	707	1294	java/lang/Error
    //   718	727	1294	java/lang/Error
    //   814	830	1294	java/lang/Error
    //   836	843	1294	java/lang/Error
    //   849	861	1294	java/lang/Error
    //   670	681	1299	java/lang/Exception
    //   687	694	1307	java/lang/Exception
    //   700	707	1307	java/lang/Exception
    //   718	727	1307	java/lang/Exception
    //   814	830	1307	java/lang/Exception
    //   836	843	1307	java/lang/Exception
    //   849	861	1307	java/lang/Exception
    //   670	681	1312	java/io/IOException
    //   687	694	1320	java/io/IOException
    //   700	707	1320	java/io/IOException
    //   718	727	1320	java/io/IOException
    //   814	830	1320	java/io/IOException
    //   836	843	1320	java/io/IOException
    //   849	861	1320	java/io/IOException
    //   217	268	1325	java/net/SocketTimeoutException
    //   316	362	1325	java/net/SocketTimeoutException
    //   410	475	1325	java/net/SocketTimeoutException
    //   528	540	1325	java/net/SocketTimeoutException
    //   540	563	1325	java/net/SocketTimeoutException
    //   571	577	1325	java/net/SocketTimeoutException
    //   577	593	1325	java/net/SocketTimeoutException
    //   598	616	1325	java/net/SocketTimeoutException
    //   664	670	1325	java/net/SocketTimeoutException
    //   670	681	1331	java/net/SocketTimeoutException
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.RemoteDownload.DownloadFileTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */