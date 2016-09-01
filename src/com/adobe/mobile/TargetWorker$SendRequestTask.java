package com.adobe.mobile;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;

public class TargetWorker$SendRequestTask
  implements Runnable
{
  private Target.TargetCallback callback;
  private BigDecimal lifetimeValue;
  private TargetLocationRequest request;
  
  private TargetWorker$SendRequestTask(TargetLocationRequest paramTargetLocationRequest, Target.TargetCallback paramTargetCallback)
  {
    request = paramTargetLocationRequest;
    callback = paramTargetCallback;
    lifetimeValue = AnalyticsTrackLifetimeValueIncrease.getLifetimeValue();
  }
  
  public void run()
  {
    if (lifetimeValue != null) {
      TargetWorker.addPersistentParameter("a.ltv.amount", lifetimeValue.toString());
    }
    ??? = TargetWorker.access$100(request.name, request.parameters);
    if ((??? == null) || (((String)???).length() <= 0))
    {
      StaticMethods.logWarningFormat("Target - LocationRequest requires a name.", new Object[0]);
      if (callback != null) {
        callback.call(request.defaultContent);
      }
    }
    label383:
    do
    {
      do
      {
        String str;
        do
        {
          Object localObject2;
          for (;;)
          {
            return;
            try
            {
              StringBuilder localStringBuilder = new StringBuilder();
              localObject2 = new BasicHttpParams();
              HttpConnectionParams.setConnectionTimeout((HttpParams)localObject2, MobileConfig.getInstance().getDefaultLocationTimeout() * 1000);
              HttpConnectionParams.setSoTimeout((HttpParams)localObject2, 2000);
              localObject2 = new DefaultHttpClient((HttpParams)localObject2);
              HttpGet localHttpGet = new HttpGet((String)???);
              TargetWorker.loadCookies();
              if (callback == null) {}
            }
            catch (RuntimeException localRuntimeException)
            {
              synchronized (TargetWorker.access$200())
              {
                if (TargetWorker.access$300() != null) {
                  localHttpGet.setHeader("Cookie", TargetWorker.access$300());
                }
                ??? = ((DefaultHttpClient)localObject2).execute(localHttpGet);
                TargetWorker.access$400(((DefaultHttpClient)localObject2).getCookieStore());
                if (((HttpResponse)???).getStatusLine().getStatusCode() != 200) {
                  break label383;
                }
                localObject2 = new BufferedReader(new InputStreamReader(((HttpResponse)???).getEntity().getContent(), "UTF-8"));
                for (;;)
                {
                  ??? = ((BufferedReader)localObject2).readLine();
                  if (??? == null) {
                    break;
                  }
                  localStringBuilder.append((String)???);
                }
                localRuntimeException = localRuntimeException;
                throw localRuntimeException;
              }
            }
            catch (Exception localException)
            {
              StaticMethods.logWarningFormat("Target - Unable to create HttpURLConnection", new Object[0]);
            }
          }
          callback.call(request.defaultContent);
          return;
          ((BufferedReader)localObject2).close();
          str = localException.toString();
          if (str.length() <= 0) {
            break;
          }
          StaticMethods.logDebugFormat("Target - LocationRequest (%s) Result: %s", new Object[] { request.name, str });
        } while (callback == null);
        callback.call(str);
        return;
        StaticMethods.logWarningFormat("Target - LocationRequest (%s) response was empty", new Object[] { request.name });
      } while (callback == null);
      callback.call(request.defaultContent);
      return;
      StaticMethods.logWarningFormat("Target - No content found or user didn't qualify for campaign for LocationRequest (%s)", new Object[] { request.name });
    } while (callback == null);
    callback.call(request.defaultContent);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.TargetWorker.SendRequestTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */