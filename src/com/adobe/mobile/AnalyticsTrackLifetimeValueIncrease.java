package com.adobe.mobile;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

final class AnalyticsTrackLifetimeValueIncrease
{
  private static final String LOCAL_STORAGE_LIFETIME_VALUE_KEY = "ADB_LIFETIME_VALUE";
  private static final String LTV_ACTION_NAME = "LifetimeValueIncrease";
  protected static final String LTV_AMOUNT_KEY = "a.ltv.amount";
  private static final String LTV_INCREASE_KEY = "a.ltv.increase";
  private static final Object _lifetimeValueMutex = new Object();
  
  protected static BigDecimal getLifetimeValue()
  {
    try
    {
      synchronized (_lifetimeValueMutex)
      {
        try
        {
          BigDecimal localBigDecimal1 = new BigDecimal(StaticMethods.getSharedPreferences().getString("ADB_LIFETIME_VALUE", "0"));
          return localBigDecimal1;
        }
        catch (NumberFormatException localNumberFormatException)
        {
          for (;;)
          {
            BigDecimal localBigDecimal2 = new BigDecimal("0");
          }
        }
      }
    }
    catch (StaticMethods.NullContextException localNullContextException)
    {
      for (;;)
      {
        StaticMethods.logErrorFormat("Analytics - Error getting current lifetime value:(%s).", new Object[] { localNullContextException.getMessage() });
        Object localObject2 = null;
      }
    }
  }
  
  private static void incrementLifetimeValue(BigDecimal paramBigDecimal)
  {
    synchronized (_lifetimeValueMutex)
    {
      BigDecimal localBigDecimal = getLifetimeValue();
      if ((paramBigDecimal == null) || (paramBigDecimal.signum() == -1) || (localBigDecimal == null)) {
        return;
      }
      setLifetimeValue(localBigDecimal.add(paramBigDecimal));
      return;
    }
  }
  
  protected static void setLifetimeValue(BigDecimal paramBigDecimal)
  {
    synchronized (_lifetimeValueMutex)
    {
      try
      {
        localEditor = StaticMethods.getSharedPreferencesEditor();
        if ((paramBigDecimal != null) && (paramBigDecimal.signum() != -1)) {
          break label43;
        }
        localEditor.putString("ADB_LIFETIME_VALUE", "0.00");
        localEditor.commit();
      }
      catch (StaticMethods.NullContextException paramBigDecimal)
      {
        for (;;)
        {
          SharedPreferences.Editor localEditor;
          label43:
          StaticMethods.logErrorFormat("Analytics - Error updating lifetime value: (%s).", new Object[] { paramBigDecimal.getMessage() });
        }
      }
      return;
      localEditor.putString("ADB_LIFETIME_VALUE", paramBigDecimal.toString());
    }
  }
  
  public static void trackLifetimeValueIncrease(BigDecimal paramBigDecimal, Map paramMap)
  {
    if ((paramBigDecimal == null) || (paramBigDecimal.signum() == -1)) {
      StaticMethods.logWarningFormat("Analytics - trackLifetimeValueIncrease failed, invalid amount specified '%f'", new Object[] { paramBigDecimal });
    }
    HashMap localHashMap;
    do
    {
      return;
      incrementLifetimeValue(paramBigDecimal);
      localHashMap = new HashMap();
      if (paramMap != null) {
        localHashMap.putAll(paramMap);
      }
    } while (getLifetimeValue() == null);
    localHashMap.put("a.ltv.amount", getLifetimeValue());
    localHashMap.put("a.ltv.increase", paramBigDecimal);
    AnalyticsTrackInternal.trackInternal("LifetimeValueIncrease", localHashMap, StaticMethods.getTimeSince1970());
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.AnalyticsTrackLifetimeValueIncrease
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */