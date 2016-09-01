package com.adobe.primetime.va.plugins.videoplayer;

import com.adobe.primetime.core.ICallback;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

class VideoPlayerPlugin$31
  implements ICallback
{
  VideoPlayerPlugin$31(VideoPlayerPlugin paramVideoPlayerPlugin, Map paramMap1, Map paramMap2) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (ArrayList)paramObject;
    if ((paramObject == null) || (((ArrayList)paramObject).size() == 0)) {
      return null;
    }
    val$cachedData.clear();
    HashMap localHashMap = new HashMap();
    Iterator localIterator = ((ArrayList)paramObject).iterator();
    if (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      if (val$fnMap.containsKey(str)) {}
      for (paramObject = ((ICallback)val$fnMap.get(str)).call(this);; paramObject = null)
      {
        localHashMap.put(str, paramObject);
        break;
      }
    }
    return localHashMap;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.videoplayer.VideoPlayerPlugin.31
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */