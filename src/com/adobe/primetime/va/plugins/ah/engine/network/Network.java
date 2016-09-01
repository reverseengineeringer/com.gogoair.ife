package com.adobe.primetime.va.plugins.ah.engine.network;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.core.radio.Channel;
import com.adobe.primetime.va.plugins.ah.engine.model.serialization.QueryStringSerializer;

public class Network
{
  private static final String EVENT_API_CONFIG = "api:config";
  private static final String EVENT_CLOCK_CHECK_STATUS_TICK = "clock:check_status.tick";
  private static final String EVENT_FILTER_REPORT_AVAILABLE = "filter:data_available";
  private static final String EVENT_NET_CHECK_STATUS_COMPLETE = "net:check_status_complete";
  private static final String KEY_CHECK_STATUS_SERVER = "check_status_server";
  private static final String KEY_PUBLISHER = "publisher";
  private static final String KEY_QUIET_MODE = "quiet_mode";
  private static final String KEY_REPORT = "report";
  private static final String KEY_SSL = "ssl";
  private static final String KEY_TRACKING_SERVER = "tracking_server";
  private final Channel _channel;
  private String _checkStatusServer = null;
  private boolean _isConfigured = false;
  private boolean _isDestroyed = false;
  private String _logTag;
  private ILogger _logger;
  private final ICallback _onApiConfig = new Network.1(this);
  private final ICallback _onClockCheckStatusTick = new Network.3(this);
  private final ICallback _onFilterReportAvailable = new Network.2(this);
  private String _publisher = null;
  private boolean _quietMode = false;
  private final QueryStringSerializer _serializer;
  private String _trackingServer = null;
  
  public Network(Channel paramChannel, ILogger paramILogger)
  {
    if (paramChannel == null) {
      throw new Error("Reference to the channel object cannot be NULL");
    }
    _channel = paramChannel;
    if (paramILogger == null) {
      throw new Error("Reference to the logger object cannot be NULL");
    }
    _logger = paramILogger;
    _logTag = Network.class.getSimpleName();
    _serializer = new QueryStringSerializer(_logger);
    _installEventListeners();
  }
  
  private void _installEventListeners()
  {
    _channel.on("api:config", _onApiConfig, this);
    _channel.on("filter:data_available", _onFilterReportAvailable, this);
    _channel.on("clock:check_status.tick", _onClockCheckStatusTick, this);
  }
  
  private void _uninstallEventListeners()
  {
    _channel.off(null, null, this);
  }
  
  private static String _updateRequestProtocol(String paramString, boolean paramBoolean)
  {
    String str;
    if (paramString.indexOf("http://") == 0) {
      str = paramString.substring(7);
    }
    while (paramBoolean)
    {
      return "https://" + str;
      str = paramString;
      if (paramString.indexOf("https://") == 0) {
        str = paramString.substring(8);
      }
    }
    return "http://" + str;
  }
  
  public void destroy()
  {
    if (_isDestroyed) {
      return;
    }
    _isDestroyed = true;
    _logger.debug(_logTag, "#destroy()");
    _uninstallEventListeners();
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.network.Network
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */