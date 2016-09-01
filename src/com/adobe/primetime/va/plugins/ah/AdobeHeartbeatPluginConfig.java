package com.adobe.primetime.va.plugins.ah;

import com.adobe.primetime.core.plugin.IPluginConfig;

public class AdobeHeartbeatPluginConfig
  implements IPluginConfig
{
  private static final String DEFAULT_UNKNOWN = "unknown";
  public boolean __isPrimetime = false;
  public String __psdkVersion;
  private String _publisher;
  private String _trackingServer;
  public boolean debugLogging = false;
  public String ovp = "unknown";
  public boolean quietMode = false;
  public String sdk = "unknown";
  public boolean ssl = false;
  
  public AdobeHeartbeatPluginConfig(String paramString1, String paramString2)
  {
    _trackingServer = paramString1;
    _publisher = paramString2;
  }
  
  public String getPublisher()
  {
    return _publisher;
  }
  
  public String getTrackingServer()
  {
    return _trackingServer;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.AdobeHeartbeatPluginConfig
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */