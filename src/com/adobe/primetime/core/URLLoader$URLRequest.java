package com.adobe.primetime.core;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class URLLoader$URLRequest
{
  private final Map _data;
  private final URLLoader.HttpMethod _method;
  private final String _url;
  
  public URLLoader$URLRequest(String paramString, URLLoader.HttpMethod paramHttpMethod)
  {
    this(paramString, paramHttpMethod, null);
  }
  
  public URLLoader$URLRequest(String paramString, URLLoader.HttpMethod paramHttpMethod, Map paramMap)
  {
    _url = paramString;
    _method = paramHttpMethod;
    _data = paramMap;
  }
  
  public URLLoader.HttpMethod getMethod()
  {
    return _method;
  }
  
  public String getUrl()
  {
    return _url;
  }
  
  public String getUrlEncodedData()
  {
    if (_data == null) {
      return "";
    }
    Object localObject1 = _data.entrySet().iterator();
    Object localObject2;
    String str2;
    for (String str1 = ""; ((Iterator)localObject1).hasNext(); str1 = str1 + str2 + "=" + (String)localObject2 + "&")
    {
      localObject2 = (Map.Entry)((Iterator)localObject1).next();
      str2 = (String)((Map.Entry)localObject2).getKey();
      localObject2 = (String)((Map.Entry)localObject2).getValue();
    }
    localObject1 = str1;
    if (str1.length() > 0) {
      localObject1 = str1.substring(0, str1.length() - 1);
    }
    return (String)localObject1;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.core.URLLoader.URLRequest
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */