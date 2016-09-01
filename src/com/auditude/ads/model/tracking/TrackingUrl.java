package com.auditude.ads.model.tracking;

import com.auditude.ads.util.AuditudeUtil;
import com.auditude.ads.util.PingUtil;
import com.auditude.ads.util.StringUtil;
import java.util.HashMap;

public class TrackingUrl
{
  private boolean isLogged = false;
  private int offset = 0;
  private Boolean offsetIsPercent = Boolean.valueOf(false);
  private String type;
  private String url;
  
  public TrackingUrl(String paramString1, String paramString2)
  {
    url = paramString1;
    type = paramString2;
  }
  
  public TrackingUrl duplicate()
  {
    return new TrackingUrl(getUrl(), getType());
  }
  
  public final int getOffset()
  {
    return offset;
  }
  
  public final Boolean getOffsetIsPercent()
  {
    return offsetIsPercent;
  }
  
  public final String getType()
  {
    return type;
  }
  
  public String getUrl()
  {
    return url;
  }
  
  public final boolean isLogged()
  {
    return isLogged;
  }
  
  public void log()
  {
    log(false, null, -1);
  }
  
  public void log(boolean paramBoolean)
  {
    log(paramBoolean, null, -1);
  }
  
  public void log(boolean paramBoolean, HashMap paramHashMap)
  {
    log(paramBoolean, paramHashMap, -1);
  }
  
  public void log(boolean paramBoolean, HashMap paramHashMap, int paramInt)
  {
    if ((isLogged) && (!paramBoolean)) {
      return;
    }
    if (!StringUtil.isNullOrEmpty(url))
    {
      if (paramInt < 0) {
        break label60;
      }
      PingUtil.pingUrl(AuditudeUtil.substituteTags(url.replaceAll("\\[ERRORCODE\\]", String.valueOf(paramInt)).replaceAll("%5BERRORCODE%5D", String.valueOf(paramInt))));
    }
    for (;;)
    {
      isLogged = true;
      return;
      label60:
      PingUtil.pingUrl(AuditudeUtil.substituteTags(url));
    }
  }
  
  public final void setLogged(boolean paramBoolean)
  {
    isLogged = paramBoolean;
  }
  
  public final void setOffset(int paramInt)
  {
    offset = paramInt;
  }
  
  public final void setOffsetIsPercent(Boolean paramBoolean)
  {
    offsetIsPercent = paramBoolean;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.model.tracking.TrackingUrl
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */