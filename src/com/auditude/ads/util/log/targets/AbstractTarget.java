package com.auditude.ads.util.log.targets;

import com.auditude.ads.util.event.IEventListener;
import com.auditude.ads.util.log.ILogger;
import com.auditude.ads.util.log.Log;
import com.auditude.ads.util.log.LogEvent;
import com.auditude.ads.util.log.LogLevel;

public class AbstractTarget
  implements IEventListener, ILoggingTarget
{
  private LogLevel level = LogLevel.ALL;
  
  public ILogger addLogger(ILogger paramILogger)
  {
    if (paramILogger != null) {
      paramILogger.addEventListener("log", this);
    }
    return paramILogger;
  }
  
  public LogLevel getLevel()
  {
    return level;
  }
  
  public void initialized(Object paramObject)
  {
    Log.addTarget(this);
  }
  
  public void logEvent(LogEvent paramLogEvent) {}
  
  public void onEvent(String paramString, Object paramObject)
  {
    if ((paramString == "log") && ((paramObject instanceof LogEvent)))
    {
      paramString = (LogEvent)paramObject;
      if (level.getVerbosity() >= level.getVerbosity()) {
        logEvent(paramString);
      }
    }
  }
  
  public void removeLogger(ILogger paramILogger)
  {
    if (paramILogger != null) {
      paramILogger.removeEventListener("log", this);
    }
  }
  
  public void setLevel(LogLevel paramLogLevel)
  {
    Log.removeTarget(this);
    level = paramLogLevel;
    Log.addTarget(this);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.log.targets.AbstractTarget
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */