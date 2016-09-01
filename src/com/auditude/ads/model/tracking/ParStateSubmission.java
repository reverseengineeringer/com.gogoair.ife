package com.auditude.ads.model.tracking;

import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.reporting.ReportingHelper;
import com.auditude.ads.util.AuditudeUtil;
import com.auditude.ads.util.PingUtil;
import com.auditude.ads.util.StringUtil;
import com.auditude.ads.util.URLUtil;
import java.util.HashMap;

public class ParStateSubmission
  extends Submission
{
  public ParStateSubmission(String paramString1, String paramString2)
  {
    super(paramString1, paramString2);
  }
  
  public String getUrl()
  {
    String str2 = super.getUrl();
    String str1 = str2;
    if (!StringUtil.isNullOrEmpty(str2)) {
      str1 = AuditudeUtil.getUrlWithState(str2, AuditudeEnv.getInstance().getReportingHelper().currentAdState());
    }
    return str1;
  }
  
  public void log(boolean paramBoolean, HashMap paramHashMap)
  {
    if ((isLogged()) && (!paramBoolean)) {}
    String str;
    do
    {
      return;
      str = getUrl();
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
 * Qualified Name:     com.auditude.ads.model.tracking.ParStateSubmission
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */