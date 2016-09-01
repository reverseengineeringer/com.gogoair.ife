package com.adobe.mobile;

import android.content.ContentValues;
import android.content.Context;
import android.content.IntentFilter;
import android.database.DatabaseUtils;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteStatement;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Process;
import java.io.File;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

final class AnalyticsWorker
  extends AbstractDatabaseBacking
{
  private static final int CONNECTION_TIMEOUT_MSEC = 5000;
  private static final int TIMESTAMP_DISABLED_WAIT_THRESHOLD = 60;
  private static AnalyticsWorker _instance;
  private static final Object _instanceMutex;
  private static volatile boolean analyticsGetBaseURL_pred = true;
  private static final Object backgroundMutex;
  private static String baseURL;
  private static boolean bgThreadActive;
  private static boolean networkAvailable;
  private static final SecureRandom randomGen = new SecureRandom();
  private static final Object referrerTimerMutex;
  private SQLiteStatement _preparedInsertStatement = null;
  private long lastHitTimestamp = 0L;
  private long numberOfUnsentHits;
  private TimerTask referrerTask;
  private Timer referrerTimer;
  
  static
  {
    backgroundMutex = new Object();
    referrerTimerMutex = new Object();
    networkAvailable = false;
    _instance = null;
    _instanceMutex = new Object();
    bgThreadActive = false;
  }
  
  protected AnalyticsWorker()
  {
    initDatabaseBacking(new File(StaticMethods.getCacheDirectory(), "ADBMobileDataCache.sqlite"));
    if (StaticMethods.isWearableApp()) {
      networkAvailable = true;
    }
    for (;;)
    {
      numberOfUnsentHits = getTrackingQueueSize();
      return;
      startNotifier();
    }
  }
  
  private void bringOnline()
  {
    if (!bgThreadActive)
    {
      bgThreadActive = true;
      synchronized (backgroundMutex)
      {
        new Thread(new WorkerThreadRunner(null)).start();
        return;
      }
    }
  }
  
  private void deleteHit(String paramString)
    throws AbstractDatabaseBacking.CorruptedDatabaseException
  {
    if ((paramString == null) || (paramString.trim().length() == 0))
    {
      StaticMethods.logDebugFormat("Analytics - Unable to delete hit due to an invalid parameter", new Object[0]);
      return;
    }
    try
    {
      synchronized (dbMutex)
      {
        database.delete("HITS", "ID=" + paramString, null);
        numberOfUnsentHits -= 1L;
        return;
      }
    }
    catch (NullPointerException paramString)
    {
      for (;;)
      {
        StaticMethods.logErrorFormat("Analytics - Unable to delete hit due to an unopened database (%s)", new Object[] { paramString.getLocalizedMessage() });
      }
    }
    catch (SQLException paramString)
    {
      StaticMethods.logErrorFormat("Analytics - Unable to delete hit due to a sql error (%s)", new Object[] { paramString.getLocalizedMessage() });
      throw new AbstractDatabaseBacking.CorruptedDatabaseException("Unable to delete, database probably corrupted (" + paramString.getLocalizedMessage() + ")");
    }
    catch (Exception paramString)
    {
      StaticMethods.logErrorFormat("Analytics - Unable to delete hit due to an unexpected error (%s)", new Object[] { paramString.getLocalizedMessage() });
      throw new AbstractDatabaseBacking.CorruptedDatabaseException("Unexpected exception, database probably corrupted (" + paramString.getLocalizedMessage() + ")");
    }
  }
  
  private static String getBaseURL()
  {
    StringBuilder localStringBuilder;
    if (analyticsGetBaseURL_pred)
    {
      analyticsGetBaseURL_pred = false;
      localStringBuilder = new StringBuilder();
      if (!MobileConfig.getInstance().getSSL()) {
        break label101;
      }
    }
    label101:
    for (String str = "https://";; str = "http://")
    {
      baseURL = str + MobileConfig.getInstance().getTrackingServer() + "/b/ss/" + StaticMethods.URLEncode(MobileConfig.getInstance().getReportSuiteIds()) + "/0/JAVA-" + "4.5.3-AN" + "/s";
      StaticMethods.logDebugFormat("Analytics - Setting base request URL(%s)", new Object[] { baseURL });
      return baseURL;
    }
  }
  
  /* Error */
  private Hit getFirstHitInQueue()
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 4
    //   3: aconst_null
    //   4: astore_2
    //   5: aconst_null
    //   6: astore_3
    //   7: aconst_null
    //   8: astore 5
    //   10: aload_0
    //   11: getfield 169	com/adobe/mobile/AnalyticsWorker:dbMutex	Ljava/lang/Object;
    //   14: astore 6
    //   16: aload 6
    //   18: monitorenter
    //   19: aload_0
    //   20: getfield 173	com/adobe/mobile/AnalyticsWorker:database	Landroid/database/sqlite/SQLiteDatabase;
    //   23: ldc -81
    //   25: iconst_3
    //   26: anewarray 153	java/lang/String
    //   29: dup
    //   30: iconst_0
    //   31: ldc -4
    //   33: aastore
    //   34: dup
    //   35: iconst_1
    //   36: ldc -2
    //   38: aastore
    //   39: dup
    //   40: iconst_2
    //   41: ldc_w 256
    //   44: aastore
    //   45: aconst_null
    //   46: aconst_null
    //   47: aconst_null
    //   48: aconst_null
    //   49: ldc_w 258
    //   52: ldc_w 260
    //   55: invokevirtual 264	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   58: astore_1
    //   59: aload 5
    //   61: astore_3
    //   62: aload_1
    //   63: astore_2
    //   64: aload_1
    //   65: invokeinterface 269 1 0
    //   70: ifeq +52 -> 122
    //   73: aload_1
    //   74: astore_2
    //   75: new 6	com/adobe/mobile/AnalyticsWorker$Hit
    //   78: dup
    //   79: invokespecial 270	com/adobe/mobile/AnalyticsWorker$Hit:<init>	()V
    //   82: astore_3
    //   83: aload_1
    //   84: astore_2
    //   85: aload_3
    //   86: aload_1
    //   87: iconst_0
    //   88: invokeinterface 274 2 0
    //   93: putfield 277	com/adobe/mobile/AnalyticsWorker$Hit:identifier	Ljava/lang/String;
    //   96: aload_1
    //   97: astore_2
    //   98: aload_3
    //   99: aload_1
    //   100: iconst_1
    //   101: invokeinterface 274 2 0
    //   106: putfield 280	com/adobe/mobile/AnalyticsWorker$Hit:urlFragment	Ljava/lang/String;
    //   109: aload_1
    //   110: astore_2
    //   111: aload_3
    //   112: aload_1
    //   113: iconst_2
    //   114: invokeinterface 284 2 0
    //   119: putfield 287	com/adobe/mobile/AnalyticsWorker$Hit:timestamp	J
    //   122: aload_3
    //   123: astore_2
    //   124: aload_1
    //   125: ifnull +11 -> 136
    //   128: aload_1
    //   129: invokeinterface 290 1 0
    //   134: aload_3
    //   135: astore_2
    //   136: aload 6
    //   138: monitorexit
    //   139: aload_2
    //   140: areturn
    //   141: astore_3
    //   142: aconst_null
    //   143: astore_1
    //   144: aload_1
    //   145: astore_2
    //   146: ldc_w 292
    //   149: iconst_1
    //   150: anewarray 52	java/lang/Object
    //   153: dup
    //   154: iconst_0
    //   155: aload_3
    //   156: invokevirtual 295	android/database/SQLException:getMessage	()Ljava/lang/String;
    //   159: aastore
    //   160: invokestatic 201	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   163: aload 4
    //   165: astore_2
    //   166: aload_1
    //   167: ifnull -31 -> 136
    //   170: aload_1
    //   171: invokeinterface 290 1 0
    //   176: aload 4
    //   178: astore_2
    //   179: goto -43 -> 136
    //   182: astore_1
    //   183: aload 6
    //   185: monitorexit
    //   186: aload_1
    //   187: athrow
    //   188: astore 4
    //   190: aconst_null
    //   191: astore_1
    //   192: aload_2
    //   193: astore_3
    //   194: ldc_w 297
    //   197: iconst_1
    //   198: anewarray 52	java/lang/Object
    //   201: dup
    //   202: iconst_0
    //   203: aload 4
    //   205: invokevirtual 298	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   208: aastore
    //   209: invokestatic 201	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   212: aload_2
    //   213: ifnull +63 -> 276
    //   216: aload_2
    //   217: invokeinterface 290 1 0
    //   222: aload_1
    //   223: astore_2
    //   224: goto -88 -> 136
    //   227: aload_2
    //   228: ifnull +9 -> 237
    //   231: aload_2
    //   232: invokeinterface 290 1 0
    //   237: aload_1
    //   238: athrow
    //   239: astore_1
    //   240: goto -13 -> 227
    //   243: astore 4
    //   245: aconst_null
    //   246: astore_3
    //   247: aload_1
    //   248: astore_2
    //   249: aload_3
    //   250: astore_1
    //   251: goto -59 -> 192
    //   254: astore 4
    //   256: aload_1
    //   257: astore_2
    //   258: aload_3
    //   259: astore_1
    //   260: goto -68 -> 192
    //   263: astore_3
    //   264: goto -120 -> 144
    //   267: astore_2
    //   268: aload_3
    //   269: astore 4
    //   271: aload_2
    //   272: astore_3
    //   273: goto -129 -> 144
    //   276: aload_1
    //   277: astore_2
    //   278: goto -142 -> 136
    //   281: astore_1
    //   282: aload_3
    //   283: astore_2
    //   284: goto -57 -> 227
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	287	0	this	AnalyticsWorker
    //   58	113	1	localCursor	android.database.Cursor
    //   182	5	1	localObject1	Object
    //   191	47	1	localObject2	Object
    //   239	9	1	localObject3	Object
    //   250	27	1	localObject4	Object
    //   281	1	1	localObject5	Object
    //   4	254	2	localObject6	Object
    //   267	5	2	localSQLException1	SQLException
    //   277	7	2	localObject7	Object
    //   6	129	3	localObject8	Object
    //   141	15	3	localSQLException2	SQLException
    //   193	66	3	localObject9	Object
    //   263	6	3	localSQLException3	SQLException
    //   272	11	3	localSQLException4	SQLException
    //   1	176	4	localObject10	Object
    //   188	16	4	localException1	Exception
    //   243	1	4	localException2	Exception
    //   254	1	4	localException3	Exception
    //   269	1	4	localObject11	Object
    //   8	52	5	localObject12	Object
    //   14	170	6	localObject13	Object
    // Exception table:
    //   from	to	target	type
    //   19	59	141	android/database/SQLException
    //   128	134	182	finally
    //   136	139	182	finally
    //   170	176	182	finally
    //   183	186	182	finally
    //   216	222	182	finally
    //   231	237	182	finally
    //   237	239	182	finally
    //   19	59	188	java/lang/Exception
    //   64	73	239	finally
    //   75	83	239	finally
    //   85	96	239	finally
    //   98	109	239	finally
    //   111	122	239	finally
    //   146	163	239	finally
    //   64	73	243	java/lang/Exception
    //   75	83	243	java/lang/Exception
    //   85	96	254	java/lang/Exception
    //   98	109	254	java/lang/Exception
    //   111	122	254	java/lang/Exception
    //   64	73	263	android/database/SQLException
    //   75	83	263	android/database/SQLException
    //   85	96	267	android/database/SQLException
    //   98	109	267	android/database/SQLException
    //   111	122	267	android/database/SQLException
    //   19	59	281	finally
    //   194	212	281	finally
  }
  
  protected static boolean networkConnectivity(Context paramContext)
  {
    bool = true;
    if (paramContext != null) {}
    for (;;)
    {
      try
      {
        paramContext = (ConnectivityManager)paramContext.getSystemService("connectivity");
        if (paramContext != null)
        {
          paramContext = paramContext.getActiveNetworkInfo();
          if (paramContext != null)
          {
            if (paramContext.isAvailable())
            {
              bool = paramContext.isConnected();
              if (bool)
              {
                bool = true;
                return bool;
              }
            }
            bool = false;
            continue;
          }
        }
      }
      catch (NullPointerException paramContext)
      {
        bool = true;
        StaticMethods.logWarningFormat("Analytics - Unable to determine connectivity status due to an unexpected error (%s)", new Object[] { paramContext.getLocalizedMessage() });
        return bool;
      }
      catch (SecurityException paramContext)
      {
        bool = true;
        StaticMethods.logErrorFormat("Analytics - Unable to access connectivity status due to a security error (%s)", new Object[] { paramContext.getLocalizedMessage() });
        return bool;
      }
      catch (Exception paramContext)
      {
        bool = true;
        StaticMethods.logWarningFormat("Analytics - Unable to access connectivity status due to an unexpected error (%s)", new Object[] { paramContext.getLocalizedMessage() });
        return bool;
      }
      try
      {
        StaticMethods.logWarningFormat("Analytics - Unable to determine connectivity status due to there being no default network currently active", new Object[0]);
        bool = false;
      }
      catch (Exception paramContext)
      {
        bool = false;
      }
      catch (SecurityException paramContext)
      {
        bool = false;
      }
      catch (NullPointerException paramContext)
      {
        bool = false;
      }
    }
    StaticMethods.logWarningFormat("Analytics - Unable to determine connectivity status due to the system service requested being unrecognized", new Object[0]);
    return true;
  }
  
  public static AnalyticsWorker sharedInstance()
  {
    synchronized (_instanceMutex)
    {
      if (_instance == null) {
        _instance = new AnalyticsWorker();
      }
      AnalyticsWorker localAnalyticsWorker = _instance;
      return localAnalyticsWorker;
    }
  }
  
  private void updateHitInDatabase(Hit paramHit)
  {
    try
    {
      synchronized (dbMutex)
      {
        try
        {
          ContentValues localContentValues = new ContentValues();
          localContentValues.put("URL", urlFragment);
          database.update("HITS", localContentValues, "id=" + identifier, null);
          return;
        }
        catch (SQLException paramHit)
        {
          for (;;)
          {
            StaticMethods.logErrorFormat("Analytics - Unable to update url in database (%s)", new Object[] { paramHit.getMessage() });
          }
        }
      }
    }
    catch (Exception paramHit)
    {
      for (;;)
      {
        StaticMethods.logErrorFormat("Analytics - Unknown error updating url in database (%s)", new Object[] { paramHit.getMessage() });
      }
    }
  }
  
  protected void clearTrackingQueue()
  {
    try
    {
      synchronized (dbMutex)
      {
        try
        {
          database.delete("HITS", null, null);
          numberOfUnsentHits = 0L;
          return;
        }
        catch (NullPointerException localNullPointerException)
        {
          for (;;)
          {
            StaticMethods.logErrorFormat("Analytics - Unable to clear tracking queue due to an unopened database (%s)", new Object[] { localNullPointerException.getLocalizedMessage() });
          }
        }
      }
    }
    catch (SQLException localSQLException)
    {
      for (;;)
      {
        StaticMethods.logErrorFormat("Analytics - Unable to clear tracking queue due to a sql error (%s)", new Object[] { localSQLException.getLocalizedMessage() });
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        StaticMethods.logErrorFormat("Analytics - Unable to clear tracking queue due to an unexpected error (%s)", new Object[] { localException.getLocalizedMessage() });
      }
    }
  }
  
  protected void forceKick()
  {
    kick(true);
  }
  
  protected long getTrackingQueueSize()
  {
    synchronized (dbMutex)
    {
      try
      {
        l = DatabaseUtils.queryNumEntries(database, "HITS");
        return l;
      }
      catch (NullPointerException localNullPointerException)
      {
        for (;;)
        {
          StaticMethods.logErrorFormat("Analytics - Unable to get tracking queue size due to an unopened database (%s)", new Object[] { localNullPointerException.getLocalizedMessage() });
          l = 0L;
        }
      }
      catch (SQLException localSQLException)
      {
        for (;;)
        {
          StaticMethods.logErrorFormat("Analytics - Unable to get tracking queue size due to a sql error (%s)", new Object[] { localSQLException.getLocalizedMessage() });
          l = 0L;
        }
      }
      catch (Exception localException)
      {
        for (;;)
        {
          StaticMethods.logErrorFormat("Analytics - Unable to get tracking queue size due to an unexpected error (%s)", new Object[] { localException.getLocalizedMessage() });
          long l = 0L;
        }
      }
    }
  }
  
  protected void initializeDatabase()
  {
    try
    {
      database.execSQL("CREATE TABLE IF NOT EXISTS HITS (ID INTEGER PRIMARY KEY AUTOINCREMENT, URL TEXT, TIMESTAMP INTEGER)");
      return;
    }
    catch (NullPointerException localNullPointerException)
    {
      StaticMethods.logErrorFormat("Analytics - Unable to create database due to an invalid path (%s)", new Object[] { localNullPointerException.getLocalizedMessage() });
      return;
    }
    catch (SQLException localSQLException)
    {
      StaticMethods.logErrorFormat("Analytics - Unable to create database due to a sql error (%s)", new Object[] { localSQLException.getLocalizedMessage() });
      return;
    }
    catch (Exception localException)
    {
      StaticMethods.logErrorFormat("Analytics - Unable to create database due to an unexpected error (%s)", new Object[] { localException.getLocalizedMessage() });
    }
  }
  
  protected void kick(boolean paramBoolean)
  {
    Object localObject2 = MobileConfig.getInstance();
    if ((!ReferrerHandler.getReferrerProcessed()) && (((MobileConfig)localObject2).getReferrerTimeout() > 0)) {
      synchronized (referrerTimerMutex)
      {
        localObject2 = referrerTask;
        if (localObject2 == null) {}
        try
        {
          referrerTask = new ReferrerTimeoutTask(paramBoolean);
          referrerTimer = new Timer();
          referrerTimer.schedule(referrerTask, MobileConfig.getInstance().getReferrerTimeout() * 1000);
          return;
        }
        catch (Exception localException1)
        {
          for (;;)
          {
            StaticMethods.logErrorFormat("Analytics - Error creating referrer timer (%s)", new Object[] { localException1.getMessage() });
          }
        }
      }
    }
    if (referrerTimer != null) {}
    for (;;)
    {
      synchronized (referrerTimerMutex)
      {
        try
        {
          referrerTimer.cancel();
          referrerTask = null;
          if (((MobileConfig)localObject3).getPrivacyStatus() != MobilePrivacyStatus.MOBILE_PRIVACY_STATUS_OPT_IN) {
            break;
          }
          if ((!((MobileConfig)localObject3).getOfflineTrackingEnabled()) || (numberOfUnsentHits > ((MobileConfig)localObject3).getBatchLimit()))
          {
            i = 1;
            if ((i == 0) && (!paramBoolean)) {
              break;
            }
            bringOnline();
            return;
          }
        }
        catch (Exception localException2)
        {
          StaticMethods.logErrorFormat("Analytics - Error cancelling referrer timer (%s)", new Object[] { localException2.getMessage() });
          continue;
        }
      }
      int i = 0;
    }
  }
  
  protected void kickWithReferrerData(Map paramMap)
  {
    Hit localHit = getFirstHitInQueue();
    if ((localHit != null) && (urlFragment != null))
    {
      StringBuilder localStringBuilder = new StringBuilder(urlFragment);
      StaticMethods.serializeToQueryString(paramMap, localStringBuilder);
      urlFragment = localStringBuilder.toString();
      updateHitInDatabase(localHit);
      ReferrerHandler.setReferrerProcessed(true);
    }
    kick(false);
  }
  
  protected void postReset()
  {
    numberOfUnsentHits = 0L;
  }
  
  protected void preMigrate()
  {
    File localFile1 = new File(StaticMethods.getCacheDirectory() + "ADBMobileDataCache.sqlite");
    File localFile2 = new File(StaticMethods.getCacheDirectory(), "ADBMobileDataCache.sqlite");
    if ((localFile1.exists()) && (!localFile2.exists())) {}
    try
    {
      if (!localFile1.renameTo(localFile2)) {
        StaticMethods.logWarningFormat("Analytics - Unable to migrate old hits db, creating new hits db (move file returned false)", new Object[0]);
      }
      return;
    }
    catch (Exception localException)
    {
      StaticMethods.logWarningFormat("Analytics - Unable to migrate old hits db, creating new hits db (%s)", new Object[] { localException.getLocalizedMessage() });
    }
  }
  
  protected void prepareStatements()
  {
    try
    {
      _preparedInsertStatement = database.compileStatement("INSERT INTO HITS (URL, TIMESTAMP) VALUES (?, ?)");
      return;
    }
    catch (NullPointerException localNullPointerException)
    {
      StaticMethods.logErrorFormat("Analytics - Unable to create database due to an invalid path (%s)", new Object[] { localNullPointerException.getLocalizedMessage() });
      return;
    }
    catch (SQLException localSQLException)
    {
      StaticMethods.logErrorFormat("Analytics - Unable to create database due to a sql error (%s)", new Object[] { localSQLException.getLocalizedMessage() });
      return;
    }
    catch (Exception localException)
    {
      StaticMethods.logErrorFormat("Analytics - Unable to create database due to an unexpected error (%s)", new Object[] { localException.getLocalizedMessage() });
    }
  }
  
  protected void queue(String paramString, long paramLong)
  {
    ??? = MobileConfig.getInstance();
    if (??? == null)
    {
      StaticMethods.logErrorFormat("Analytics - Cannot send hit, MobileConfig is null (this really shouldn't happen)", new Object[0]);
      return;
    }
    if (((MobileConfig)???).getPrivacyStatus() == MobilePrivacyStatus.MOBILE_PRIVACY_STATUS_OPT_OUT)
    {
      StaticMethods.logDebugFormat("Analytics - Ignoring hit due to privacy status being opted out", new Object[0]);
      return;
    }
    try
    {
      synchronized (dbMutex)
      {
        try
        {
          _preparedInsertStatement.bindString(1, paramString);
          _preparedInsertStatement.bindLong(2, paramLong);
          _preparedInsertStatement.execute();
          StaticMethods.updateLastKnownTimestamp(Long.valueOf(paramLong));
          numberOfUnsentHits += 1L;
          _preparedInsertStatement.clearBindings();
          kick(false);
          return;
        }
        catch (SQLException localSQLException)
        {
          for (;;)
          {
            StaticMethods.logErrorFormat("Analytics - Unable to insert url (%s)", new Object[] { paramString });
            resetDatabase(localSQLException);
          }
        }
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        StaticMethods.logErrorFormat("Analytics - Unknown error while inserting url (%s)", new Object[] { paramString });
        resetDatabase(localException);
      }
    }
  }
  
  protected void startNotifier()
  {
    IntentFilter localIntentFilter = new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE");
    try
    {
      Context localContext = StaticMethods.getSharedContext().getApplicationContext();
      if (localContext == null) {
        return;
      }
    }
    catch (StaticMethods.NullContextException localNullContextException)
    {
      Object localObject;
      for (;;)
      {
        StaticMethods.logErrorFormat("Analytics - Error registering network receiver (%s)", new Object[] { localNullContextException.getMessage() });
        localObject = null;
      }
      ((Context)localObject).registerReceiver(new AnalyticsWorker.1(this), localIntentFilter);
    }
  }
  
  protected static class Hit
  {
    String identifier;
    long timestamp;
    String urlFragment;
  }
  
  protected class ReferrerTimeoutTask
    extends TimerTask
  {
    private boolean kickFlag = false;
    
    ReferrerTimeoutTask(boolean paramBoolean)
    {
      kickFlag = paramBoolean;
    }
    
    public void run()
    {
      ReferrerHandler.setReferrerProcessed(true);
      StaticMethods.logDebugFormat("Analytics - Referrer timeout has expired without referrer data", new Object[0]);
      kick(kickFlag);
    }
  }
  
  private static class WorkerThreadRunner
    implements Runnable
  {
    public void run()
    {
      AnalyticsWorker localAnalyticsWorker = AnalyticsWorker.sharedInstance();
      Process.setThreadPriority(10);
      HashMap localHashMap = new HashMap();
      localHashMap.put("Accept-Language", StaticMethods.getDefaultAcceptLanguage());
      localHashMap.put("User-Agent", StaticMethods.getDefaultUserAgent());
      for (;;)
      {
        AnalyticsWorker.Hit localHit;
        if ((MobileConfig.getInstance().getPrivacyStatus() == MobilePrivacyStatus.MOBILE_PRIVACY_STATUS_OPT_IN) && (AnalyticsWorker.networkAvailable))
        {
          localHit = localAnalyticsWorker.getFirstHitInQueue();
          if (localHit != null) {
            break label81;
          }
        }
        for (;;)
        {
          AnalyticsWorker.access$602(false);
          return;
          label81:
          Object localObject;
          String str;
          if (MobileConfig.getInstance().getOfflineTrackingEnabled()) {
            if (timestamp - lastHitTimestamp < 0L)
            {
              long l = lastHitTimestamp + 1L;
              localObject = "&ts=" + Long.toString(timestamp);
              str = "&ts=" + Long.toString(l);
              urlFragment = urlFragment.replaceFirst((String)localObject, str);
              StaticMethods.logDebugFormat("Analytics - Adjusting out of order hit timestamp(%d->%d)", new Object[] { Long.valueOf(timestamp), Long.valueOf(l) });
              timestamp = l;
            }
          }
          do
          {
            str = urlFragment;
            localObject = str;
            if (!str.startsWith("ndh")) {
              localObject = str.substring(str.indexOf('?') + 1);
            }
            if (!RequestHandler.sendAnalyticsRequest(AnalyticsWorker.access$400() + AnalyticsWorker.randomGen.nextInt(100000000), (String)localObject, localHashMap, 5000)) {
              break label372;
            }
            try
            {
              localAnalyticsWorker.deleteHit(identifier);
              AnalyticsWorker.access$202(localAnalyticsWorker, timestamp);
            }
            catch (AbstractDatabaseBacking.CorruptedDatabaseException localCorruptedDatabaseException2)
            {
              AnalyticsWorker.sharedInstance().resetDatabase(localCorruptedDatabaseException2);
            }
          } while (timestamp >= StaticMethods.getTimeSince1970() - 60L);
          try
          {
            localAnalyticsWorker.deleteHit(identifier);
          }
          catch (AbstractDatabaseBacking.CorruptedDatabaseException localCorruptedDatabaseException1)
          {
            AnalyticsWorker.sharedInstance().resetDatabase(localCorruptedDatabaseException1);
          }
          continue;
          continue;
          label372:
          StaticMethods.logWarningFormat("Analytics - Unable to send hit", new Object[0]);
          int i;
          if (MobileConfig.getInstance().getOfflineTrackingEnabled())
          {
            StaticMethods.logDebugFormat("Analytics - Network error, imposing internal cooldown(%d seconds)", new Object[] { Long.valueOf(30L) });
            i = 0;
            if (i >= 30L) {
              break;
            }
          }
          try
          {
            if (!AnalyticsWorker.networkAvailable) {
              break;
            }
            Thread.sleep(1000L);
            i += 1;
          }
          catch (Exception localException)
          {
            StaticMethods.logWarningFormat("Analytics - Background Thread Interrupted(%s)", new Object[] { localException.getMessage() });
          }
          try
          {
            localAnalyticsWorker.deleteHit(identifier);
          }
          catch (AbstractDatabaseBacking.CorruptedDatabaseException localCorruptedDatabaseException3)
          {
            AnalyticsWorker.sharedInstance().resetDatabase(localCorruptedDatabaseException3);
          }
        }
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.AnalyticsWorker
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */