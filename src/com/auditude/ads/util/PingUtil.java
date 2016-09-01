package com.auditude.ads.util;

import com.auditude.ads.core.AdSettings;
import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.util.log.ILogger;
import com.auditude.ads.util.log.Log;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import javax.net.ssl.HttpsURLConnection;
import org.apache.http.conn.ssl.StrictHostnameVerifier;

public final class PingUtil
{
  private static final String CATEGORY = "Ping";
  private static final Integer NETWORK_TIMEOUT = Integer.valueOf(10000);
  private static int POOL_NUM = 5;
  private static int REDIRECT_LIMIT = 5;
  private static ExecutorService _executor;
  private static volatile Boolean _executor_pred = Boolean.valueOf(true);
  
  private static HttpURLConnection _requestConnect(String paramString)
  {
    try
    {
      Object localObject = new URL(paramString);
      if (((URL)localObject).getProtocol().equals("https"))
      {
        localObject = (HttpsURLConnection)((URL)localObject).openConnection();
        ((HttpsURLConnection)localObject).setHostnameVerifier(new StrictHostnameVerifier());
        return (HttpURLConnection)localObject;
      }
      localObject = (HttpURLConnection)((URL)localObject).openConnection();
      return (HttpURLConnection)localObject;
    }
    catch (MalformedURLException localMalformedURLException)
    {
      Log.getLogger("Ping").info("Pinging Url: MalformedURL " + paramString);
      return null;
    }
    catch (Exception paramString)
    {
      for (;;)
      {
        Log.getLogger("Ping").info("Pinging Url: Exception opening url (" + paramString.getLocalizedMessage() + ")");
      }
    }
  }
  
  private static final String getAbsoluteUrl(String paramString1, String paramString2)
  {
    if (paramString2.length() > 0)
    {
      if (paramString2.toLowerCase().startsWith("http")) {
        return paramString2;
      }
      if (!paramString2.toLowerCase().startsWith("/")) {
        break label84;
      }
      try
      {
        paramString1 = new URL(paramString1);
        paramString1 = new URL(paramString1.getProtocol(), paramString1.getHost(), paramString1.getPort(), paramString2).toString();
        return paramString1;
      }
      catch (Exception paramString1)
      {
        Log.getLogger("Ping").info("Pinging Url: Exception when building redirect url.");
      }
    }
    for (;;)
    {
      return "";
      try
      {
        label84:
        URL localURL = new URL(paramString1);
        paramString1 = localURL.getPath();
        int i = paramString1.lastIndexOf("/");
        if (i < 0) {}
        for (paramString1 = "/";; paramString1 = paramString1.substring(0, i + 1)) {
          return new URL(localURL.getProtocol(), localURL.getHost(), localURL.getPort(), paramString1 + paramString2).toString();
        }
      }
      catch (Exception paramString1)
      {
        Log.getLogger("Ping").info("Pinging Url: Exception when building redirect url.");
      }
    }
  }
  
  private static ExecutorService getExecutor()
  {
    try
    {
      if (_executor_pred.booleanValue())
      {
        _executor = Executors.newFixedThreadPool(POOL_NUM);
        _executor_pred = Boolean.valueOf(false);
      }
      ExecutorService localExecutorService = _executor;
      return localExecutorService;
    }
    finally {}
  }
  
  public static final void pingUrl(String paramString)
  {
    pingUrl(paramString, 0);
  }
  
  public static final void pingUrl(String paramString, int paramInt)
  {
    String str2 = AuditudeEnv.getInstance().getAdSettings().getUserAgent();
    String str1 = str2;
    if (!StringUtil.isNotNullOrEmpty(str2)) {
      str1 = System.getProperty("http.agent");
    }
    pingUrlHttpURLConnection(paramString, str1, paramInt);
  }
  
  private static final void pingUrlHttpURLConnection(String paramString1, String paramString2, int paramInt)
  {
    if (paramInt < REDIRECT_LIMIT)
    {
      getExecutor().execute(new PingUtil.1(paramInt, paramString1, paramString2));
      return;
    }
    Log.getLogger("Ping").info("Too many redirects. Abandon Url: " + paramString1);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.PingUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */