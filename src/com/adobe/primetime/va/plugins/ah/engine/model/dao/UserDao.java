package com.adobe.primetime.va.plugins.ah.engine.model.dao;

public class UserDao
  extends Dao
{
  private static final String REALM = "user";
  private String _analyticsVisitorId;
  private String _marketingCloudVisitorId;
  private String _visitorId;
  
  public UserDao()
  {
    this(null);
  }
  
  public UserDao(UserDao paramUserDao)
  {
    super("user");
    if (paramUserDao != null)
    {
      setVisitorId(paramUserDao.getVisitorId());
      setAnalyticsVisitorId(paramUserDao.getAnalyticsVisitorId());
      setMarketingCloudVisitorId(paramUserDao.getMarketingCloudVisitorId());
      return;
    }
    _visitorId = "";
    _analyticsVisitorId = "";
    _marketingCloudVisitorId = "";
  }
  
  public String getAnalyticsVisitorId()
  {
    return _analyticsVisitorId;
  }
  
  public String getMarketingCloudVisitorId()
  {
    return _marketingCloudVisitorId;
  }
  
  public String getVisitorId()
  {
    return _visitorId;
  }
  
  public void setAnalyticsVisitorId(String paramString)
  {
    _analyticsVisitorId = paramString;
    setField("aid", paramString, null);
  }
  
  public void setMarketingCloudVisitorId(String paramString)
  {
    _marketingCloudVisitorId = paramString;
    setField("mid", paramString, null);
  }
  
  public void setVisitorId(String paramString)
  {
    _visitorId = paramString;
    setField("id", paramString, null);
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.model.dao.UserDao
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */