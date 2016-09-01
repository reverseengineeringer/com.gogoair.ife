package com.auditude.creativerepackaging;

import android.util.Log;
import com.auditude.ads.util.StringUtil;
import java.util.ArrayList;
import java.util.HashMap;

public class Cache
{
  private static final String LOG_CATEGORY = "CreativeRepackagingService";
  public static HashMap streamCache = new HashMap();
  public static int streamCacheSize = 2;
  public static ArrayList streamIdCache = new ArrayList();
  
  public static void addPlaylistToCache(String paramString1, String paramString2)
  {
    if (streamIdCache.size() >= streamCacheSize) {
      removeFirstStreamFromCache();
    }
    if ((StringUtil.isNotNullOrEmpty(paramString2)) && (StringUtil.isNotNullOrEmpty(paramString1)))
    {
      Log.d("CreativeRepackagingService", "Cache: Adding stream for id " + paramString2 + "to cache. Cache size: " + streamIdCache.size());
      streamIdCache.add(streamIdCache.size(), paramString2);
      streamCache.put(paramString2, paramString1);
    }
  }
  
  public static String playlistFromCacheForId(String paramString)
  {
    Log.d("CreativeRepackagingService", "Cache: Looking for stream with id " + paramString);
    if (StringUtil.isNotNullOrEmpty(paramString)) {
      return (String)streamCache.get(paramString);
    }
    return null;
  }
  
  public static void removeFirstStreamFromCache()
  {
    if (streamIdCache.size() > 0)
    {
      String str = (String)streamIdCache.get(0);
      if ((StringUtil.isNotNullOrEmpty(str)) && (streamCache.containsKey(str)))
      {
        streamCache.remove(str);
        streamIdCache.remove(0);
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.creativerepackaging.Cache
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */