package com.auditude.ads.util.http;

import android.content.Context;
import com.auditude.ads.core.AdSettings;
import com.auditude.ads.core.AuditudeEnv;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import org.apache.http.client.CookieStore;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;

public class ConnectionManager
{
  public static final int MAX_CONNECTIONS = 10;
  private static ConnectionManager instance;
  private ArrayList active = new ArrayList();
  private HashMap httpContextList = new HashMap();
  private ArrayList queue = new ArrayList();
  
  public static ConnectionManager getInstance()
  {
    if (instance == null) {
      instance = new ConnectionManager();
    }
    return instance;
  }
  
  private void startNext()
  {
    try
    {
      if (!queue.isEmpty())
      {
        Runnable localRunnable = (Runnable)queue.get(0);
        queue.remove(0);
        active.add(localRunnable);
        new Thread(localRunnable).start();
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void didComplete(Runnable paramRunnable)
  {
    active.remove(paramRunnable);
    startNext();
  }
  
  public HttpContext getLocalContext(String paramString)
  {
    BasicHttpContext localBasicHttpContext;
    if (!httpContextList.containsKey(paramString))
    {
      localBasicHttpContext = new BasicHttpContext();
      Context localContext = (Context)AuditudeEnv.getInstance().getAdSettings().getProperty("applicationContext");
      if (localContext == null) {
        break label102;
      }
      localBasicHttpContext.setAttribute("http.cookie-store", new PersistentCookieStore(localContext));
    }
    for (;;)
    {
      httpContextList.put(paramString, localBasicHttpContext);
      paramString = (HttpContext)httpContextList.get(paramString);
      ((CookieStore)paramString.getAttribute("http.cookie-store")).clearExpired(new Date());
      return paramString;
      label102:
      localBasicHttpContext.setAttribute("http.cookie-store", new BasicCookieStore());
    }
  }
  
  public void push(Runnable paramRunnable)
  {
    queue.add(paramRunnable);
    if (active.size() < 10) {
      startNext();
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.http.ConnectionManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */