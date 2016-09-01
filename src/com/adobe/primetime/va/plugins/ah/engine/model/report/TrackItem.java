package com.adobe.primetime.va.plugins.ah.engine.model.report;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.va.plugins.ah.engine.context.Context;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.AssetDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.CUserDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.EventDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.QoSDao;
import com.adobe.primetime.va.plugins.ah.engine.model.dao.StreamDao;
import java.util.Date;

public final class TrackItem
{
  private AssetDao _assetData;
  private ICallback _callback;
  private CUserDao _cuserData;
  private EventDao _eventData = new EventDao(null);
  private Object _meta;
  private QoSDao _qosData;
  private StreamDao _streamData;
  
  public TrackItem(Context paramContext, String paramString, double paramDouble, Object paramObject, ICallback paramICallback)
  {
    _eventData.setType(paramString);
    _eventData.setDuration(0L);
    _eventData.setTs(new Date().getTime());
    _eventData.setPlayhead(paramDouble);
    _assetData = new AssetDao(_assetData);
    _streamData = new StreamDao(_streamData);
    _qosData = new QoSDao(_qosData);
    _cuserData = new CUserDao(_cuserData);
    _meta = paramObject;
    _callback = paramICallback;
  }
  
  public AssetDao getAssetDao()
  {
    return _assetData;
  }
  
  public CUserDao getCUserDao()
  {
    return _cuserData;
  }
  
  public ICallback getCallback()
  {
    return _callback;
  }
  
  public EventDao getEventDao()
  {
    return _eventData;
  }
  
  public Object getMeta()
  {
    return _meta;
  }
  
  public QoSDao getQoSDao()
  {
    return _qosData;
  }
  
  public StreamDao getStreamDao()
  {
    return _streamData;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.model.report.TrackItem
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */