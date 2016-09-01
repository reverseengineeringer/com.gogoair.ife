package com.adobe.primetime.va.service.clock;

import com.adobe.primetime.core.ICallback;
import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.core.plugin.BasePlugin;
import com.adobe.primetime.core.plugin.PluginManager;
import java.util.HashMap;
import java.util.Map;

public class ClockService
  extends BasePlugin
{
  private static final String CMD_CREATE = "create";
  private static final String CMD_DESTROY = "destroy";
  private static final String CMD_PAUSE = "pause";
  private static final String CMD_RESUME = "resume";
  private static final String KEY_INTERVAL = "interval";
  private static final String KEY_NAME = "name";
  private static final String KEY_REPEAT_COUNT = "repeat_count";
  private static final String KEY_RESET = "reset";
  private static final String KEY_TICK = "tick";
  private static final String NAME = "service.clock";
  private static final int REPEAT_FOREVER = -1;
  private static final String REQ_IS_PAUSED = "is_paused";
  private ICallback _cmdCreate = new ClockService.1(this);
  private ICallback _cmdDestroy = new ClockService.4(this);
  private ICallback _cmdPause = new ClockService.2(this);
  private ICallback _cmdResume = new ClockService.3(this);
  private TimerManager _timerManager;
  
  public ClockService(ILogger paramILogger)
  {
    super("service.clock");
    if (paramILogger == null) {
      throw new Error("Reference to the logger cannot be NULL.");
    }
    _logger = paramILogger;
    _timerManager = new TimerManager(this, _logger);
    _setupDataResolver();
  }
  
  private void _setupDataResolver()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("is_paused", new ClockService.5(this));
    _dataResolver = new ClockService.6(this, localHashMap);
  }
  
  protected void _teardown()
  {
    _timerManager.destroy();
  }
  
  public void bootstrap(PluginManager paramPluginManager)
  {
    super.bootstrap(paramPluginManager);
    _pluginManager.comply(this, "create", _cmdCreate);
    _pluginManager.comply(this, "resume", _cmdResume);
    _pluginManager.comply(this, "pause", _cmdPause);
    _pluginManager.comply(this, "destroy", _cmdDestroy);
  }
  
  void onTick(String paramString, double paramDouble, int paramInt)
  {
    paramString = paramString + ".tick";
    HashMap localHashMap = new HashMap();
    localHashMap.put("name", paramString);
    localHashMap.put("interval", Double.valueOf(paramDouble));
    localHashMap.put("tick", Integer.valueOf(paramInt));
    _trigger(paramString, localHashMap);
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.service.clock.ClockService
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */