package com.adobe.mediacore;

import com.adobe.mediacore.utils.StringUtils;
import java.util.HashSet;
import java.util.Set;

public final class PSDKConfig
{
  public static final String DEFAULT_AD_TAG = "#EXT-X-CUE";
  private static String[] _adTags;
  private static String[] _subscribedTags;
  
  private static String[] addDefaultAdTag(String[] paramArrayOfString)
  {
    if (paramArrayOfString == null)
    {
      arrayOfString = new String[1];
      arrayOfString[0] = "#EXT-X-CUE";
      return arrayOfString;
    }
    int j = paramArrayOfString.length;
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        break label46;
      }
      arrayOfString = paramArrayOfString;
      if ("#EXT-X-CUE".equals(paramArrayOfString[i])) {
        break;
      }
      i += 1;
    }
    label46:
    String[] arrayOfString = new String[paramArrayOfString.length + 1];
    arrayOfString[0] = "#EXT-X-CUE";
    System.arraycopy(paramArrayOfString, 0, arrayOfString, 1, paramArrayOfString.length);
    return arrayOfString;
  }
  
  public static String[] getAdTags()
  {
    return _adTags;
  }
  
  protected static String[] getAdTagsWithDefault()
  {
    return addDefaultAdTag(_adTags);
  }
  
  public static String[] getSubscribedTags()
  {
    return _subscribedTags;
  }
  
  public static void setAdTags(String[] paramArrayOfString)
  {
    if (paramArrayOfString == null)
    {
      _adTags = null;
      return;
    }
    HashSet localHashSet = new HashSet();
    int j = paramArrayOfString.length;
    int i = 0;
    while (i < j)
    {
      String str2 = paramArrayOfString[i];
      String str1 = str2;
      if (str2 != null) {
        str1 = str2.trim();
      }
      if (StringUtils.isEmpty(str1)) {
        throw new IllegalArgumentException("Array can not contain null or empty values.");
      }
      localHashSet.add(str1);
      i += 1;
    }
    _adTags = (String[])localHashSet.toArray(new String[localHashSet.size()]);
  }
  
  public static void setSubscribedTags(String[] paramArrayOfString)
  {
    if (paramArrayOfString == null)
    {
      _subscribedTags = null;
      return;
    }
    HashSet localHashSet = new HashSet();
    int j = paramArrayOfString.length;
    int i = 0;
    while (i < j)
    {
      String str2 = paramArrayOfString[i];
      String str1 = str2;
      if (str2 != null) {
        str1 = str2.trim();
      }
      if (StringUtils.isEmpty(str1)) {
        throw new IllegalArgumentException("Array can not contain null or empty values.");
      }
      localHashSet.add(str1);
      i += 1;
    }
    _subscribedTags = (String[])localHashSet.toArray(new String[localHashSet.size()]);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.PSDKConfig
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */