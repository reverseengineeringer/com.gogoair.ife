package com.adobe.primetime.va.service.clock;

import com.adobe.primetime.core.ICallback;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

class ClockService$6
  implements ICallback
{
  ClockService$6(ClockService paramClockService, Map paramMap) {}
  
  public Object call(Object paramObject)
  {
    String str = null;
    Iterator localIterator = null;
    paramObject = (ArrayList)paramObject;
    Object localObject = localIterator;
    if (paramObject != null)
    {
      if (((ArrayList)paramObject).size() <= 0) {
        localObject = localIterator;
      }
    }
    else {
      return localObject;
    }
    localIterator = ((ArrayList)paramObject).iterator();
    paramObject = str;
    for (;;)
    {
      localObject = paramObject;
      if (!localIterator.hasNext()) {
        break;
      }
      str = (String)localIterator.next();
      localObject = paramObject;
      if (paramObject == null) {
        localObject = new HashMap();
      }
      paramObject = localObject;
      if (str.startsWith("is_paused"))
      {
        String[] arrayOfString = str.split("is_paused.");
        paramObject = localObject;
        if (arrayOfString.length > 0)
        {
          ((Map)localObject).put(str, ((ICallback)val$fnMap.get("is_paused")).call(arrayOfString[1]));
          paramObject = localObject;
        }
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.service.clock.ClockService.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */