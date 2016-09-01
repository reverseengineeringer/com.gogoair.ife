package com.adobe.primetime.core;

public class Event
{
  public static final String ERROR = "error";
  public static final String SUCCESS = "success";
  private Object _data;
  private String _name;
  
  public Event(String paramString, Object paramObject)
  {
    _name = paramString;
    _data = paramObject;
  }
  
  public static Event createFromTrigger(Trigger paramTrigger)
  {
    return new Event(paramTrigger.getName(), null);
  }
  
  public Object getData()
  {
    return _data;
  }
  
  public String getName()
  {
    return _name;
  }
  
  public void setData(Object paramObject)
  {
    _data = paramObject;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.core.Event
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */