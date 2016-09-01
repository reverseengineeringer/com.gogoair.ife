package com.adobe.mobile;

import android.os.Process;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

class AnalyticsWorker$WorkerThreadRunner
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
      if ((MobileConfig.getInstance().getPrivacyStatus() == MobilePrivacyStatus.MOBILE_PRIVACY_STATUS_OPT_IN) && (AnalyticsWorker.access$000()))
      {
        localHit = AnalyticsWorker.access$100(localAnalyticsWorker);
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
          if (timestamp - AnalyticsWorker.access$200(localAnalyticsWorker) < 0L)
          {
            long l = AnalyticsWorker.access$200(localAnalyticsWorker) + 1L;
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
          if (!RequestHandler.sendAnalyticsRequest(AnalyticsWorker.access$400() + AnalyticsWorker.access$500().nextInt(100000000), (String)localObject, localHashMap, 5000)) {
            break label372;
          }
          try
          {
            AnalyticsWorker.access$300(localAnalyticsWorker, identifier);
            AnalyticsWorker.access$202(localAnalyticsWorker, timestamp);
          }
          catch (AbstractDatabaseBacking.CorruptedDatabaseException localCorruptedDatabaseException2)
          {
            AnalyticsWorker.sharedInstance().resetDatabase(localCorruptedDatabaseException2);
          }
        } while (timestamp >= StaticMethods.getTimeSince1970() - 60L);
        try
        {
          AnalyticsWorker.access$300(localAnalyticsWorker, identifier);
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
          if (!AnalyticsWorker.access$000()) {
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
          AnalyticsWorker.access$300(localAnalyticsWorker, identifier);
        }
        catch (AbstractDatabaseBacking.CorruptedDatabaseException localCorruptedDatabaseException3)
        {
          AnalyticsWorker.sharedInstance().resetDatabase(localCorruptedDatabaseException3);
        }
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.AnalyticsWorker.WorkerThreadRunner
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */