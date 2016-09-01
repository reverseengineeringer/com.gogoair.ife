package com.adobe.primetime.core.radio;

import com.adobe.primetime.core.ILogger;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class Radio
{
  private Map _channels;
  private ILogger _logger;
  
  public Radio(ILogger paramILogger)
  {
    if (paramILogger == null) {
      throw new Error("Reference to the logger object cannot be NULL");
    }
    _logger = paramILogger;
    _channels = new HashMap();
  }
  
  public Channel channel(String paramString)
  {
    if (_channels.get(paramString) == null) {
      _channels.put(paramString, new Channel(paramString, _logger));
    }
    return (Channel)_channels.get(paramString);
  }
  
  public void shutdown()
  {
    Iterator localIterator = _channels.values().iterator();
    while (localIterator.hasNext()) {
      ((Channel)localIterator.next()).shutdown();
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.core.radio.Radio
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */