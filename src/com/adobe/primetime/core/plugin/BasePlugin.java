package com.adobe.primetime.core.plugin;

import com.adobe.primetime.core.Event;
import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.core.Logger;
import com.adobe.primetime.core.Trigger;
import com.adobe.primetime.va.ErrorInfo;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class BasePlugin
  implements IPlugin
{
  public static final String ERROR_INFO = "error_info";
  protected static final String INITIALIZED = "initialized";
  public static final String STATE_PLUGIN = "state";
  protected Object _dataResolver;
  protected boolean _isDestroyed;
  protected boolean _isEnabled;
  protected boolean _isInitialized;
  protected String _logTag;
  protected ILogger _logger;
  protected String _name;
  protected PluginManager _pluginManager;
  
  public BasePlugin(String paramString)
  {
    _name = paramString;
    _isInitialized = false;
    _isDestroyed = false;
    _isEnabled = true;
    _dataResolver = new HashMap();
    _logTag = getClass().getSimpleName();
    _logger = new Logger();
  }
  
  protected boolean _canProcess()
  {
    if (!_isEnabled)
    {
      _logger.error(_logTag, "#_canProcess() > Plugin disabled.");
      return false;
    }
    if (_isDestroyed)
    {
      _logger.error(_logTag, "#_canProcess() > Plugin destroyed.");
      return false;
    }
    return true;
  }
  
  protected void _disabled() {}
  
  protected void _enabled() {}
  
  protected void _teardown() {}
  
  protected void _trigger(String paramString, Object paramObject)
  {
    paramString = Event.createFromTrigger(new Trigger(_name, paramString));
    paramString.setData(paramObject);
    _pluginManager.trigger(paramString);
  }
  
  public void bootstrap(PluginManager paramPluginManager)
  {
    _pluginManager = paramPluginManager;
    if (_isDestroyed) {
      _pluginManager.raise(new ErrorInfo("Invalid State.", "Plugin already destroyed."));
    }
  }
  
  public void configure(IPluginConfig paramIPluginConfig) {}
  
  public void destroy()
  {
    if (_isDestroyed) {
      return;
    }
    _isDestroyed = true;
    _teardown();
  }
  
  public void disable()
  {
    _isEnabled = false;
    _disabled();
  }
  
  public void enable()
  {
    _isEnabled = true;
    _enabled();
  }
  
  public Logger getLogger()
  {
    return (Logger)_logger;
  }
  
  public String getName()
  {
    return _name;
  }
  
  public boolean isInitialized()
  {
    return _isInitialized;
  }
  
  public Object resolveData(ArrayList paramArrayList)
  {
    if ((!_isEnabled) || (!_isInitialized)) {
      _logger.warn(_logTag, "Unable to retrieve plugin data.. Plugin: " + _name + ". Enabled: " + _isEnabled + ". Initialized: " + _isInitialized + ".");
    }
    do
    {
      do
      {
        do
        {
          return null;
        } while (_dataResolver == null);
        if ((_dataResolver instanceof ICallback)) {
          return ((ICallback)_dataResolver).call(paramArrayList);
        }
      } while (!(_dataResolver instanceof HashMap));
      paramArrayList = paramArrayList.iterator();
    } while (!paramArrayList.hasNext());
    paramArrayList = (String)paramArrayList.next();
    Object localObject = ((HashMap)_dataResolver).get(paramArrayList);
    HashMap localHashMap = new HashMap();
    if ((localObject instanceof ICallback)) {
      return localHashMap.put(paramArrayList, ((ICallback)localObject).call(paramArrayList));
    }
    return localHashMap.put(paramArrayList, ((HashMap)_dataResolver).get(paramArrayList));
  }
  
  public void setup()
  {
    _isInitialized = true;
    _trigger("initialized", null);
  }
  
  public String toString()
  {
    return "<plugin: " + _name + ">";
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.core.plugin.BasePlugin
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */