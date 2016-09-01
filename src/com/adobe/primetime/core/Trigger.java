package com.adobe.primetime.core;

public class Trigger
{
  private String _eventName;
  private String _pluginName;
  
  public Trigger(String paramString1, String paramString2)
  {
    _pluginName = paramString1;
    _eventName = paramString2;
  }
  
  public String getEventName()
  {
    return _eventName;
  }
  
  public String getName()
  {
    return _pluginName + ":" + _eventName;
  }
  
  public String getPluginName()
  {
    return _pluginName;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.core.Trigger
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */