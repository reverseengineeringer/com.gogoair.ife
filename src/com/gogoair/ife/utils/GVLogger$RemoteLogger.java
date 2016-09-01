package com.gogoair.ife.utils;

import android.os.AsyncTask;

class GVLogger$RemoteLogger
  extends AsyncTask
{
  private Boolean isAccountingGrade = Boolean.valueOf(false);
  private GVLogger.RemoteLoggerListener listener;
  private final String postData;
  private final String requestMethod;
  private String responseData;
  
  public GVLogger$RemoteLogger(GVLogger paramGVLogger, String paramString1, GVLogger.RemoteLoggerListener paramRemoteLoggerListener, Boolean paramBoolean, String paramString2)
  {
    listener = paramRemoteLoggerListener;
    requestMethod = paramString1;
    isAccountingGrade = paramBoolean;
    postData = paramString2;
  }
  
  public GVLogger$RemoteLogger(GVLogger paramGVLogger, String paramString1, String paramString2)
  {
    requestMethod = paramString1;
    postData = paramString2;
  }
  
  /* Error */
  protected Boolean doInBackground(String... paramVarArgs)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_3
    //   2: aconst_null
    //   3: astore 4
    //   5: aload_3
    //   6: astore_2
    //   7: invokestatic 48	com/gogoair/ife/utils/GVLogger:getDefaultLogger	()Lcom/gogoair/ife/utils/GVLogger;
    //   10: ldc 50
    //   12: new 52	java/lang/StringBuilder
    //   15: dup
    //   16: invokespecial 53	java/lang/StringBuilder:<init>	()V
    //   19: ldc 55
    //   21: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   24: aload_1
    //   25: iconst_0
    //   26: aaload
    //   27: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   30: invokevirtual 63	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   33: invokevirtual 67	com/gogoair/ife/utils/GVLogger:d	(Ljava/lang/String;Ljava/lang/String;)V
    //   36: aload_3
    //   37: astore_2
    //   38: new 69	java/net/URL
    //   41: dup
    //   42: aload_1
    //   43: iconst_0
    //   44: aaload
    //   45: invokespecial 72	java/net/URL:<init>	(Ljava/lang/String;)V
    //   48: invokevirtual 76	java/net/URL:openConnection	()Ljava/net/URLConnection;
    //   51: checkcast 78	java/net/HttpURLConnection
    //   54: astore_1
    //   55: aload_1
    //   56: ldc 79
    //   58: invokevirtual 83	java/net/HttpURLConnection:setReadTimeout	(I)V
    //   61: aload_1
    //   62: ldc 84
    //   64: invokevirtual 87	java/net/HttpURLConnection:setConnectTimeout	(I)V
    //   67: aload_1
    //   68: aload_0
    //   69: getfield 36	com/gogoair/ife/utils/GVLogger$RemoteLogger:requestMethod	Ljava/lang/String;
    //   72: invokevirtual 90	java/net/HttpURLConnection:setRequestMethod	(Ljava/lang/String;)V
    //   75: aload_1
    //   76: iconst_1
    //   77: invokevirtual 94	java/net/HttpURLConnection:setDoOutput	(Z)V
    //   80: aload_0
    //   81: getfield 32	com/gogoair/ife/utils/GVLogger$RemoteLogger:isAccountingGrade	Ljava/lang/Boolean;
    //   84: invokevirtual 98	java/lang/Boolean:booleanValue	()Z
    //   87: ifeq +11 -> 98
    //   90: aload_1
    //   91: ldc 100
    //   93: ldc 102
    //   95: invokevirtual 105	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   98: aload_1
    //   99: invokevirtual 109	java/net/HttpURLConnection:getOutputStream	()Ljava/io/OutputStream;
    //   102: astore_2
    //   103: new 111	java/io/BufferedWriter
    //   106: dup
    //   107: new 113	java/io/OutputStreamWriter
    //   110: dup
    //   111: aload_2
    //   112: ldc 115
    //   114: invokespecial 118	java/io/OutputStreamWriter:<init>	(Ljava/io/OutputStream;Ljava/lang/String;)V
    //   117: invokespecial 121	java/io/BufferedWriter:<init>	(Ljava/io/Writer;)V
    //   120: astore_3
    //   121: aload_3
    //   122: aload_0
    //   123: getfield 38	com/gogoair/ife/utils/GVLogger$RemoteLogger:postData	Ljava/lang/String;
    //   126: invokevirtual 124	java/io/BufferedWriter:write	(Ljava/lang/String;)V
    //   129: aload_3
    //   130: invokevirtual 127	java/io/BufferedWriter:flush	()V
    //   133: aload_3
    //   134: invokevirtual 130	java/io/BufferedWriter:close	()V
    //   137: aload_2
    //   138: invokevirtual 133	java/io/OutputStream:close	()V
    //   141: aload_1
    //   142: invokevirtual 137	java/net/HttpURLConnection:getResponseCode	()I
    //   145: sipush 200
    //   148: if_icmplt +146 -> 294
    //   151: aload_1
    //   152: invokevirtual 137	java/net/HttpURLConnection:getResponseCode	()I
    //   155: sipush 299
    //   158: if_icmpgt +136 -> 294
    //   161: invokestatic 48	com/gogoair/ife/utils/GVLogger:getDefaultLogger	()Lcom/gogoair/ife/utils/GVLogger;
    //   164: ldc 50
    //   166: new 52	java/lang/StringBuilder
    //   169: dup
    //   170: invokespecial 53	java/lang/StringBuilder:<init>	()V
    //   173: ldc -117
    //   175: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   178: aload_0
    //   179: getfield 38	com/gogoair/ife/utils/GVLogger$RemoteLogger:postData	Ljava/lang/String;
    //   182: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   185: invokevirtual 63	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   188: invokevirtual 67	com/gogoair/ife/utils/GVLogger:d	(Ljava/lang/String;Ljava/lang/String;)V
    //   191: new 141	java/io/BufferedReader
    //   194: dup
    //   195: new 143	java/io/InputStreamReader
    //   198: dup
    //   199: aload_1
    //   200: invokevirtual 147	java/net/HttpURLConnection:getInputStream	()Ljava/io/InputStream;
    //   203: invokespecial 150	java/io/InputStreamReader:<init>	(Ljava/io/InputStream;)V
    //   206: invokespecial 153	java/io/BufferedReader:<init>	(Ljava/io/Reader;)V
    //   209: astore_2
    //   210: new 52	java/lang/StringBuilder
    //   213: dup
    //   214: invokespecial 53	java/lang/StringBuilder:<init>	()V
    //   217: astore_3
    //   218: aload_2
    //   219: invokevirtual 156	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   222: astore 4
    //   224: aload 4
    //   226: ifnull +43 -> 269
    //   229: aload_3
    //   230: aload 4
    //   232: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   235: pop
    //   236: goto -18 -> 218
    //   239: astore_3
    //   240: aload_1
    //   241: astore_2
    //   242: aload_3
    //   243: invokevirtual 159	java/io/IOException:printStackTrace	()V
    //   246: aload_1
    //   247: astore_2
    //   248: aload_0
    //   249: aload_3
    //   250: invokevirtual 162	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   253: putfield 164	com/gogoair/ife/utils/GVLogger$RemoteLogger:responseData	Ljava/lang/String;
    //   256: aload_1
    //   257: ifnull +7 -> 264
    //   260: aload_1
    //   261: invokevirtual 167	java/net/HttpURLConnection:disconnect	()V
    //   264: iconst_0
    //   265: invokestatic 30	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   268: areturn
    //   269: aload_2
    //   270: invokevirtual 168	java/io/BufferedReader:close	()V
    //   273: aload_0
    //   274: aload_3
    //   275: invokevirtual 63	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   278: putfield 164	com/gogoair/ife/utils/GVLogger$RemoteLogger:responseData	Ljava/lang/String;
    //   281: aload_1
    //   282: ifnull +7 -> 289
    //   285: aload_1
    //   286: invokevirtual 167	java/net/HttpURLConnection:disconnect	()V
    //   289: iconst_1
    //   290: invokestatic 30	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   293: areturn
    //   294: aload_0
    //   295: new 52	java/lang/StringBuilder
    //   298: dup
    //   299: invokespecial 53	java/lang/StringBuilder:<init>	()V
    //   302: ldc -86
    //   304: invokevirtual 59	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   307: aload_1
    //   308: invokevirtual 137	java/net/HttpURLConnection:getResponseCode	()I
    //   311: invokevirtual 173	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   314: invokevirtual 63	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   317: putfield 164	com/gogoair/ife/utils/GVLogger$RemoteLogger:responseData	Ljava/lang/String;
    //   320: aload_1
    //   321: ifnull +7 -> 328
    //   324: aload_1
    //   325: invokevirtual 167	java/net/HttpURLConnection:disconnect	()V
    //   328: iconst_0
    //   329: invokestatic 30	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   332: areturn
    //   333: astore_3
    //   334: aload_2
    //   335: astore_1
    //   336: aload_3
    //   337: astore_2
    //   338: aload_1
    //   339: ifnull +7 -> 346
    //   342: aload_1
    //   343: invokevirtual 167	java/net/HttpURLConnection:disconnect	()V
    //   346: aload_2
    //   347: athrow
    //   348: astore_2
    //   349: goto -11 -> 338
    //   352: astore_3
    //   353: aload 4
    //   355: astore_1
    //   356: goto -116 -> 240
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	359	0	this	RemoteLogger
    //   0	359	1	paramVarArgs	String[]
    //   6	341	2	localObject1	Object
    //   348	1	2	localObject2	Object
    //   1	229	3	localObject3	Object
    //   239	36	3	localIOException1	java.io.IOException
    //   333	4	3	localObject4	Object
    //   352	1	3	localIOException2	java.io.IOException
    //   3	351	4	str	String
    // Exception table:
    //   from	to	target	type
    //   55	98	239	java/io/IOException
    //   98	218	239	java/io/IOException
    //   218	224	239	java/io/IOException
    //   229	236	239	java/io/IOException
    //   269	281	239	java/io/IOException
    //   294	320	239	java/io/IOException
    //   7	36	333	finally
    //   38	55	333	finally
    //   242	246	333	finally
    //   248	256	333	finally
    //   55	98	348	finally
    //   98	218	348	finally
    //   218	224	348	finally
    //   229	236	348	finally
    //   269	281	348	finally
    //   294	320	348	finally
    //   7	36	352	java/io/IOException
    //   38	55	352	java/io/IOException
  }
  
  protected void onPostExecute(Boolean paramBoolean)
  {
    if (listener != null)
    {
      if (paramBoolean.booleanValue()) {
        listener.onLogSuccess(responseData);
      }
    }
    else {
      return;
    }
    listener.onLogFailure(responseData);
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.utils.GVLogger.RemoteLogger
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */