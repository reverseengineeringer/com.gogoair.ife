package com.adobe.primetime.va.plugins.ah.engine.clock;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.core.plugin.PluginManager;
import com.adobe.primetime.core.radio.Channel;
import java.util.ArrayList;
import java.util.HashMap;

class Timer
{
  private static final String CLOCK_SERVICE = "service.clock";
  private static final String CMD_CREATE = "create";
  private static final String CMD_DESTROY = "destroy";
  private static final String CMD_PAUSE = "pause";
  private static final String CMD_RESUME = "resume";
  private static final String HEARTBEAT_PLUGIN = "heartbeat";
  protected static final String KEY_INTERVAL = "interval";
  protected static final String KEY_NAME = "name";
  protected static final String KEY_RESET = "reset";
  private static final String REQ_TIMER_IS_PAUSED = "is_paused";
  protected Channel _channel;
  private ICallback _cmdPause = new Timer.2(this);
  private ICallback _cmdResume = new Timer.1(this);
  protected Double _interval;
  private boolean _isDestroyed;
  protected String _logTag;
  protected ILogger _logger;
  protected String _name;
  private ICallback _onTick = new Timer.3(this);
  protected PluginManager _pluginManager;
  
  Timer(PluginManager paramPluginManager, Channel paramChannel, String paramString, double paramDouble, ILogger paramILogger)
  {
    if (paramChannel == null) {
      throw new Error("Reference to the channel object cannot be NULL.");
    }
    _channel = paramChannel;
    if (paramPluginManager == null) {
      throw new Error("Reference to the pluginManager object cannot be NULL.");
    }
    _pluginManager = paramPluginManager;
    if (paramILogger == null) {
      throw new Error("Reference to the logger object cannot be NULL.");
    }
    _logger = paramILogger;
    _logTag = getClass().getSimpleName();
    _isDestroyed = false;
    _createTimer(paramString, paramDouble);
    _installHandlers();
  }
  
  private void _createTimer(String paramString, double paramDouble)
  {
    _name = paramString;
    _interval = Double.valueOf(paramDouble);
    paramString = new HashMap();
    paramString.put("name", "heartbeat." + _name);
    paramString.put("interval", _interval);
    _pluginManager.command("service.clock", "create", paramString);
  }
  
  private void _installHandlers()
  {
    _channel.comply("clock:" + _name + ".resume", _cmdResume);
    _channel.comply("clock:" + _name + ".pause", _cmdPause);
    _pluginManager.on("service.clock", "heartbeat." + _name + ".tick", _onTick, this);
  }
  
  private void _uninstallHandlers()
  {
    _channel.off(null, null, this);
    _pluginManager.off(null, null, null, this);
  }
  
  public void destroy()
  {
    if (_isDestroyed) {
      return;
    }
    _isDestroyed = true;
    _uninstallHandlers();
    HashMap localHashMap = new HashMap();
    localHashMap.put("name", "heartbeat." + _name);
    _pluginManager.command("service.clock", "destroy", localHashMap);
  }
  
  public void pause(Boolean paramBoolean)
  {
    _logger.debug(_logTag, "Stopping timer: " + _name);
    HashMap localHashMap = new HashMap();
    localHashMap.put("name", "heartbeat." + _name);
    localHashMap.put("reset", paramBoolean);
    _pluginManager.command("service.clock", "pause", localHashMap);
  }
  
  public void resume(Boolean paramBoolean)
  {
    _logger.debug(_logTag, "Starting timer: " + _name);
    HashMap localHashMap = new HashMap();
    localHashMap.put("name", "heartbeat." + _name);
    localHashMap.put("reset", paramBoolean);
    _pluginManager.command("service.clock", "resume", localHashMap);
  }
  
  void setInterval(double paramDouble)
  {
    Object localObject = "is_paused.heartbeat." + _name;
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(localObject);
    localObject = (Boolean)((HashMap)_pluginManager.request("service.clock", localArrayList)).get(localObject);
    pause(Boolean.valueOf(true));
    _createTimer(_name, paramDouble);
    if (!((Boolean)localObject).booleanValue()) {
      resume(Boolean.valueOf(true));
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.plugins.ah.engine.clock.Timer
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */