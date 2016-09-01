package com.adobe.primetime.va.plugins.ah.engine.model.dao;

public class CUserDao
  extends Dao
{
  private static final String REALM = "cuser";
  private String _dpid;
  private String _dpuuid;
  
  public CUserDao()
  {
    this(null);
  }
  
  public CUserDao(CUserDao paramCUserDao)
  {
    super("cuser");
    if (paramCUserDao != null)
    {
      setDpid(paramCUserDao.getDpid());
      setDpuuid(paramCUserDao.getDpuuid());
      return;
    }
    _dpid = "";
    _dpuuid = "";
  }
  
  public String getDpid()
  {
    return _dpid;
  }
  
  public String getDpuuid()
  {
    return _dpuuid;
  }
  
  public void setDpid(String paramString)
  {
    _dpid = paramString;
    setField("userId.id", paramString, null);
  }
  
  public void setDpuuid(String paramString)
  {
    _dpuuid = paramString;
    setField("puuid.id", paramString, null);
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.model.dao.CUserDao
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */