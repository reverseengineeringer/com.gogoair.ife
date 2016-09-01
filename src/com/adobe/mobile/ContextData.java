package com.adobe.mobile;

import java.util.HashMap;

final class ContextData
{
  protected HashMap contextData = new HashMap();
  protected Object value = null;
  
  protected boolean containsKey(String paramString)
  {
    return contextData.containsKey(paramString);
  }
  
  protected ContextData get(String paramString)
  {
    return (ContextData)contextData.get(paramString);
  }
  
  protected void put(String paramString, ContextData paramContextData)
  {
    contextData.put(paramString, paramContextData);
  }
  
  public String toString()
  {
    String str = "";
    try
    {
      if (value != null) {
        str = value.toString();
      }
      str = super.toString() + str;
      return str;
    }
    finally {}
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.ContextData
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */