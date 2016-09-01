package com.auditude.ads.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

public final class StringUtil
{
  public static HashMap ConvertToKeysAndValues(String paramString1, String paramString2, String paramString3)
  {
    HashMap localHashMap = new HashMap();
    if (isNullOrEmpty(paramString1)) {}
    for (;;)
    {
      return localHashMap;
      paramString1 = paramString1.split(paramString2);
      int j = paramString1.length;
      int i = 0;
      while (i < j)
      {
        paramString2 = paramString1[i];
        int k = paramString2.indexOf(paramString3);
        if (k > 0) {
          localHashMap.put(paramString2.substring(0, k), paramString2.substring(k + 1));
        }
        i += 1;
      }
    }
  }
  
  public static String ConvertToString(HashMap paramHashMap, String paramString1, String paramString2)
  {
    StringBuilder localStringBuilder1 = new StringBuilder("");
    int i;
    Iterator localIterator;
    if ((paramHashMap != null) && (paramHashMap.size() > 0))
    {
      i = paramHashMap.size();
      localIterator = paramHashMap.entrySet().iterator();
      if (localIterator.hasNext()) {}
    }
    else
    {
      return localStringBuilder1.toString();
    }
    paramHashMap = (Map.Entry)localIterator.next();
    i -= 1;
    StringBuilder localStringBuilder2 = new StringBuilder(String.valueOf((String)paramHashMap.getKey())).append(paramString2).append((String)paramHashMap.getValue());
    if (i <= 0) {}
    for (paramHashMap = "";; paramHashMap = paramString1)
    {
      localStringBuilder1.append(paramHashMap);
      break;
    }
  }
  
  public static String convertToHHMMSS(int paramInt)
  {
    return String.format("%02d:%02d:%02d.000", new Object[] { Integer.valueOf(paramInt / 3600), Integer.valueOf(paramInt % 3600 / 60), Integer.valueOf(paramInt % 60) });
  }
  
  public static int convertToInt(String paramString)
  {
    try
    {
      float f = Float.parseFloat(paramString);
      return (int)f;
    }
    catch (NumberFormatException paramString) {}
    return 0;
  }
  
  public static boolean isNotNullOrEmpty(String paramString)
  {
    return (paramString != null) && (paramString.length() > 0);
  }
  
  public static boolean isNullOrEmpty(String paramString)
  {
    return (paramString == null) || (paramString.equals(""));
  }
  
  public static int parseDuration(String paramString)
  {
    if (isNullOrEmpty(paramString)) {
      return -1;
    }
    String[] arrayOfString = paramString.split(":");
    if (arrayOfString.length == 3) {
      return convertToInt(arrayOfString[0]) * 3600 + convertToInt(arrayOfString[1]) * 60 + convertToInt(arrayOfString[2]);
    }
    convertToInt(paramString);
    return -1;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.StringUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */