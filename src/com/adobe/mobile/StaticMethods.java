package com.adobe.mobile;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.os.Build.VERSION;
import android.telephony.TelephonyManager;
import android.util.DisplayMetrics;
import android.util.Log;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.lang.ref.WeakReference;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TimeZone;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONException;
import org.json.JSONObject;

final class StaticMethods
{
  private static final String AID_JSON_ID_KEY = "id";
  private static final String APPID_KEY = "a.AppID";
  private static final char[] BYTE_TO_HEX = "000102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F202122232425262728292A2B2C2D2E2F303132333435363738393A3B3C3D3E3F404142434445464748494A4B4C4D4E4F505152535455565758595A5B5C5D5E5F606162636465666768696A6B6C6D6E6F707172737475767778797A7B7C7D7E7F808182838485868788898A8B8C8D8E8F909192939495969798999A9B9C9D9E9FA0A1A2A3A4A5A6A7A8A9AAABACADAEAFB0B1B2B3B4B5B6B7B8B9BABBBCBDBEBFC0C1C2C3C4C5C6C7C8C9CACBCCCDCECFD0D1D2D3D4D5D6D7D8D9DADBDCDDDEDFE0E1E2E3E4E5E6E7E8E9EAEBECEDEEEFF0F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF".toCharArray();
  private static final String CARRIER_NAME_KEY = "a.CarrierName";
  private static final String DEVICE_NAME_KEY = "a.DeviceName";
  protected static final String HITS_DB_FILE_NAME = "ADBMobileDataCache.sqlite";
  protected static final String LAST_KNOWN_TIMESTAMP_KEY = "ADBLastKnownTimestampKey";
  protected static final String LIBRARY_VERSION = "4.5.3-AN";
  private static final String NO_ACTIVITY_MESSAGE = "Message - No Current Activity (Messages must have a reference to the current activity to work properly)";
  private static final String NO_CONTEXT_MESSAGE = "Config - No Application Context (Application context must be set prior to calling any library functions.)";
  private static final String NO_SHARED_PREFERENCES_EDITOR_MESSAGE = "Config - Unable to create an instance of a SharedPreferences Editor";
  private static final String NO_SHARED_PREFERENCES_MESSAGE = "Config - No SharedPreferences available";
  private static final String OS_VERSION_KEY = "a.OSVersion";
  private static final String RESOLUTION_KEY = "a.Resolution";
  private static final String RUN_MODE = "a.RunMode";
  private static final String RUN_MODE_APPLICATION = "Application";
  private static final String RUN_MODE_EXTENSION = "Extension";
  protected static final String TA_DB_FILE_NAME = "ADBMobileTimedActionsCache.sqlite";
  protected static final String TIME_SINCE_LAUNCH_KEY = "a.TimeSinceLaunch";
  private static WeakReference _activity;
  private static boolean _aidDone;
  private static final Object _aidMutex;
  private static final Object _analyticsExecutorMutex;
  private static Config.ApplicationType _appType;
  private static final Object _applicationIDMutex;
  private static final Object _applicationNameMutex;
  private static final Object _applicationVersionCodeMutex;
  private static final Object _applicationVersionMutex;
  private static final Object _audienceExecutorMutex;
  private static final Object _carrierMutex;
  static final Map _contextDataKeyWhiteList;
  static int _contextDataKeyWhiteListCount;
  private static final Object _currentActivityMutex;
  private static boolean _debugLogging;
  private static final Object _defaultDataMutex;
  private static boolean _isWearable;
  private static final Object _mediaExecutorMutex;
  private static final Object _messageImageCachingExecutorMutex;
  private static final Object _messagesExecutorMutex;
  private static final Object _operatingSystemMutex;
  private static final Object _resolutionMutex;
  private static final Object _sharedExecutorMutex;
  private static final Object _sharedPreferencesMutex;
  private static final Object _timedActionsExecutorMutex;
  private static final Object _timestampMutex;
  private static final Object _userAgentMutex;
  private static final Object _userIdentifierMutex;
  private static final Object _visitorIDMutex;
  private static String aid;
  private static ExecutorService analyticsExecutor;
  private static String appID;
  private static String appName;
  private static ExecutorService audienceExecutor;
  private static String carrier;
  private static final boolean[] contextDataMask;
  private static HashMap defaultData;
  private static final String[] encodedChars = { "%00", "%01", "%02", "%03", "%04", "%05", "%06", "%07", "%08", "%09", "%0A", "%0B", "%0C", "%0D", "%0E", "%0F", "%10", "%11", "%12", "%13", "%14", "%15", "%16", "%17", "%18", "%19", "%1A", "%1B", "%1C", "%1D", "%1E", "%1F", "%20", "%21", "%22", "%23", "%24", "%25", "%26", "%27", "%28", "%29", "*", "%2B", "%2C", "-", ".", "%2F", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "%3A", "%3B", "%3C", "%3D", "%3E", "%3F", "%40", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "%5B", "%5C", "%5D", "%5E", "_", "%60", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "%7B", "%7C", "%7D", "%7E", "%7F", "%80", "%81", "%82", "%83", "%84", "%85", "%86", "%87", "%88", "%89", "%8A", "%8B", "%8C", "%8D", "%8E", "%8F", "%90", "%91", "%92", "%93", "%94", "%95", "%96", "%97", "%98", "%99", "%9A", "%9B", "%9C", "%9D", "%9E", "%9F", "%A0", "%A1", "%A2", "%A3", "%A4", "%A5", "%A6", "%A7", "%A8", "%A9", "%AA", "%AB", "%AC", "%AD", "%AE", "%AF", "%B0", "%B1", "%B2", "%B3", "%B4", "%B5", "%B6", "%B7", "%B8", "%B9", "%BA", "%BB", "%BC", "%BD", "%BE", "%BF", "%C0", "%C1", "%C2", "%C3", "%C4", "%C5", "%C6", "%C7", "%C8", "%C9", "%CA", "%CB", "%CC", "%CD", "%CE", "%CF", "%D0", "%D1", "%D2", "%D3", "%D4", "%D5", "%D6", "%D7", "%D8", "%D9", "%DA", "%DB", "%DC", "%DD", "%DE", "%DF", "%E0", "%E1", "%E2", "%E3", "%E4", "%E5", "%E6", "%E7", "%E8", "%E9", "%EA", "%EB", "%EC", "%ED", "%EE", "%EF", "%F0", "%F1", "%F2", "%F3", "%F4", "%F5", "%F6", "%F7", "%F8", "%F9", "%FA", "%FB", "%FC", "%FD", "%FE", "%FF" };
  private static ExecutorService mediaExecutor;
  private static ExecutorService messageImageCachingExecutor;
  private static ExecutorService messagesExecutor;
  private static String operatingSystem;
  private static SharedPreferences prefs;
  private static String resolution;
  private static Context sharedContext;
  private static ExecutorService sharedExecutor;
  private static ExecutorService timedActionsExecutor;
  private static String timestamp;
  private static String userAgent;
  private static final boolean[] utf8Mask = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
  private static int versionCode;
  private static String versionName;
  private static String visitorID;
  
  static
  {
    contextDataMask = new boolean[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
    _appType = Config.ApplicationType.APPLICATION_TYPE_HANDHELD;
    _isWearable = false;
    prefs = null;
    _sharedPreferencesMutex = new Object();
    appID = null;
    _applicationIDMutex = new Object();
    appName = null;
    _applicationNameMutex = new Object();
    versionName = null;
    _applicationVersionMutex = new Object();
    versionCode = -1;
    _applicationVersionCodeMutex = new Object();
    visitorID = null;
    _visitorIDMutex = new Object();
    _userIdentifierMutex = new Object();
    userAgent = null;
    _userAgentMutex = new Object();
    defaultData = null;
    _defaultDataMutex = new Object();
    resolution = null;
    _resolutionMutex = new Object();
    carrier = null;
    _carrierMutex = new Object();
    operatingSystem = null;
    _operatingSystemMutex = new Object();
    timestamp = null;
    _timestampMutex = new Object();
    mediaExecutor = null;
    _mediaExecutorMutex = new Object();
    timedActionsExecutor = null;
    _timedActionsExecutorMutex = new Object();
    sharedExecutor = null;
    _sharedExecutorMutex = new Object();
    analyticsExecutor = null;
    _analyticsExecutorMutex = new Object();
    messagesExecutor = null;
    _messagesExecutorMutex = new Object();
    messageImageCachingExecutor = null;
    _messageImageCachingExecutorMutex = new Object();
    audienceExecutor = null;
    _audienceExecutorMutex = new Object();
    aid = null;
    _aidDone = false;
    _aidMutex = new Object();
    _contextDataKeyWhiteList = new HashMap(256);
    _contextDataKeyWhiteListCount = 0;
    sharedContext = null;
    _activity = null;
    _currentActivityMutex = new Object();
  }
  
  protected static String URLEncode(String paramString)
  {
    if (paramString == null) {
      paramString = null;
    }
    for (;;)
    {
      return paramString;
      try
      {
        byte[] arrayOfByte = paramString.getBytes("UTF-8");
        int k = arrayOfByte.length;
        int i = 0;
        while ((i < k) && (utf8Mask[(arrayOfByte[i] & 0xFF)] != 0)) {
          i += 1;
        }
        if (i != k)
        {
          paramString = new StringBuilder(arrayOfByte.length << 1);
          int j = i;
          if (i > 0)
          {
            paramString.append(new String(arrayOfByte, 0, i, "UTF-8"));
            j = i;
          }
          while (j < k)
          {
            paramString.append(encodedChars[(arrayOfByte[j] & 0xFF)]);
            j += 1;
          }
          paramString = paramString.toString();
          return paramString;
        }
      }
      catch (UnsupportedEncodingException paramString)
      {
        logWarningFormat("UnsupportedEncodingException : " + paramString.getMessage(), new Object[0]);
      }
    }
    return null;
  }
  
  private static void addValueToHashMap(Object paramObject, ContextData paramContextData, List paramList, int paramInt)
  {
    if ((paramContextData == null) || (paramList == null)) {}
    String str;
    ContextData localContextData;
    for (;;)
    {
      return;
      int i = paramList.size();
      if (paramInt < i) {}
      for (str = (String)paramList.get(paramInt); str != null; str = null)
      {
        localContextData = new ContextData();
        if (paramContextData.containsKey(str)) {
          localContextData = paramContextData.get(str);
        }
        if (i - 1 != paramInt) {
          break label95;
        }
        value = paramObject;
        paramContextData.put(str, localContextData);
        return;
      }
    }
    label95:
    paramContextData.put(str, localContextData);
    addValueToHashMap(paramObject, localContextData, paramList, paramInt + 1);
  }
  
  protected static Map cleanContextDataDictionary(Map paramMap)
  {
    if (paramMap == null) {
      return new HashMap();
    }
    HashMap localHashMap = new HashMap();
    paramMap = paramMap.entrySet().iterator();
    while (paramMap.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramMap.next();
      String str = cleanContextDataKey((String)localEntry.getKey());
      if (str != null) {
        localHashMap.put(str, localEntry.getValue());
      }
    }
    return localHashMap;
  }
  
  protected static String cleanContextDataKey(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    Object localObject2;
    synchronized (_contextDataKeyWhiteList)
    {
      localObject2 = (String)_contextDataKeyWhiteList.get(paramString);
      if (localObject2 != null) {
        return (String)localObject2;
      }
    }
    int i1;
    int k;
    int j;
    int n;
    try
    {
      ??? = paramString.getBytes("UTF-8");
      localObject2 = new byte[???.length];
      i1 = ???.length;
      k = 0;
      j = 0;
      n = 0;
    }
    catch (UnsupportedEncodingException paramString)
    {
      logErrorFormat("Analytics - Unable to clean context data key (%s)", new Object[] { paramString.getLocalizedMessage() });
      return null;
    }
    int m = j;
    int i;
    if (contextDataMask[(i & 0xFF)] != 0)
    {
      localObject2[j] = i;
      m = j + 1;
      n = i;
      break label234;
      localObject2 = new String((byte[])localObject2, k, j, "UTF-8");
      synchronized (_contextDataKeyWhiteList)
      {
        if (_contextDataKeyWhiteListCount > 250)
        {
          _contextDataKeyWhiteList.clear();
          _contextDataKeyWhiteListCount = 0;
        }
        _contextDataKeyWhiteList.put(paramString, localObject2);
        _contextDataKeyWhiteListCount += 1;
        return (String)localObject2;
      }
    }
    for (;;)
    {
      if (k >= i1) {
        break label244;
      }
      i = ???[k];
      if ((i != 46) || (n != 46)) {
        break;
      }
      m = j;
      label234:
      k += 1;
      j = m;
    }
    label244:
    if (j == 0) {
      return null;
    }
    if (localObject2[0] == 46)
    {
      k = 1;
      label261:
      if (localObject2[(j - 1)] != 46) {
        break label293;
      }
    }
    label293:
    for (m = 1;; m = 0)
    {
      j = j - m - k;
      if (j > 0) {
        break;
      }
      return null;
      k = 0;
      break label261;
    }
  }
  
  protected static String expandTokens(String paramString, Map paramMap)
  {
    try
    {
      localIterator = paramMap.entrySet().iterator();
    }
    catch (Exception paramMap)
    {
      try
      {
        Iterator localIterator;
        while (localIterator.hasNext())
        {
          paramMap = (Map.Entry)localIterator.next();
          paramMap = paramString.replace((CharSequence)paramMap.getKey(), (CharSequence)paramMap.getValue());
          paramString = paramMap;
        }
        return paramString;
      }
      catch (Exception paramMap)
      {
        for (;;) {}
      }
      paramMap = paramMap;
    }
    logDebugFormat("Unable to expand tokens (%s)", new Object[] { paramMap.toString() });
    return paramString;
  }
  
  private static String generateAID()
  {
    Object localObject2 = UUID.randomUUID().toString().replace("-", "").toUpperCase(Locale.US);
    Object localObject1 = Pattern.compile("^[89A-F]");
    Object localObject3 = Pattern.compile("^[4-9A-F]");
    localObject1 = ((Pattern)localObject1).matcher(((String)localObject2).substring(0, 16));
    localObject2 = ((Pattern)localObject3).matcher(((String)localObject2).substring(16, 32));
    localObject3 = new SecureRandom();
    localObject1 = ((Matcher)localObject1).replaceAll(String.valueOf(((SecureRandom)localObject3).nextInt(7)));
    localObject2 = ((Matcher)localObject2).replaceAll(String.valueOf(((SecureRandom)localObject3).nextInt(3)));
    return (String)localObject1 + "-" + (String)localObject2;
  }
  
  protected static String getAID()
  {
    synchronized (_aidMutex)
    {
      if (!_aidDone) {
        _aidDone = true;
      }
      try
      {
        boolean bool = getSharedPreferences().getBoolean("ADOBEMOBILE_STOREDDEFAULTS_IGNORE_AID", false);
        aid = getSharedPreferences().getString("ADOBEMOBILE_STOREDDEFAULTS_AID", null);
        if ((!bool) && (aid == null))
        {
          aid = retrieveAIDFromVisitorIDService();
          localEditor = getSharedPreferencesEditor();
          if (aid == null) {
            break label102;
          }
          localEditor.putString("ADOBEMOBILE_STOREDDEFAULTS_AID", aid);
          localEditor.commit();
          syncAIDIfNeeded(aid);
        }
      }
      catch (NullContextException localNullContextException)
      {
        for (;;)
        {
          SharedPreferences.Editor localEditor;
          label102:
          logErrorFormat("Config - Error getting AID. (%s)", new Object[] { localNullContextException.getMessage() });
        }
      }
      return aid;
      localEditor.putBoolean("ADOBEMOBILE_STOREDDEFAULTS_IGNORE_AID", true);
    }
  }
  
  protected static ExecutorService getAnalyticsExecutor()
  {
    synchronized (_analyticsExecutorMutex)
    {
      if (analyticsExecutor == null) {
        analyticsExecutor = Executors.newSingleThreadExecutor();
      }
      ExecutorService localExecutorService = analyticsExecutor;
      return localExecutorService;
    }
  }
  
  private static String getAndroidVersion()
  {
    return Build.VERSION.RELEASE;
  }
  
  protected static Config.ApplicationType getApplicaionType()
  {
    return _appType;
  }
  
  protected static String getApplicationID()
  {
    for (;;)
    {
      synchronized (_applicationIDMutex)
      {
        String str1;
        if (appID == null)
        {
          StringBuilder localStringBuilder = new StringBuilder();
          if (getApplicationName() != null)
          {
            str1 = getApplicationName();
            localStringBuilder = localStringBuilder.append(str1);
            if ((getApplicationVersion() == null) || (getApplicationVersion().length() <= 0)) {
              break label146;
            }
            str1 = " " + getApplicationVersion() + " ";
            localStringBuilder = localStringBuilder.append(str1);
            if (getApplicationVersionCode() == 0) {
              break label153;
            }
            str1 = String.format(Locale.US, "(%d)", new Object[] { Integer.valueOf(getApplicationVersionCode()) });
            appID = str1;
          }
        }
        else
        {
          str1 = appID;
          return str1;
        }
      }
      String str2 = "";
      continue;
      label146:
      str2 = "";
      continue;
      label153:
      str2 = "";
    }
  }
  
  private static String getApplicationName()
  {
    synchronized (_applicationNameMutex)
    {
      if (appName == null) {
        appName = "";
      }
      for (;;)
      {
        try
        {
          localObject1 = getSharedContext().getPackageManager();
          if (localObject1 == null) {
            continue;
          }
          ApplicationInfo localApplicationInfo = ((PackageManager)localObject1).getApplicationInfo(getSharedContext().getPackageName(), 0);
          if (localApplicationInfo == null) {
            continue;
          }
          if (((PackageManager)localObject1).getApplicationLabel(localApplicationInfo) == null) {
            continue;
          }
          localObject1 = (String)((PackageManager)localObject1).getApplicationLabel(localApplicationInfo);
          appName = (String)localObject1;
        }
        catch (PackageManager.NameNotFoundException localNameNotFoundException)
        {
          Object localObject1;
          logWarningFormat("Analytics - PackageManager couldn't find application name (%s)", new Object[] { localNameNotFoundException.toString() });
          appName = "";
          continue;
          localObject2 = finally;
          throw ((Throwable)localObject2);
          logWarningFormat("Analytics - PackageManager was null", new Object[0]);
          appName = "";
          continue;
        }
        catch (NullContextException localNullContextException)
        {
          logErrorFormat("Config - Unable to get package to pull application name. (%s)", new Object[] { localNullContextException.getMessage() });
          appName = "";
          continue;
        }
        localObject1 = appName;
        return (String)localObject1;
        localObject1 = "";
      }
      logWarningFormat("Analytics - ApplicationInfo was null", new Object[0]);
      appName = "";
    }
  }
  
  protected static String getApplicationVersion()
  {
    synchronized (_applicationVersionMutex)
    {
      if (versionName == null) {
        versionName = "";
      }
      for (;;)
      {
        try
        {
          localObject1 = getSharedContext().getPackageManager();
          if (localObject1 == null) {
            continue;
          }
          localObject1 = ((PackageManager)localObject1).getPackageInfo(getSharedContext().getPackageName(), 0);
          if (localObject1 == null) {
            continue;
          }
          if (versionName == null) {
            continue;
          }
          localObject1 = versionName;
          versionName = (String)localObject1;
        }
        catch (PackageManager.NameNotFoundException localNameNotFoundException)
        {
          Object localObject1;
          logWarningFormat("Analytics - PackageManager couldn't find application version (%s)", new Object[] { localNameNotFoundException.toString() });
          versionName = "";
          continue;
          localObject2 = finally;
          throw ((Throwable)localObject2);
          logWarningFormat("Analytics - PackageManager was null", new Object[0]);
          versionName = "";
          continue;
        }
        catch (NullContextException localNullContextException)
        {
          logErrorFormat("Config - Unable to get package to pull application version. (%s)", new Object[] { localNullContextException.getMessage() });
          versionName = "";
          continue;
        }
        localObject1 = versionName;
        return (String)localObject1;
        localObject1 = "";
      }
      logWarningFormat("Analytics - PackageInfo was null", new Object[0]);
      versionName = "";
    }
  }
  
  protected static int getApplicationVersionCode()
  {
    int i = 0;
    synchronized (_applicationVersionCodeMutex)
    {
      int j = versionCode;
      if (j == -1) {}
      try
      {
        Object localObject2 = getSharedContext().getPackageManager();
        if (localObject2 == null) {
          break label115;
        }
        localObject2 = ((PackageManager)localObject2).getPackageInfo(getSharedContext().getPackageName(), 0);
        if (localObject2 == null) {
          break label68;
        }
        if (versionCode > 0) {
          i = versionCode;
        }
        versionCode = i;
      }
      catch (PackageManager.NameNotFoundException localNameNotFoundException)
      {
        for (;;)
        {
          logWarningFormat("Analytics - PackageManager couldn't find application version code (%s)", new Object[] { localNameNotFoundException.toString() });
          versionCode = 0;
          continue;
          localObject3 = finally;
          throw ((Throwable)localObject3);
          logWarningFormat("Analytics - PackageManager was null", new Object[0]);
          versionCode = 0;
        }
      }
      catch (NullContextException localNullContextException)
      {
        for (;;)
        {
          logErrorFormat("Config - Unable to get package to pull application version code. (%s)", new Object[] { localNullContextException.getMessage() });
          versionCode = 0;
        }
      }
      i = versionCode;
      return i;
      label68:
      logWarningFormat("Analytics - PackageInfo was null", new Object[0]);
      versionCode = 0;
    }
  }
  
  protected static ExecutorService getAudienceExecutor()
  {
    synchronized (_audienceExecutorMutex)
    {
      if (audienceExecutor == null) {
        audienceExecutor = Executors.newSingleThreadExecutor();
      }
      ExecutorService localExecutorService = audienceExecutor;
      return localExecutorService;
    }
  }
  
  protected static File getCacheDirectory()
  {
    try
    {
      File localFile = getSharedContext().getCacheDir();
      return localFile;
    }
    catch (NullContextException localNullContextException)
    {
      logErrorFormat("Config - Error getting cache directory. (%s)", new Object[] { localNullContextException.getMessage() });
    }
    return null;
  }
  
  protected static String getCarrier()
  {
    synchronized (_carrierMutex)
    {
      String str = carrier;
      if (str == null) {}
      try
      {
        carrier = ((TelephonyManager)getSharedContext().getSystemService("phone")).getNetworkOperatorName();
        str = carrier;
        return str;
      }
      catch (NullContextException localNullContextException)
      {
        for (;;)
        {
          logErrorFormat("Config - Error getting device carrier. (%s)", new Object[] { localNullContextException.getMessage() });
        }
      }
    }
  }
  
  protected static Activity getCurrentActivity()
    throws StaticMethods.NullActivityException
  {
    Activity localActivity;
    synchronized (_currentActivityMutex)
    {
      if ((_activity == null) || (_activity.get() == null)) {
        throw new NullActivityException("Message - No Current Activity (Messages must have a reference to the current activity to work properly)");
      }
    }
    return localActivity;
  }
  
  protected static int getCurrentOrientation()
  {
    try
    {
      int i = getCurrentActivitygetResourcesgetConfigurationorientation;
      return i;
    }
    catch (NullActivityException localNullActivityException) {}
    return -1;
  }
  
  protected static boolean getDebugLogging()
  {
    return _debugLogging;
  }
  
  protected static String getDefaultAcceptLanguage()
  {
    Object localObject;
    do
    {
      do
      {
        try
        {
          Resources localResources = getSharedContext().getResources();
          if (localResources == null) {
            return null;
          }
        }
        catch (NullContextException localNullContextException)
        {
          logErrorFormat("Config - Error getting application resources for default accepted language. (%s)", new Object[] { localNullContextException.getMessage() });
          return null;
        }
        localObject = localNullContextException.getConfiguration();
      } while (localObject == null);
      localObject = locale;
    } while (localObject == null);
    return ((Locale)localObject).toString().replace('_', '-');
  }
  
  protected static HashMap getDefaultData()
  {
    for (;;)
    {
      synchronized (_defaultDataMutex)
      {
        Object localObject1;
        if (defaultData == null)
        {
          defaultData = new HashMap();
          defaultData.put("a.DeviceName", Build.MODEL);
          defaultData.put("a.Resolution", getResolution());
          defaultData.put("a.OSVersion", getOperatingSystem());
          defaultData.put("a.CarrierName", getCarrier());
          defaultData.put("a.AppID", getApplicationID());
          HashMap localHashMap = defaultData;
          if (isWearableApp())
          {
            localObject1 = "Extension";
            localHashMap.put("a.RunMode", localObject1);
          }
        }
        else
        {
          localObject1 = defaultData;
          return (HashMap)localObject1;
        }
      }
      String str = "Application";
    }
  }
  
  protected static String getDefaultUserAgent()
  {
    synchronized (_userAgentMutex)
    {
      if (userAgent == null) {
        userAgent = "Mozilla/5.0 (Linux; U; Android " + getAndroidVersion() + "; " + getDefaultAcceptLanguage() + "; " + Build.MODEL + " Build/" + Build.ID + ")";
      }
      String str = userAgent;
      return str;
    }
  }
  
  protected static String getHexString(String paramString)
  {
    int j = 0;
    if ((paramString == null) || (paramString.length() <= 0)) {
      return null;
    }
    try
    {
      paramString = paramString.getBytes("UTF-8");
      int k = paramString.length;
      char[] arrayOfChar = new char[k << 1];
      int i = 0;
      while (i < k)
      {
        int m = (paramString[i] & 0xFF) << 1;
        int n = j + 1;
        arrayOfChar[j] = BYTE_TO_HEX[m];
        j = n + 1;
        arrayOfChar[n] = BYTE_TO_HEX[(m + 1)];
        i += 1;
      }
      return new String(arrayOfChar);
    }
    catch (UnsupportedEncodingException paramString)
    {
      logDebugFormat("Failed to get hex from string (%s)", new Object[] { paramString.getMessage() });
      return null;
    }
  }
  
  protected static ExecutorService getMediaExecutor()
  {
    synchronized (_mediaExecutorMutex)
    {
      if (mediaExecutor == null) {
        mediaExecutor = Executors.newSingleThreadExecutor();
      }
      ExecutorService localExecutorService = mediaExecutor;
      return localExecutorService;
    }
  }
  
  protected static ExecutorService getMessageImageCachingExecutor()
  {
    synchronized (_messageImageCachingExecutorMutex)
    {
      if (messageImageCachingExecutor == null) {
        messageImageCachingExecutor = Executors.newSingleThreadExecutor();
      }
      ExecutorService localExecutorService = messageImageCachingExecutor;
      return localExecutorService;
    }
  }
  
  protected static ExecutorService getMessagesExecutor()
  {
    synchronized (_messagesExecutorMutex)
    {
      if (messagesExecutor == null) {
        messagesExecutor = Executors.newSingleThreadExecutor();
      }
      ExecutorService localExecutorService = messagesExecutor;
      return localExecutorService;
    }
  }
  
  protected static String getOperatingSystem()
  {
    synchronized (_operatingSystemMutex)
    {
      if (operatingSystem == null) {
        operatingSystem = "Android " + getAndroidVersion();
      }
      String str = operatingSystem;
      return str;
    }
  }
  
  protected static String getResolution()
  {
    synchronized (_resolutionMutex)
    {
      Object localObject2 = resolution;
      if (localObject2 == null) {}
      try
      {
        localObject2 = getSharedContext().getResources().getDisplayMetrics();
        resolution = widthPixels + "x" + heightPixels;
        localObject2 = resolution;
        return (String)localObject2;
      }
      catch (NullContextException localNullContextException)
      {
        for (;;)
        {
          logErrorFormat("Config - Error getting device resolution. (%s)", new Object[] { localNullContextException.getMessage() });
        }
      }
    }
  }
  
  protected static Context getSharedContext()
    throws StaticMethods.NullContextException
  {
    if (sharedContext == null) {
      throw new NullContextException("Config - No Application Context (Application context must be set prior to calling any library functions.)");
    }
    return sharedContext;
  }
  
  protected static ExecutorService getSharedExecutor()
  {
    synchronized (_sharedExecutorMutex)
    {
      if (sharedExecutor == null) {
        sharedExecutor = Executors.newSingleThreadExecutor();
      }
      ExecutorService localExecutorService = sharedExecutor;
      return localExecutorService;
    }
  }
  
  protected static SharedPreferences getSharedPreferences()
    throws StaticMethods.NullContextException
  {
    synchronized (_sharedPreferencesMutex)
    {
      if (prefs == null)
      {
        prefs = getSharedContext().getSharedPreferences("APP_MEASUREMENT_CACHE", 0);
        if (prefs == null) {
          logWarningFormat("Config - No SharedPreferences available", new Object[0]);
        }
      }
      if (prefs == null) {
        throw new NullContextException("Config - No SharedPreferences available");
      }
    }
    SharedPreferences localSharedPreferences = prefs;
    return localSharedPreferences;
  }
  
  protected static SharedPreferences.Editor getSharedPreferencesEditor()
    throws StaticMethods.NullContextException
  {
    SharedPreferences.Editor localEditor = getSharedPreferences().edit();
    if (localEditor == null) {
      throw new NullContextException("Config - Unable to create an instance of a SharedPreferences Editor");
    }
    return localEditor;
  }
  
  protected static long getTimeSince1970()
  {
    return System.currentTimeMillis() / 1000L;
  }
  
  protected static long getTimeSinceLaunch()
  {
    long l = Lifecycle.sessionStartTime;
    l = getTimeSince1970() - l;
    if (l < 604800L) {
      return l;
    }
    return 0L;
  }
  
  public static ExecutorService getTimedActionsExecutor()
  {
    synchronized (_timedActionsExecutorMutex)
    {
      if (timedActionsExecutor == null) {
        timedActionsExecutor = Executors.newSingleThreadExecutor();
      }
      ExecutorService localExecutorService = timedActionsExecutor;
      return localExecutorService;
    }
  }
  
  protected static String getTimestampString()
  {
    synchronized (_timestampMutex)
    {
      if (timestamp == null)
      {
        Object localObject4 = new Date();
        localObject2 = Calendar.getInstance();
        ((Calendar)localObject2).setTime((Date)localObject4);
        localObject4 = new StringBuilder().append("00/00/0000 00:00:00 0 ");
        TimeZone localTimeZone = ((Calendar)localObject2).getTimeZone();
        int i = ((Calendar)localObject2).get(1);
        int j = ((Calendar)localObject2).get(2);
        int k = ((Calendar)localObject2).get(5);
        int m = ((Calendar)localObject2).get(7);
        int n = ((Calendar)localObject2).get(11);
        int i1 = ((Calendar)localObject2).get(12);
        int i2 = ((Calendar)localObject2).get(13);
        timestamp = localTimeZone.getOffset(1, i, j, k, m, ((Calendar)localObject2).get(14) + ((n * 60 + i1) * 60 + i2) * 1000) / 60000 * -1;
      }
      Object localObject2 = timestamp;
      return (String)localObject2;
    }
  }
  
  protected static String getVisitorID()
  {
    synchronized (_visitorIDMutex)
    {
      String str = visitorID;
      if (str == null) {}
      try
      {
        visitorID = getSharedPreferences().getString("APP_MEASUREMENT_VISITOR_ID", null);
        str = visitorID;
        return str;
      }
      catch (NullContextException localNullContextException)
      {
        for (;;)
        {
          logErrorFormat("Config - Unable to pull visitorID from shared preferences. (%s)", new Object[] { localNullContextException.getMessage() });
        }
      }
    }
  }
  
  protected static String hexToString(String paramString)
  {
    if ((paramString == null) || (paramString.length() <= 0) || (paramString.length() % 2 != 0)) {
      return null;
    }
    int j = paramString.length();
    byte[] arrayOfByte = new byte[j / 2];
    int i = 0;
    while (i < j)
    {
      arrayOfByte[(i / 2)] = ((byte)((Character.digit(paramString.charAt(i), 16) << 4) + Character.digit(paramString.charAt(i + 1), 16)));
      i += 2;
    }
    try
    {
      paramString = new String(arrayOfByte, "UTF-8");
      return paramString;
    }
    catch (UnsupportedEncodingException paramString)
    {
      logDebugFormat("Failed to get string from hex (%s)", new Object[] { paramString.getMessage() });
    }
    return null;
  }
  
  protected static boolean isWearableApp()
  {
    return _isWearable;
  }
  
  protected static String join(Iterable paramIterable, String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    paramIterable = paramIterable.iterator();
    for (;;)
    {
      if (paramIterable.hasNext())
      {
        localStringBuilder.append(paramIterable.next());
        if (paramIterable.hasNext()) {}
      }
      else
      {
        return localStringBuilder.toString();
      }
      localStringBuilder.append(paramString);
    }
  }
  
  protected static void logDebugFormat(String paramString, Object... paramVarArgs)
  {
    if (getDebugLogging())
    {
      if ((paramVarArgs != null) && (paramVarArgs.length > 0)) {
        Log.d("ADBMobile", String.format("ADBMobile Debug : " + paramString, paramVarArgs));
      }
    }
    else {
      return;
    }
    Log.d("ADBMobile", "ADBMobile Debug : " + paramString);
  }
  
  protected static void logErrorFormat(String paramString, Object... paramVarArgs)
  {
    if ((paramVarArgs != null) && (paramVarArgs.length > 0))
    {
      Log.e("ADBMobile", String.format("ADBMobile Error : " + paramString, paramVarArgs));
      return;
    }
    Log.e("ADBMobile", "ADBMobile Error : " + paramString);
  }
  
  protected static void logWarningFormat(String paramString, Object... paramVarArgs)
  {
    if (getDebugLogging())
    {
      if ((paramVarArgs != null) && (paramVarArgs.length > 0)) {
        Log.w("ADBMobile", String.format("ADBMobile Warning : " + paramString, paramVarArgs));
      }
    }
    else {
      return;
    }
    Log.w("ADBMobile", "ADBMobile Warning : " + paramString);
  }
  
  protected static HashMap mapFromJson(JSONObject paramJSONObject)
  {
    if (paramJSONObject == null) {
      return null;
    }
    Iterator localIterator = paramJSONObject.keys();
    HashMap localHashMap = new HashMap();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      try
      {
        localHashMap.put(str, paramJSONObject.getString(str));
      }
      catch (JSONException localJSONException)
      {
        logWarningFormat("Problem parsing json data (%s)", new Object[] { localJSONException.getLocalizedMessage() });
      }
    }
    return localHashMap;
  }
  
  private static String retrieveAIDFromVisitorIDService()
  {
    Object localObject4 = new StringBuilder(64);
    Object localObject1;
    boolean bool;
    if (MobileConfig.getInstance().getSSL())
    {
      localObject1 = "https";
      ((StringBuilder)localObject4).append((String)localObject1);
      ((StringBuilder)localObject4).append("://");
      ((StringBuilder)localObject4).append(MobileConfig.getInstance().getTrackingServer());
      ((StringBuilder)localObject4).append("/id");
      bool = MobileConfig.getInstance().getVisitorIdServiceEnabled();
      if (bool) {
        ((StringBuilder)localObject4).append(VisitorIDService.sharedInstance().getAnalyticsIDRequestParameterString());
      }
      localObject1 = RequestHandler.retrieveData(((StringBuilder)localObject4).toString(), null, 500, "Analytics ID");
      if (localObject1 == null) {
        break label196;
      }
    }
    for (;;)
    {
      try
      {
        localObject1 = new JSONObject(new String((byte[])localObject1, "UTF-8")).getString("id");
        if (localObject1 != null)
        {
          localObject4 = localObject1;
          if (((String)localObject1).length() == 33) {}
        }
        else
        {
          if (!bool) {
            break label201;
          }
          localObject4 = null;
        }
        return (String)localObject4;
        localObject1 = "http";
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        logErrorFormat("Analytics ID - Unable to decode /id response(%s)", new Object[] { localUnsupportedEncodingException.getLocalizedMessage() });
        Object localObject2 = null;
        continue;
      }
      catch (JSONException localJSONException)
      {
        if (!bool) {
          logErrorFormat("Analytics ID - Unable to parse /id response(%s)", new Object[] { localJSONException.getLocalizedMessage() });
        }
      }
      label196:
      Object localObject3 = null;
    }
    label201:
    return generateAID();
  }
  
  private static void serializeKeyValuePair(String paramString, Object paramObject, StringBuilder paramStringBuilder)
  {
    if ((paramString == null) || (paramObject == null) || ((paramObject instanceof ContextData)) || (paramString.length() <= 0)) {
      return;
    }
    paramStringBuilder.append("&");
    paramStringBuilder.append(paramString);
    paramStringBuilder.append("=");
    if ((paramObject instanceof List))
    {
      paramStringBuilder.append(URLEncode(join((List)paramObject, ",")));
      return;
    }
    paramStringBuilder.append(URLEncode(paramObject.toString()));
  }
  
  protected static void serializeToQueryString(Map paramMap, StringBuilder paramStringBuilder)
  {
    if (paramMap == null) {}
    for (;;)
    {
      return;
      paramMap = paramMap.entrySet().iterator();
      while (paramMap.hasNext())
      {
        Object localObject = (Map.Entry)paramMap.next();
        String str = URLEncode((String)((Map.Entry)localObject).getKey());
        if (str != null)
        {
          localObject = ((Map.Entry)localObject).getValue();
          if ((localObject instanceof ContextData))
          {
            localObject = (ContextData)localObject;
            if (value != null) {
              serializeKeyValuePair(str, value, paramStringBuilder);
            }
            if ((contextData != null) && (contextData.size() > 0))
            {
              paramStringBuilder.append("&");
              paramStringBuilder.append(str);
              paramStringBuilder.append(".");
              serializeToQueryString(contextData, paramStringBuilder);
              paramStringBuilder.append("&.");
              paramStringBuilder.append(str);
            }
          }
          else
          {
            serializeKeyValuePair(str, localObject, paramStringBuilder);
          }
        }
      }
    }
  }
  
  protected static void setApplicationType(Config.ApplicationType paramApplicationType)
  {
    _appType = paramApplicationType;
    if (_appType == Config.ApplicationType.APPLICATION_TYPE_WEARABLE) {}
    for (boolean bool = true;; bool = false)
    {
      _isWearable = bool;
      return;
    }
  }
  
  protected static void setCurrentActivity(Activity paramActivity)
  {
    synchronized (_currentActivityMutex)
    {
      _activity = new WeakReference(paramActivity);
      return;
    }
  }
  
  protected static void setDebugLogging(boolean paramBoolean)
  {
    _debugLogging = paramBoolean;
  }
  
  protected static void setSharedContext(Context paramContext)
  {
    if (paramContext != null)
    {
      if ((paramContext instanceof Activity)) {
        sharedContext = paramContext.getApplicationContext();
      }
    }
    else {
      return;
    }
    sharedContext = paramContext;
  }
  
  protected static void setVisitorID(String paramString)
  {
    synchronized (_userIdentifierMutex)
    {
      visitorID = paramString;
      WearableFunctionBridge.syncVisitorIDToWearable(paramString);
      try
      {
        SharedPreferences.Editor localEditor = getSharedPreferencesEditor();
        localEditor.putString("APP_MEASUREMENT_VISITOR_ID", paramString);
        localEditor.commit();
        return;
      }
      catch (NullContextException paramString)
      {
        for (;;)
        {
          logErrorFormat("Config - Error updating visitorID. (%s)", new Object[] { paramString.getMessage() });
        }
      }
    }
  }
  
  private static void syncAIDIfNeeded(String paramString)
  {
    if (paramString == null) {}
    for (;;)
    {
      return;
      if (!MobileConfig.getInstance().getVisitorIdServiceEnabled()) {
        continue;
      }
      try
      {
        bool = getSharedPreferences().getBoolean("ADOBEMOBILE_STOREDDEFAULTS_AID_SYNCED", false);
        if (bool) {
          continue;
        }
        HashMap localHashMap = new HashMap();
        localHashMap.put("AVID", paramString);
        VisitorIDService.sharedInstance().idSync(localHashMap);
        try
        {
          paramString = getSharedPreferencesEditor();
          paramString.putBoolean("ADOBEMOBILE_STOREDDEFAULTS_AID_SYNCED", true);
          paramString.commit();
          return;
        }
        catch (NullContextException paramString)
        {
          logWarningFormat("Visitor ID - Null context when attempting to persist visitor ID sync status (%s)", new Object[] { paramString.getLocalizedMessage() });
          return;
        }
      }
      catch (NullContextException localNullContextException)
      {
        for (;;)
        {
          logWarningFormat("Visitor ID - Null context when attempting to determine visitor ID sync status (%s)", new Object[] { localNullContextException.getLocalizedMessage() });
          boolean bool = false;
        }
      }
    }
  }
  
  protected static ContextData translateContextData(Map paramMap)
  {
    ContextData localContextData = new ContextData();
    paramMap = cleanContextDataDictionary(paramMap).entrySet().iterator();
    while (paramMap.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramMap.next();
      String str = (String)localEntry.getKey();
      ArrayList localArrayList = new ArrayList();
      int j;
      for (int i = 0;; i = j + 1)
      {
        j = str.indexOf('.', i);
        if (j < 0) {
          break;
        }
        localArrayList.add(str.substring(i, j));
      }
      localArrayList.add(str.substring(i, str.length()));
      addValueToHashMap(localEntry.getValue(), localContextData, localArrayList, 0);
    }
    return localContextData;
  }
  
  protected static void updateLastKnownTimestamp(Long paramLong)
  {
    Object localObject = MobileConfig.getInstance();
    if (localObject == null) {
      logErrorFormat("Config - Lost config instance", new Object[0]);
    }
    while (!((MobileConfig)localObject).getOfflineTrackingEnabled()) {
      return;
    }
    try
    {
      localObject = getSharedPreferencesEditor();
      ((SharedPreferences.Editor)localObject).putLong("ADBLastKnownTimestampKey", paramLong.longValue());
      ((SharedPreferences.Editor)localObject).commit();
      return;
    }
    catch (NullContextException paramLong)
    {
      logErrorFormat("Config - Error while updating last known timestamp. (%s)", new Object[] { paramLong.getMessage() });
    }
  }
  
  protected static class NullActivityException
    extends Exception
  {
    public NullActivityException(String paramString)
    {
      super();
    }
  }
  
  protected static class NullContextException
    extends Exception
  {
    public NullContextException(String paramString)
    {
      super();
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.StaticMethods
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */