package com.adobe.primetime.va.plugins.ah.engine.model.dao;

public class ServiceProviderDao
  extends Dao
{
  private static final String REALM = "sp";
  private static final String UNKNOWN = "unknown";
  public long _apiLevel;
  public String _channel;
  public String _libVersion;
  public String _ovp;
  public String _playerName;
  public String _sdk;
  
  public ServiceProviderDao()
  {
    this(null);
  }
  
  public ServiceProviderDao(ServiceProviderDao paramServiceProviderDao)
  {
    super("sp");
    if (paramServiceProviderDao != null)
    {
      setOvp(paramServiceProviderDao.getOvp());
      setSdk(paramServiceProviderDao.getSdk());
      setChannel(paramServiceProviderDao.getChannel());
      setPlayerName(paramServiceProviderDao.getPlayerName());
      setLibVersion(paramServiceProviderDao.getLibVersion());
      setApiLevel(paramServiceProviderDao.getApiLevel());
      return;
    }
    _ovp = "unknown";
    _sdk = "unknown";
    _channel = "unknown";
    _playerName = "";
    _libVersion = "";
    _apiLevel = 0L;
  }
  
  public long getApiLevel()
  {
    return _apiLevel;
  }
  
  public String getChannel()
  {
    return _channel;
  }
  
  public String getLibVersion()
  {
    return _libVersion;
  }
  
  public String getOvp()
  {
    return _ovp;
  }
  
  public String getPlayerName()
  {
    return _playerName;
  }
  
  public String getSdk()
  {
    return _sdk;
  }
  
  public void setApiLevel(long paramLong)
  {
    _apiLevel = paramLong;
    setField("hb_api_lvl", Long.valueOf(paramLong), null);
  }
  
  public void setChannel(String paramString)
  {
    _channel = paramString;
    setField("channel", paramString, null);
  }
  
  public void setLibVersion(String paramString)
  {
    _libVersion = paramString;
    setField("hb_version", paramString, null);
  }
  
  public void setOvp(String paramString)
  {
    _ovp = paramString;
    setField("ovp", paramString, null);
  }
  
  public void setPlayerName(String paramString)
  {
    _playerName = paramString;
    setField("player_name", paramString, null);
  }
  
  public void setSdk(String paramString)
  {
    _sdk = paramString;
    setField("sdk", paramString, null);
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.model.dao.ServiceProviderDao
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */