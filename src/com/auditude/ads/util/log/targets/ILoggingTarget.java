package com.auditude.ads.util.log.targets;

import com.auditude.ads.util.log.ILogger;
import com.auditude.ads.util.log.LogLevel;

public abstract interface ILoggingTarget
{
  public abstract ILogger addLogger(ILogger paramILogger);
  
  public abstract LogLevel getLevel();
  
  public abstract void removeLogger(ILogger paramILogger);
  
  public abstract void setLevel(LogLevel paramLogLevel);
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.log.targets.ILoggingTarget
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */