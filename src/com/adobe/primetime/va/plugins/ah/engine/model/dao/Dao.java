package com.adobe.primetime.va.plugins.ah.engine.model.dao;

import java.util.HashMap;

public class Dao
{
  private final HashMap _data;
  private final String _realm;
  
  Dao(String paramString)
  {
    _realm = paramString;
    _data = new HashMap();
  }
  
  public HashMap getData()
  {
    synchronized (_data)
    {
      HashMap localHashMap2 = _data;
      return localHashMap2;
    }
  }
  
  public String getRealm()
  {
    return _realm;
  }
  
  void setField(String paramString, Object paramObject1, Object paramObject2)
  {
    synchronized (_data)
    {
      _data.put(paramString, new DaoField(paramObject1, paramObject2));
      return;
    }
  }
  
  public static class DaoField
  {
    public final Object hint;
    public final Object value;
    
    public DaoField(Object paramObject1, Object paramObject2)
    {
      value = paramObject1;
      hint = paramObject2;
    }
  }
  
  public static enum Hint
  {
    SHORT;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.model.dao.Dao
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */