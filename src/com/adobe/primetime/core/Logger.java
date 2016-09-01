package com.adobe.primetime.core;

import android.util.Log;
import java.util.Date;

public class Logger
  implements ILogger
{
  private Boolean _enabled = Boolean.valueOf(true);
  
  private String _computeTag(String paramString)
  {
    Object localObject = new Date();
    localObject = "[" + ((Date)localObject).getTime() + "]";
    return (String)localObject + "[" + paramString + "]";
  }
  
  public void debug(String paramString1, String paramString2)
  {
    if (_enabled.booleanValue()) {
      Log.d(_computeTag(paramString1), paramString2);
    }
  }
  
  public void disable()
  {
    _enabled = Boolean.valueOf(false);
  }
  
  public void enable()
  {
    _enabled = Boolean.valueOf(true);
  }
  
  public boolean enabled()
  {
    return _enabled.booleanValue();
  }
  
  public void error(String paramString1, String paramString2)
  {
    Log.e(_computeTag(paramString1), paramString2);
  }
  
  public void info(String paramString1, String paramString2)
  {
    if (_enabled.booleanValue()) {
      Log.i(_computeTag(paramString1), paramString2);
    }
  }
  
  public void warn(String paramString1, String paramString2)
  {
    if (_enabled.booleanValue()) {
      Log.w(_computeTag(paramString1), paramString2);
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.core.Logger
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */