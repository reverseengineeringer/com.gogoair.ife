package com.auditude.ads.exception;

import com.auditude.ads.core.AdSettings;
import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.util.ObjectUtil;
import java.util.HashMap;

public class PlayerException
  extends Exception
{
  private static final long serialVersionUID = 1L;
  public int id;
  
  public PlayerException(int paramInt, String paramString)
  {
    super(paramString);
    id = paramInt;
  }
  
  public HashMap toParams()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("errorId", ObjectUtil.convertToString(Integer.valueOf(id), "0"));
    localHashMap.put("message", getMessage());
    int i = AuditudeEnv.getInstance().getAdSettings().getZoneId();
    if (i > 0) {
      localHashMap.put("z", ObjectUtil.convertToString(Integer.valueOf(i), "0"));
    }
    return localHashMap;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.exception.PlayerException
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */