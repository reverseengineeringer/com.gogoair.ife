package com.gogoair.ife.utils;

import android.content.Context;
import android.os.AsyncTask;

class GVNetworkManager$1GVNetworkChecker
  extends AsyncTask
{
  GVNetworkManager.GVNetworkType newNetwork = GVNetworkManager.GVNetworkType.unknown;
  
  GVNetworkManager$1GVNetworkChecker(GVNetworkManager paramGVNetworkManager, Context paramContext) {}
  
  /* Error */
  private boolean connectsToUrl(String paramString, boolean paramBoolean)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 6
    //   3: aconst_null
    //   4: astore 4
    //   6: aconst_null
    //   7: astore 5
    //   9: aload 4
    //   11: astore_3
    //   12: invokestatic 41	com/gogoair/ife/utils/GVLogger:getDefaultLogger	()Lcom/gogoair/ife/utils/GVLogger;
    //   15: ldc 43
    //   17: new 45	java/lang/StringBuilder
    //   20: dup
    //   21: invokespecial 46	java/lang/StringBuilder:<init>	()V
    //   24: ldc 48
    //   26: invokevirtual 52	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   29: aload_1
    //   30: invokevirtual 52	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   33: invokevirtual 56	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   36: invokevirtual 60	com/gogoair/ife/utils/GVLogger:d	(Ljava/lang/String;Ljava/lang/String;)V
    //   39: aload 4
    //   41: astore_3
    //   42: new 62	java/net/URL
    //   45: dup
    //   46: aload_1
    //   47: invokespecial 65	java/net/URL:<init>	(Ljava/lang/String;)V
    //   50: astore 7
    //   52: iload_2
    //   53: ifne +79 -> 132
    //   56: aload 4
    //   58: astore_3
    //   59: iconst_0
    //   60: invokestatic 71	java/net/HttpURLConnection:setFollowRedirects	(Z)V
    //   63: aload 4
    //   65: astore_3
    //   66: aload 7
    //   68: invokevirtual 75	java/net/URL:openConnection	()Ljava/net/URLConnection;
    //   71: checkcast 67	java/net/HttpURLConnection
    //   74: astore 4
    //   76: aload 4
    //   78: sipush 10000
    //   81: invokevirtual 79	java/net/HttpURLConnection:setReadTimeout	(I)V
    //   84: aload 4
    //   86: sipush 15000
    //   89: invokevirtual 82	java/net/HttpURLConnection:setConnectTimeout	(I)V
    //   92: aload 4
    //   94: ldc 84
    //   96: invokevirtual 87	java/net/HttpURLConnection:setRequestMethod	(Ljava/lang/String;)V
    //   99: aload 4
    //   101: invokevirtual 91	java/net/HttpURLConnection:getResponseCode	()I
    //   104: sipush 200
    //   107: if_icmpne +58 -> 165
    //   110: invokestatic 41	com/gogoair/ife/utils/GVLogger:getDefaultLogger	()Lcom/gogoair/ife/utils/GVLogger;
    //   113: ldc 43
    //   115: ldc 93
    //   117: invokevirtual 60	com/gogoair/ife/utils/GVLogger:d	(Ljava/lang/String;Ljava/lang/String;)V
    //   120: aload 4
    //   122: ifnull +8 -> 130
    //   125: aload 4
    //   127: invokevirtual 96	java/net/HttpURLConnection:disconnect	()V
    //   130: iconst_1
    //   131: ireturn
    //   132: aload 4
    //   134: astore_3
    //   135: iconst_1
    //   136: invokestatic 71	java/net/HttpURLConnection:setFollowRedirects	(Z)V
    //   139: goto -76 -> 63
    //   142: astore_3
    //   143: aconst_null
    //   144: astore_1
    //   145: aload_3
    //   146: astore 4
    //   148: aload_1
    //   149: astore_3
    //   150: aload 4
    //   152: invokevirtual 99	java/io/IOException:printStackTrace	()V
    //   155: aload_1
    //   156: ifnull +7 -> 163
    //   159: aload_1
    //   160: invokevirtual 96	java/net/HttpURLConnection:disconnect	()V
    //   163: iconst_0
    //   164: ireturn
    //   165: aload 4
    //   167: ifnull -4 -> 163
    //   170: aload 4
    //   172: invokevirtual 96	java/net/HttpURLConnection:disconnect	()V
    //   175: goto -12 -> 163
    //   178: astore_3
    //   179: aload 6
    //   181: astore 4
    //   183: aload 4
    //   185: astore_3
    //   186: invokestatic 41	com/gogoair/ife/utils/GVLogger:getDefaultLogger	()Lcom/gogoair/ife/utils/GVLogger;
    //   189: ldc 43
    //   191: new 45	java/lang/StringBuilder
    //   194: dup
    //   195: invokespecial 46	java/lang/StringBuilder:<init>	()V
    //   198: ldc 101
    //   200: invokevirtual 52	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   203: aload_1
    //   204: invokevirtual 52	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   207: invokevirtual 56	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   210: invokevirtual 60	com/gogoair/ife/utils/GVLogger:d	(Ljava/lang/String;Ljava/lang/String;)V
    //   213: aload 4
    //   215: ifnull -52 -> 163
    //   218: aload 4
    //   220: invokevirtual 96	java/net/HttpURLConnection:disconnect	()V
    //   223: goto -60 -> 163
    //   226: astore_1
    //   227: aload_3
    //   228: ifnull +7 -> 235
    //   231: aload_3
    //   232: invokevirtual 96	java/net/HttpURLConnection:disconnect	()V
    //   235: aload_1
    //   236: athrow
    //   237: astore_1
    //   238: aload 4
    //   240: astore_3
    //   241: goto -14 -> 227
    //   244: astore_3
    //   245: goto -62 -> 183
    //   248: astore 4
    //   250: aload 5
    //   252: astore_1
    //   253: goto -105 -> 148
    //   256: astore_3
    //   257: aload 4
    //   259: astore_1
    //   260: aload_3
    //   261: astore 4
    //   263: goto -115 -> 148
    //   266: astore_3
    //   267: aload 4
    //   269: astore_1
    //   270: goto -125 -> 145
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	273	0	this	1GVNetworkChecker
    //   0	273	1	paramString	String
    //   0	273	2	paramBoolean	boolean
    //   11	124	3	localObject1	Object
    //   142	4	3	localMalformedURLException1	java.net.MalformedURLException
    //   149	1	3	str	String
    //   178	1	3	localIOException1	java.io.IOException
    //   185	56	3	localObject2	Object
    //   244	1	3	localIOException2	java.io.IOException
    //   256	5	3	localProtocolException1	java.net.ProtocolException
    //   266	1	3	localMalformedURLException2	java.net.MalformedURLException
    //   4	235	4	localObject3	Object
    //   248	10	4	localProtocolException2	java.net.ProtocolException
    //   261	7	4	localObject4	Object
    //   7	244	5	localObject5	Object
    //   1	179	6	localObject6	Object
    //   50	17	7	localURL	java.net.URL
    // Exception table:
    //   from	to	target	type
    //   12	39	142	java/net/MalformedURLException
    //   42	52	142	java/net/MalformedURLException
    //   59	63	142	java/net/MalformedURLException
    //   66	76	142	java/net/MalformedURLException
    //   135	139	142	java/net/MalformedURLException
    //   12	39	178	java/io/IOException
    //   42	52	178	java/io/IOException
    //   59	63	178	java/io/IOException
    //   66	76	178	java/io/IOException
    //   135	139	178	java/io/IOException
    //   12	39	226	finally
    //   42	52	226	finally
    //   59	63	226	finally
    //   66	76	226	finally
    //   135	139	226	finally
    //   150	155	226	finally
    //   186	213	226	finally
    //   76	120	237	finally
    //   76	120	244	java/io/IOException
    //   12	39	248	java/net/ProtocolException
    //   42	52	248	java/net/ProtocolException
    //   59	63	248	java/net/ProtocolException
    //   66	76	248	java/net/ProtocolException
    //   135	139	248	java/net/ProtocolException
    //   76	120	256	java/net/ProtocolException
    //   76	120	266	java/net/MalformedURLException
  }
  
  protected String doInBackground(String... paramVarArgs)
  {
    if (connectsToUrl(paramVarArgs[0], false)) {
      newNetwork = GVNetworkManager.GVNetworkType.in_air;
    }
    for (;;)
    {
      return "DONE";
      if (connectsToUrl(paramVarArgs[1], true)) {
        newNetwork = GVNetworkManager.GVNetworkType.ground;
      } else {
        newNetwork = GVNetworkManager.GVNetworkType.ground;
      }
    }
  }
  
  protected void onPostExecute(String paramString)
  {
    GVLogger.getDefaultLogger().d("GVNetworkManager", "Previous net: " + GVNetworkManager.access$000());
    if ((GVNetworkManager.access$000() != newNetwork) || (newNetwork == GVNetworkManager.GVNetworkType.unknown))
    {
      GVNetworkManager.access$002(newNetwork);
      GVNetworkManager.access$100(val$context, newNetwork);
    }
    GVLogger.getDefaultLogger().d("GVNetworkManager", "Current net: " + GVNetworkManager.access$000());
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.utils.GVNetworkManager.1GVNetworkChecker
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */