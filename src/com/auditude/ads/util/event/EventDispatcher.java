package com.auditude.ads.util.event;

import com.auditude.ads.util.StringUtil;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;

public class EventDispatcher
  implements IEventDispatcher
{
  private HashMap listeners = new HashMap();
  
  private ArrayList getListenersForType(String paramString)
  {
    return getListenersForType(paramString, Boolean.valueOf(false));
  }
  
  private ArrayList getListenersForType(String paramString, Boolean paramBoolean)
  {
    if (listeners.containsKey(paramString)) {
      return (ArrayList)listeners.get(paramString);
    }
    if (paramBoolean.booleanValue())
    {
      paramBoolean = new ArrayList();
      listeners.put(paramString, paramBoolean);
      return paramBoolean;
    }
    return null;
  }
  
  public void addEventListener(String paramString, IEventListener paramIEventListener)
  {
    addEventListener(paramString, paramIEventListener, 0);
  }
  
  public void addEventListener(String paramString, IEventListener paramIEventListener, int paramInt)
  {
    Iterator localIterator;
    if ((StringUtil.isNotNullOrEmpty(paramString)) && (paramIEventListener != null))
    {
      paramString = getListenersForType(paramString, Boolean.valueOf(true));
      localIterator = paramString.iterator();
      if (localIterator.hasNext()) {
        break label63;
      }
      paramString.add(new EventListenerHolder(paramIEventListener, paramInt));
      Collections.sort(paramString, new ListenerPriorityComparator());
    }
    label63:
    EventListenerHolder localEventListenerHolder;
    do
    {
      return;
      localEventListenerHolder = (EventListenerHolder)localIterator.next();
      if (listener != paramIEventListener) {
        break;
      }
    } while (priority == paramInt);
    priority = paramInt;
    Collections.sort(paramString, new ListenerPriorityComparator());
  }
  
  public void dispatchEvent(String paramString, Object paramObject)
  {
    Object localObject;
    if (listeners.containsKey(paramString))
    {
      localObject = getListenersForType(paramString);
      if (localObject != null) {
        localObject = ((ArrayList)localObject).iterator();
      }
    }
    for (;;)
    {
      if (!((Iterator)localObject).hasNext()) {
        return;
      }
      ((EventListenerHolder)((Iterator)localObject).next()).invoke(paramString, paramObject);
    }
  }
  
  public Boolean hasEventListener(String paramString)
  {
    if (StringUtil.isNotNullOrEmpty(paramString))
    {
      paramString = getListenersForType(paramString);
      if ((paramString != null) && (paramString.size() > 0)) {
        return Boolean.valueOf(true);
      }
      return Boolean.valueOf(false);
    }
    return Boolean.valueOf(false);
  }
  
  public void removeEventListener(String paramString, IEventListener paramIEventListener)
  {
    if ((StringUtil.isNotNullOrEmpty(paramString)) && (paramIEventListener != null))
    {
      paramString = getListenersForType(paramString);
      if (paramString != null) {
        paramString = paramString.iterator();
      }
    }
    for (;;)
    {
      if (!paramString.hasNext()) {
        return;
      }
      if (nextlistener == paramIEventListener) {
        paramString.remove();
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.event.EventDispatcher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */