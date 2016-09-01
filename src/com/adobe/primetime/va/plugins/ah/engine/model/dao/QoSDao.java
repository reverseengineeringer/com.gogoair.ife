package com.adobe.primetime.va.plugins.ah.engine.model.dao;

public class QoSDao
  extends Dao
{
  private static final String REALM = "stream";
  private long _bitrate;
  private long _droppedFrames;
  private double _fps;
  private long _startupTime;
  public boolean isStartupTimeOverridden;
  
  public QoSDao()
  {
    this(null);
  }
  
  public QoSDao(QoSDao paramQoSDao)
  {
    super("stream");
    if (paramQoSDao != null)
    {
      setBitrate(paramQoSDao.getBitrate());
      setFps(paramQoSDao.getFps());
      setDroppedFrames(paramQoSDao.getDroppedFrames());
      setStartupTime(paramQoSDao.getStartupTime());
      isStartupTimeOverridden = isStartupTimeOverridden;
      return;
    }
    _bitrate = 0L;
    _fps = 0.0D;
    _droppedFrames = 0L;
    _startupTime = 0L;
    isStartupTimeOverridden = false;
  }
  
  public long getBitrate()
  {
    return _bitrate;
  }
  
  public long getDroppedFrames()
  {
    return _droppedFrames;
  }
  
  public double getFps()
  {
    return _fps;
  }
  
  public long getStartupTime()
  {
    return _startupTime;
  }
  
  public void setBitrate(long paramLong)
  {
    _bitrate = paramLong;
    setField("bitrate", Long.valueOf(paramLong), null);
  }
  
  public void setDroppedFrames(long paramLong)
  {
    _droppedFrames = paramLong;
    setField("dropped_frames", Long.valueOf(paramLong), null);
  }
  
  public void setFps(double paramDouble)
  {
    _fps = paramDouble;
    setField("fps", Double.valueOf(paramDouble), null);
  }
  
  public void setStartupTime(long paramLong)
  {
    _startupTime = paramLong;
    setField("startup_time", Long.valueOf(paramLong), null);
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.model.dao.QoSDao
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */