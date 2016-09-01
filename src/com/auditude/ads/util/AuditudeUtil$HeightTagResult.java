package com.auditude.ads.util;

public class AuditudeUtil$HeightTagResult
  implements AuditudeUtil.ITagResult
{
  public String getResult()
  {
    if (AuditudeUtil.AuditudePluginSize != null) {
      return String.valueOf(AuditudePluginSizeheight);
    }
    return "0";
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.AuditudeUtil.HeightTagResult
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */