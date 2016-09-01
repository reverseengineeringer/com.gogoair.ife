package com.auditude.ads.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

public class ObjectUtil
{
  public static boolean convertToBoolean(Object paramObject)
  {
    if (paramObject != null) {
      return Boolean.parseBoolean(paramObject.toString());
    }
    return false;
  }
  
  public static float convertToFloat(Object paramObject, float paramFloat)
  {
    float f = paramFloat;
    if (paramObject != null) {}
    try
    {
      f = Float.parseFloat(paramObject.toString());
      return f;
    }
    catch (NumberFormatException paramObject) {}
    return paramFloat;
  }
  
  public static int convertToInt(Object paramObject, int paramInt)
  {
    int i = paramInt;
    if (paramObject != null) {}
    try
    {
      i = Integer.parseInt(paramObject.toString());
      return i;
    }
    catch (NumberFormatException paramObject) {}
    return paramInt;
  }
  
  public static String convertToString(Object paramObject, String paramString)
  {
    if (paramObject != null) {
      paramString = paramObject.toString();
    }
    return paramString;
  }
  
  public static HashMap merge(HashMap paramHashMap1, HashMap paramHashMap2)
  {
    if ((paramHashMap1 == null) && (paramHashMap2 == null)) {
      localHashMap = new HashMap();
    }
    do
    {
      return localHashMap;
      if (paramHashMap1 == null) {
        break;
      }
      localHashMap = paramHashMap1;
    } while (paramHashMap2 == null);
    if ((paramHashMap2 != null) && (paramHashMap1 == null)) {
      return paramHashMap2;
    }
    HashMap localHashMap = new HashMap();
    paramHashMap1 = paramHashMap1.entrySet().iterator();
    if (!paramHashMap1.hasNext()) {
      paramHashMap1 = paramHashMap2.entrySet().iterator();
    }
    for (;;)
    {
      if (!paramHashMap1.hasNext())
      {
        return localHashMap;
        Map.Entry localEntry = (Map.Entry)paramHashMap1.next();
        if (!StringUtil.isNotNullOrEmpty((String)localEntry.getKey())) {
          break;
        }
        localHashMap.put((String)localEntry.getKey(), (String)localEntry.getValue());
        break;
      }
      paramHashMap2 = (Map.Entry)paramHashMap1.next();
      if (StringUtil.isNotNullOrEmpty((String)paramHashMap2.getKey())) {
        localHashMap.put((String)paramHashMap2.getKey(), (String)paramHashMap2.getValue());
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.ObjectUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */