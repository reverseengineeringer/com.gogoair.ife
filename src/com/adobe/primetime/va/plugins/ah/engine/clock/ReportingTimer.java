package com.adobe.primetime.va.plugins.ah.engine.clock;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.core.plugin.PluginManager;
import com.adobe.primetime.core.radio.Channel;

public final class ReportingTimer
  extends Timer
{
  private static final double DEFAULT_REPORT_INTERVAL = 10.0D;
  private static final String EVENT_NET_CHECK_STATUS_COMPLETE = "net:check_status_complete";
  private static final String KEY_REPORTING_INTERVAL = "reporting_interval";
  private static final String NAME = "reporting";
  private final ICallback _onCheckStatusComplete = new ReportingTimer.1(this);
  
  public ReportingTimer(PluginManager paramPluginManager, Channel paramChannel, ILogger paramILogger)
  {
    super(paramPluginManager, paramChannel, "reporting", 10.0D, paramILogger);
    installHandlers();
  }
  
  private void installHandlers()
  {
    _channel.on("net:check_status_complete", _onCheckStatusComplete, this);
    _channel.reply("reporting_interval", new ReportingTimer.2(this));
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.clock.ReportingTimer
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */