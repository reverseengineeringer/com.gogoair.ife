package com.auditude.ads.util.event;

public class Event
{
  private IEventDispatcher owner;
  
  public Event(IEventDispatcher paramIEventDispatcher)
  {
    owner = paramIEventDispatcher;
  }
  
  public IEventDispatcher getOwner()
  {
    return owner;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.util.event.Event
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */