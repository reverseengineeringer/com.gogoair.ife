package com.adobe.primetime.va.plugins.ah.engine.model.report;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.AdobeAnalyticsDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.AssetDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.CUserDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.EventDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.QoSDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.ServiceProviderDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.SessionDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.StreamDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.UserDao;

public class Report
{
  private AdobeAnalyticsDao _adobeAnalyticsData;
  private AssetDao _assetData;
  private ICallback _callback;
  private CUserDao _cuserData;
  private EventDao _eventData;
  private Object _meta;
  private QoSDao _qosData;
  private ServiceProviderDao _serviceProviderData;
  private SessionDao _sessionData;
  private StreamDao _streamData;
  private UserDao _userData;
  
  public Report(AdobeAnalyticsDao paramAdobeAnalyticsDao, UserDao paramUserDao, ServiceProviderDao paramServiceProviderDao, SessionDao paramSessionDao, TrackItem paramTrackItem)
  {
    _adobeAnalyticsData = new AdobeAnalyticsDao(paramAdobeAnalyticsDao);
    _userData = new UserDao(paramUserDao);
    _cuserData = new CUserDao(paramTrackItem.getCUserDao());
    _serviceProviderData = new ServiceProviderDao(paramServiceProviderDao);
    _sessionData = new SessionDao(paramSessionDao);
    _eventData = new EventDao(paramTrackItem.getEventDao());
    _assetData = new AssetDao(paramTrackItem.getAssetDao());
    _streamData = new StreamDao(paramTrackItem.getStreamDao());
    _qosData = new QoSDao(paramTrackItem.getQoSDao());
    _meta = paramTrackItem.getMeta();
    _callback = paramTrackItem.getCallback();
  }
  
  public AdobeAnalyticsDao getAdobeAnalyticsData()
  {
    return _adobeAnalyticsData;
  }
  
  public AssetDao getAssetData()
  {
    return _assetData;
  }
  
  public CUserDao getCUserData()
  {
    return _cuserData;
  }
  
  public ICallback getCallback()
  {
    return _callback;
  }
  
  public EventDao getEventData()
  {
    return _eventData;
  }
  
  public Object getMeta()
  {
    return _meta;
  }
  
  public QoSDao getQosData()
  {
    return _qosData;
  }
  
  public ServiceProviderDao getServiceProviderData()
  {
    return _serviceProviderData;
  }
  
  public SessionDao getSessionData()
  {
    return _sessionData;
  }
  
  public StreamDao getStreamData()
  {
    return _streamData;
  }
  
  public UserDao getUserData()
  {
    return _userData;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.model.report.Report
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */