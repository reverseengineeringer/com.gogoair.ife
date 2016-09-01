package com.adobe.primetime.va.plugins.ah.engine.clock;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.core.plugin.PluginManager;
import com.adobe.primetime.core.radio.Channel;

public final class CheckStatusTimer
  extends Timer
{
  private static final double DEFAULT_CHECK_STATUS_INTERVAL = 60.0D;
  private static final String EVENT_CLOCK_CHECK_STATUS_GET_SETTINGS = "clock:check_status.get_settings";
  private static final String EVENT_CLOCK_CHECK_STATUS_TICK = "clock:check_status.tick";
  private static final String EVENT_NET_CHECK_STATUS_COMPLETE = "net:check_status_complete";
  private static final String KEY_CHECK_STATUS_INTERVAL = "check_status_interval";
  private static final double MAXIMUM_CHECK_STATUS_INTERVAL = 600.0D;
  private static final String NAME = "check_status";
  private final ICallback _getSettings = new CheckStatusTimer.2(this);
  private final ICallback _onCheckStatusComplete = new CheckStatusTimer.1(this);
  
  public CheckStatusTimer(PluginManager paramPluginManager, Channel paramChannel, ILogger paramILogger)
  {
    super(paramPluginManager, paramChannel, "check_status", 60.0D, paramILogger);
    installHandlers();
  }
  
  private void installHandlers()
  {
    _channel.on("clock:check_status.get_settings", _getSettings, this);
    _channel.on("net:check_status_complete", _onCheckStatusComplete, this);
    _channel.reply("check_status_interval", new CheckStatusTimer.3(this));
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.clock.CheckStatusTimer
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */