package com.auditude.ads.event;

import com.auditude.ads.exception.PlayerException;
import com.auditude.ads.util.event.Event;
import com.auditude.ads.util.event.IEventDispatcher;

public class PlayerErrorEvent
  extends Event
{
  public static final String PLAYER_ERROR = "playerError";
  public PlayerException exception;
  
  public PlayerErrorEvent(IEventDispatcher paramIEventDispatcher, PlayerException paramPlayerException)
  {
    super(paramIEventDispatcher);
    exception = paramPlayerException;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.event.PlayerErrorEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */