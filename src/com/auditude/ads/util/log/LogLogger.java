package com.auditude.ads.util.log;

import com.auditude.ads.util.event.EventDispatcher;

public class LogLogger
  extends EventDispatcher
  implements ILogger
{
  private String category;
  
  public LogLogger(String paramString)
  {
    category = paramString;
  }
  
  private String getLogData(Object paramObject)
  {
    if (paramObject == null) {
      return "";
    }
    if ((paramObject instanceof String)) {
      return (String)paramObject;
    }
    return paramObject.toString();
  }
  
  public void debug(Object paramObject)
  {
    dispatchEvent("log", new LogEvent(this, getLogData(paramObject), LogLevel.DEBUG));
  }
  
  public void error(Object paramObject)
  {
    dispatchEvent("log", new LogEvent(this, getLogData(paramObject), LogLevel.ERROR));
  }
  
  public void fatal(Object paramObject)
  {
    dispatchEvent("log", new LogEvent(this, getLogData(paramObject), LogLevel.FATAL));
  }
  
  public String getCategory()
  {
    return category;
  }
  
  public void info(Object paramObject)
  {
    dispatchEvent("log", new LogEvent(this, getLogData(paramObject), LogLevel.INFO));
  }
  
  public void log(LogLevel paramLogLevel, Object paramObject)
    throws RuntimeException
  {
    if (paramLogLevel.getVerbosity() < LogLevel.DEBUG.getVerbosity()) {
      throw new RuntimeException("Logging at level ALL is not allowed");
    }
    dispatchEvent("log", new LogEvent(this, paramObject, paramLogLevel));
  }
  
  public void warn(Object paramObject)
  {
    dispatchEvent("log", new LogEvent(this, getLogData(paramObject), LogLevel.WARN));
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.log.LogLogger
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */