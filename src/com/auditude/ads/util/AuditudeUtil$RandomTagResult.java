package com.auditude.ads.util;

import java.util.Random;

public class AuditudeUtil$RandomTagResult
  implements AuditudeUtil.ITagResult
{
  public String getResult()
  {
    return String.valueOf(new Random().nextInt(1000000));
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.AuditudeUtil.RandomTagResult
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */