package com.auditude.ads.util;

import java.util.Date;

public class AuditudeUtil$TimestampTagResult
  implements AuditudeUtil.ITagResult
{
  public String getResult()
  {
    return String.valueOf(new Date().getTime() / 1000L);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.AuditudeUtil.TimestampTagResult
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */