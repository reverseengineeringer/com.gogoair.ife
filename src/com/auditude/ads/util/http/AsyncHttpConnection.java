package com.auditude.ads.util.http;

import android.graphics.BitmapFactory;
import android.os.Handler;
import android.os.Message;
import com.auditude.ads.core.AdSettings;
import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.util.StringUtil;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpHead;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.entity.BufferedHttpEntity;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;

public class AsyncHttpConnection
  implements Runnable
{
  private static final int BITMAP = 4;
  private static final int DELETE = 3;
  public static final int DID_ERROR = 1;
  public static final int DID_START = 0;
  public static final int DID_SUCCEED = 2;
  private static final int GET = 0;
  private static final int HEAD = 5;
  private static final int POST = 1;
  private static final int PUT = 2;
  private String data;
  private Handler handler;
  private HttpClient httpClient;
  private boolean isCanceled = false;
  private int method;
  private int timeout = 0;
  private String url;
  
  public AsyncHttpConnection()
  {
    this(new Handler());
  }
  
  public AsyncHttpConnection(Handler paramHandler)
  {
    handler = paramHandler;
  }
  
  private void processBitmapEntity(HttpEntity paramHttpEntity)
    throws IOException
  {
    if (isCanceled) {
      return;
    }
    paramHttpEntity = BitmapFactory.decodeStream(new BufferedHttpEntity(paramHttpEntity).getContent());
    handler.sendMessage(Message.obtain(handler, 2, paramHttpEntity));
  }
  
  private void processEntity(HttpEntity paramHttpEntity)
    throws IllegalStateException, IOException
  {
    if (isCanceled) {
      return;
    }
    paramHttpEntity = new BufferedReader(new InputStreamReader(paramHttpEntity.getContent()));
    StringBuffer localStringBuffer = new StringBuffer();
    for (;;)
    {
      String str = paramHttpEntity.readLine();
      if (str == null)
      {
        paramHttpEntity.close();
        paramHttpEntity = Message.obtain(handler, 2, localStringBuffer.toString());
        handler.sendMessage(paramHttpEntity);
        return;
      }
      localStringBuffer.append(str);
    }
  }
  
  public void bitmap(String paramString)
  {
    create(4, paramString, null);
  }
  
  public void bitmap(String paramString, int paramInt)
  {
    create(4, paramString, null, paramInt);
  }
  
  public void cancel()
  {
    isCanceled = true;
  }
  
  public void create(int paramInt, String paramString1, String paramString2)
  {
    create(paramInt, paramString1, paramString2, 0);
  }
  
  public void create(int paramInt1, String paramString1, String paramString2, int paramInt2)
  {
    isCanceled = false;
    method = paramInt1;
    url = paramString1;
    data = paramString2;
    timeout = paramInt2;
    ConnectionManager.getInstance().push(this);
  }
  
  public void delete(String paramString)
  {
    create(3, paramString, null);
  }
  
  public void get(String paramString)
  {
    create(0, paramString, null);
  }
  
  public void get(String paramString, int paramInt)
  {
    create(0, paramString, null, paramInt);
  }
  
  public void head(String paramString)
  {
    create(5, paramString, null);
  }
  
  public void head(String paramString, int paramInt)
  {
    create(5, paramString, null, paramInt);
  }
  
  public void post(String paramString1, String paramString2)
  {
    create(1, paramString1, paramString2);
  }
  
  public void post(String paramString1, String paramString2, int paramInt)
  {
    create(1, paramString1, paramString2, paramInt);
  }
  
  public void put(String paramString1, String paramString2)
  {
    create(2, paramString1, paramString2);
  }
  
  public void run()
  {
    handler.sendMessage(Message.obtain(handler, 0));
    BasicHttpParams localBasicHttpParams = new BasicHttpParams();
    HttpConnectionParams.setConnectionTimeout(localBasicHttpParams, timeout);
    HttpConnectionParams.setSoTimeout(localBasicHttpParams, timeout);
    String str = AuditudeEnv.getInstance().getAdSettings().getUserAgent();
    Object localObject1 = str;
    if (!StringUtil.isNotNullOrEmpty(str)) {
      localObject1 = System.getProperty("http.agent");
    }
    httpClient = new DefaultHttpClient(localBasicHttpParams);
    httpClient.getParams().setParameter("http.protocol.allow-circular-redirects", Boolean.valueOf(true));
    if (StringUtil.isNotNullOrEmpty((String)localObject1)) {
      httpClient.getParams().setParameter("http.useragent", localObject1);
    }
    localObject1 = null;
    try
    {
      switch (method)
      {
      case 0: 
      case 1: 
      case 2: 
      case 3: 
      case 4: 
        for (;;)
        {
          i = ((HttpResponse)localObject1).getStatusLine().getStatusCode();
          if (method != 5) {
            break label491;
          }
          if (i < 400) {
            break;
          }
          localObject1 = Message.obtain(handler, 2, "false");
          handler.sendMessage((Message)localObject1);
          ConnectionManager.getInstance().didComplete(this);
          return;
          localObject1 = httpClient.execute(new HttpGet(url), ConnectionManager.getInstance().getLocalContext(new URL(url).getHost()));
          continue;
          localObject1 = new HttpPost(url);
          ((HttpPost)localObject1).setEntity(new StringEntity(data));
          localObject1 = httpClient.execute((HttpUriRequest)localObject1, ConnectionManager.getInstance().getLocalContext(new URL(url).getHost()));
          continue;
          localObject1 = new HttpPut(url);
          ((HttpPut)localObject1).setEntity(new StringEntity(data));
          localObject1 = httpClient.execute((HttpUriRequest)localObject1);
          continue;
          localObject1 = httpClient.execute(new HttpDelete(url));
          continue;
          localObject1 = httpClient.execute(new HttpGet(url));
          processBitmapEntity(((HttpResponse)localObject1).getEntity());
        }
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        int i;
        handler.sendMessage(Message.obtain(handler, 1, localException));
        continue;
        Object localObject2 = httpClient.execute(new HttpHead(url));
        continue;
        localObject2 = Message.obtain(handler, 2, "true");
        continue;
        label491:
        if (i >= 400) {
          handler.sendMessage(Message.obtain(handler, 1));
        } else if (method < 4) {
          processEntity(((HttpResponse)localObject2).getEntity());
        }
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.http.AsyncHttpConnection
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */