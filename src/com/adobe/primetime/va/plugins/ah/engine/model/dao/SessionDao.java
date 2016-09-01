package com.adobe.primetime.va.plugins.ah.engine.model.dao;

public class SessionDao
  extends Dao
{
  private static final String REALM = "event";
  private String _sessionId;
  
  public SessionDao()
  {
    this(null);
  }
  
  public SessionDao(SessionDao paramSessionDao)
  {
    super("event");
    if (paramSessionDao != null)
    {
      setSessionId(paramSessionDao.getSessionId());
      return;
    }
    _sessionId = "";
  }
  
  public String getSessionId()
  {
    return _sessionId;
  }
  
  public void setSessionId(String paramString)
  {
    _sessionId = paramString;
    setField("sid", paramString, null);
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.model.dao.SessionDao
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */