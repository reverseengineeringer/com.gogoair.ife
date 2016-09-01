package com.auditude.ads.model.tracking;

import com.auditude.ads.util.PingUtil;
import com.auditude.ads.util.StringUtil;
import com.auditude.ads.util.URLUtil;
import java.util.HashMap;

public class Submission
  extends TrackingUrl
{
  public static final String AD_PROGRESS = "AD_PROGRESS";
  public static final String PLAYER_DEBUG = "playerdebug";
  public static final String PLAYER_ERROR = "playererror";
  public static final String POD_PROGRESS = "podprogress";
  public String externalUrl;
  
  public Submission(String paramString1, String paramString2)
  {
    super(paramString1, paramString2);
  }
  
  public static Submission newSubmission(String paramString1, String paramString2)
  {
    return new Submission(paramString1, paramString2);
  }
  
  public TrackingUrl duplicate()
  {
    Submission localSubmission = new Submission(getUrl(), getType());
    externalUrl = externalUrl;
    return localSubmission;
  }
  
  public void log(boolean paramBoolean, HashMap paramHashMap)
  {
    if ((isLogged()) && (!paramBoolean)) {}
    String str;
    do
    {
      return;
      str = URLUtil.appendURLParams(getUrl(), paramHashMap);
    } while (StringUtil.isNullOrEmpty(str));
    paramHashMap = str;
    if (!StringUtil.isNullOrEmpty(externalUrl))
    {
      paramHashMap = new HashMap();
      paramHashMap.put("v", "0");
      paramHashMap = URLUtil.appendURLParams(str, paramHashMap);
    }
    PingUtil.pingUrl(paramHashMap);
    setLogged(true);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.model.tracking.Submission
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */