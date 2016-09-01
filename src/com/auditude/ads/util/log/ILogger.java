package com.auditude.ads.util.log;

import com.auditude.ads.util.event.IEventDispatcher;

public abstract interface ILogger
  extends IEventDispatcher
{
  public abstract void debug(Object paramObject);
  
  public abstract void error(Object paramObject);
  
  public abstract void fatal(Object paramObject);
  
  public abstract String getCategory();
  
  public abstract void info(Object paramObject);
  
  public abstract void log(LogLevel paramLogLevel, Object paramObject);
  
  public abstract void warn(Object paramObject);
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.log.ILogger
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */