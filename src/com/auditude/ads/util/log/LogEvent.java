package com.auditude.ads.util.log;

import com.auditude.ads.util.event.Event;
import com.auditude.ads.util.event.IEventDispatcher;

public class LogEvent
  extends Event
{
  public static final String LOG = "log";
  public Object data;
  public LogLevel level;
  
  public LogEvent(IEventDispatcher paramIEventDispatcher, Object paramObject, LogLevel paramLogLevel)
  {
    super(paramIEventDispatcher);
    data = paramObject;
    level = paramLogLevel;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.log.LogEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */