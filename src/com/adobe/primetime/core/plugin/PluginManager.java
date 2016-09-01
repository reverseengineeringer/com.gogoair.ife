package com.adobe.primetime.core.plugin;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.core.Trigger;
import com.adobe.primetime.core.radio.Channel;
import com.adobe.primetime.core.radio.Radio;
import com.adobe.primetime.va.ErrorInfo;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class PluginManager
{
  public static final String ALL_PLUGINS = "*";
  private static final String CTRL_CHANNEL = "ctrl_channel";
  private static final String DATA_CHANNEL = "data_channel";
  private Map _behaviours;
  private Channel _ctrlChannel;
  private Channel _dataChannel;
  private ErrorInfo _errorInfo;
  private boolean _isDestroyed;
  private String _logTag;
  private ILogger _logger;
  private Map _plugins;
  private Radio _radio;
  
  public PluginManager(ILogger paramILogger)
  {
    if (paramILogger == null) {
      throw new Error("Reference to the logger object cannot be NULL");
    }
    _logTag = PluginManager.class.getSimpleName();
    _logger = paramILogger;
    _isDestroyed = false;
    _plugins = new HashMap();
    _behaviours = new HashMap();
    _radio = new Radio(_logger);
    _ctrlChannel = _radio.channel("ctrl_channel");
    _dataChannel = _radio.channel("data_channel");
  }
  
  public void addPlugin(IPlugin paramIPlugin)
  {
    if (_isDestroyed) {
      return;
    }
    String str = paramIPlugin.getName();
    if (_plugins.get(str) != null) {
      _logger.info(_logTag, "#addPlugin > Replacing plugin: " + paramIPlugin.getName());
    }
    _plugins.put(str, paramIPlugin);
    paramIPlugin.bootstrap(this);
  }
  
  public void command(String paramString1, String paramString2, Object paramObject)
  {
    _dataChannel.command(paramString1 + ":" + paramString2, paramObject);
  }
  
  public void comply(IPlugin paramIPlugin, String paramString, ICallback paramICallback)
  {
    _dataChannel.comply(paramIPlugin.getName() + ":" + paramString, paramICallback);
  }
  
  public void destroy()
  {
    _isDestroyed = true;
    Iterator localIterator = _plugins.values().iterator();
    while (localIterator.hasNext()) {
      ((IPlugin)localIterator.next()).destroy();
    }
    _radio.shutdown();
  }
  
  public ErrorInfo getErrorInfo()
  {
    return _errorInfo;
  }
  
  public boolean isPluginInitialized(String paramString)
  {
    return (!_isDestroyed) && (_plugins.get(paramString) != null) && (((IPlugin)_plugins.get(paramString)).isInitialized());
  }
  
  public void off(String paramString1, String paramString2, ICallback paramICallback, Object paramObject)
  {
    if (_isDestroyed) {
      return;
    }
    if ((paramString1 != null) && (paramString2 != null)) {}
    for (paramString1 = paramString1 + ":" + paramString2;; paramString1 = null)
    {
      _dataChannel.off(paramString1, paramICallback, paramObject);
      return;
    }
  }
  
  public void on(String paramString1, String paramString2, ICallback paramICallback, Object paramObject)
  {
    if (_isDestroyed) {
      return;
    }
    _dataChannel.on(paramString1 + ":" + paramString2, paramICallback, paramObject);
  }
  
  public Boolean pluginExists(String paramString)
  {
    if ((!_isDestroyed) && (_plugins.get(paramString) != null)) {}
    for (boolean bool = true;; bool = false) {
      return Boolean.valueOf(bool);
    }
  }
  
  public void raise(ErrorInfo paramErrorInfo)
  {
    _errorInfo = paramErrorInfo;
    paramErrorInfo = new Event("error", paramErrorInfo);
    _ctrlChannel.trigger(paramErrorInfo);
  }
  
  public void registerBehaviour(Trigger paramTrigger, IPlugin paramIPlugin, String paramString, ArrayList paramArrayList)
  {
    String str = paramTrigger.getName();
    paramTrigger = new Behaviour(paramTrigger, paramIPlugin, paramString, paramArrayList);
    if (!_behaviours.containsKey(str)) {
      _behaviours.put(str, new ArrayList());
    }
    ((List)_behaviours.get(str)).add(paramTrigger);
  }
  
  public Object request(String paramString, ArrayList paramArrayList)
  {
    if (_isDestroyed) {
      return null;
    }
    paramString = (IPlugin)_plugins.get(paramString);
    if ((paramString == null) || (paramArrayList == null) || (paramArrayList.size() == 0)) {
      return null;
    }
    return paramString.resolveData(paramArrayList);
  }
  
  public void setupPlugins()
  {
    if (_isDestroyed) {}
    for (;;)
    {
      return;
      Iterator localIterator = _plugins.values().iterator();
      while (localIterator.hasNext()) {
        ((IPlugin)localIterator.next()).setup();
      }
    }
  }
  
  public void trigger(Event paramEvent)
  {
    Object localObject1 = paramEvent.getName();
    Object localObject2 = (ArrayList)_behaviours.get(localObject1);
    if (_isDestroyed) {
      return;
    }
    if (localObject2 != null)
    {
      Object localObject3 = new HashMap();
      localObject1 = new HashMap();
      Object localObject4 = ((ArrayList)localObject2).iterator();
      Object localObject5;
      ParamMapping localParamMapping;
      while (((Iterator)localObject4).hasNext())
      {
        localObject5 = ((Behaviour)((Iterator)localObject4).next()).getParams().iterator();
        while (((Iterator)localObject5).hasNext())
        {
          localParamMapping = (ParamMapping)((Iterator)localObject5).next();
          if (!((Map)localObject3).containsKey(localParamMapping.getPluginName())) {
            ((Map)localObject3).put(localParamMapping.getPluginName(), new ArrayList());
          }
          if (!((List)((Map)localObject3).get(localParamMapping.getPluginName())).contains(localParamMapping.getKey())) {
            ((List)((Map)localObject3).get(localParamMapping.getPluginName())).add(localParamMapping.getKey());
          }
        }
      }
      localObject4 = ((Map)localObject3).keySet().iterator();
      while (((Iterator)localObject4).hasNext())
      {
        localObject5 = (String)((Iterator)localObject4).next();
        if (((Map)localObject3).containsKey(localObject5)) {
          ((Map)localObject1).put(localObject5, request((String)localObject5, (ArrayList)((Map)localObject3).get(localObject5)));
        }
      }
      localObject2 = ((ArrayList)localObject2).iterator();
      while (((Iterator)localObject2).hasNext())
      {
        localObject3 = (Behaviour)((Iterator)localObject2).next();
        localObject4 = new HashMap();
        ((Map)localObject4).put("_behaviour", localObject3);
        ((Map)localObject4).put("_eventData", paramEvent.getData());
        localObject5 = ((Behaviour)localObject3).getParams().iterator();
        while (((Iterator)localObject5).hasNext())
        {
          localParamMapping = (ParamMapping)((Iterator)localObject5).next();
          HashMap localHashMap = (HashMap)((Map)localObject1).get(localParamMapping.getPluginName());
          ((Map)localObject4).put(localParamMapping.getParamName(), localHashMap.get(localParamMapping.getKey()));
        }
        command(((Behaviour)localObject3).getPlugin().getName(), ((Behaviour)localObject3).getAction(), localObject4);
      }
    }
    _dataChannel.trigger(paramEvent);
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.core.plugin.PluginManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */