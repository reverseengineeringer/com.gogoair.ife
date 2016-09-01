package com.adobe.primetime.core.radio;

import com.adobe.primetime.core.ICallback;

class Channel$EventHandler
{
  private final ICallback _callback;
  private final Object _context;
  
  Channel$EventHandler(ICallback paramICallback, Object paramObject)
  {
    if (paramICallback == null) {
      throw new Error("Event handler callback cannot be null");
    }
    _callback = paramICallback;
    if (paramObject == null) {
      throw new Error("Event handler context cannot be null");
    }
    _context = paramObject;
  }
  
  public ICallback getCallback()
  {
    return _callback;
  }
  
  public Object getContext()
  {
    return _context;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.core.radio.Channel.EventHandler
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */