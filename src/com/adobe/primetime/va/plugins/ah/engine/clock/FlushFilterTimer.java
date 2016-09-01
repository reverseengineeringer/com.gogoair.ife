package com.adobe.primetime.va.plugins.ah.engine.clock;

import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.core.plugin.PluginManager;
import com.adobe.primetime.core.radio.Channel;

public final class FlushFilterTimer
  extends Timer
{
  private static final double DEFAULT_FLUSH_FILTER_INTERVAL = 0.25D;
  private static final String NAME = "flush_filter";
  
  public FlushFilterTimer(PluginManager paramPluginManager, Channel paramChannel, ILogger paramILogger)
  {
    super(paramPluginManager, paramChannel, "flush_filter", 0.25D, paramILogger);
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.clock.FlushFilterTimer
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */