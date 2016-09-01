package com.auditude.ads.util;

public class AuditudeUtil$AssetURI
  implements AuditudeUtil.ITagResult
{
  public String getResult()
  {
    if ((AuditudeUtil.access$1() != null) && (AuditudeUtil.access$1().length() > 0)) {
      return AuditudeUtil.access$1();
    }
    return "[ASSETURI]";
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.AuditudeUtil.AssetURI
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */