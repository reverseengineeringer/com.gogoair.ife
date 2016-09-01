package com.adobe.primetime.va.plugins.ah;

import com.adobe.primetime.core.ICallback;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

class AdobeHeartbeatPlugin$31
  implements ICallback
{
  AdobeHeartbeatPlugin$31(AdobeHeartbeatPlugin paramAdobeHeartbeatPlugin, Map paramMap) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (ArrayList)paramObject;
    if ((paramObject == null) || (((ArrayList)paramObject).size() == 0)) {
      return null;
    }
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
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.AdobeHeartbeatPlugin.31
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */