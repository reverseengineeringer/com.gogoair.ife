package com.auditude.ads.util;

public class AuditudeUtil$ContentPlayhead
  implements AuditudeUtil.ITagResult
{
  public String getResult()
  {
    if (AuditudeUtil.access$0() >= 0) {
      return StringUtil.convertToHHMMSS(Math.round(AuditudeUtil.access$0() / 1000));
    }
    return "[CONTENTPLAYHEAD]";
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.AuditudeUtil.ContentPlayhead
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */