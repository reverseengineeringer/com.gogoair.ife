package com.adobe.mobile;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

final class AnalyticsTrackCoordinateSpace
{
  private static final String COORDINATE_ACTION_NAME = "Coordinates";
  private static final String COORDINATE_FLOAT_FORMAT = "%.2f";
  private static final String COORDINATE_NAME_KEY = "a.map.name";
  private static final String COORDINATE_X_KEY = "a.map.x";
  private static final String COORDINATE_Y_KEY = "a.map.y";
  
  public static void trackCoordinateSpace(String paramString, float paramFloat1, float paramFloat2, Map paramMap)
  {
    if ((paramFloat1 < 0.0F) || (paramFloat1 > 1.0F) || (paramFloat2 < 0.0F) || (paramFloat2 > 1.0F))
    {
      StaticMethods.logWarningFormat("Analytics - trackCoordinateSpace failed, the coordinates (x:%.2f, y:%.2f) must be between 0.0f & 1.0f.", new Object[] { Float.valueOf(paramFloat1), Float.valueOf(paramFloat2) });
      return;
    }
    if ((paramString == null) || (paramString.trim().length() == 0))
    {
      StaticMethods.logWarningFormat("Analytics - trackCoordinateSpace failed, the name was empty or only contained whitespace and is required to map the coorindates to a coordinates space.", new Object[0]);
      return;
    }
    String str1 = String.format(Locale.US, "%.2f", new Object[] { Float.valueOf(Math.abs(paramFloat1)) });
    String str2 = String.format(Locale.US, "%.2f", new Object[] { Float.valueOf(Math.abs(paramFloat2)) });
    HashMap localHashMap = new HashMap();
    if (paramMap != null) {
      localHashMap.putAll(paramMap);
    }
    localHashMap.put("a.map.name", paramString);
    localHashMap.put("a.map.x", str1);
    localHashMap.put("a.map.y", str2);
    AnalyticsTrackInternal.trackInternal("Coordinates", localHashMap, StaticMethods.getTimeSince1970());
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.AnalyticsTrackCoordinateSpace
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */