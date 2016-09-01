package com.adobe.mobile;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.FutureTask;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

final class AudienceManagerWorker
{
  private static final String AUDIENCE_MANAGER_CUSTOMER_DATA_PREFIX = "c_";
  private static final String AUDIENCE_MANAGER_DATA_PROVIDER_ID_KEY = "d_dpid";
  private static final String AUDIENCE_MANAGER_DATA_PROVIDER_USER_ID_KEY = "d_dpuuid";
  private static final String AUDIENCE_MANAGER_JSON_COOKIE_NAME_KEY = "cn";
  private static final String AUDIENCE_MANAGER_JSON_COOKIE_VALUE_KEY = "cv";
  private static final String AUDIENCE_MANAGER_JSON_DESTS_KEY = "dests";
  private static final String AUDIENCE_MANAGER_JSON_STUFF_KEY = "stuff";
  private static final String AUDIENCE_MANAGER_JSON_URL_KEY = "c";
  private static final String AUDIENCE_MANAGER_JSON_USER_ID_KEY = "uuid";
  private static final String AUDIENCE_MANAGER_SHARED_PREFS_PROFILE_KEY = "AAMUserProfile";
  private static final String AUDIENCE_MANAGER_SHARED_PREFS_USER_ID_KEY = "AAMUserId";
  private static final String AUDIENCE_MANAGER_URL_PREFIX = "http://%s/event?";
  private static final String AUDIENCE_MANAGER_URL_SUFFIX = "&d_ptfm=android&d_dst=1&d_rtbd=json";
  private static final String AUDIENCE_MANAGER_USER_ID_KEY = "d_uuid";
  private static volatile boolean UrlPrefix_pred = true;
  private static volatile boolean VisitorProfile_pred;
  private static String _dpid = null;
  private static String _dpuuid = null;
  private static String _urlPrefix;
  private static HashMap _visitorProfile = null;
  
  static
  {
    VisitorProfile_pred = true;
    _urlPrefix = null;
  }
  
  private static String BuildSchemaRequest(Map paramMap)
  {
    if (GetUrlPrefix() == null) {
      return null;
    }
    return (GetUrlPrefix() + GetCustomUrlVariables(paramMap) + GetDataProviderUrlVariables() + "&d_ptfm=android&d_dst=1&d_rtbd=json").replace("?&", "?");
  }
  
  private static String GetCustomUrlVariables(Map paramMap)
  {
    if ((paramMap == null) || (paramMap.size() <= 0)) {
      return "";
    }
    StringBuilder localStringBuilder = new StringBuilder(1024);
    paramMap = paramMap.entrySet().iterator();
    while (paramMap.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramMap.next();
      String str = (String)localEntry.getKey();
      Object localObject = localEntry.getValue();
      if ((str != null) && (str.length() > 0) && (localObject != null) && (localObject.toString().length() > 0) && (localEntry.getValue().getClass() == String.class)) {
        localStringBuilder.append("&").append("c_").append(StaticMethods.URLEncode(SanitizeUrlVariableName(str))).append("=").append(StaticMethods.URLEncode(localObject.toString()));
      }
    }
    return localStringBuilder.toString();
  }
  
  private static String GetDataProviderUrlVariables()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    if (MobileConfig.getInstance().getVisitorIdServiceEnabled()) {
      localStringBuilder.append(VisitorIDService.sharedInstance().getAAMParameterString());
    }
    if (GetUUID() != null) {
      localStringBuilder.append("&").append("d_uuid").append("=").append(GetUUID());
    }
    if ((_dpid != null) && (_dpid.length() > 0) && (_dpuuid != null) && (_dpuuid.length() > 0)) {
      localStringBuilder.append("&").append("d_dpid").append("=").append(_dpid).append("&").append("d_dpuuid").append("=").append(_dpuuid);
    }
    return localStringBuilder.toString();
  }
  
  public static String GetDpid()
  {
    Object localObject = new FutureTask(new AudienceManagerWorker.3());
    StaticMethods.getAudienceExecutor().execute((Runnable)localObject);
    try
    {
      localObject = (String)((FutureTask)localObject).get();
      return (String)localObject;
    }
    catch (Exception localException)
    {
      StaticMethods.logErrorFormat("Audience Manager - Unable to get Dpid (%s)", new Object[] { localException.getMessage() });
    }
    return null;
  }
  
  public static String GetDpuuid()
  {
    Object localObject = new FutureTask(new AudienceManagerWorker.2());
    StaticMethods.getAudienceExecutor().execute((Runnable)localObject);
    try
    {
      localObject = (String)((FutureTask)localObject).get();
      return (String)localObject;
    }
    catch (Exception localException)
    {
      StaticMethods.logErrorFormat("Audience Manager - Unable to get Dpid (%s)", new Object[] { localException.getMessage() });
    }
    return null;
  }
  
  private static String GetUUID()
  {
    try
    {
      String str = StaticMethods.getSharedPreferences().getString("AAMUserId", null);
      return str;
    }
    catch (StaticMethods.NullContextException localNullContextException)
    {
      StaticMethods.logErrorFormat("Audience Manager - Error getting uuid from shared preferences (%s).", new Object[] { localNullContextException.getMessage() });
    }
    return null;
  }
  
  private static String GetUrlPrefix()
  {
    if ((UrlPrefix_pred) && (MobileConfig.getInstance().mobileUsingAudienceManager()))
    {
      UrlPrefix_pred = false;
      _urlPrefix = String.format("http://%s/event?", new Object[] { MobileConfig.getInstance().getAamServer() });
    }
    return _urlPrefix;
  }
  
  public static HashMap GetVisitorProfile()
  {
    Object localObject = new FutureTask(new AudienceManagerWorker.1());
    StaticMethods.getAudienceExecutor().execute((Runnable)localObject);
    try
    {
      localObject = (HashMap)((FutureTask)localObject).get();
      return (HashMap)localObject;
    }
    catch (Exception localException)
    {
      StaticMethods.logErrorFormat("Audience Manager - Unable to retrieve Visitor Profile", new Object[] { localException.getMessage() });
    }
    return null;
  }
  
  private static void ProcessDestsArray(JSONObject paramJSONObject)
  {
    try
    {
      paramJSONObject = paramJSONObject.getJSONArray("dests");
      int i = 0;
      while (i < paramJSONObject.length())
      {
        String str = paramJSONObject.getJSONObject(i).getString("c");
        if ((str != null) && (str.length() > 0)) {
          RequestHandler.sendGenericRequest(str, null, 5000, "Audience Manager");
        }
        i += 1;
      }
      return;
    }
    catch (JSONException paramJSONObject)
    {
      StaticMethods.logDebugFormat("Audience Manager - No destination in response (%s)", new Object[] { paramJSONObject.getLocalizedMessage() });
    }
  }
  
  private static HashMap ProcessStuffArray(JSONObject paramJSONObject)
  {
    localHashMap = new HashMap();
    try
    {
      paramJSONObject = paramJSONObject.getJSONArray("stuff");
      int i = 0;
      while (i < paramJSONObject.length())
      {
        JSONObject localJSONObject = paramJSONObject.getJSONObject(i);
        if (localJSONObject != null) {
          localHashMap.put(localJSONObject.getString("cn"), localJSONObject.getString("cv"));
        }
        i += 1;
      }
      return localHashMap;
    }
    catch (JSONException paramJSONObject)
    {
      StaticMethods.logDebugFormat("Audience Manager - No 'stuff' array in response (%s)", new Object[] { paramJSONObject.getLocalizedMessage() });
    }
  }
  
  public static void Reset()
  {
    StaticMethods.getAudienceExecutor().execute(new AudienceManagerWorker.5());
  }
  
  private static String SanitizeUrlVariableName(String paramString)
  {
    return paramString.replace(".", "_");
  }
  
  public static void SetDpidAndDpuuid(String paramString1, String paramString2)
  {
    StaticMethods.getAudienceExecutor().execute(new AudienceManagerWorker.4(paramString1, paramString2));
  }
  
  private static void SetUUID(String paramString)
  {
    try
    {
      SharedPreferences.Editor localEditor = StaticMethods.getSharedPreferencesEditor();
      if (paramString == null) {
        localEditor.remove("AAMUserId");
      }
      for (;;)
      {
        localEditor.commit();
        return;
        localEditor.putString("AAMUserId", paramString);
      }
      return;
    }
    catch (StaticMethods.NullContextException paramString)
    {
      StaticMethods.logErrorFormat("Audience Manager - Error updating uuid in shared preferences (%s)", new Object[] { paramString.getMessage() });
    }
  }
  
  private static void SetVisitorProfile(Map paramMap)
  {
    VisitorProfile_pred = false;
    try
    {
      SharedPreferences.Editor localEditor = StaticMethods.getSharedPreferencesEditor();
      if (paramMap != null) {
        localEditor.putString("AAMUserProfile", new JSONObject(paramMap).toString());
      }
      for (_visitorProfile = new HashMap(paramMap);; _visitorProfile = null)
      {
        localEditor.commit();
        return;
        localEditor.remove("AAMUserProfile");
      }
      return;
    }
    catch (StaticMethods.NullContextException paramMap)
    {
      StaticMethods.logErrorFormat("Audience Manager - Error updating visitor profile (%s)", new Object[] { paramMap.getMessage() });
    }
  }
  
  public static void SubmitSignal(Map paramMap, AudienceManager.AudienceManagerCallback paramAudienceManagerCallback)
  {
    StaticMethods.getAudienceExecutor().execute(new SubmitSignalTask(paramMap, paramAudienceManagerCallback));
  }
  
  public static class SubmitSignalTask
    implements Runnable
  {
    public final AudienceManager.AudienceManagerCallback callback;
    public final Map data;
    
    public SubmitSignalTask(Map paramMap, AudienceManager.AudienceManagerCallback paramAudienceManagerCallback)
    {
      data = paramMap;
      callback = paramAudienceManagerCallback;
    }
    
    public void run()
    {
      localHashMap = new HashMap();
      do
      {
        do
        {
          try
          {
            boolean bool = MobileConfig.getInstance().mobileUsingAudienceManager();
            if (!bool) {
              return;
            }
          }
          catch (IOException localIOException)
          {
            Object localObject3;
            StringBuilder localStringBuilder;
            StaticMethods.logWarningFormat("Audience Manager - Unable to read response from server (%s)", new Object[] { localIOException.getLocalizedMessage() });
            return;
            ((BufferedReader)localObject3).close();
            Object localObject1 = new JSONObject(localIOException.toString());
            AudienceManagerWorker.ProcessDestsArray((JSONObject)localObject1);
            AudienceManagerWorker.SetUUID(((JSONObject)localObject1).getString("uuid"));
            localObject1 = AudienceManagerWorker.ProcessStuffArray((JSONObject)localObject1);
            if (((HashMap)localObject1).size() > 0) {
              break label383;
            }
            StaticMethods.logWarningFormat("Audience Manager - response was empty", new Object[0]);
            return;
            StaticMethods.logDebugFormat("Audience Manager - response (%s)", new Object[] { localObject1 });
            AudienceManagerWorker.SetVisitorProfile((Map)localObject1);
            localHashMap.putAll((Map)localObject1);
            return;
          }
          catch (JSONException localJSONException)
          {
            StaticMethods.logWarningFormat("Audience Manager - Unable to parse JSON data (%s)", new Object[] { localJSONException.getLocalizedMessage() });
            return;
          }
          catch (Exception localException)
          {
            StaticMethods.logWarningFormat("Audience Manager - Unexpected error parsing result (%s)", new Object[] { localException.getLocalizedMessage() });
            return;
          }
          finally
          {
            if (callback == null) {
              break label547;
            }
            new Thread(new AudienceManagerWorker.SubmitSignalTask.1(this, localHashMap)).start();
          }
          if (MobileConfig.getInstance().getPrivacyStatus() != MobilePrivacyStatus.MOBILE_PRIVACY_STATUS_OPT_OUT) {
            break;
          }
          StaticMethods.logDebugFormat("Audience Manager - Privacy status is set to opt out, no signals will be submitted.", new Object[0]);
        } while (callback == null);
        new Thread(new AudienceManagerWorker.SubmitSignalTask.1(this, localHashMap)).start();
        return;
        localObject3 = AudienceManagerWorker.BuildSchemaRequest(data);
        if (((String)localObject3).length() > 1) {
          break;
        }
        StaticMethods.logWarningFormat("Audience Manager - Unable to create URL object", new Object[0]);
      } while (callback == null);
      new Thread(new AudienceManagerWorker.SubmitSignalTask.1(this, localHashMap)).start();
      return;
      StaticMethods.logDebugFormat("Audience Manager - request (%s)", new Object[] { localObject3 });
      localStringBuilder = new StringBuilder();
      localObject3 = new DefaultHttpClient().execute(new HttpGet((String)localObject3));
      if (((HttpResponse)localObject3).getStatusLine().getStatusCode() == 200)
      {
        localObject3 = new BufferedReader(new InputStreamReader(((HttpResponse)localObject3).getEntity().getContent(), "UTF-8"));
        for (;;)
        {
          String str = ((BufferedReader)localObject3).readLine();
          if (str == null) {
            break;
          }
          localStringBuilder.append(str);
        }
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.AudienceManagerWorker
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */