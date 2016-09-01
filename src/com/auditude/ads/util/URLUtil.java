package com.auditude.ads.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

public final class URLUtil
{
  public static String appendURLParams(String paramString, HashMap paramHashMap)
  {
    if ((StringUtil.isNullOrEmpty(paramString)) || (paramHashMap == null) || (paramHashMap.isEmpty())) {
      return paramString;
    }
    StringBuilder localStringBuilder = new StringBuilder(paramString);
    if (paramString.indexOf("?") < 0) {
      localStringBuilder.append("?");
    }
    paramString = localStringBuilder.toString();
    if ((paramString.lastIndexOf("&") != paramString.length() - 1) && (paramString.lastIndexOf("?") != paramString.length() - 1)) {
      localStringBuilder.append("&");
    }
    paramString = paramHashMap.entrySet().iterator();
    for (;;)
    {
      if (!paramString.hasNext())
      {
        localStringBuilder.deleteCharAt(localStringBuilder.length() - 1);
        return localStringBuilder.toString();
      }
      paramHashMap = (Map.Entry)paramString.next();
      localStringBuilder.append((String)paramHashMap.getKey());
      localStringBuilder.append("=");
      if (!StringUtil.isNullOrEmpty((String)paramHashMap.getValue())) {
        localStringBuilder.append(urlEncode((String)paramHashMap.getValue()));
      }
      localStringBuilder.append("&");
    }
  }
  
  public static String getFileExtension(String paramString)
  {
    if (!StringUtil.isNullOrEmpty(paramString))
    {
      String str = paramString;
      if (paramString.indexOf("?") >= 0) {
        str = paramString.substring(0, paramString.indexOf("?"));
      }
      int i = str.lastIndexOf(".");
      if ((i >= 0) && (i < str.length() - 1)) {
        return str.substring(i + 1);
      }
    }
    return "";
  }
  
  public static boolean isIPAddress(String paramString)
  {
    if (StringUtil.isNullOrEmpty(paramString)) {}
    int i;
    do
    {
      return false;
      i = paramString.indexOf(":");
      String str = paramString;
      if (i > 0) {
        str = paramString.substring(0, i);
      }
      paramString = str.split("\\.");
    } while (paramString.length != 4);
    int j;
    do
    {
      try
      {
        j = paramString.length;
        i = 0;
      }
      catch (NumberFormatException paramString)
      {
        int k;
        return false;
      }
      k = Integer.parseInt(paramString[i]);
      if ((k < 0) || (k > 255)) {
        break;
      }
      i += 1;
    } while (i < j);
    return true;
  }
  
  public static String urlEncode(String paramString)
  {
    if (StringUtil.isNullOrEmpty(paramString)) {
      return null;
    }
    try
    {
      String str = URLEncoder.encode(paramString, "UTF-8");
      return str;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException) {}
    return paramString;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.URLUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */