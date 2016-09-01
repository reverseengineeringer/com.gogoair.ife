package com.adobe.mediacore;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

final class ContentMapCache
  implements ContentCache
{
  private final Map cache = new ConcurrentHashMap();
  
  public boolean addContent(String paramString, AdHandle paramAdHandle)
  {
    if ((paramString == null) || (paramAdHandle == null)) {
      return false;
    }
    cache.put(paramString, paramAdHandle);
    return true;
  }
  
  public void clearCache()
  {
    Iterator localIterator = cache.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      cache.remove(str);
    }
  }
  
  public Set getCachedUrls()
  {
    return cache.keySet();
  }
  
  public AdHandle getHandle(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    return (AdHandle)cache.get(paramString);
  }
  
  public boolean isCached(String paramString)
  {
    return (paramString != null) && (cache.containsKey(paramString));
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.ContentMapCache
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */