package com.adobe.mobile;

import android.location.Location;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

final class AnalyticsTrackLocation
{
  private static final String ACCURACY_KEY = "a.loc.acc";
  private static final String LOCATION_ACTION_NAME = "Location";
  private static final String LOCATION_LAT_PART1_KEY = "a.loc.lat.a";
  private static final String LOCATION_LAT_PART2_KEY = "a.loc.lat.b";
  private static final String LOCATION_LAT_PART3_KEY = "a.loc.lat.c";
  private static final String LOCATION_LON_PART1_KEY = "a.loc.lon.a";
  private static final String LOCATION_LON_PART2_KEY = "a.loc.lon.b";
  private static final String LOCATION_LON_PART3_KEY = "a.loc.lon.c";
  private static final String POI_DIST_KEY = "a.loc.dist";
  private static final String POI_NAME_KEY = "a.loc.poi";
  private static final String WHOLE_ONLY_FLOAT_FORMAT = "%.0f";
  private static final String ZERO_PADDED_11_6_FLOAT_FORMAT = "% 011.6f";
  
  public static void trackLocation(Location paramLocation, Map paramMap)
  {
    if (paramLocation == null)
    {
      StaticMethods.logWarningFormat("Analytics - trackLocation failed, invalid location specified", new Object[0]);
      return;
    }
    String str = String.format(Locale.US, "% 011.6f", new Object[] { Double.valueOf(paramLocation.getLatitude()) });
    Object localObject = String.format(Locale.US, "% 011.6f", new Object[] { Double.valueOf(paramLocation.getLongitude()) });
    HashMap localHashMap = new HashMap();
    if (paramMap != null) {
      localHashMap.putAll(paramMap);
    }
    localHashMap.put("a.loc.lat.a", str.substring(0, 6).trim());
    localHashMap.put("a.loc.lat.b", str.substring(6, 8));
    localHashMap.put("a.loc.lat.c", str.substring(8, 10));
    localHashMap.put("a.loc.lon.a", ((String)localObject).substring(0, 6).trim());
    localHashMap.put("a.loc.lon.b", ((String)localObject).substring(6, 8));
    localHashMap.put("a.loc.lon.c", ((String)localObject).substring(8, 10));
    if ((paramLocation.hasAccuracy()) && (paramLocation.getAccuracy() > 0.0F)) {
      localHashMap.put("a.loc.acc", String.format(Locale.US, "%.0f", new Object[] { Float.valueOf(paramLocation.getAccuracy()) }));
    }
    TargetWorker.removePersistentParameter("a.loc.poi");
    TargetWorker.removePersistentParameter("a.loc.dist");
    Lifecycle.removeContextData("a.loc.poi");
    paramMap = MobileConfig.getInstance().getPointsOfInterest();
    if (paramMap != null) {
      paramMap = paramMap.iterator();
    }
    for (;;)
    {
      if (paramMap.hasNext())
      {
        localObject = (List)paramMap.next();
        if ((localObject == null) || (((List)localObject).size() != 4)) {}
      }
      else
      {
        try
        {
          str = ((List)localObject).get(0).toString();
          double d2 = ((Double)((List)localObject).get(1)).doubleValue();
          double d3 = ((Double)((List)localObject).get(2)).doubleValue();
          double d1 = ((Double)((List)localObject).get(3)).doubleValue();
          localObject = new Location("poi");
          ((Location)localObject).setLatitude(d2);
          ((Location)localObject).setLongitude(d3);
          d2 = ((Location)localObject).distanceTo(paramLocation);
          if ((d2 <= d1) && (str != null))
          {
            localHashMap.put("a.loc.poi", str);
            TargetWorker.addPersistentParameter("a.loc.poi", str);
            localHashMap.put("a.loc.dist", String.format(Locale.US, "%.0f", new Object[] { Double.valueOf(d2) }));
            TargetWorker.addPersistentParameter("a.loc.dist", String.valueOf(d2));
            paramLocation = new HashMap();
            paramLocation.put("a.loc.poi", str);
            Lifecycle.updateContextData(paramLocation);
            AnalyticsTrackInternal.trackInternal("Location", localHashMap, StaticMethods.getTimeSince1970());
            return;
          }
        }
        catch (ClassCastException localClassCastException)
        {
          StaticMethods.logWarningFormat("Analytics - Invalid data for point of interest(%s)", new Object[] { localClassCastException.getLocalizedMessage() });
        }
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.AnalyticsTrackLocation
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */