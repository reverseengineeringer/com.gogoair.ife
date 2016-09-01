package com.adobe.mobile;

import java.util.HashMap;
import java.util.Map;

final class AnalyticsTrackBeacon
{
  private static final String BEACON_ACTION_NAME = "Beacon";
  private static final String BEACON_MAJOR_KEY = "a.beacon.major";
  private static final String BEACON_MINOR_KEY = "a.beacon.minor";
  private static final String BEACON_PROX_KEY = "a.beacon.prox";
  private static final String BEACON_UUID_KEY = "a.beacon.uuid";
  
  protected static void clearBeacon()
  {
    TargetWorker.removePersistentParameter("a.beacon.uuid");
    TargetWorker.removePersistentParameter("a.beacon.major");
    TargetWorker.removePersistentParameter("a.beacon.minor");
    TargetWorker.removePersistentParameter("a.beacon.prox");
    Lifecycle.removeContextData("a.beacon.uuid");
    Lifecycle.removeContextData("a.beacon.major");
    Lifecycle.removeContextData("a.beacon.minor");
    Lifecycle.removeContextData("a.beacon.prox");
  }
  
  protected static void trackBeacon(String paramString1, String paramString2, String paramString3, Analytics.BEACON_PROXIMITY paramBEACON_PROXIMITY, Map paramMap)
  {
    HashMap localHashMap = new HashMap();
    clearBeacon();
    if (paramString1 != null)
    {
      localHashMap.put("a.beacon.uuid", paramString1);
      TargetWorker.addPersistentParameter("a.beacon.uuid", paramString1);
    }
    if (paramString2 != null)
    {
      localHashMap.put("a.beacon.major", paramString2);
      TargetWorker.addPersistentParameter("a.beacon.major", paramString2);
    }
    if (paramString3 != null)
    {
      localHashMap.put("a.beacon.minor", paramString3);
      TargetWorker.addPersistentParameter("a.beacon.minor", paramString3);
    }
    if (paramBEACON_PROXIMITY != null)
    {
      localHashMap.put("a.beacon.prox", paramBEACON_PROXIMITY.toString());
      TargetWorker.addPersistentParameter("a.beacon.prox", paramBEACON_PROXIMITY.toString());
    }
    Lifecycle.updateContextData(localHashMap);
    if (paramMap != null) {
      localHashMap.putAll(paramMap);
    }
    AnalyticsTrackInternal.trackInternal("Beacon", localHashMap);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.AnalyticsTrackBeacon
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */