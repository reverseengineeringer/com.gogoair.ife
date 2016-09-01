package android.support.v7.widget;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.database.DataSetObservable;
import android.os.AsyncTask;
import android.support.v4.os.AsyncTaskCompat;
import android.text.TextUtils;
import android.util.Log;
import android.util.Xml;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.xmlpull.v1.XmlSerializer;

class ActivityChooserModel
  extends DataSetObservable
{
  private static final String ATTRIBUTE_ACTIVITY = "activity";
  private static final String ATTRIBUTE_TIME = "time";
  private static final String ATTRIBUTE_WEIGHT = "weight";
  private static final boolean DEBUG = false;
  private static final int DEFAULT_ACTIVITY_INFLATION = 5;
  private static final float DEFAULT_HISTORICAL_RECORD_WEIGHT = 1.0F;
  public static final String DEFAULT_HISTORY_FILE_NAME = "activity_choser_model_history.xml";
  public static final int DEFAULT_HISTORY_MAX_LENGTH = 50;
  private static final String HISTORY_FILE_EXTENSION = ".xml";
  private static final int INVALID_INDEX = -1;
  private static final String LOG_TAG = ActivityChooserModel.class.getSimpleName();
  private static final String TAG_HISTORICAL_RECORD = "historical-record";
  private static final String TAG_HISTORICAL_RECORDS = "historical-records";
  private static final Map sDataModelRegistry = new HashMap();
  private static final Object sRegistryLock = new Object();
  private final List mActivities = new ArrayList();
  private OnChooseActivityListener mActivityChoserModelPolicy;
  private ActivitySorter mActivitySorter = new DefaultSorter(null);
  private boolean mCanReadHistoricalData = true;
  private final Context mContext;
  private final List mHistoricalRecords = new ArrayList();
  private boolean mHistoricalRecordsChanged = true;
  private final String mHistoryFileName;
  private int mHistoryMaxSize = 50;
  private final Object mInstanceLock = new Object();
  private Intent mIntent;
  private boolean mReadShareHistoryCalled = false;
  private boolean mReloadActivities = false;
  
  private ActivityChooserModel(Context paramContext, String paramString)
  {
    mContext = paramContext.getApplicationContext();
    if ((!TextUtils.isEmpty(paramString)) && (!paramString.endsWith(".xml")))
    {
      mHistoryFileName = (paramString + ".xml");
      return;
    }
    mHistoryFileName = paramString;
  }
  
  private boolean addHisoricalRecord(HistoricalRecord paramHistoricalRecord)
  {
    boolean bool = mHistoricalRecords.add(paramHistoricalRecord);
    if (bool)
    {
      mHistoricalRecordsChanged = true;
      pruneExcessiveHistoricalRecordsIfNeeded();
      persistHistoricalDataIfNeeded();
      sortActivitiesIfNeeded();
      notifyChanged();
    }
    return bool;
  }
  
  private void ensureConsistentState()
  {
    boolean bool1 = loadActivitiesIfNeeded();
    boolean bool2 = readHistoricalDataIfNeeded();
    pruneExcessiveHistoricalRecordsIfNeeded();
    if ((bool1 | bool2))
    {
      sortActivitiesIfNeeded();
      notifyChanged();
    }
  }
  
  public static ActivityChooserModel get(Context paramContext, String paramString)
  {
    synchronized (sRegistryLock)
    {
      ActivityChooserModel localActivityChooserModel2 = (ActivityChooserModel)sDataModelRegistry.get(paramString);
      ActivityChooserModel localActivityChooserModel1 = localActivityChooserModel2;
      if (localActivityChooserModel2 == null)
      {
        localActivityChooserModel1 = new ActivityChooserModel(paramContext, paramString);
        sDataModelRegistry.put(paramString, localActivityChooserModel1);
      }
      return localActivityChooserModel1;
    }
  }
  
  private boolean loadActivitiesIfNeeded()
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (mReloadActivities)
    {
      bool1 = bool2;
      if (mIntent != null)
      {
        mReloadActivities = false;
        mActivities.clear();
        List localList = mContext.getPackageManager().queryIntentActivities(mIntent, 0);
        int j = localList.size();
        int i = 0;
        while (i < j)
        {
          ResolveInfo localResolveInfo = (ResolveInfo)localList.get(i);
          mActivities.add(new ActivityResolveInfo(localResolveInfo));
          i += 1;
        }
        bool1 = true;
      }
    }
    return bool1;
  }
  
  private void persistHistoricalDataIfNeeded()
  {
    if (!mReadShareHistoryCalled) {
      throw new IllegalStateException("No preceding call to #readHistoricalData");
    }
    if (!mHistoricalRecordsChanged) {}
    do
    {
      return;
      mHistoricalRecordsChanged = false;
    } while (TextUtils.isEmpty(mHistoryFileName));
    AsyncTaskCompat.executeParallel(new PersistHistoryAsyncTask(null), new Object[] { new ArrayList(mHistoricalRecords), mHistoryFileName });
  }
  
  private void pruneExcessiveHistoricalRecordsIfNeeded()
  {
    int j = mHistoricalRecords.size() - mHistoryMaxSize;
    if (j <= 0) {}
    for (;;)
    {
      return;
      mHistoricalRecordsChanged = true;
      int i = 0;
      while (i < j)
      {
        HistoricalRecord localHistoricalRecord = (HistoricalRecord)mHistoricalRecords.remove(0);
        i += 1;
      }
    }
  }
  
  private boolean readHistoricalDataIfNeeded()
  {
    if ((mCanReadHistoricalData) && (mHistoricalRecordsChanged) && (!TextUtils.isEmpty(mHistoryFileName)))
    {
      mCanReadHistoricalData = false;
      mReadShareHistoryCalled = true;
      readHistoricalDataImpl();
      return true;
    }
    return false;
  }
  
  /* Error */
  private void readHistoricalDataImpl()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 142	android/support/v7/widget/ActivityChooserModel:mContext	Landroid/content/Context;
    //   4: aload_0
    //   5: getfield 166	android/support/v7/widget/ActivityChooserModel:mHistoryFileName	Ljava/lang/String;
    //   8: invokevirtual 274	android/content/Context:openFileInput	(Ljava/lang/String;)Ljava/io/FileInputStream;
    //   11: astore_2
    //   12: invokestatic 280	android/util/Xml:newPullParser	()Lorg/xmlpull/v1/XmlPullParser;
    //   15: astore_3
    //   16: aload_3
    //   17: aload_2
    //   18: ldc_w 282
    //   21: invokeinterface 288 3 0
    //   26: iconst_0
    //   27: istore_1
    //   28: iload_1
    //   29: iconst_1
    //   30: if_icmpeq +18 -> 48
    //   33: iload_1
    //   34: iconst_2
    //   35: if_icmpeq +13 -> 48
    //   38: aload_3
    //   39: invokeinterface 291 1 0
    //   44: istore_1
    //   45: goto -17 -> 28
    //   48: ldc 63
    //   50: aload_3
    //   51: invokeinterface 294 1 0
    //   56: invokevirtual 297	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   59: ifne +55 -> 114
    //   62: new 268	org/xmlpull/v1/XmlPullParserException
    //   65: dup
    //   66: ldc_w 299
    //   69: invokespecial 300	org/xmlpull/v1/XmlPullParserException:<init>	(Ljava/lang/String;)V
    //   72: athrow
    //   73: astore_3
    //   74: getstatic 95	android/support/v7/widget/ActivityChooserModel:LOG_TAG	Ljava/lang/String;
    //   77: new 156	java/lang/StringBuilder
    //   80: dup
    //   81: invokespecial 157	java/lang/StringBuilder:<init>	()V
    //   84: ldc_w 302
    //   87: invokevirtual 161	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   90: aload_0
    //   91: getfield 166	android/support/v7/widget/ActivityChooserModel:mHistoryFileName	Ljava/lang/String;
    //   94: invokevirtual 161	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   97: invokevirtual 164	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   100: aload_3
    //   101: invokestatic 308	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   104: pop
    //   105: aload_2
    //   106: ifnull +7 -> 113
    //   109: aload_2
    //   110: invokevirtual 313	java/io/FileInputStream:close	()V
    //   113: return
    //   114: aload_0
    //   115: getfield 119	android/support/v7/widget/ActivityChooserModel:mHistoricalRecords	Ljava/util/List;
    //   118: astore 4
    //   120: aload 4
    //   122: invokeinterface 219 1 0
    //   127: aload_3
    //   128: invokeinterface 291 1 0
    //   133: istore_1
    //   134: iload_1
    //   135: iconst_1
    //   136: if_icmpne +14 -> 150
    //   139: aload_2
    //   140: ifnull -27 -> 113
    //   143: aload_2
    //   144: invokevirtual 313	java/io/FileInputStream:close	()V
    //   147: return
    //   148: astore_2
    //   149: return
    //   150: iload_1
    //   151: iconst_3
    //   152: if_icmpeq -25 -> 127
    //   155: iload_1
    //   156: iconst_4
    //   157: if_icmpeq -30 -> 127
    //   160: ldc 60
    //   162: aload_3
    //   163: invokeinterface 294 1 0
    //   168: invokevirtual 297	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   171: ifne +57 -> 228
    //   174: new 268	org/xmlpull/v1/XmlPullParserException
    //   177: dup
    //   178: ldc_w 315
    //   181: invokespecial 300	org/xmlpull/v1/XmlPullParserException:<init>	(Ljava/lang/String;)V
    //   184: athrow
    //   185: astore_3
    //   186: getstatic 95	android/support/v7/widget/ActivityChooserModel:LOG_TAG	Ljava/lang/String;
    //   189: new 156	java/lang/StringBuilder
    //   192: dup
    //   193: invokespecial 157	java/lang/StringBuilder:<init>	()V
    //   196: ldc_w 302
    //   199: invokevirtual 161	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   202: aload_0
    //   203: getfield 166	android/support/v7/widget/ActivityChooserModel:mHistoryFileName	Ljava/lang/String;
    //   206: invokevirtual 161	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   209: invokevirtual 164	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   212: aload_3
    //   213: invokestatic 308	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   216: pop
    //   217: aload_2
    //   218: ifnull -105 -> 113
    //   221: aload_2
    //   222: invokevirtual 313	java/io/FileInputStream:close	()V
    //   225: return
    //   226: astore_2
    //   227: return
    //   228: aload 4
    //   230: new 20	android/support/v7/widget/ActivityChooserModel$HistoricalRecord
    //   233: dup
    //   234: aload_3
    //   235: aconst_null
    //   236: ldc 31
    //   238: invokeinterface 319 3 0
    //   243: aload_3
    //   244: aconst_null
    //   245: ldc 34
    //   247: invokeinterface 319 3 0
    //   252: invokestatic 325	java/lang/Long:parseLong	(Ljava/lang/String;)J
    //   255: aload_3
    //   256: aconst_null
    //   257: ldc 37
    //   259: invokeinterface 319 3 0
    //   264: invokestatic 331	java/lang/Float:parseFloat	(Ljava/lang/String;)F
    //   267: invokespecial 334	android/support/v7/widget/ActivityChooserModel$HistoricalRecord:<init>	(Ljava/lang/String;JF)V
    //   270: invokeinterface 181 2 0
    //   275: pop
    //   276: goto -149 -> 127
    //   279: astore_3
    //   280: aload_2
    //   281: ifnull +7 -> 288
    //   284: aload_2
    //   285: invokevirtual 313	java/io/FileInputStream:close	()V
    //   288: aload_3
    //   289: athrow
    //   290: astore_2
    //   291: return
    //   292: astore_2
    //   293: goto -5 -> 288
    //   296: astore_2
    //   297: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	298	0	this	ActivityChooserModel
    //   27	131	1	i	int
    //   11	133	2	localFileInputStream	java.io.FileInputStream
    //   148	74	2	localIOException1	IOException
    //   226	59	2	localIOException2	IOException
    //   290	1	2	localIOException3	IOException
    //   292	1	2	localIOException4	IOException
    //   296	1	2	localFileNotFoundException	FileNotFoundException
    //   15	36	3	localXmlPullParser	org.xmlpull.v1.XmlPullParser
    //   73	90	3	localXmlPullParserException	org.xmlpull.v1.XmlPullParserException
    //   185	71	3	localIOException5	IOException
    //   279	10	3	localObject	Object
    //   118	111	4	localList	List
    // Exception table:
    //   from	to	target	type
    //   12	26	73	org/xmlpull/v1/XmlPullParserException
    //   38	45	73	org/xmlpull/v1/XmlPullParserException
    //   48	73	73	org/xmlpull/v1/XmlPullParserException
    //   114	127	73	org/xmlpull/v1/XmlPullParserException
    //   127	134	73	org/xmlpull/v1/XmlPullParserException
    //   160	185	73	org/xmlpull/v1/XmlPullParserException
    //   228	276	73	org/xmlpull/v1/XmlPullParserException
    //   143	147	148	java/io/IOException
    //   12	26	185	java/io/IOException
    //   38	45	185	java/io/IOException
    //   48	73	185	java/io/IOException
    //   114	127	185	java/io/IOException
    //   127	134	185	java/io/IOException
    //   160	185	185	java/io/IOException
    //   228	276	185	java/io/IOException
    //   221	225	226	java/io/IOException
    //   12	26	279	finally
    //   38	45	279	finally
    //   48	73	279	finally
    //   74	105	279	finally
    //   114	127	279	finally
    //   127	134	279	finally
    //   160	185	279	finally
    //   186	217	279	finally
    //   228	276	279	finally
    //   109	113	290	java/io/IOException
    //   284	288	292	java/io/IOException
    //   0	12	296	java/io/FileNotFoundException
  }
  
  private boolean sortActivitiesIfNeeded()
  {
    if ((mActivitySorter != null) && (mIntent != null) && (!mActivities.isEmpty()) && (!mHistoricalRecords.isEmpty()))
    {
      mActivitySorter.sort(mIntent, mActivities, Collections.unmodifiableList(mHistoricalRecords));
      return true;
    }
    return false;
  }
  
  public Intent chooseActivity(int paramInt)
  {
    synchronized (mInstanceLock)
    {
      if (mIntent == null) {
        return null;
      }
      ensureConsistentState();
      Object localObject2 = (ActivityResolveInfo)mActivities.get(paramInt);
      localObject2 = new ComponentName(resolveInfo.activityInfo.packageName, resolveInfo.activityInfo.name);
      Intent localIntent1 = new Intent(mIntent);
      localIntent1.setComponent((ComponentName)localObject2);
      if (mActivityChoserModelPolicy != null)
      {
        Intent localIntent2 = new Intent(localIntent1);
        if (mActivityChoserModelPolicy.onChooseActivity(this, localIntent2)) {
          return null;
        }
      }
      addHisoricalRecord(new HistoricalRecord((ComponentName)localObject2, System.currentTimeMillis(), 1.0F));
      return localIntent1;
    }
  }
  
  public ResolveInfo getActivity(int paramInt)
  {
    synchronized (mInstanceLock)
    {
      ensureConsistentState();
      ResolveInfo localResolveInfo = mActivities.get(paramInt)).resolveInfo;
      return localResolveInfo;
    }
  }
  
  public int getActivityCount()
  {
    synchronized (mInstanceLock)
    {
      ensureConsistentState();
      int i = mActivities.size();
      return i;
    }
  }
  
  public int getActivityIndex(ResolveInfo paramResolveInfo)
  {
    for (;;)
    {
      int i;
      synchronized (mInstanceLock)
      {
        ensureConsistentState();
        List localList = mActivities;
        int j = localList.size();
        i = 0;
        if (i < j)
        {
          if (getresolveInfo == paramResolveInfo) {
            return i;
          }
        }
        else {
          return -1;
        }
      }
      i += 1;
    }
  }
  
  public ResolveInfo getDefaultActivity()
  {
    synchronized (mInstanceLock)
    {
      ensureConsistentState();
      if (!mActivities.isEmpty())
      {
        ResolveInfo localResolveInfo = mActivities.get(0)).resolveInfo;
        return localResolveInfo;
      }
      return null;
    }
  }
  
  public int getHistoryMaxSize()
  {
    synchronized (mInstanceLock)
    {
      int i = mHistoryMaxSize;
      return i;
    }
  }
  
  public int getHistorySize()
  {
    synchronized (mInstanceLock)
    {
      ensureConsistentState();
      int i = mHistoricalRecords.size();
      return i;
    }
  }
  
  public Intent getIntent()
  {
    synchronized (mInstanceLock)
    {
      Intent localIntent = mIntent;
      return localIntent;
    }
  }
  
  public void setActivitySorter(ActivitySorter paramActivitySorter)
  {
    synchronized (mInstanceLock)
    {
      if (mActivitySorter == paramActivitySorter) {
        return;
      }
      mActivitySorter = paramActivitySorter;
      if (sortActivitiesIfNeeded()) {
        notifyChanged();
      }
      return;
    }
  }
  
  public void setDefaultActivity(int paramInt)
  {
    for (;;)
    {
      synchronized (mInstanceLock)
      {
        ensureConsistentState();
        ActivityResolveInfo localActivityResolveInfo1 = (ActivityResolveInfo)mActivities.get(paramInt);
        ActivityResolveInfo localActivityResolveInfo2 = (ActivityResolveInfo)mActivities.get(0);
        if (localActivityResolveInfo2 != null)
        {
          f = weight - weight + 5.0F;
          addHisoricalRecord(new HistoricalRecord(new ComponentName(resolveInfo.activityInfo.packageName, resolveInfo.activityInfo.name), System.currentTimeMillis(), f));
          return;
        }
      }
      float f = 1.0F;
    }
  }
  
  public void setHistoryMaxSize(int paramInt)
  {
    synchronized (mInstanceLock)
    {
      if (mHistoryMaxSize == paramInt) {
        return;
      }
      mHistoryMaxSize = paramInt;
      pruneExcessiveHistoricalRecordsIfNeeded();
      if (sortActivitiesIfNeeded()) {
        notifyChanged();
      }
      return;
    }
  }
  
  public void setIntent(Intent paramIntent)
  {
    synchronized (mInstanceLock)
    {
      if (mIntent == paramIntent) {
        return;
      }
      mIntent = paramIntent;
      mReloadActivities = true;
      ensureConsistentState();
      return;
    }
  }
  
  public void setOnChooseActivityListener(OnChooseActivityListener paramOnChooseActivityListener)
  {
    synchronized (mInstanceLock)
    {
      mActivityChoserModelPolicy = paramOnChooseActivityListener;
      return;
    }
  }
  
  public static abstract interface ActivityChooserModelClient
  {
    public abstract void setActivityChooserModel(ActivityChooserModel paramActivityChooserModel);
  }
  
  public final class ActivityResolveInfo
    implements Comparable
  {
    public final ResolveInfo resolveInfo;
    public float weight;
    
    public ActivityResolveInfo(ResolveInfo paramResolveInfo)
    {
      resolveInfo = paramResolveInfo;
    }
    
    public int compareTo(ActivityResolveInfo paramActivityResolveInfo)
    {
      return Float.floatToIntBits(weight) - Float.floatToIntBits(weight);
    }
    
    public boolean equals(Object paramObject)
    {
      if (this == paramObject) {}
      do
      {
        return true;
        if (paramObject == null) {
          return false;
        }
        if (getClass() != paramObject.getClass()) {
          return false;
        }
        paramObject = (ActivityResolveInfo)paramObject;
      } while (Float.floatToIntBits(weight) == Float.floatToIntBits(weight));
      return false;
    }
    
    public int hashCode()
    {
      return Float.floatToIntBits(weight) + 31;
    }
    
    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder();
      localStringBuilder.append("[");
      localStringBuilder.append("resolveInfo:").append(resolveInfo.toString());
      localStringBuilder.append("; weight:").append(new BigDecimal(weight));
      localStringBuilder.append("]");
      return localStringBuilder.toString();
    }
  }
  
  public static abstract interface ActivitySorter
  {
    public abstract void sort(Intent paramIntent, List paramList1, List paramList2);
  }
  
  private final class DefaultSorter
    implements ActivityChooserModel.ActivitySorter
  {
    private static final float WEIGHT_DECAY_COEFFICIENT = 0.95F;
    private final Map mPackageNameToActivityMap = new HashMap();
    
    private DefaultSorter() {}
    
    public void sort(Intent paramIntent, List paramList1, List paramList2)
    {
      paramIntent = mPackageNameToActivityMap;
      paramIntent.clear();
      int j = paramList1.size();
      int i = 0;
      Object localObject;
      while (i < j)
      {
        localObject = (ActivityChooserModel.ActivityResolveInfo)paramList1.get(i);
        weight = 0.0F;
        paramIntent.put(new ComponentName(resolveInfo.activityInfo.packageName, resolveInfo.activityInfo.name), localObject);
        i += 1;
      }
      i = paramList2.size();
      float f1 = 1.0F;
      i -= 1;
      if (i >= 0)
      {
        localObject = (ActivityChooserModel.HistoricalRecord)paramList2.get(i);
        ActivityChooserModel.ActivityResolveInfo localActivityResolveInfo = (ActivityChooserModel.ActivityResolveInfo)paramIntent.get(activity);
        if (localActivityResolveInfo == null) {
          break label195;
        }
        float f2 = weight;
        weight = (weight * f1 + f2);
        f1 = 0.95F * f1;
      }
      label195:
      for (;;)
      {
        i -= 1;
        break;
        Collections.sort(paramList1);
        return;
      }
    }
  }
  
  public static final class HistoricalRecord
  {
    public final ComponentName activity;
    public final long time;
    public final float weight;
    
    public HistoricalRecord(ComponentName paramComponentName, long paramLong, float paramFloat)
    {
      activity = paramComponentName;
      time = paramLong;
      weight = paramFloat;
    }
    
    public HistoricalRecord(String paramString, long paramLong, float paramFloat)
    {
      this(ComponentName.unflattenFromString(paramString), paramLong, paramFloat);
    }
    
    public boolean equals(Object paramObject)
    {
      if (this == paramObject) {}
      do
      {
        return true;
        if (paramObject == null) {
          return false;
        }
        if (getClass() != paramObject.getClass()) {
          return false;
        }
        paramObject = (HistoricalRecord)paramObject;
        if (activity == null)
        {
          if (activity != null) {
            return false;
          }
        }
        else if (!activity.equals(activity)) {
          return false;
        }
        if (time != time) {
          return false;
        }
      } while (Float.floatToIntBits(weight) == Float.floatToIntBits(weight));
      return false;
    }
    
    public int hashCode()
    {
      if (activity == null) {}
      for (int i = 0;; i = activity.hashCode()) {
        return ((i + 31) * 31 + (int)(time ^ time >>> 32)) * 31 + Float.floatToIntBits(weight);
      }
    }
    
    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder();
      localStringBuilder.append("[");
      localStringBuilder.append("; activity:").append(activity);
      localStringBuilder.append("; time:").append(time);
      localStringBuilder.append("; weight:").append(new BigDecimal(weight));
      localStringBuilder.append("]");
      return localStringBuilder.toString();
    }
  }
  
  public static abstract interface OnChooseActivityListener
  {
    public abstract boolean onChooseActivity(ActivityChooserModel paramActivityChooserModel, Intent paramIntent);
  }
  
  private final class PersistHistoryAsyncTask
    extends AsyncTask
  {
    private PersistHistoryAsyncTask() {}
    
    public Void doInBackground(Object... paramVarArgs)
    {
      int i = 0;
      List localList = (List)paramVarArgs[0];
      Object localObject2 = (String)paramVarArgs[1];
      for (;;)
      {
        try
        {
          paramVarArgs = mContext.openFileOutput((String)localObject2, 0);
          localObject2 = Xml.newSerializer();
          int j;
          ActivityChooserModel.HistoricalRecord localHistoricalRecord;
          ((XmlSerializer)localObject2).endTag(null, "historical-records");
        }
        catch (FileNotFoundException paramVarArgs)
        {
          try
          {
            ((XmlSerializer)localObject2).setOutput(paramVarArgs, null);
            ((XmlSerializer)localObject2).startDocument("UTF-8", Boolean.valueOf(true));
            ((XmlSerializer)localObject2).startTag(null, "historical-records");
            j = localList.size();
            if (i >= j) {
              break label213;
            }
            localHistoricalRecord = (ActivityChooserModel.HistoricalRecord)localList.remove(0);
            ((XmlSerializer)localObject2).startTag(null, "historical-record");
            ((XmlSerializer)localObject2).attribute(null, "activity", activity.flattenToString());
            ((XmlSerializer)localObject2).attribute(null, "time", String.valueOf(time));
            ((XmlSerializer)localObject2).attribute(null, "weight", String.valueOf(weight));
            ((XmlSerializer)localObject2).endTag(null, "historical-record");
            i += 1;
            continue;
            paramVarArgs = paramVarArgs;
            Log.e(ActivityChooserModel.LOG_TAG, "Error writing historical recrod file: " + (String)localObject2, paramVarArgs);
          }
          catch (IllegalArgumentException localIllegalArgumentException)
          {
            Log.e(ActivityChooserModel.LOG_TAG, "Error writing historical recrod file: " + mHistoryFileName, localIllegalArgumentException);
            ActivityChooserModel.access$502(ActivityChooserModel.this, true);
            if (paramVarArgs == null) {
              continue;
            }
            try
            {
              paramVarArgs.close();
              return null;
            }
            catch (IOException paramVarArgs)
            {
              return null;
            }
          }
          catch (IllegalStateException localIllegalStateException)
          {
            Log.e(ActivityChooserModel.LOG_TAG, "Error writing historical recrod file: " + mHistoryFileName, localIllegalStateException);
            ActivityChooserModel.access$502(ActivityChooserModel.this, true);
            if (paramVarArgs == null) {
              continue;
            }
            try
            {
              paramVarArgs.close();
              return null;
            }
            catch (IOException paramVarArgs)
            {
              return null;
            }
          }
          catch (IOException localIOException)
          {
            Log.e(ActivityChooserModel.LOG_TAG, "Error writing historical recrod file: " + mHistoryFileName, localIOException);
            ActivityChooserModel.access$502(ActivityChooserModel.this, true);
            if (paramVarArgs == null) {
              continue;
            }
            try
            {
              paramVarArgs.close();
              return null;
            }
            catch (IOException paramVarArgs)
            {
              return null;
            }
          }
          finally
          {
            ActivityChooserModel.access$502(ActivityChooserModel.this, true);
            if (paramVarArgs == null) {
              break label446;
            }
          }
          return null;
        }
        label213:
        ((XmlSerializer)localObject2).endDocument();
        ActivityChooserModel.access$502(ActivityChooserModel.this, true);
        if (paramVarArgs != null) {
          try
          {
            paramVarArgs.close();
            return null;
          }
          catch (IOException paramVarArgs)
          {
            return null;
          }
        }
      }
      try
      {
        paramVarArgs.close();
        label446:
        throw ((Throwable)localObject1);
      }
      catch (IOException paramVarArgs)
      {
        for (;;) {}
      }
    }
  }
}

/* Location:
 * Qualified Name:     android.support.v7.widget.ActivityChooserModel
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */