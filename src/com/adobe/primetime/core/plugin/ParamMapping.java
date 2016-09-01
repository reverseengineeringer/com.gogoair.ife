package com.adobe.primetime.core.plugin;

public class ParamMapping
{
  private String _key;
  private String _paramName;
  private String _pluginName;
  
  public ParamMapping(String paramString1, String paramString2, String paramString3)
  {
    _pluginName = paramString1;
    _key = paramString2;
    if ((paramString3 == null) || (paramString3.equals("")))
    {
      _paramName = (_pluginName + ":" + _key);
      return;
    }
    _paramName = paramString3;
  }
  
  public String getKey()
  {
    return _key;
  }
  
  public String getKeyName()
  {
    return _pluginName + ":" + _key;
  }
  
  public String getParamName()
  {
    return _paramName;
  }
  
  public String getPluginName()
  {
    return _pluginName;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.core.plugin.ParamMapping
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */