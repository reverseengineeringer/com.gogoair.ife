package com.adobe.primetime.va.plugins.ah.engine.model.dao;

public class AdDao
  extends Dao
{
  private static final String REALM = "asset";
  private String _adId;
  private double _adLength;
  private String _adName;
  private String _podId;
  private String _podName;
  private double _podOffset;
  private String _podPosition;
  private String _resolver;
  private String _sid;
  
  public AdDao()
  {
    this(null);
  }
  
  public AdDao(AdDao paramAdDao)
  {
    super("asset");
    if (paramAdDao != null)
    {
      setAdId(paramAdDao.getAdId());
      setAdName(paramAdDao.getAdName());
      setAdLength(paramAdDao.getAdLength());
      setSid(paramAdDao.getSid());
      setResolver(paramAdDao.getResolver());
      setPodId(paramAdDao.getPodId());
      setPodPosition(paramAdDao.getPodPosition());
      setPodOffset(paramAdDao.getPodOffset());
      setPodName(paramAdDao.getPodName());
      return;
    }
    _adId = "";
    _adName = "";
    _adLength = 0.0D;
    _sid = "";
    _podId = "";
    _podPosition = "";
    _podOffset = 0.0D;
    _podName = "";
    _resolver = "";
  }
  
  public String getAdId()
  {
    return _adId;
  }
  
  public double getAdLength()
  {
    return _adLength;
  }
  
  public String getAdName()
  {
    return _adName;
  }
  
  public String getPodId()
  {
    return _podId;
  }
  
  public String getPodName()
  {
    return _podName;
  }
  
  public double getPodOffset()
  {
    return _podOffset;
  }
  
  public String getPodPosition()
  {
    return _podPosition;
  }
  
  public String getResolver()
  {
    return _resolver;
  }
  
  public String getSid()
  {
    return _sid;
  }
  
  public void setAdId(String paramString)
  {
    _adId = paramString;
    setField("ad_id", paramString, null);
  }
  
  public void setAdLength(double paramDouble)
  {
    _adLength = paramDouble;
    setField("ad_length", Double.valueOf(paramDouble), null);
  }
  
  public void setAdName(String paramString)
  {
    _adName = paramString;
    setField("ad_name", paramString, null);
  }
  
  public void setPodId(String paramString)
  {
    _podId = paramString;
    setField("pod_id", paramString, null);
  }
  
  public void setPodName(String paramString)
  {
    _podName = paramString;
    setField("pod_name", paramString, null);
  }
  
  public void setPodOffset(double paramDouble)
  {
    _podOffset = paramDouble;
    setField("pod_offset", Double.valueOf(_podOffset), null);
  }
  
  public void setPodPosition(String paramString)
  {
    _podPosition = paramString;
    setField("pod_position", paramString, null);
  }
  
  public void setResolver(String paramString)
  {
    _resolver = paramString;
    setField("resolver", paramString, null);
  }
  
  public void setSid(String paramString)
  {
    _sid = paramString;
    setField("ad_sid", paramString, null);
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.model.dao.AdDao
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */