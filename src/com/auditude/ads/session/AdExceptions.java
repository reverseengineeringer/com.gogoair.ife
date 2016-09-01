package com.auditude.ads.session;

import com.auditude.ads.core.AdSettings;
import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.util.StringUtil;
import java.util.Arrays;
import java.util.List;

public class AdExceptions
{
  public static final String SKIP_NEXT_BREAK = "skipNextBreak";
  private static final int[] skipNextBreakZoneIds = { 604, 9477 };
  
  public static Boolean hasException(String paramString)
  {
    if (StringUtil.isNullOrEmpty(paramString)) {
      return Boolean.valueOf(false);
    }
    int i = AuditudeEnv.getInstance().getAdSettings().getZoneId();
    if (paramString.equalsIgnoreCase("skipNextBreak"))
    {
      if (Arrays.asList(new int[][] { skipNextBreakZoneIds }).indexOf(Integer.valueOf(i)) >= 0) {
        return Boolean.valueOf(true);
      }
      return Boolean.valueOf(false);
    }
    return Boolean.valueOf(false);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.session.AdExceptions
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */