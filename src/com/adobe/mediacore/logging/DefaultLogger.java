package com.adobe.mediacore.logging;

import android.util.Log;
import java.util.List;

final class DefaultLogger
  implements Logger
{
  private Logger.Verbosity maxVerbosityLevel = Logger.Verbosity.INFO;
  
  public void clear() {}
  
  public void d(String paramString1, String paramString2)
  {
    if (maxVerbosityLevel.getLevel() < Logger.Verbosity.DEBUG.getLevel()) {
      return;
    }
    Log.d(paramString1, paramString2);
  }
  
  public void e(String paramString1, String paramString2)
  {
    if (maxVerbosityLevel.getLevel() < Logger.Verbosity.ERROR.getLevel()) {
      return;
    }
    Log.e(paramString1, paramString2);
  }
  
  public void e(String paramString1, String paramString2, Exception paramException)
  {
    if (maxVerbosityLevel.getLevel() < Logger.Verbosity.ERROR.getLevel()) {
      return;
    }
    Log.e(paramString1, paramString2, paramException);
  }
  
  public List getEntries()
  {
    return null;
  }
  
  public void i(String paramString1, String paramString2)
  {
    if (maxVerbosityLevel.getLevel() < Logger.Verbosity.INFO.getLevel()) {
      return;
    }
    Log.i(paramString1, paramString2);
  }
  
  public void setCapacity(int paramInt) {}
  
  public void setVerbosityLevel(Logger.Verbosity paramVerbosity)
  {
    maxVerbosityLevel = paramVerbosity;
  }
  
  public void w(String paramString1, String paramString2)
  {
    if (maxVerbosityLevel.getLevel() < Logger.Verbosity.WARN.getLevel()) {
      return;
    }
    Log.w(paramString1, paramString2);
  }
  
  public void w(String paramString1, String paramString2, Exception paramException)
  {
    if (maxVerbosityLevel.getLevel() < Logger.Verbosity.WARN.getLevel()) {
      return;
    }
    Log.w(paramString1, paramString2, paramException);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.logging.DefaultLogger
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */