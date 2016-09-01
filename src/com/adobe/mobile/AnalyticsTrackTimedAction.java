package com.adobe.mobile;

import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteStatement;
import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ExecutorService;

final class AnalyticsTrackTimedAction
  extends AbstractDatabaseBacking
{
  private static final String TIMED_ACTION_IN_APP_TIME_KEY = "a.action.time.inapp";
  private static final String TIMED_ACTION_TOTAL_TIME_KEY = "a.action.time.total";
  private static AnalyticsTrackTimedAction _instance = null;
  private static final Object _instanceMutex = new Object();
  private SQLiteStatement sqlDeleteAction;
  private SQLiteStatement sqlDeleteContextDataForAction;
  private String sqlExistsAction;
  private String sqlExistsContextDataByActionAndKey;
  private SQLiteStatement sqlInsertAction;
  private SQLiteStatement sqlInsertContextData;
  private String sqlSelectAction;
  private String sqlSelectContextDataForAction;
  private SQLiteStatement sqlUpdateAction;
  private SQLiteStatement sqlUpdateActionsClearAdjustedTime;
  private SQLiteStatement sqlUpdateContextData;
  
  private AnalyticsTrackTimedAction()
  {
    initDatabaseBacking(new File(StaticMethods.getCacheDirectory(), "ADBMobileTimedActionsCache.sqlite"));
  }
  
  private void deleteTimedAction(int paramInt)
  {
    try
    {
      synchronized (dbMutex)
      {
        try
        {
          sqlDeleteContextDataForAction.bindLong(1, paramInt);
          sqlDeleteContextDataForAction.execute();
          sqlDeleteAction.bindLong(1, paramInt);
          sqlDeleteAction.execute();
          sqlDeleteContextDataForAction.clearBindings();
          sqlDeleteAction.clearBindings();
          return;
        }
        catch (SQLException localSQLException)
        {
          for (;;)
          {
            StaticMethods.logErrorFormat("Analytics - Unable to delete the timed action (ID = %d, Exception: %s)", new Object[] { Integer.valueOf(paramInt), localSQLException.getMessage() });
            resetDatabase(localSQLException);
          }
        }
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        StaticMethods.logErrorFormat("Analytics - Unknown error deleting timed action (%s)", new Object[] { localException.getMessage() });
      }
    }
  }
  
  /* Error */
  private AnalyticsTimedAction getTimedAction(String paramString)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 4
    //   3: aconst_null
    //   4: astore 5
    //   6: aconst_null
    //   7: astore 6
    //   9: aload_1
    //   10: ifnull +13 -> 23
    //   13: aload_1
    //   14: invokevirtual 112	java/lang/String:trim	()Ljava/lang/String;
    //   17: invokevirtual 116	java/lang/String:length	()I
    //   20: ifne +14 -> 34
    //   23: ldc 118
    //   25: iconst_0
    //   26: anewarray 33	java/lang/Object
    //   29: invokestatic 121	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   32: aconst_null
    //   33: areturn
    //   34: aload_0
    //   35: getfield 66	com/adobe/mobile/AnalyticsTrackTimedAction:dbMutex	Ljava/lang/Object;
    //   38: astore 7
    //   40: aload 7
    //   42: monitorenter
    //   43: aload_0
    //   44: getfield 125	com/adobe/mobile/AnalyticsTrackTimedAction:database	Landroid/database/sqlite/SQLiteDatabase;
    //   47: ifnonnull +8 -> 55
    //   50: aload 7
    //   52: monitorexit
    //   53: aconst_null
    //   54: areturn
    //   55: aload 4
    //   57: astore_3
    //   58: aload 5
    //   60: astore_2
    //   61: aload_0
    //   62: getfield 125	com/adobe/mobile/AnalyticsTrackTimedAction:database	Landroid/database/sqlite/SQLiteDatabase;
    //   65: aload_0
    //   66: getfield 127	com/adobe/mobile/AnalyticsTrackTimedAction:sqlSelectAction	Ljava/lang/String;
    //   69: iconst_1
    //   70: anewarray 109	java/lang/String
    //   73: dup
    //   74: iconst_0
    //   75: aload_1
    //   76: aastore
    //   77: invokevirtual 133	android/database/sqlite/SQLiteDatabase:rawQuery	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   80: astore 8
    //   82: aload 6
    //   84: astore_1
    //   85: aload 4
    //   87: astore_3
    //   88: aload 5
    //   90: astore_2
    //   91: aload 8
    //   93: invokeinterface 139 1 0
    //   98: ifeq +127 -> 225
    //   101: aload 4
    //   103: astore_3
    //   104: aload 5
    //   106: astore_2
    //   107: new 141	com/adobe/mobile/AnalyticsTimedAction
    //   110: dup
    //   111: aconst_null
    //   112: aload 8
    //   114: iconst_1
    //   115: invokeinterface 145 2 0
    //   120: aload 8
    //   122: iconst_2
    //   123: invokeinterface 145 2 0
    //   128: aload 8
    //   130: iconst_0
    //   131: invokeinterface 149 2 0
    //   136: invokespecial 152	com/adobe/mobile/AnalyticsTimedAction:<init>	(Ljava/util/Map;JJI)V
    //   139: astore_1
    //   140: aload_0
    //   141: getfield 125	com/adobe/mobile/AnalyticsTrackTimedAction:database	Landroid/database/sqlite/SQLiteDatabase;
    //   144: aload_0
    //   145: getfield 154	com/adobe/mobile/AnalyticsTrackTimedAction:sqlSelectContextDataForAction	Ljava/lang/String;
    //   148: iconst_1
    //   149: anewarray 109	java/lang/String
    //   152: dup
    //   153: iconst_0
    //   154: aload_1
    //   155: getfield 158	com/adobe/mobile/AnalyticsTimedAction:databaseID	I
    //   158: invokestatic 161	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   161: aastore
    //   162: invokevirtual 133	android/database/sqlite/SQLiteDatabase:rawQuery	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   165: astore_2
    //   166: aload_2
    //   167: invokeinterface 139 1 0
    //   172: ifeq +47 -> 219
    //   175: aload_1
    //   176: new 163	java/util/HashMap
    //   179: dup
    //   180: invokespecial 164	java/util/HashMap:<init>	()V
    //   183: putfield 168	com/adobe/mobile/AnalyticsTimedAction:contextData	Ljava/util/Map;
    //   186: aload_1
    //   187: getfield 168	com/adobe/mobile/AnalyticsTimedAction:contextData	Ljava/util/Map;
    //   190: aload_2
    //   191: iconst_0
    //   192: invokeinterface 171 2 0
    //   197: aload_2
    //   198: iconst_1
    //   199: invokeinterface 171 2 0
    //   204: invokeinterface 177 3 0
    //   209: pop
    //   210: aload_2
    //   211: invokeinterface 180 1 0
    //   216: ifne -30 -> 186
    //   219: aload_2
    //   220: invokeinterface 183 1 0
    //   225: aload_1
    //   226: astore_3
    //   227: aload_1
    //   228: astore_2
    //   229: aload 8
    //   231: invokeinterface 183 1 0
    //   236: aload 7
    //   238: monitorexit
    //   239: aload_1
    //   240: areturn
    //   241: astore_1
    //   242: aload 7
    //   244: monitorexit
    //   245: aload_1
    //   246: athrow
    //   247: astore_2
    //   248: ldc -71
    //   250: iconst_1
    //   251: anewarray 33	java/lang/Object
    //   254: dup
    //   255: iconst_0
    //   256: aload_2
    //   257: invokevirtual 94	android/database/SQLException:getMessage	()Ljava/lang/String;
    //   260: aastore
    //   261: invokestatic 98	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   264: aload_0
    //   265: aload_2
    //   266: invokevirtual 102	com/adobe/mobile/AnalyticsTrackTimedAction:resetDatabase	(Ljava/lang/Exception;)V
    //   269: aload_3
    //   270: astore_1
    //   271: goto -35 -> 236
    //   274: ldc -69
    //   276: iconst_1
    //   277: anewarray 33	java/lang/Object
    //   280: dup
    //   281: iconst_0
    //   282: aload_1
    //   283: invokevirtual 105	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   286: aastore
    //   287: invokestatic 98	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   290: aload_2
    //   291: astore_1
    //   292: goto -56 -> 236
    //   295: astore_3
    //   296: aload_1
    //   297: astore_2
    //   298: aload_3
    //   299: astore_1
    //   300: goto -26 -> 274
    //   303: astore_2
    //   304: aload_1
    //   305: astore_3
    //   306: goto -58 -> 248
    //   309: astore_1
    //   310: goto -36 -> 274
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	313	0	this	AnalyticsTrackTimedAction
    //   0	313	1	paramString	String
    //   60	169	2	localObject1	Object
    //   247	44	2	localSQLException1	SQLException
    //   297	1	2	str1	String
    //   303	1	2	localSQLException2	SQLException
    //   57	213	3	localObject2	Object
    //   295	4	3	localException	Exception
    //   305	1	3	str2	String
    //   1	101	4	localObject3	Object
    //   4	101	5	localObject4	Object
    //   7	76	6	localObject5	Object
    //   38	205	7	localObject6	Object
    //   80	150	8	localCursor	Cursor
    // Exception table:
    //   from	to	target	type
    //   43	53	241	finally
    //   61	82	241	finally
    //   91	101	241	finally
    //   107	140	241	finally
    //   140	186	241	finally
    //   186	219	241	finally
    //   219	225	241	finally
    //   229	236	241	finally
    //   236	239	241	finally
    //   242	245	241	finally
    //   248	269	241	finally
    //   274	290	241	finally
    //   61	82	247	android/database/SQLException
    //   91	101	247	android/database/SQLException
    //   107	140	247	android/database/SQLException
    //   229	236	247	android/database/SQLException
    //   140	186	295	java/lang/Exception
    //   186	219	295	java/lang/Exception
    //   219	225	295	java/lang/Exception
    //   140	186	303	android/database/SQLException
    //   186	219	303	android/database/SQLException
    //   219	225	303	android/database/SQLException
    //   61	82	309	java/lang/Exception
    //   91	101	309	java/lang/Exception
    //   107	140	309	java/lang/Exception
    //   229	236	309	java/lang/Exception
  }
  
  /* Error */
  private void insertTimedAction(String paramString, Map paramMap, long paramLong)
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnull +13 -> 14
    //   4: aload_1
    //   5: invokevirtual 112	java/lang/String:trim	()Ljava/lang/String;
    //   8: invokevirtual 116	java/lang/String:length	()I
    //   11: ifne +13 -> 24
    //   14: ldc -65
    //   16: iconst_0
    //   17: anewarray 33	java/lang/Object
    //   20: invokestatic 121	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   23: return
    //   24: aload_0
    //   25: getfield 66	com/adobe/mobile/AnalyticsTrackTimedAction:dbMutex	Ljava/lang/Object;
    //   28: astore 5
    //   30: aload 5
    //   32: monitorenter
    //   33: aload_0
    //   34: getfield 193	com/adobe/mobile/AnalyticsTrackTimedAction:sqlInsertAction	Landroid/database/sqlite/SQLiteStatement;
    //   37: iconst_1
    //   38: aload_1
    //   39: invokevirtual 197	android/database/sqlite/SQLiteStatement:bindString	(ILjava/lang/String;)V
    //   42: aload_0
    //   43: getfield 193	com/adobe/mobile/AnalyticsTrackTimedAction:sqlInsertAction	Landroid/database/sqlite/SQLiteStatement;
    //   46: iconst_2
    //   47: lload_3
    //   48: invokevirtual 74	android/database/sqlite/SQLiteStatement:bindLong	(IJ)V
    //   51: aload_0
    //   52: getfield 193	com/adobe/mobile/AnalyticsTrackTimedAction:sqlInsertAction	Landroid/database/sqlite/SQLiteStatement;
    //   55: invokevirtual 201	android/database/sqlite/SQLiteStatement:executeInsert	()J
    //   58: ldc2_w 202
    //   61: lcmp
    //   62: ifne +16 -> 78
    //   65: ldc -51
    //   67: iconst_1
    //   68: anewarray 33	java/lang/Object
    //   71: dup
    //   72: iconst_0
    //   73: aload_1
    //   74: aastore
    //   75: invokestatic 121	com/adobe/mobile/StaticMethods:logWarningFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   78: aload_0
    //   79: getfield 193	com/adobe/mobile/AnalyticsTrackTimedAction:sqlInsertAction	Landroid/database/sqlite/SQLiteStatement;
    //   82: invokevirtual 82	android/database/sqlite/SQLiteStatement:clearBindings	()V
    //   85: aload 5
    //   87: monitorexit
    //   88: aload_0
    //   89: aload_1
    //   90: aload_2
    //   91: invokespecial 209	com/adobe/mobile/AnalyticsTrackTimedAction:saveContextDataForTimedAction	(Ljava/lang/String;Ljava/util/Map;)V
    //   94: return
    //   95: astore 6
    //   97: ldc -45
    //   99: iconst_1
    //   100: anewarray 33	java/lang/Object
    //   103: dup
    //   104: iconst_0
    //   105: aload_1
    //   106: aastore
    //   107: invokestatic 98	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   110: aload_0
    //   111: aload 6
    //   113: invokevirtual 102	com/adobe/mobile/AnalyticsTrackTimedAction:resetDatabase	(Ljava/lang/Exception;)V
    //   116: goto -31 -> 85
    //   119: astore_1
    //   120: aload 5
    //   122: monitorexit
    //   123: aload_1
    //   124: athrow
    //   125: astore 6
    //   127: ldc -43
    //   129: iconst_1
    //   130: anewarray 33	java/lang/Object
    //   133: dup
    //   134: iconst_0
    //   135: aload 6
    //   137: invokevirtual 105	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   140: aastore
    //   141: invokestatic 98	com/adobe/mobile/StaticMethods:logErrorFormat	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   144: goto -59 -> 85
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	147	0	this	AnalyticsTrackTimedAction
    //   0	147	1	paramString	String
    //   0	147	2	paramMap	Map
    //   0	147	3	paramLong	long
    //   95	17	6	localSQLException	SQLException
    //   125	11	6	localException	Exception
    // Exception table:
    //   from	to	target	type
    //   33	78	95	android/database/SQLException
    //   78	85	95	android/database/SQLException
    //   33	78	119	finally
    //   78	85	119	finally
    //   85	88	119	finally
    //   97	116	119	finally
    //   120	123	119	finally
    //   127	144	119	finally
    //   33	78	125	java/lang/Exception
    //   78	85	125	java/lang/Exception
  }
  
  private void saveContextDataForTimedAction(String paramString, Map paramMap)
  {
    if ((paramString == null) || (paramString.trim().length() == 0))
    {
      StaticMethods.logWarningFormat("Analytics - Unable to save context data (timed action name was null or empty)", new Object[0]);
      return;
    }
    if ((paramMap == null) || (paramMap.isEmpty()))
    {
      StaticMethods.logWarningFormat("Analytics - Unable to save context data (context data was null or empty)", new Object[0]);
      return;
    }
    for (;;)
    {
      try
      {
        synchronized (dbMutex)
        {
          if (database == null)
          {
            StaticMethods.logErrorFormat("Analytics - Null Database Object, unable to save context data for timed action", new Object[0]);
            return;
          }
        }
        localObject2 = database.rawQuery(sqlSelectAction, new String[] { paramString });
        if (!((Cursor)localObject2).moveToFirst()) {
          continue;
        }
        i = ((Cursor)localObject2).getInt(0);
        ((Cursor)localObject2).close();
        localObject2 = paramMap.entrySet().iterator();
        if (!((Iterator)localObject2).hasNext()) {
          continue;
        }
        localEntry = (Map.Entry)((Iterator)localObject2).next();
        localObject3 = (String)localEntry.getKey();
        paramMap = localEntry.getValue();
        if ((localObject3 == null) || (((String)localObject3).length() <= 0)) {
          continue;
        }
        localObject3 = database.rawQuery(sqlExistsContextDataByActionAndKey, new String[] { String.valueOf(i), (String)localEntry.getKey() });
        if (paramMap != null) {
          continue;
        }
        paramMap = "";
      }
      catch (SQLException paramString)
      {
        Object localObject2;
        int i;
        Map.Entry localEntry;
        Object localObject3;
        StaticMethods.logErrorFormat("Analytics - SQL exception when attempting to update context data for timed action (%s)", new Object[] { paramString.getMessage() });
        return;
        ((Cursor)localObject2).close();
        StaticMethods.logWarningFormat("Analytics - Unable to save context data (no timed action was found matching the name %s)", new Object[] { paramString });
        return;
        paramMap = paramMap.toString();
        continue;
        sqlInsertContextData.bindLong(1, i);
        sqlInsertContextData.bindString(2, (String)localEntry.getKey());
        sqlInsertContextData.bindString(3, paramMap);
        if (sqlInsertContextData.executeInsert() != -1L) {
          continue;
        }
        StaticMethods.logWarningFormat("Analytics - Unable to insert the timed action's context data (%s)", new Object[] { paramString });
        sqlInsertContextData.clearBindings();
        continue;
      }
      catch (Exception paramString)
      {
        StaticMethods.logErrorFormat("Analytics - Unexpected exception when attempting to update context data for timed action (%s)", new Object[] { paramString.getMessage() });
        continue;
      }
      if ((!((Cursor)localObject3).moveToFirst()) || (((Cursor)localObject3).getInt(0) <= 0)) {
        continue;
      }
      sqlUpdateContextData.bindString(1, paramMap);
      sqlUpdateContextData.bindLong(2, i);
      sqlUpdateContextData.bindString(3, (String)localEntry.getKey());
      sqlUpdateContextData.execute();
      sqlUpdateContextData.clearBindings();
      ((Cursor)localObject3).close();
    }
  }
  
  public static AnalyticsTrackTimedAction sharedInstance()
  {
    synchronized (_instanceMutex)
    {
      if (_instance == null) {
        _instance = new AnalyticsTrackTimedAction();
      }
      AnalyticsTrackTimedAction localAnalyticsTrackTimedAction = _instance;
      return localAnalyticsTrackTimedAction;
    }
  }
  
  protected void initializeDatabase()
  {
    try
    {
      database.execSQL("CREATE TABLE IF NOT EXISTS TIMEDACTIONS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, STARTTIME INTEGER, ADJSTARTTIME INTEGER)");
      database.execSQL("CREATE TABLE IF NOT EXISTS CONTEXTDATA (ID INTEGER PRIMARY KEY AUTOINCREMENT, ACTIONID INTEGER, KEY TEXT, VALUE TEXT, FOREIGN KEY(ACTIONID) REFERENCES TIMEDACTIONS(ID))");
      return;
    }
    catch (SQLException localSQLException)
    {
      StaticMethods.logErrorFormat("Analytics - Unable to open or create timed actions database (%s)", new Object[] { localSQLException.getMessage() });
      return;
    }
    catch (Exception localException)
    {
      StaticMethods.logErrorFormat("Analytics - Uknown error creating timed actions database (%s)", new Object[] { localException.getMessage() });
    }
  }
  
  protected void preMigrate()
  {
    File localFile1 = new File(StaticMethods.getCacheDirectory() + "ADBMobileDataCache.sqlite" + "ADBMobileTimedActionsCache.sqlite");
    File localFile2 = new File(StaticMethods.getCacheDirectory(), "ADBMobileTimedActionsCache.sqlite");
    if ((localFile1.exists()) && (!localFile2.exists())) {}
    try
    {
      if (!localFile1.renameTo(localFile2)) {
        StaticMethods.logWarningFormat("Analytics - Unable to migrate old Timed Actions db, creating new Timed Actions db (move file returned false)", new Object[0]);
      }
      return;
    }
    catch (Exception localException)
    {
      StaticMethods.logWarningFormat("Analytics - Unable to migrate old Timed Actions db, creating new Timed Actions db (%s)", new Object[] { localException.getLocalizedMessage() });
    }
  }
  
  protected void prepareStatements()
  {
    sqlSelectAction = "SELECT ID, STARTTIME, ADJSTARTTIME FROM TIMEDACTIONS WHERE NAME=?";
    sqlExistsAction = "SELECT COUNT(*) FROM TIMEDACTIONS WHERE NAME=?";
    sqlSelectContextDataForAction = "SELECT KEY, VALUE FROM CONTEXTDATA WHERE ACTIONID=?";
    sqlExistsContextDataByActionAndKey = "SELECT COUNT(*) FROM CONTEXTDATA WHERE ACTIONID=? AND KEY=?";
    try
    {
      sqlInsertAction = database.compileStatement("INSERT INTO TIMEDACTIONS (NAME, STARTTIME, ADJSTARTTIME) VALUES (@NAME, @START, @START)");
      sqlUpdateAction = database.compileStatement("UPDATE TIMEDACTIONS SET ADJSTARTTIME=ADJSTARTTIME+@DELTA WHERE ADJSTARTTIME!=0");
      sqlUpdateActionsClearAdjustedTime = database.compileStatement("UPDATE TIMEDACTIONS SET ADJSTARTTIME=0");
      sqlDeleteAction = database.compileStatement("DELETE FROM TIMEDACTIONS WHERE ID=@ID");
      sqlInsertContextData = database.compileStatement("INSERT INTO CONTEXTDATA(ACTIONID, KEY, VALUE) VALUES (@ACTIONID, @KEY, @VALUE)");
      sqlUpdateContextData = database.compileStatement("UPDATE CONTEXTDATA SET VALUE=@VALUE WHERE ACTIONID=@ACTIONID AND KEY=@KEY");
      sqlDeleteContextDataForAction = database.compileStatement("DELETE FROM CONTEXTDATA WHERE ACTIONID=@ACTIONID");
      return;
    }
    catch (SQLException localSQLException)
    {
      StaticMethods.logErrorFormat("Analytics - unable to prepare the needed SQL statements for interacting with the timed actions database (%s)", new Object[] { localSQLException.getMessage() });
      return;
    }
    catch (Exception localException)
    {
      StaticMethods.logErrorFormat("Analytics - Unknown error preparing sql statements (%s)", new Object[] { localException.getMessage() });
    }
  }
  
  protected void trackTimedActionEnd(String paramString, Analytics.TimedActionBlock paramTimedActionBlock)
  {
    if ((paramString == null) || (paramString.trim().length() == 0))
    {
      StaticMethods.logWarningFormat("Analytics - Unable to end the timed action (timed action name was null or empty)", new Object[0]);
      return;
    }
    AnalyticsTimedAction localAnalyticsTimedAction = getTimedAction(paramString);
    if (localAnalyticsTimedAction != null)
    {
      Object localObject = Long.valueOf(StaticMethods.getTimeSince1970());
      long l1;
      if (adjustedStartTime == 0L)
      {
        l1 = 0L;
        long l2 = ((Long)localObject).longValue() - startTime;
        if (contextData == null) {
          break label195;
        }
        localObject = new HashMap(contextData);
        label92:
        if ((paramTimedActionBlock != null) && (!((Boolean)paramTimedActionBlock.call(l1, l2, (Map)localObject)).booleanValue())) {
          break label207;
        }
        ((HashMap)localObject).put("a.action.time.total", String.valueOf(l2));
        if (adjustedStartTime != 0L) {
          ((HashMap)localObject).put("a.action.time.inapp", String.valueOf(l1));
        }
        StaticMethods.getAnalyticsExecutor().execute(new AnalyticsTrackTimedAction.1(this, paramString, (HashMap)localObject));
      }
      for (;;)
      {
        deleteTimedAction(databaseID);
        return;
        l1 = ((Long)localObject).longValue() - adjustedStartTime;
        break;
        label195:
        localObject = new HashMap();
        break label92;
        label207:
        StaticMethods.logDebugFormat("Analytics - Not sending hit for timed action due to block cancellation (%s)", new Object[] { paramString });
      }
    }
    StaticMethods.logWarningFormat("Analytics - Unable to end a timed action that has not yet begun (no timed action was found matching the name %s)", new Object[] { paramString });
  }
  
  protected boolean trackTimedActionExists(String paramString)
  {
    boolean bool4 = true;
    boolean bool5 = false;
    boolean bool6 = false;
    boolean bool1 = false;
    if ((paramString == null) || (paramString.trim().length() == 0))
    {
      StaticMethods.logWarningFormat("Analytics - Unable to verify the existence of timed action (timed action name was null or empty)", new Object[0]);
      return false;
    }
    synchronized (dbMutex)
    {
      if (database == null) {
        return false;
      }
    }
    boolean bool2 = bool5;
    boolean bool3 = bool6;
    try
    {
      paramString = database.rawQuery(sqlExistsAction, new String[] { paramString });
      bool2 = bool5;
      bool3 = bool6;
      if (paramString.moveToFirst())
      {
        bool2 = bool5;
        bool3 = bool6;
        if (paramString.getInt(0) <= 0) {
          break label196;
        }
        bool1 = bool4;
        break label193;
      }
      bool2 = bool1;
      bool3 = bool1;
      paramString.close();
    }
    catch (SQLException paramString)
    {
      for (;;)
      {
        StaticMethods.logErrorFormat("Analytics - Unable to query timed actions database (%s)", new Object[] { paramString.getMessage() });
        bool1 = bool2;
      }
    }
    catch (Exception paramString)
    {
      for (;;)
      {
        StaticMethods.logErrorFormat("Analytics - Unknown error checking for timed action (%s)", new Object[] { paramString.getMessage() });
        bool1 = bool3;
      }
    }
    return bool1;
    for (;;)
    {
      label193:
      break;
      label196:
      bool1 = false;
    }
  }
  
  protected void trackTimedActionStart(String paramString, Map paramMap)
  {
    if ((paramString == null) || (paramString.trim().length() == 0))
    {
      StaticMethods.logWarningFormat("Analytics - trackTimedActionStart() failed(the required parameter actionName was null or empty.)", new Object[0]);
      return;
    }
    long l = StaticMethods.getTimeSince1970();
    AnalyticsTimedAction localAnalyticsTimedAction = getTimedAction(paramString);
    if (localAnalyticsTimedAction != null) {
      deleteTimedAction(databaseID);
    }
    insertTimedAction(paramString, paramMap, l);
  }
  
  protected void trackTimedActionUpdate(String paramString, Map paramMap)
  {
    if ((paramString == null) || (paramString.trim().length() == 0))
    {
      StaticMethods.logWarningFormat("Analytics - Unable to update the timed action (timed action name was null or empty)", new Object[0]);
      return;
    }
    if ((paramMap == null) || (paramMap.isEmpty()))
    {
      StaticMethods.logWarningFormat("Analytics - Unable to update the timed action (context data was null or empty)", new Object[0]);
      return;
    }
    saveContextDataForTimedAction(paramString, paramMap);
  }
  
  protected void trackTimedActionUpdateActionsClearAdjustedStartTime()
  {
    try
    {
      synchronized (dbMutex)
      {
        try
        {
          sqlUpdateActionsClearAdjustedTime.execute();
          sqlUpdateActionsClearAdjustedTime.clearBindings();
          return;
        }
        catch (SQLException localSQLException)
        {
          for (;;)
          {
            StaticMethods.logErrorFormat("Analytics - Unable to update adjusted time for timed actions after crash (%s)", new Object[] { localSQLException.getMessage() });
            resetDatabase(localSQLException);
          }
        }
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        StaticMethods.logErrorFormat("Analytics - Unknown error clearing adjusted start times for timed actions (%s)", new Object[] { localException.getMessage() });
        resetDatabase(localException);
      }
    }
  }
  
  protected void trackTimedActionUpdateAdjustedStartTime(long paramLong)
  {
    try
    {
      synchronized (dbMutex)
      {
        try
        {
          sqlUpdateAction.bindLong(1, paramLong);
          sqlUpdateAction.execute();
          sqlUpdateAction.clearBindings();
          return;
        }
        catch (SQLException localSQLException)
        {
          for (;;)
          {
            StaticMethods.logErrorFormat("Analytics - Unable to bind prepared statement values for updating the adjusted start time for timed action (%s)", new Object[] { localSQLException.getLocalizedMessage() });
            resetDatabase(localSQLException);
          }
        }
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        StaticMethods.logErrorFormat("Analytics - Unable to adjust start times for timed actions (%s)", new Object[] { localException.getMessage() });
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.AnalyticsTrackTimedAction
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */