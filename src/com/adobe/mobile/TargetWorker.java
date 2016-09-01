package com.adobe.mobile;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.FutureTask;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.CookieStore;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.cookie.Cookie;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;

final class TargetWorker
{
  protected static final String COOKIE_EXPIRES_KEY_SUFFIX = "_Expires";
  protected static final String COOKIE_NAME_PCID = "mboxPC";
  protected static final String COOKIE_NAME_SESSION = "mboxSession";
  protected static final String COOKIE_VALUE_KEY_SUFFIX = "_Value";
  protected static final String LOCATION_CONTENT_TYPE = "text%2Fplain%3Bcharset%3Dutf-8";
  protected static final String LOCATION_SERVER_PREFIX = "http://";
  protected static final String LOCATION_SERVER_SUFFIX = ".tt.omtrdc.net";
  protected static final String LOCATION_SESSION_STRING = "&mboxSession=%s&mboxPC=%s&mboxXDomain=disabled";
  private static final String OFFER_ENCODING = "UTF-8";
  private static final int TARGET_SOCKET_TIMEOUT = 2;
  private static final int TO_MILLI = 1000;
  private static final Object _cookieMutex = new Object();
  private static String _cookies;
  private static final Object _parameterMutex = new Object();
  private static String _pcId;
  private static final Object _pcIdMutex;
  private static HashMap _persistentParameters;
  private static String _serverURL = null;
  private static final Object _serverURLMutex = new Object();
  private static String _sessionId;
  private static final Object _sessionIdMutex = new Object();
  
  static
  {
    _pcIdMutex = new Object();
  }
  
  protected static void addPersistentParameter(String paramString1, String paramString2)
  {
    if ((paramString1 == null) || (paramString2 == null)) {
      return;
    }
    synchronized (_parameterMutex)
    {
      if (_persistentParameters == null) {
        _persistentParameters = new HashMap();
      }
      _persistentParameters.put(paramString1, paramString2);
      return;
    }
  }
  
  protected static void clearCookies()
  {
    synchronized (_cookieMutex)
    {
      _cookies = null;
      deleteCookie("mboxSession");
      deleteCookie("mboxPC");
      return;
    }
  }
  
  private static void deleteCookie(String paramString)
  {
    if (paramString.equals("mboxSession")) {
      synchronized (_sessionIdMutex)
      {
        _sessionId = null;
      }
    }
    for (;;)
    {
      try
      {
        ??? = StaticMethods.getSharedPreferencesEditor();
        ((SharedPreferences.Editor)???).remove(paramString + "_Value");
        ((SharedPreferences.Editor)???).remove(paramString + "_Expires");
        ((SharedPreferences.Editor)???).commit();
        return;
      }
      catch (StaticMethods.NullContextException paramString)
      {
        StaticMethods.logErrorFormat("Target - Error persisting cookies (%s)", new Object[] { paramString.getMessage() });
      }
      paramString = finally;
      throw paramString;
      if (paramString.equals("mboxPC")) {
        synchronized (_pcIdMutex)
        {
          _pcId = null;
        }
      }
    }
  }
  
  private static String getParamsString(Map paramMap)
  {
    if ((paramMap == null) || (paramMap.size() == 0)) {
      return "";
    }
    StringBuilder localStringBuilder = new StringBuilder();
    paramMap = paramMap.entrySet().iterator();
    while (paramMap.hasNext())
    {
      Object localObject = (Map.Entry)paramMap.next();
      String str = (String)((Map.Entry)localObject).getKey();
      localObject = ((Map.Entry)localObject).getValue();
      if ((str != null) && (str.length() > 0) && (localObject != null) && (localObject.toString().length() > 0))
      {
        localStringBuilder.append("&");
        localStringBuilder.append(StaticMethods.URLEncode(str));
        localStringBuilder.append("=");
        localStringBuilder.append(StaticMethods.URLEncode(localObject.toString()));
      }
    }
    return localStringBuilder.toString();
  }
  
  protected static String getPcID()
  {
    synchronized (_pcIdMutex)
    {
      String str = _pcId;
      return str;
    }
  }
  
  private static String getServerURL(String paramString)
  {
    for (;;)
    {
      synchronized (_serverURLMutex)
      {
        if (_serverURL == null)
        {
          StringBuilder localStringBuilder = new StringBuilder();
          if (MobileConfig.getInstance().getSSL())
          {
            str = "https://";
            _serverURL = str + paramString + ".tt.omtrdc.net";
          }
        }
        else
        {
          paramString = _serverURL;
          return paramString;
        }
      }
      String str = "http://";
    }
  }
  
  protected static String getSessionID()
  {
    synchronized (_sessionIdMutex)
    {
      String str = _sessionId;
      return str;
    }
  }
  
  private static String getSessionString()
  {
    String str1;
    synchronized (_pcIdMutex)
    {
      str1 = _pcId;
    }
    synchronized (_sessionIdMutex)
    {
      String str2 = _sessionId;
      if ((str2 != null) && (str2.trim().length() > 0) && (str1 != null) && (str1.trim().length() > 0))
      {
        return String.format("&mboxSession=%s&mboxPC=%s&mboxXDomain=disabled", new Object[] { str2, str1 });
        localObject1 = finally;
        throw ((Throwable)localObject1);
      }
    }
    return "";
  }
  
  private static String getURLRequestString(String paramString, Map paramMap)
  {
    if ((paramString == null) || (paramString.length() <= 0) || (!MobileConfig.getInstance().mobileUsingTarget())) {
      return null;
    }
    String str2;
    synchronized (_parameterMutex)
    {
      str2 = getParamsString(_persistentParameters);
      ??? = new FutureTask(new TargetWorker.1());
      StaticMethods.getAnalyticsExecutor().execute((Runnable)???);
    }
    try
    {
      ??? = (HashMap)((FutureTask)???).get();
      StringBuilder localStringBuilder = new StringBuilder().append(getServerURL(MobileConfig.getInstance().getClientCode())).append("/m2/").append(MobileConfig.getInstance().getClientCode()).append("/ubox/raw?mboxContentType=").append("text%2Fplain%3Bcharset%3Dutf-8").append("&t=").append(StaticMethods.getTimeSince1970()).append(getSessionString()).append("&mboxDefault=none&mbox=").append(paramString);
      if (MobileConfig.getInstance().getVisitorIdServiceEnabled())
      {
        str1 = VisitorIDService.sharedInstance().getTargetParameterString();
        paramMap = str1 + getParamsString(paramMap) + getParamsString((Map)???) + str2;
        StaticMethods.logDebugFormat("Target - LocationRequest (%s) loading URL: %s", new Object[] { paramString, paramMap });
        return paramMap;
        paramString = finally;
        throw paramString;
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        StaticMethods.logDebugFormat("Target - Unable to get lifecycle data (%s)", new Object[] { localException.getMessage() });
        Object localObject2 = null;
        continue;
        String str1 = "";
      }
    }
  }
  
  private static void loadCookie(String paramString)
  {
    try
    {
      long l = StaticMethods.getSharedPreferences().getLong(paramString + "_Expires", 0L);
      if ((l > 0L) && (l > System.currentTimeMillis()))
      {
        String str = StaticMethods.getSharedPreferences().getString(paramString + "_Value", "");
        synchronized (_cookieMutex)
        {
          if (_cookies != null)
          {
            localStringBuilder = new StringBuilder(_cookies);
            localStringBuilder.append("; ");
            localStringBuilder.append(paramString);
            localStringBuilder.append("=");
            localStringBuilder.append(str);
            _cookies = localStringBuilder.toString();
            return;
          }
          StringBuilder localStringBuilder = new StringBuilder();
        }
      }
      deleteCookie(paramString);
    }
    catch (StaticMethods.NullContextException paramString)
    {
      StaticMethods.logErrorFormat("Target - Error loading cookie data (%s)", new Object[] { paramString.getMessage() });
      return;
    }
  }
  
  protected static void loadCookies()
  {
    synchronized (_cookieMutex)
    {
      _cookies = null;
      loadCookie("mboxPC");
      loadCookie("mboxSession");
      return;
    }
  }
  
  protected static void loadRequest(TargetLocationRequest paramTargetLocationRequest, Target.TargetCallback paramTargetCallback)
  {
    if (paramTargetLocationRequest == null)
    {
      StaticMethods.logWarningFormat("Target - LocationRequest parameter is null", new Object[0]);
      if (paramTargetCallback != null) {
        paramTargetCallback.call(null);
      }
      return;
    }
    new Thread(new SendRequestTask(paramTargetLocationRequest, paramTargetCallback, null)).start();
  }
  
  protected static void removePersistentParameter(String paramString)
  {
    if (paramString == null) {
      return;
    }
    synchronized (_parameterMutex)
    {
      if (_persistentParameters != null) {
        _persistentParameters.remove(paramString);
      }
      return;
    }
  }
  
  private static void saveCookies(CookieStore paramCookieStore)
  {
    paramCookieStore = paramCookieStore.getCookies().iterator();
    while (paramCookieStore.hasNext())
    {
      Cookie localCookie = (Cookie)paramCookieStore.next();
      String str = localCookie.getName();
      if (str.equals("mboxSession")) {
        synchronized (_sessionIdMutex)
        {
          _sessionId = localCookie.getValue();
          storeCookie(str, localCookie);
        }
      }
      if (str.equals("mboxPC")) {
        synchronized (_pcIdMutex)
        {
          _pcId = localCookie.getValue();
          storeCookie(str, localCookie);
        }
      }
    }
  }
  
  private static void storeCookie(String paramString, Cookie paramCookie)
  {
    try
    {
      SharedPreferences.Editor localEditor = StaticMethods.getSharedPreferencesEditor();
      localEditor.putString(paramString + "_Value", paramCookie.getValue());
      localEditor.putLong(paramString + "_Expires", paramCookie.getExpiryDate().getTime());
      localEditor.commit();
      return;
    }
    catch (StaticMethods.NullContextException paramString)
    {
      StaticMethods.logErrorFormat("Target - Error persisting cookie (%s)", new Object[] { paramString.getMessage() });
    }
  }
  
  protected static class SendRequestTask
    implements Runnable
  {
    private Target.TargetCallback callback;
    private BigDecimal lifetimeValue;
    private TargetLocationRequest request;
    
    private SendRequestTask(TargetLocationRequest paramTargetLocationRequest, Target.TargetCallback paramTargetCallback)
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
      ??? = TargetWorker.getURLRequestString(request.name, request.parameters);
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
                synchronized (TargetWorker._cookieMutex)
                {
                  if (TargetWorker._cookies != null) {
                    localHttpGet.setHeader("Cookie", TargetWorker._cookies);
                  }
                  ??? = ((DefaultHttpClient)localObject2).execute(localHttpGet);
                  TargetWorker.saveCookies(((DefaultHttpClient)localObject2).getCookieStore());
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
}

/* Location:
 * Qualified Name:     com.adobe.mobile.TargetWorker
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */