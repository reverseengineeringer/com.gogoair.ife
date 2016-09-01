package com.adobe.primetime.core.radio;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class Channel
{
  public static final String SEPARATOR = ":";
  public static final String WILDCARD = "*";
  private Map _commands;
  private boolean _isShutDown;
  private Map _listeners;
  private String _logTag;
  private ILogger _logger;
  private String _name;
  private Map _requests;
  
  public Channel(String paramString, ILogger paramILogger)
  {
    _name = paramString;
    _listeners = new HashMap();
    _requests = new HashMap();
    _commands = new HashMap();
    _isShutDown = false;
    if (paramILogger == null) {
      throw new Error("Reference to the logger object cannot be NULL");
    }
    _logTag = Channel.class.getSimpleName();
    _logger = paramILogger;
  }
  
  private static boolean _matchWildcard(String paramString1, String paramString2)
  {
    String str = paramString1;
    if (paramString1 == null) {
      str = "";
    }
    paramString1 = paramString2;
    if (paramString2 == null) {
      paramString1 = "";
    }
    if (str.equals(paramString1)) {
      return true;
    }
    paramString2 = str.split(":");
    paramString1 = paramString1.split(":");
    if (paramString2.length != paramString1.length) {
      return false;
    }
    int i = 0;
    boolean bool = true;
    if (i < paramString2.length)
    {
      if ((bool) && ((paramString2[i].equals("*")) || (paramString2[i].equals(paramString1[i])))) {}
      for (bool = true;; bool = false)
      {
        i += 1;
        break;
      }
    }
    return bool;
  }
  
  private void _removeListener(String paramString, ICallback paramICallback, Object paramObject)
  {
    paramString = (List)_listeners.get(paramString);
    if (paramString == null) {}
    for (;;)
    {
      return;
      paramString = paramString.iterator();
      while (paramString.hasNext())
      {
        EventHandler localEventHandler = (EventHandler)paramString.next();
        if (((paramICallback == null) || (paramICallback == localEventHandler.getCallback())) && ((paramObject == null) || (paramObject == localEventHandler.getContext()))) {
          paramString.remove();
        }
      }
    }
  }
  
  public void command(String paramString, Object paramObject)
  {
    if (_isShutDown) {
      return;
    }
    ICallback localICallback = (ICallback)_commands.get(paramString);
    if (localICallback == null)
    {
      _logger.warn(_logTag, "#command > No command handler for: " + paramString);
      return;
    }
    localICallback.call(paramObject);
  }
  
  public void comply(String paramString, ICallback paramICallback)
  {
    try
    {
      if (_isShutDown) {
        return;
      }
      _commands.put(paramString, paramICallback);
      return;
    }
    finally {}
  }
  
  public void off()
  {
    off(null, null, null);
  }
  
  public void off(String paramString, ICallback paramICallback, Object paramObject)
  {
    try
    {
      if (_isShutDown) {
        return;
      }
      if ((paramString == null) && (paramICallback == null) && (paramObject == null))
      {
        _listeners.clear();
        return;
      }
    }
    finally {}
    if (paramString == null)
    {
      paramString = _listeners.keySet().iterator();
      while (paramString.hasNext()) {
        _removeListener((String)paramString.next(), paramICallback, paramObject);
      }
      paramString = _listeners.keySet().iterator();
      while (paramString.hasNext())
      {
        paramICallback = (String)paramString.next();
        if (((List)_listeners.get(paramICallback)).size() == 0) {
          paramString.remove();
        }
      }
    }
    _removeListener(paramString, paramICallback, paramObject);
  }
  
  public void on(String paramString, ICallback paramICallback, Object paramObject)
  {
    try
    {
      if (_isShutDown) {
        return;
      }
      if (!_listeners.containsKey(paramString)) {
        _listeners.put(paramString, new ArrayList());
      }
      ((List)_listeners.get(paramString)).add(new EventHandler(paramICallback, paramObject));
      return;
    }
    finally {}
  }
  
  public void reply(String paramString, ICallback paramICallback)
  {
    try
    {
      if (_isShutDown) {
        return;
      }
      _requests.put(paramString, paramICallback);
      return;
    }
    finally {}
  }
  
  public Object request(String paramString)
  {
    return request(paramString, null);
  }
  
  public Object request(String paramString, Object paramObject)
  {
    try
    {
      if (_isShutDown) {
        return null;
      }
      ICallback localICallback = (ICallback)_requests.get(paramString);
      if (localICallback == null)
      {
        _logger.warn(_logTag, "#request > No request handler for: " + paramString);
        return null;
      }
      paramString = localICallback.call(paramObject);
      return paramString;
    }
    finally {}
  }
  
  public void shutdown()
  {
    try
    {
      if (_isShutDown) {
        return;
      }
      _logger.debug(_logTag, " #shutdown > Shutting down");
      off(null, null, null);
      _requests.clear();
      _commands.clear();
      _isShutDown = true;
      return;
    }
    finally {}
  }
  
  public String toString()
  {
    return "<channel: " + _name + ">";
  }
  
  public void trigger(Event paramEvent)
  {
    try
    {
      if (_isShutDown) {
        return;
      }
      Iterator localIterator = _listeners.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Object localObject2 = (Map.Entry)localIterator.next();
        Object localObject1 = (String)((Map.Entry)localObject2).getKey();
        localObject2 = (List)((Map.Entry)localObject2).getValue();
        if (_matchWildcard((String)localObject1, paramEvent.getName()))
        {
          localObject1 = ((List)localObject2).iterator();
          while (((Iterator)localObject1).hasNext()) {
            ((EventHandler)((Iterator)localObject1).next()).getCallback().call(paramEvent);
          }
        }
      }
    }
    finally {}
  }
  
  private static class EventHandler
  {
    private final ICallback _callback;
    private final Object _context;
    
    EventHandler(ICallback paramICallback, Object paramObject)
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
}

/* Location:
 * Qualified Name:     com.adobe.primetime.core.radio.Channel
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */