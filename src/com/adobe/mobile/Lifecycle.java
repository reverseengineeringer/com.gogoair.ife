package com.adobe.mobile;

import android.app.Activity;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;

final class Lifecycle
{
  private static final Object _contextDataMutex = new Object();
  private static final HashMap _lifecycleContextData;
  private static final HashMap _lifecycleContextDataLowercase;
  private static final Object _lowercaseContextDataMutex = new Object();
  private static final HashMap _previousSessionlifecycleContextData;
  private static final Object _referralMutex = new Object();
  protected static volatile boolean lifecycleHasRun;
  protected static long sessionStartTime = 0L;
  
  static
  {
    lifecycleHasRun = false;
    _lifecycleContextData = new HashMap();
    _lifecycleContextDataLowercase = new HashMap();
    _previousSessionlifecycleContextData = new HashMap();
  }
  
  private static void addInstallData(Map paramMap, long paramLong)
  {
    paramMap.put("a.InstallDate", new SimpleDateFormat("M/d/yyyy", Locale.US).format(Long.valueOf(paramLong)));
    paramMap.put("a.InstallEvent", "InstallEvent");
    paramMap.put("a.DailyEngUserEvent", "DailyEngUserEvent");
    paramMap.put("a.MonthlyEngUserEvent", "MonthlyEngUserEvent");
    try
    {
      if (StaticMethods.getSharedPreferences().contains("utm_campaign"))
      {
        String str1 = StaticMethods.getSharedPreferences().getString("utm_source", null);
        String str2 = StaticMethods.getSharedPreferences().getString("utm_medium", null);
        String str3 = StaticMethods.getSharedPreferences().getString("utm_term", null);
        String str4 = StaticMethods.getSharedPreferences().getString("utm_content", null);
        String str5 = StaticMethods.getSharedPreferences().getString("utm_campaign", null);
        String str6 = StaticMethods.getSharedPreferences().getString("trackingcode", null);
        if ((str1 != null) && (str5 != null))
        {
          paramMap.put("a.referrer.campaign.source", str1);
          paramMap.put("a.referrer.campaign.medium", str2);
          paramMap.put("a.referrer.campaign.term", str3);
          paramMap.put("a.referrer.campaign.content", str4);
          paramMap.put("a.referrer.campaign.name", str5);
          paramMap.put("a.referrer.campaign.trackingcode", str6);
        }
      }
      for (;;)
      {
        paramMap = StaticMethods.getSharedPreferencesEditor();
        paramMap.putLong("ADMS_InstallDate", paramLong);
        paramMap.commit();
        return;
        if (MobileConfig.getInstance().getReferrerTimeout() > 0)
        {
          paramMap.put("a.referrer.campaign.source", "D=utm_source");
          paramMap.put("a.referrer.campaign.medium", "D=utm_medium");
          paramMap.put("a.referrer.campaign.term", "D=utm_term");
          paramMap.put("a.referrer.campaign.content", "D=utm_content");
          paramMap.put("a.referrer.campaign.name", "D=utm_campaign");
          paramMap.put("a.referrer.campaign.trackingcode", "D=trackingcode");
          ReferrerHandler.setReferrerProcessed(false);
        }
      }
      return;
    }
    catch (StaticMethods.NullContextException paramMap)
    {
      StaticMethods.logErrorFormat("Lifecycle - Error setting install data (%s).", new Object[] { paramMap.getMessage() });
    }
  }
  
  private static void addLifecycleGenericData(Map paramMap, long paramLong)
  {
    paramMap.putAll(StaticMethods.getDefaultData());
    paramMap.put("a.LaunchEvent", "LaunchEvent");
    paramMap.put("a.OSVersion", StaticMethods.getOperatingSystem());
    paramMap.put("a.HourOfDay", new SimpleDateFormat("H", Locale.US).format(Long.valueOf(paramLong)));
    Object localObject = Calendar.getInstance();
    ((Calendar)localObject).setTimeInMillis(paramLong);
    paramMap.put("a.DayOfWeek", Integer.toString(((Calendar)localObject).get(7)));
    try
    {
      localObject = StaticMethods.getSharedPreferencesEditor();
      int i = StaticMethods.getSharedPreferences().getInt("ADMS_Launches", 0) + 1;
      paramMap.put("a.Launches", Integer.toString(i));
      ((SharedPreferences.Editor)localObject).putInt("ADMS_Launches", i);
      ((SharedPreferences.Editor)localObject).putLong("ADMS_LastDateUsed", paramLong);
      ((SharedPreferences.Editor)localObject).commit();
      return;
    }
    catch (StaticMethods.NullContextException paramMap)
    {
      StaticMethods.logErrorFormat("Lifecycle - Error adding generic data (%s).", new Object[] { paramMap.getMessage() });
    }
  }
  
  private static void addNonInstallData(Map paramMap, long paramLong)
  {
    try
    {
      Object localObject = new SimpleDateFormat("yyyy/M/d", Locale.US);
      long l = StaticMethods.getSharedPreferences().getLong("ADMS_LastDateUsed", 0L);
      String str = ((DateFormat)localObject).format(new Date(l));
      if (!((DateFormat)localObject).format(Long.valueOf(paramLong)).equalsIgnoreCase(str)) {
        paramMap.put("a.DailyEngUserEvent", "DailyEngUserEvent");
      }
      localObject = new SimpleDateFormat("yyyy/M", Locale.US);
      str = ((DateFormat)localObject).format(new Date(l));
      if (!((DateFormat)localObject).format(Long.valueOf(paramLong)).equalsIgnoreCase(str)) {
        paramMap.put("a.MonthlyEngUserEvent", "MonthlyEngUserEvent");
      }
      paramMap.put("a.DaysSinceFirstUse", calculateDaysSince(StaticMethods.getSharedPreferences().getLong("ADMS_InstallDate", 0L), paramLong));
      paramMap.put("a.DaysSinceLastUse", calculateDaysSince(l, paramLong));
      if (!StaticMethods.getSharedPreferences().getBoolean("ADMS_SuccessfulClose", false))
      {
        localObject = StaticMethods.getSharedPreferencesEditor();
        ((SharedPreferences.Editor)localObject).remove("ADMS_PauseDate");
        ((SharedPreferences.Editor)localObject).remove("ADMS_SessionStart");
        sessionStartTime = StaticMethods.getTimeSince1970();
        ((SharedPreferences.Editor)localObject).commit();
        paramLong = StaticMethods.getSharedPreferences().getLong("ADBLastKnownTimestampKey", 0L);
        if ((paramLong > 0L) && (MobileConfig.getInstance().mobileUsingAnalytics()) && (MobileConfig.getInstance().getOfflineTrackingEnabled()) && (MobileConfig.getInstance().getBackdateSessionInfoEnabled()))
        {
          paramMap = new HashMap();
          paramMap.put("a.CrashEvent", "CrashEvent");
          _lifecycleContextData.putAll(paramMap);
          AnalyticsTrackInternal.trackInternal("Crash", paramMap, paramLong + 1L);
        }
        for (;;)
        {
          AnalyticsTrackTimedAction.sharedInstance().trackTimedActionUpdateActionsClearAdjustedStartTime();
          return;
          paramMap.put("a.CrashEvent", "CrashEvent");
        }
      }
      return;
    }
    catch (StaticMethods.NullContextException paramMap)
    {
      StaticMethods.logErrorFormat("Lifecycle - Error setting non install data (%s).", new Object[] { paramMap.getMessage() });
    }
  }
  
  private static void addPersistedLifecycleToMap(Map paramMap)
  {
    try
    {
      String str = StaticMethods.getSharedPreferences().getString("ADMS_LifecycleData", null);
      if ((str != null) && (str.length() > 0)) {
        paramMap.putAll(StaticMethods.mapFromJson(new JSONObject(str)));
      }
      return;
    }
    catch (StaticMethods.NullContextException paramMap)
    {
      StaticMethods.logErrorFormat("Lifecycle - Issue loading persisted lifecycle data", new Object[] { paramMap.getMessage() });
      return;
    }
    catch (JSONException paramMap)
    {
      StaticMethods.logWarningFormat("Lifecycle - Issue loading persisted lifecycle data (%s)", new Object[] { paramMap.getMessage() });
    }
  }
  
  protected static void addReferralDataToSavedLifecycle(Map paramMap)
  {
    synchronized (_referralMutex)
    {
      if (_lifecycleContextData.size() == 0) {
        return;
      }
      _lifecycleContextData.put("a.referrer.campaign.source", paramMap.get("utm_source"));
      _lifecycleContextData.put("a.referrer.campaign.medium", paramMap.get("utm_medium"));
      _lifecycleContextData.put("a.referrer.campaign.term", paramMap.get("utm_term"));
      _lifecycleContextData.put("a.referrer.campaign.content", paramMap.get("utm_content"));
      _lifecycleContextData.put("a.referrer.campaign.name", paramMap.get("utm_campaign"));
      _lifecycleContextData.put("a.referrer.campaign.trackingcode", paramMap.get("trackingcode"));
      clearContextDataLowercase();
      paramMap = _lifecycleContextData.entrySet().iterator();
      if (paramMap.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)paramMap.next();
        _lifecycleContextDataLowercase.put(((String)localEntry.getKey()).toLowerCase(), localEntry.getValue());
      }
    }
  }
  
  private static void addSessionLengthData(Map paramMap)
  {
    for (;;)
    {
      int i;
      try
      {
        long l = StaticMethods.getSharedPreferences().getLong("ADMS_PauseDate", 0L);
        i = MobileConfig.getInstance().getLifecycleTimeout();
        if ((int)((new Date().getTime() - l) / 1000L) < i) {
          return;
        }
        i = (int)((l - StaticMethods.getSharedPreferences().getLong("ADMS_SessionStart", 0L)) / 1000L);
        sessionStartTime = StaticMethods.getTimeSince1970();
        if ((i <= 0) || (i >= 604800)) {
          break label236;
        }
        l = StaticMethods.getSharedPreferences().getLong("ADBLastKnownTimestampKey", 0L);
        if ((l > 0L) && (MobileConfig.getInstance().mobileUsingAnalytics()) && (MobileConfig.getInstance().getOfflineTrackingEnabled()) && (MobileConfig.getInstance().getBackdateSessionInfoEnabled()))
        {
          paramMap = new HashMap();
          paramMap.put("a.PrevSessionLength", "" + i);
          _lifecycleContextData.putAll(paramMap);
          AnalyticsTrackInternal.trackInternal("SessionInfo", paramMap, l + 1L);
          paramMap = StaticMethods.getSharedPreferencesEditor();
          paramMap.remove("ADMS_SessionStart");
          paramMap.commit();
          return;
        }
      }
      catch (StaticMethods.NullContextException paramMap)
      {
        StaticMethods.logErrorFormat("Lifecycle - Error adding session length data (%s).", new Object[] { paramMap.getMessage() });
        return;
      }
      paramMap.put("a.PrevSessionLength", Integer.toString(i));
      continue;
      label236:
      paramMap.put("a.ignoredSessionLength", Integer.toString(i));
    }
  }
  
  private static void addUpgradeData(Map paramMap, long paramLong)
  {
    try
    {
      SharedPreferences.Editor localEditor = StaticMethods.getSharedPreferencesEditor();
      long l = StaticMethods.getSharedPreferences().getLong("ADMS_UpgradeDate", 0L);
      if (!StaticMethods.getApplicationVersion().equalsIgnoreCase(StaticMethods.getSharedPreferences().getString("ADMS_LastVersion", "")))
      {
        paramMap.put("a.UpgradeEvent", "UpgradeEvent");
        localEditor.putLong("ADMS_UpgradeDate", paramLong);
        localEditor.putInt("ADMS_LaunchesAfterUpgrade", 0);
      }
      for (;;)
      {
        if (l > 0L)
        {
          int i = StaticMethods.getSharedPreferences().getInt("ADMS_LaunchesAfterUpgrade", 0) + 1;
          paramMap.put("a.LaunchesSinceUpgrade", "" + i);
          localEditor.putInt("ADMS_LaunchesAfterUpgrade", i);
        }
        localEditor.commit();
        return;
        if (l > 0L) {
          paramMap.put("a.DaysSinceLastUpgrade", calculateDaysSince(l, paramLong));
        }
      }
      return;
    }
    catch (StaticMethods.NullContextException paramMap)
    {
      StaticMethods.logErrorFormat("Lifecycle - Error setting upgrade data (%s).", new Object[] { paramMap.getMessage() });
    }
  }
  
  private static String calculateDaysSince(long paramLong1, long paramLong2)
  {
    return Integer.toString((int)((paramLong2 - paramLong1) / 86400000L));
  }
  
  private static void clearContextDataLowercase()
  {
    synchronized (_lowercaseContextDataMutex)
    {
      _lifecycleContextDataLowercase.clear();
      return;
    }
  }
  
  private static void generateLifecycleToBeSaved(Map paramMap)
  {
    if (paramMap != null) {}
    for (paramMap = new HashMap(paramMap);; paramMap = new HashMap())
    {
      paramMap.putAll(StaticMethods.getDefaultData());
      paramMap.put("a.locale", StaticMethods.getDefaultAcceptLanguage());
      _lifecycleContextData.putAll(paramMap);
      clearContextDataLowercase();
      paramMap = _lifecycleContextData.entrySet().iterator();
      while (paramMap.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)paramMap.next();
        _lifecycleContextDataLowercase.put(((String)localEntry.getKey()).toLowerCase(), localEntry.getValue());
      }
    }
  }
  
  protected static HashMap getContextData()
  {
    synchronized (_contextDataMutex)
    {
      HashMap localHashMap1;
      if (_lifecycleContextData.size() > 0)
      {
        localHashMap1 = _lifecycleContextData;
        return localHashMap1;
      }
      if (_previousSessionlifecycleContextData.size() > 0)
      {
        localHashMap1 = _previousSessionlifecycleContextData;
        return localHashMap1;
      }
    }
    addPersistedLifecycleToMap(_previousSessionlifecycleContextData);
    HashMap localHashMap2 = _previousSessionlifecycleContextData;
    return localHashMap2;
  }
  
  protected static Map getContextDataLowercase()
  {
    synchronized (_lowercaseContextDataMutex)
    {
      if (_lifecycleContextDataLowercase.size() <= 0)
      {
        Object localObject2 = new HashMap();
        addPersistedLifecycleToMap((Map)localObject2);
        localObject2 = ((HashMap)localObject2).entrySet().iterator();
        if (((Iterator)localObject2).hasNext())
        {
          Map.Entry localEntry = (Map.Entry)((Iterator)localObject2).next();
          _lifecycleContextDataLowercase.put(((String)localEntry.getKey()).toLowerCase(), localEntry.getValue());
        }
      }
    }
    HashMap localHashMap = _lifecycleContextDataLowercase;
    return localHashMap;
  }
  
  private static void persistLifecycleContextData()
  {
    try
    {
      SharedPreferences.Editor localEditor = StaticMethods.getSharedPreferencesEditor();
      localEditor.putString("ADMS_LifecycleData", new JSONObject(_lifecycleContextData).toString());
      localEditor.commit();
      return;
    }
    catch (StaticMethods.NullContextException localNullContextException)
    {
      StaticMethods.logWarningFormat("Lifecycle - Error persisting lifecycle data (%s)", new Object[] { localNullContextException.getMessage() });
    }
  }
  
  protected static void removeContextData(String paramString)
  {
    synchronized (_contextDataMutex)
    {
      _lifecycleContextData.remove(paramString);
    }
    synchronized (_lowercaseContextDataMutex)
    {
      _lifecycleContextDataLowercase.remove(paramString.toLowerCase());
      return;
      paramString = finally;
      throw paramString;
    }
  }
  
  private static void resetLifecycleFlags(long paramLong)
  {
    try
    {
      SharedPreferences.Editor localEditor = StaticMethods.getSharedPreferencesEditor();
      if (!StaticMethods.getSharedPreferences().contains("ADMS_SessionStart"))
      {
        localEditor.putLong("ADMS_SessionStart", paramLong);
        sessionStartTime = paramLong / 1000L;
      }
      localEditor.putString("ADMS_LastVersion", StaticMethods.getApplicationVersion());
      localEditor.putBoolean("ADMS_SuccessfulClose", false);
      localEditor.remove("ADMS_PauseDate");
      localEditor.commit();
      return;
    }
    catch (StaticMethods.NullContextException localNullContextException)
    {
      StaticMethods.logErrorFormat("Lifecycle - Error resetting lifecycle flags (%s).", new Object[] { localNullContextException.getMessage() });
    }
  }
  
  /* Error */
  protected static void start(Activity paramActivity, Map paramMap)
  {
    // Byte code:
    //   0: getstatic 22	com/adobe/mobile/Lifecycle:lifecycleHasRun	Z
    //   3: ifeq +4 -> 7
    //   6: return
    //   7: iconst_1
    //   8: putstatic 22	com/adobe/mobile/Lifecycle:lifecycleHasRun	Z
    //   11: invokestatic 96	com/adobe/mobile/StaticMethods:getSharedPreferences	()Landroid/content/SharedPreferences;
    //   14: astore 10
    //   16: aconst_null
    //   17: astore 8
    //   19: invokestatic 489	com/adobe/mobile/StaticMethods:getCurrentActivity	()Landroid/app/Activity;
    //   22: astore 9
    //   24: aload 9
    //   26: astore 8
    //   28: aload 8
    //   30: ifnull +34 -> 64
    //   33: aload_0
    //   34: ifnull +30 -> 64
    //   37: aload 8
    //   39: invokevirtual 495	android/app/Activity:getComponentName	()Landroid/content/ComponentName;
    //   42: invokevirtual 498	android/content/ComponentName:toString	()Ljava/lang/String;
    //   45: aload_0
    //   46: invokevirtual 495	android/app/Activity:getComponentName	()Landroid/content/ComponentName;
    //   49: invokevirtual 498	android/content/ComponentName:toString	()Ljava/lang/String;
    //   52: invokevirtual 502	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   55: ifeq +9 -> 64
    //   58: aconst_null
    //   59: aconst_null
    //   60: aconst_null
    //   61: invokestatic 508	com/adobe/mobile/Messages:checkForInAppMessage	(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V
    //   64: aload_0
    //   65: invokestatic 512	com/adobe/mobile/StaticMethods:setCurrentActivity	(Landroid/app/Activity;)V
    //   68: invokestatic 152	com/adobe/mobile/MobileConfig:getInstance	()Lcom/adobe/mobile/MobileConfig;
    //   71: astore 8
    //   73: aload 10
    //   75: ldc_w 280
    //   78: lconst_0
    //   79: invokeinterface 250 4 0
    //   84: lstore 6
    //   86: aload 8
    //   88: invokevirtual 395	com/adobe/mobile/MobileConfig:getLifecycleTimeout	()I
    //   91: istore 4
    //   93: iconst_1
    //   94: istore_3
    //   95: iload_3
    //   96: istore_2
    //   97: lload 6
    //   99: lconst_0
    //   100: lcmp
    //   101: ifle +123 -> 224
    //   104: new 252	java/util/Date
    //   107: dup
    //   108: invokespecial 396	java/util/Date:<init>	()V
    //   111: invokevirtual 399	java/util/Date:getTime	()J
    //   114: lload 6
    //   116: lsub
    //   117: ldc2_w 400
    //   120: ldiv
    //   121: l2i
    //   122: istore 5
    //   124: aload 10
    //   126: ldc_w 286
    //   129: lconst_0
    //   130: invokeinterface 250 4 0
    //   135: lstore 6
    //   137: lload 6
    //   139: ldc2_w 400
    //   142: ldiv
    //   143: putstatic 20	com/adobe/mobile/Lifecycle:sessionStartTime	J
    //   146: invokestatic 321	com/adobe/mobile/AnalyticsTrackTimedAction:sharedInstance	()Lcom/adobe/mobile/AnalyticsTrackTimedAction;
    //   149: iload 5
    //   151: i2l
    //   152: invokevirtual 515	com/adobe/mobile/AnalyticsTrackTimedAction:trackTimedActionUpdateAdjustedStartTime	(J)V
    //   155: iload_3
    //   156: istore_2
    //   157: iload 5
    //   159: iload 4
    //   161: if_icmpge +63 -> 224
    //   164: iload_3
    //   165: istore_2
    //   166: lload 6
    //   168: lconst_0
    //   169: lcmp
    //   170: ifle +54 -> 224
    //   173: invokestatic 134	com/adobe/mobile/StaticMethods:getSharedPreferencesEditor	()Landroid/content/SharedPreferences$Editor;
    //   176: astore_0
    //   177: aload_0
    //   178: ldc_w 286
    //   181: iload 5
    //   183: sipush 1000
    //   186: imul
    //   187: i2l
    //   188: lload 6
    //   190: ladd
    //   191: invokeinterface 142 4 0
    //   196: pop
    //   197: aload_0
    //   198: invokeinterface 146 1 0
    //   203: pop
    //   204: aload 10
    //   206: ldc_w 286
    //   209: lconst_0
    //   210: invokeinterface 250 4 0
    //   215: ldc2_w 400
    //   218: ldiv
    //   219: putstatic 20	com/adobe/mobile/Lifecycle:sessionStartTime	J
    //   222: iconst_0
    //   223: istore_2
    //   224: new 252	java/util/Date
    //   227: dup
    //   228: invokespecial 396	java/util/Date:<init>	()V
    //   231: invokevirtual 399	java/util/Date:getTime	()J
    //   234: lstore 6
    //   236: iload_2
    //   237: ifeq +96 -> 333
    //   240: aload 8
    //   242: invokevirtual 518	com/adobe/mobile/MobileConfig:downloadRemoteConfigs	()V
    //   245: getstatic 29	com/adobe/mobile/Lifecycle:_lifecycleContextData	Ljava/util/HashMap;
    //   248: invokevirtual 449	java/util/HashMap:clear	()V
    //   251: invokestatic 361	com/adobe/mobile/Lifecycle:clearContextDataLowercase	()V
    //   254: aload_1
    //   255: ifnull +124 -> 379
    //   258: new 24	java/util/HashMap
    //   261: dup
    //   262: aload_1
    //   263: invokespecial 452	java/util/HashMap:<init>	(Ljava/util/Map;)V
    //   266: astore_0
    //   267: aload 10
    //   269: ldc -120
    //   271: invokeinterface 104 2 0
    //   276: ifne +114 -> 390
    //   279: aload_0
    //   280: lload 6
    //   282: invokestatic 520	com/adobe/mobile/Lifecycle:addInstallData	(Ljava/util/Map;J)V
    //   285: aload_0
    //   286: lload 6
    //   288: invokestatic 522	com/adobe/mobile/Lifecycle:addLifecycleGenericData	(Ljava/util/Map;J)V
    //   291: aload_0
    //   292: invokestatic 524	com/adobe/mobile/Lifecycle:generateLifecycleToBeSaved	(Ljava/util/Map;)V
    //   295: invokestatic 526	com/adobe/mobile/Lifecycle:persistLifecycleContextData	()V
    //   298: aload 8
    //   300: invokevirtual 295	com/adobe/mobile/MobileConfig:mobileUsingAnalytics	()Z
    //   303: ifeq +15 -> 318
    //   306: ldc_w 528
    //   309: aload_0
    //   310: invokestatic 290	com/adobe/mobile/StaticMethods:getTimeSince1970	()J
    //   313: lconst_1
    //   314: lsub
    //   315: invokestatic 315	com/adobe/mobile/AnalyticsTrackInternal:trackInternal	(Ljava/lang/String;Ljava/util/Map;J)V
    //   318: aload 8
    //   320: invokevirtual 531	com/adobe/mobile/MobileConfig:mobileUsingAudienceManager	()Z
    //   323: ifeq +10 -> 333
    //   326: getstatic 29	com/adobe/mobile/Lifecycle:_lifecycleContextData	Ljava/util/HashMap;
    //   329: aconst_null
    //   330: invokestatic 537	com/adobe/mobile/AudienceManagerWorker:SubmitSignal	(Ljava/util/Map;Lcom/adobe/mobile/AudienceManager$AudienceManagerCallback;)V
    //   333: lload 6
    //   335: invokestatic 539	com/adobe/mobile/Lifecycle:resetLifecycleFlags	(J)V
    //   338: return
    //   339: astore_0
    //   340: ldc_w 541
    //   343: iconst_1
    //   344: anewarray 4	java/lang/Object
    //   347: dup
    //   348: iconst_0
    //   349: aload_0
    //   350: invokevirtual 180	com/adobe/mobile/StaticMethods$NullContextException:getMessage	()Ljava/lang/String;
    //   353: aastore
    //   354: invokestatic 184	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   357: return
    //   358: astore_0
    //   359: ldc_w 543
    //   362: iconst_1
    //   363: anewarray 4	java/lang/Object
    //   366: dup
    //   367: iconst_0
    //   368: aload_0
    //   369: invokevirtual 180	com/adobe/mobile/StaticMethods$NullContextException:getMessage	()Ljava/lang/String;
    //   372: aastore
    //   373: invokestatic 184	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   376: goto -172 -> 204
    //   379: new 24	java/util/HashMap
    //   382: dup
    //   383: invokespecial 27	java/util/HashMap:<init>	()V
    //   386: astore_0
    //   387: goto -120 -> 267
    //   390: aload_0
    //   391: lload 6
    //   393: invokestatic 545	com/adobe/mobile/Lifecycle:addNonInstallData	(Ljava/util/Map;J)V
    //   396: aload_0
    //   397: lload 6
    //   399: invokestatic 547	com/adobe/mobile/Lifecycle:addUpgradeData	(Ljava/util/Map;J)V
    //   402: aload_0
    //   403: invokestatic 549	com/adobe/mobile/Lifecycle:addSessionLengthData	(Ljava/util/Map;)V
    //   406: goto -121 -> 285
    //   409: astore 9
    //   411: goto -383 -> 28
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	414	0	paramActivity	Activity
    //   0	414	1	paramMap	Map
    //   96	141	2	i	int
    //   94	71	3	j	int
    //   91	71	4	k	int
    //   122	65	5	m	int
    //   84	314	6	l	long
    //   17	302	8	localObject	Object
    //   22	3	9	localActivity	Activity
    //   409	1	9	localNullActivityException	StaticMethods.NullActivityException
    //   14	254	10	localSharedPreferences	SharedPreferences
    // Exception table:
    //   from	to	target	type
    //   11	16	339	com/adobe/mobile/StaticMethods$NullContextException
    //   173	204	358	com/adobe/mobile/StaticMethods$NullContextException
    //   19	24	409	com/adobe/mobile/StaticMethods$NullActivityException
  }
  
  protected static void stop()
  {
    lifecycleHasRun = false;
    StaticMethods.updateLastKnownTimestamp(Long.valueOf(StaticMethods.getTimeSince1970()));
    try
    {
      localObject = StaticMethods.getSharedPreferencesEditor();
      ((SharedPreferences.Editor)localObject).putBoolean("ADMS_SuccessfulClose", true);
      ((SharedPreferences.Editor)localObject).putLong("ADMS_PauseDate", new Date().getTime());
      ((SharedPreferences.Editor)localObject).commit();
    }
    catch (StaticMethods.NullContextException localNullContextException)
    {
      for (;;)
      {
        try
        {
          Object localObject = StaticMethods.getCurrentActivity();
          if (((Activity)localObject).isFinishing()) {
            Messages.resetAllInAppMessages();
          }
          return;
        }
        catch (StaticMethods.NullActivityException localNullActivityException) {}
        localNullContextException = localNullContextException;
        StaticMethods.logErrorFormat("Lifecycle - Error updating lifecycle pause data (%s)", new Object[] { localNullContextException.getMessage() });
      }
    }
  }
  
  protected static void updateContextData(HashMap paramHashMap)
  {
    synchronized (_contextDataMutex)
    {
      _lifecycleContextData.putAll(paramHashMap);
      synchronized (_lowercaseContextDataMutex)
      {
        paramHashMap = paramHashMap.entrySet().iterator();
        if (paramHashMap.hasNext())
        {
          Map.Entry localEntry = (Map.Entry)paramHashMap.next();
          _lifecycleContextDataLowercase.put(((String)localEntry.getKey()).toLowerCase(), localEntry.getValue());
        }
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Lifecycle
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */