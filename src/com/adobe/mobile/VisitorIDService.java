package com.adobe.mobile;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.FutureTask;
import org.json.JSONException;
import org.json.JSONObject;

final class VisitorIDService
{
  static final String ANALYTICS_PARAMETER_KEY_BLOB = "aamb";
  static final String ANALYTICS_PARAMETER_KEY_LOCATION_HINT = "aamlh";
  static final String ANALYTICS_PARAMETER_KEY_MID = "mid";
  static final String ANALYTICS_PARAMETER_KEY_ORG = "mcorgid";
  static final String CID_DELIMITER = "%01";
  static final String RESPONSE_KEY_BLOB = "d_blob";
  static final String RESPONSE_KEY_ERROR = "error_msg";
  static final String RESPONSE_KEY_HINT = "dcs_region";
  static final String RESPONSE_KEY_MID = "d_mid";
  static final String RESPONSE_KEY_TTL = "id_sync_ttl";
  static final String SERVER = "dpm.demdex.net";
  static final String TARGET_PARAMETER_KEY_AID = "mboxMCAVID";
  static final String TARGET_PARAMETER_KEY_BLOB = "mboxAAMB";
  static final String TARGET_PARAMETER_KEY_HINT = "mboxMCGLH";
  static final String TARGET_PARAMETER_KEY_MID = "mboxMCGVID";
  static final int TIMEOUT = 2000;
  private static VisitorIDService _instance = null;
  private static final Object _instanceMutex = new Object();
  private String _blob;
  private long _lastSync;
  private String _locationHint;
  private String _marketingCloudID;
  private long _ttl;
  private final Executor _visitorIDExector = Executors.newSingleThreadExecutor();
  
  protected VisitorIDService()
  {
    resetVariablesFromSharedPreferences();
    idSync(null);
  }
  
  private String _generateMID()
  {
    Object localObject = UUID.randomUUID();
    long l3 = ((UUID)localObject).getMostSignificantBits();
    long l2 = ((UUID)localObject).getLeastSignificantBits();
    localObject = Locale.US;
    long l1 = l3;
    if (l3 < 0L) {
      l1 = -l3;
    }
    if (l2 < 0L) {
      l2 = -l2;
    }
    for (;;)
    {
      return String.format((Locale)localObject, "%019d%019d", new Object[] { Long.valueOf(l1), Long.valueOf(l2) });
    }
  }
  
  public static VisitorIDService sharedInstance()
  {
    synchronized (_instanceMutex)
    {
      if (_instance == null) {
        _instance = new VisitorIDService();
      }
      VisitorIDService localVisitorIDService = _instance;
      return localVisitorIDService;
    }
  }
  
  protected final String getAAMParameterString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    FutureTask localFutureTask = new FutureTask(new VisitorIDService.6(this, localStringBuilder));
    _visitorIDExector.execute(localFutureTask);
    try
    {
      localFutureTask.get();
      return localStringBuilder.toString();
    }
    catch (Exception localException)
    {
      for (;;)
      {
        StaticMethods.logErrorFormat("ID Service - Unable to retrieve audience manager parameters from queue(%s)", new Object[] { localException.getLocalizedMessage() });
      }
    }
  }
  
  protected final String getAnalyticsIDRequestParameterString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    FutureTask localFutureTask = new FutureTask(new VisitorIDService.4(this, localStringBuilder));
    _visitorIDExector.execute(localFutureTask);
    try
    {
      localFutureTask.get();
      return localStringBuilder.toString();
    }
    catch (Exception localException)
    {
      for (;;)
      {
        StaticMethods.logErrorFormat("ID Service - Unable to retrieve analytics id parameters from queue(%s)", new Object[] { localException.getLocalizedMessage() });
      }
    }
  }
  
  protected final Map getAnalyticsParameters()
  {
    HashMap localHashMap = new HashMap();
    FutureTask localFutureTask = new FutureTask(new VisitorIDService.5(this, localHashMap));
    _visitorIDExector.execute(localFutureTask);
    try
    {
      localFutureTask.get();
      return localHashMap;
    }
    catch (Exception localException)
    {
      StaticMethods.logErrorFormat("ID Service - Unable to retrieve analytics parameters from queue(%s)", new Object[] { localException.getLocalizedMessage() });
    }
    return localHashMap;
  }
  
  protected final String getMarketingCloudID()
  {
    Object localObject = new FutureTask(new VisitorIDService.3(this));
    _visitorIDExector.execute((Runnable)localObject);
    try
    {
      localObject = (String)((FutureTask)localObject).get();
      return (String)localObject;
    }
    catch (Exception localException)
    {
      StaticMethods.logErrorFormat("ID Service - Unable to retrieve marketing cloud id from queue(%s)", new Object[] { localException.getLocalizedMessage() });
    }
    return null;
  }
  
  protected final String getTargetParameterString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    FutureTask localFutureTask = new FutureTask(new VisitorIDService.7(this, localStringBuilder));
    _visitorIDExector.execute(localFutureTask);
    try
    {
      localFutureTask.get();
      return localStringBuilder.toString();
    }
    catch (Exception localException)
    {
      for (;;)
      {
        StaticMethods.logErrorFormat("ID Service - Unable to retrieve target parameters from queue(%s)", new Object[] { localException.getLocalizedMessage() });
      }
    }
  }
  
  protected void idSync(Map paramMap)
  {
    if (paramMap != null) {}
    for (paramMap = new HashMap(paramMap);; paramMap = null)
    {
      _visitorIDExector.execute(new VisitorIDService.2(this, paramMap));
      return;
    }
  }
  
  protected final JSONObject parseResponse(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte == null) {
      return null;
    }
    try
    {
      paramArrayOfByte = new JSONObject(new String(paramArrayOfByte, "UTF-8"));
      return paramArrayOfByte;
    }
    catch (UnsupportedEncodingException paramArrayOfByte)
    {
      StaticMethods.logErrorFormat("ID Service - Unable to decode response(%s)", new Object[] { paramArrayOfByte.getLocalizedMessage() });
      return null;
    }
    catch (JSONException paramArrayOfByte)
    {
      StaticMethods.logDebugFormat("ID Service - Unable to parse response(%s)", new Object[] { paramArrayOfByte.getLocalizedMessage() });
    }
    return null;
  }
  
  protected void resetVariablesFromSharedPreferences()
  {
    _visitorIDExector.execute(new VisitorIDService.1(this));
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.VisitorIDService
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */