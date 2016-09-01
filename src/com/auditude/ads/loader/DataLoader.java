package com.auditude.ads.loader;

import com.auditude.ads.util.StringUtil;
import com.auditude.ads.util.http.AsyncHttpConnection;
import com.auditude.ads.util.log.ILogger;
import com.auditude.ads.util.log.Log;

public class DataLoader
{
  private Throwable error;
  private AsyncHttpConnection httpClient;
  private DataLoaderListener listener;
  private String postParams;
  private String requestURL;
  
  private void notifyRequestFailed(Throwable paramThrowable)
  {
    if (listener != null) {
      listener.onRequestFailed(paramThrowable);
    }
  }
  
  public void cancel()
  {
    try
    {
      if (httpClient != null) {
        httpClient.cancel();
      }
      return;
    }
    catch (RuntimeException localRuntimeException) {}
  }
  
  public final Throwable getError()
  {
    return error;
  }
  
  public final void load(String paramString1, String paramString2, int paramInt)
  {
    load(paramString1, paramString2, paramInt, Boolean.valueOf(false));
  }
  
  public final void load(String paramString1, String paramString2, int paramInt, Boolean paramBoolean)
  {
    requestURL = paramString1;
    postParams = paramString2;
    Log.getLogger().info("Sending adserver request to: " + requestURL);
    httpClient = new AsyncHttpConnection(new DataLoader.1(this));
    if (StringUtil.isNullOrEmpty(postParams))
    {
      if (paramBoolean.booleanValue())
      {
        httpClient.head(requestURL, paramInt * 1000);
        return;
      }
      httpClient.get(requestURL, paramInt * 1000);
      return;
    }
    httpClient.post(requestURL, postParams, paramInt * 1000);
  }
  
  public void setDataLoaderListener(DataLoaderListener paramDataLoaderListener)
  {
    listener = paramDataLoaderListener;
  }
  
  public static abstract interface DataLoaderListener
  {
    public abstract void onRequestComplete(String paramString);
    
    public abstract void onRequestFailed(Throwable paramThrowable);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.loader.DataLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */