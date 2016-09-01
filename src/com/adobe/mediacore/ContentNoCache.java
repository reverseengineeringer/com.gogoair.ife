package com.adobe.mediacore;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

final class ContentNoCache
  implements ContentCache
{
  private final List cache = new CopyOnWriteArrayList();
  private final Map requestedCount = new ConcurrentHashMap();
  
  public boolean addContent(String paramString, AdHandle paramAdHandle)
  {
    if ((paramString == null) || (paramAdHandle == null)) {
      return false;
    }
    cache.add(new Pair(paramString, paramAdHandle));
    return true;
  }
  
  public void clearCache()
  {
    cache.clear();
  }
  
  public Set getCachedUrls()
  {
    TreeSet localTreeSet = new TreeSet();
    Iterator localIterator = cache.iterator();
    while (localIterator.hasNext()) {
      localTreeSet.add(((Pair)localIterator.next()).getUrl());
    }
    return localTreeSet;
  }
  
  public AdHandle getHandle(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = cache.iterator();
    while (localIterator.hasNext())
    {
      Pair localPair = (Pair)localIterator.next();
      if (localPair.getUrl().equals(paramString)) {
        localArrayList.add(localPair);
      }
    }
    if (localArrayList.isEmpty()) {
      return null;
    }
    if (requestedCount.containsKey(paramString)) {}
    for (int i = ((Integer)requestedCount.get(paramString)).intValue();; i = 0)
    {
      int j;
      if (i < localArrayList.size())
      {
        j = i;
        if (i >= 0) {}
      }
      else
      {
        j = 0;
      }
      requestedCount.put(paramString, Integer.valueOf(j + 1));
      return ((Pair)localArrayList.get(j)).getAdHandle();
    }
  }
  
  public boolean isCached(String paramString)
  {
    if (paramString == null) {
      return false;
    }
    Iterator localIterator = cache.iterator();
    while (localIterator.hasNext()) {
      if (((Pair)localIterator.next()).getUrl().equals(paramString)) {
        return true;
      }
    }
    return false;
  }
  
  private class Pair
  {
    private AdHandle _adHandle;
    private String _url;
    
    public Pair(String paramString, AdHandle paramAdHandle)
    {
      _url = paramString;
      _adHandle = paramAdHandle;
    }
    
    AdHandle getAdHandle()
    {
      return _adHandle;
    }
    
    String getUrl()
    {
      return _url;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.ContentNoCache
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */