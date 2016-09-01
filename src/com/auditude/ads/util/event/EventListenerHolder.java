package com.auditude.ads.util.event;

class EventListenerHolder
{
  public IEventListener listener;
  public int priority = 0;
  
  public EventListenerHolder(IEventListener paramIEventListener, int paramInt)
  {
    listener = paramIEventListener;
    priority = paramInt;
  }
  
  public void invoke(String paramString, Object paramObject)
  {
    if (listener != null) {
      listener.onEvent(paramString, paramObject);
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.event.EventListenerHolder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */