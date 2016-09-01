package com.auditude.ads.util.event;

public abstract interface IEventDispatcher
{
  public abstract void addEventListener(String paramString, IEventListener paramIEventListener);
  
  public abstract void addEventListener(String paramString, IEventListener paramIEventListener, int paramInt);
  
  public abstract void dispatchEvent(String paramString, Object paramObject);
  
  public abstract Boolean hasEventListener(String paramString);
  
  public abstract void removeEventListener(String paramString, IEventListener paramIEventListener);
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.event.IEventDispatcher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */