package com.adobe.mobile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

final class Messages$1
  implements Runnable
{
  Messages$1(Map paramMap1, Map paramMap2, Map paramMap3) {}
  
  public void run()
  {
    Object localObject3 = null;
    Object localObject4 = MobileConfig.getInstance().getInAppMessages();
    if ((localObject4 == null) || (((ArrayList)localObject4).size() <= 0)) {}
    Object localObject2;
    Object localObject1;
    do
    {
      do
      {
        return;
        while ((val$vars != null) && (val$vars.containsKey("pev2")) && (val$vars.get("pev2").toString().equals("ADBINTERNAL:In-App Message"))) {}
        Iterator localIterator;
        if ((val$cdata != null) && (val$cdata.size() > 0))
        {
          localObject2 = new HashMap(val$cdata.size());
          localIterator = val$cdata.entrySet().iterator();
          for (;;)
          {
            localObject1 = localObject2;
            if (!localIterator.hasNext()) {
              break;
            }
            localObject1 = (Map.Entry)localIterator.next();
            ((HashMap)localObject2).put(((String)((Map.Entry)localObject1).getKey()).toLowerCase(), ((Map.Entry)localObject1).getValue());
          }
        }
        localObject1 = null;
        localObject2 = localObject3;
        if (val$vars != null)
        {
          localObject2 = localObject3;
          if (val$vars.size() > 0)
          {
            localObject3 = new HashMap(val$vars.size());
            localIterator = val$vars.entrySet().iterator();
            for (;;)
            {
              localObject2 = localObject3;
              if (!localIterator.hasNext()) {
                break;
              }
              localObject2 = (Map.Entry)localIterator.next();
              ((HashMap)localObject3).put(((String)((Map.Entry)localObject2).getKey()).toLowerCase(), ((Map.Entry)localObject2).getValue());
            }
          }
        }
        localObject3 = ((ArrayList)localObject4).iterator();
      } while (!((Iterator)localObject3).hasNext());
      localObject4 = (Message)((Iterator)localObject3).next();
    } while (!((Message)localObject4).shouldShowForVariables((Map)localObject2, (Map)localObject1, val$lifecycleData));
    ((Message)localObject4).show();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.Messages.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */