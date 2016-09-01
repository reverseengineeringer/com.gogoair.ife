package com.auditude.ads.network.vast.model;

import com.auditude.ads.util.ObjectUtil;
import com.auditude.ads.util.StringUtil;

public class VASTMediaFile
{
  public static final String DELIVERY_PROGRESSIVE = "progressive";
  public static final String DELIVERY_STREAMING = "streaming";
  public String apiFramework;
  public int bitrate = 0;
  public String delivery;
  public int height;
  public String id;
  public boolean maintainAspectRatio;
  public boolean scalable;
  public String type;
  public String url;
  public int width;
  
  public static int parseDuration(String paramString)
  {
    if (StringUtil.isNullOrEmpty(paramString)) {
      return 0;
    }
    String[] arrayOfString = paramString.split(":");
    if (arrayOfString.length <= 1) {
      return ObjectUtil.convertToInt(paramString, 0);
    }
    int i = ObjectUtil.convertToInt(arrayOfString[0], 0);
    int j = ObjectUtil.convertToInt(arrayOfString[1], 0);
    return ObjectUtil.convertToInt(arrayOfString[2], 0) + (i * 3600 + j * 60);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.network.vast.model.VASTMediaFile
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */