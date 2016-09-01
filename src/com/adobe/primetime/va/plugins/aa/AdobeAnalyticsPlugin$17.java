package com.adobe.primetime.va.plugins.aa;

import com.adobe.primetime.core.ICallback;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

class AdobeAnalyticsPlugin$17
  implements ICallback
{
  AdobeAnalyticsPlugin$17(AdobeAnalyticsPlugin paramAdobeAnalyticsPlugin, Map paramMap) {}
  
  public Object call(Object paramObject)
  {
    paramObject = (ArrayList)paramObject;
    if ((paramObject == null) || (((ArrayList)paramObject).size() == 0)) {
      return null;
    }
    HashMap localHashMap = new HashMap();
    Iterator localIterator = ((ArrayList)paramObject).iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      if (str.startsWith("meta."))
      {
        paramObject = str.split("meta\\.");
        localHashMap.put(str, ((ICallback)val$fnMap.get("meta")).call(paramObject[1]));
      }
      else
      {
        if (val$fnMap.containsKey(str)) {}
        for (paramObject = ((ICallback)val$fnMap.get(str)).call(this);; paramObject = null)
        {
          localHashMap.put(str, paramObject);
          break;
        }
      }
    }
    return localHashMap;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.aa.AdobeAnalyticsPlugin.17
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */