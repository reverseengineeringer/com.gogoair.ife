package com.adobe.primetime.va.plugins.ah.engine.model.dao;

public class AdobeAnalyticsDao
  extends Dao
{
  private static final String REALM = "sc";
  private String _reportSuiteId;
  private Boolean _ssl;
  private String _trackingServer;
  
  public AdobeAnalyticsDao()
  {
    this(null);
  }
  
  public AdobeAnalyticsDao(AdobeAnalyticsDao paramAdobeAnalyticsDao)
  {
    super("sc");
    if (paramAdobeAnalyticsDao != null)
    {
      setReportSuiteId(paramAdobeAnalyticsDao.getReportSuiteId());
      setTrackingServer(paramAdobeAnalyticsDao.getTrackingServer());
      setSsl(paramAdobeAnalyticsDao.getSsl());
      return;
    }
    _reportSuiteId = "";
    _trackingServer = "";
    _ssl = Boolean.valueOf(false);
  }
  
  public String getReportSuiteId()
  {
    return _reportSuiteId;
  }
  
  public Boolean getSsl()
  {
    return _ssl;
  }
  
  public String getTrackingServer()
  {
    return _trackingServer;
  }
  
  public void setReportSuiteId(String paramString)
  {
    _reportSuiteId = paramString;
    setField("rsid", paramString, null);
  }
  
  public void setSsl(Boolean paramBoolean)
  {
    _ssl = paramBoolean;
    setField("ssl", paramBoolean, Dao.Hint.SHORT);
  }
  
  public void setTrackingServer(String paramString)
  {
    _trackingServer = paramString;
    setField("tracking_server", paramString, null);
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.model.dao.AdobeAnalyticsDao
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */