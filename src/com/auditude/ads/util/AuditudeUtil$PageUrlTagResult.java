package com.auditude.ads.util;

public class AuditudeUtil$PageUrlTagResult
  implements AuditudeUtil.ITagResult
{
  public String getResult()
  {
    try
    {
      String str = BrowserUtil.getPageUrl();
      return str;
    }
    catch (RuntimeException localRuntimeException) {}
    return "";
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.AuditudeUtil.PageUrlTagResult
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */