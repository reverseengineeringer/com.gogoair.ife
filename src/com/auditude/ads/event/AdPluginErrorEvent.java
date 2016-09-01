package com.auditude.ads.event;

import java.util.HashMap;

public class AdPluginErrorEvent
  extends AdPluginEvent
{
  public static final String INIT_FAILED = "initFailed";
  public static final String PLUGIN_ERROR = "pluginError";
  private Throwable error;
  
  public AdPluginErrorEvent(String paramString, Throwable paramThrowable)
  {
    this(paramString, paramThrowable, null);
  }
  
  public AdPluginErrorEvent(String paramString, Throwable paramThrowable, HashMap paramHashMap)
  {
    super(paramString, paramHashMap);
    error = paramThrowable;
  }
  
  public final Throwable getError()
  {
    return error;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.event.AdPluginErrorEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */