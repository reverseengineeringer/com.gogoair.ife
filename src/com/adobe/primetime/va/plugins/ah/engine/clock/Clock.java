package com.adobe.primetime.va.plugins.ah.engine.clock;

import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.core.plugin.PluginManager;
import com.adobe.primetime.core.radio.Channel;

public final class Clock
{
  private CheckStatusTimer _checkStatusTimer;
  private FlushFilterTimer _flushFilterTimer;
  private boolean _isDestroyed;
  private ReportingTimer _reportingTimer;
  
  public Clock(PluginManager paramPluginManager, Channel paramChannel, ILogger paramILogger)
  {
    if (paramPluginManager == null) {
      throw new Error("Reference to the pluginManger object cannot be NULL.");
    }
    if (paramChannel == null) {
      throw new Error("Reference to the channel object cannot be NULL.");
    }
    if (paramILogger == null) {
      throw new Error("Reference to the logger object cannot be NULL.");
    }
    _isDestroyed = false;
    _reportingTimer = new ReportingTimer(paramPluginManager, paramChannel, paramILogger);
    _flushFilterTimer = new FlushFilterTimer(paramPluginManager, paramChannel, paramILogger);
    _checkStatusTimer = new CheckStatusTimer(paramPluginManager, paramChannel, paramILogger);
  }
  
  public void destroy()
  {
    if (_isDestroyed) {
      return;
    }
    _isDestroyed = true;
    _reportingTimer.destroy();
    _checkStatusTimer.destroy();
    _flushFilterTimer.destroy();
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.clock.Clock
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */