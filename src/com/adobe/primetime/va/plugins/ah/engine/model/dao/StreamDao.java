package com.adobe.primetime.va.plugins.ah.engine.model.dao;

public class StreamDao
  extends Dao
{
  private static final String REALM = "stream";
  private String _type;
  
  public StreamDao()
  {
    this(null);
  }
  
  public StreamDao(StreamDao paramStreamDao)
  {
    super("stream");
    if (paramStreamDao != null)
    {
      setType(paramStreamDao.getType());
      return;
    }
    _type = "";
  }
  
  public String getType()
  {
    return _type;
  }
  
  public void setType(String paramString)
  {
    _type = paramString;
    setField("type", paramString, null);
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.model.dao.StreamDao
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */