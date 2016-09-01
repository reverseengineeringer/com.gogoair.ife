package com.adobe.primetime.core;

import android.os.Build;
import android.os.Build.VERSION;
import com.adobe.primetime.core.radio.Channel;
import com.adobe.primetime.va.ErrorInfo;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import javax.net.ssl.HttpsURLConnection;
import org.apache.http.conn.ssl.StrictHostnameVerifier;

public class URLLoader
{
  private static final String CHANNEL_URL_LOADER = "channel_url_loader";
  private static final Integer NETWORK_TIMEOUT = Integer.valueOf(30000);
  public static final String SERVER_RESPONSE = "server_response";
  private static ExecutorService _executor;
  private static volatile boolean _executor_pred = true;
  private static volatile boolean getDefaultUserAgent_pred = true;
  private static volatile boolean getPlatform_pred;
  private static String platform = null;
  private static String userAgent;
  private final Channel _channel;
  private String _logTag;
  private ILogger _logger;
  
  static
  {
    getPlatform_pred = true;
    userAgent = null;
  }
  
  public URLLoader(ILogger paramILogger)
  {
    if (paramILogger == null) {
      throw new Error("Reference to logger cannot be NULL.");
    }
    _logger = paramILogger;
    _logTag = URLLoader.class.getSimpleName();
    _channel = new Channel("channel_url_loader", _logger);
  }
  
  private void _handleConnectionError(String paramString)
  {
    _logger.error(_logTag, paramString);
    _channel.trigger(new Event("error", new ErrorInfo("error", "Internal Error: " + paramString)));
  }
  
  /* Error */
  private String _inputStreamToString(java.io.InputStream paramInputStream)
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnonnull +5 -> 6
    //   4: aconst_null
    //   5: areturn
    //   6: new 95	java/lang/StringBuilder
    //   9: dup
    //   10: invokespecial 96	java/lang/StringBuilder:<init>	()V
    //   13: astore_2
    //   14: new 120	java/io/BufferedReader
    //   17: dup
    //   18: new 122	java/io/InputStreamReader
    //   21: dup
    //   22: aload_1
    //   23: ldc 124
    //   25: invokespecial 127	java/io/InputStreamReader:<init>	(Ljava/io/InputStream;Ljava/lang/String;)V
    //   28: invokespecial 130	java/io/BufferedReader:<init>	(Ljava/io/Reader;)V
    //   31: astore_1
    //   32: aload_1
    //   33: invokevirtual 133	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   36: astore_3
    //   37: aload_3
    //   38: ifnull +65 -> 103
    //   41: aload_2
    //   42: aload_3
    //   43: invokevirtual 102	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   46: pop
    //   47: goto -15 -> 32
    //   50: astore_3
    //   51: aload_1
    //   52: invokevirtual 136	java/io/BufferedReader:close	()V
    //   55: aload_3
    //   56: athrow
    //   57: astore_1
    //   58: aload_0
    //   59: getfield 66	com/adobe/primetime/core/URLLoader:_logger	Lcom/adobe/primetime/core/ILogger;
    //   62: aload_0
    //   63: getfield 74	com/adobe/primetime/core/URLLoader:_logTag	Ljava/lang/String;
    //   66: new 95	java/lang/StringBuilder
    //   69: dup
    //   70: invokespecial 96	java/lang/StringBuilder:<init>	()V
    //   73: ldc -118
    //   75: invokevirtual 102	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   78: aload_1
    //   79: invokevirtual 141	java/io/IOException:getLocalizedMessage	()Ljava/lang/String;
    //   82: invokevirtual 102	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   85: ldc -113
    //   87: invokevirtual 102	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   90: invokevirtual 105	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   93: invokeinterface 88 3 0
    //   98: aload_2
    //   99: invokevirtual 105	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   102: areturn
    //   103: aload_1
    //   104: invokevirtual 136	java/io/BufferedReader:close	()V
    //   107: goto -9 -> 98
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	110	0	this	URLLoader
    //   0	110	1	paramInputStream	java.io.InputStream
    //   13	86	2	localStringBuilder	StringBuilder
    //   36	7	3	str	String
    //   50	6	3	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   32	37	50	finally
    //   41	47	50	finally
    //   14	32	57	java/io/IOException
    //   51	57	57	java/io/IOException
    //   103	107	57	java/io/IOException
  }
  
  private HttpURLConnection _requestConnect(String paramString)
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
      _logger.error(_logTag, "#load() -  Exception opening URL(" + paramString.getLocalizedMessage() + ")");
    }
    return null;
  }
  
  private static String getAndroidVersion()
  {
    return Build.VERSION.RELEASE;
  }
  
  protected static String getDefaultUserAgent()
  {
    try
    {
      if (getDefaultUserAgent_pred)
      {
        userAgent = "Mozilla/5.0 (Linux; U; Android " + getAndroidVersion() + "; en-US" + "; " + getPlatform() + " Build/" + Build.ID + ")";
        getDefaultUserAgent_pred = false;
      }
      String str = userAgent;
      return str;
    }
    finally {}
  }
  
  private static ExecutorService getExecutor()
  {
    try
    {
      if (_executor_pred)
      {
        _executor = Executors.newSingleThreadExecutor();
        _executor_pred = false;
      }
      ExecutorService localExecutorService = _executor;
      return localExecutorService;
    }
    finally {}
  }
  
  protected static String getPlatform()
  {
    try
    {
      if (getPlatform_pred)
      {
        platform = Build.MODEL;
        getPlatform_pred = false;
      }
      String str = platform;
      return str;
    }
    finally {}
  }
  
  public void load(URLRequest paramURLRequest)
  {
    getExecutor().execute(new URLLoader.1(this, paramURLRequest));
  }
  
  public void on(String paramString, ICallback paramICallback)
  {
    _channel.on(paramString, paramICallback, this);
  }
  
  public static enum HttpMethod
  {
    GET,  POST;
  }
  
  public static class URLRequest
  {
    private final Map _data;
    private final URLLoader.HttpMethod _method;
    private final String _url;
    
    public URLRequest(String paramString, URLLoader.HttpMethod paramHttpMethod)
    {
      this(paramString, paramHttpMethod, null);
    }
    
    public URLRequest(String paramString, URLLoader.HttpMethod paramHttpMethod, Map paramMap)
    {
      _url = paramString;
      _method = paramHttpMethod;
      _data = paramMap;
    }
    
    public URLLoader.HttpMethod getMethod()
    {
      return _method;
    }
    
    public String getUrl()
    {
      return _url;
    }
    
    public String getUrlEncodedData()
    {
      if (_data == null) {
        return "";
      }
      Object localObject1 = _data.entrySet().iterator();
      Object localObject2;
      String str2;
      for (String str1 = ""; ((Iterator)localObject1).hasNext(); str1 = str1 + str2 + "=" + (String)localObject2 + "&")
      {
        localObject2 = (Map.Entry)((Iterator)localObject1).next();
        str2 = (String)((Map.Entry)localObject2).getKey();
        localObject2 = (String)((Map.Entry)localObject2).getValue();
      }
      localObject1 = str1;
      if (str1.length() > 0) {
        localObject1 = str1.substring(0, str1.length() - 1);
      }
      return (String)localObject1;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.core.URLLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */