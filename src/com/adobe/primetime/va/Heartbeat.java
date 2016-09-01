package com.adobe.primetime.va;

import com.adobe.primetime.core.ILogger;
import com.adobe.primetime.core.Logger;
import com.adobe.primetime.core.plugin.IPlugin;
import com.adobe.primetime.core.plugin.PluginManager;
import com.adobe.primetime.va.service.clock.ClockService;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class Heartbeat
{
  private static final String ADOBE_ANALYTICS_PLUGIN = "adobe-analytics";
  private static final String ADOBE_HEARTBEAT_PLUGIN = "adobe-heartbeat";
  private static final String PLAYER_PLUGIN = "player";
  private boolean _isDestroyed;
  private String _logTag = Heartbeat.class.getSimpleName();
  private ILogger _logger = new Logger();
  private PluginManager _pluginManager = new PluginManager(_logger);
  
  public Heartbeat(HeartbeatDelegate paramHeartbeatDelegate)
  {
    this(paramHeartbeatDelegate, null);
  }
  
  public Heartbeat(HeartbeatDelegate paramHeartbeatDelegate, List paramList)
  {
    _pluginManager.addPlugin(new ClockService(_logger));
    if (paramList != null)
    {
      Collections.sort(paramList, new Heartbeat.1(this));
      paramHeartbeatDelegate = paramList.iterator();
      while (paramHeartbeatDelegate.hasNext())
      {
        paramList = (IPlugin)paramHeartbeatDelegate.next();
        _pluginManager.addPlugin(paramList);
      }
    }
    _pluginManager.setupPlugins();
    _isDestroyed = false;
  }
  
  public void configure(HeartbeatConfig paramHeartbeatConfig)
  {
    if (paramHeartbeatConfig == null) {
      try
      {
        throw new Error("Configuration object cannot be NULL.");
      }
      finally {}
    }
    if (debugLogging) {
      _logger.enable();
    }
    for (;;)
    {
      if (_isDestroyed) {
        _logger.error(_logTag, "Instance is destroyed.");
      }
      return;
      _logger.disable();
    }
  }
  
  /* Error */
  public void destroy()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 91	com/adobe/primetime/va/Heartbeat:_isDestroyed	Z
    //   6: istore_1
    //   7: iload_1
    //   8: ifeq +6 -> 14
    //   11: aload_0
    //   12: monitorexit
    //   13: return
    //   14: aload_0
    //   15: getfield 50	com/adobe/primetime/va/Heartbeat:_pluginManager	Lcom/adobe/primetime/core/plugin/PluginManager;
    //   18: invokevirtual 122	com/adobe/primetime/core/plugin/PluginManager:destroy	()V
    //   21: aload_0
    //   22: iconst_1
    //   23: putfield 91	com/adobe/primetime/va/Heartbeat:_isDestroyed	Z
    //   26: goto -15 -> 11
    //   29: astore_2
    //   30: aload_0
    //   31: monitorexit
    //   32: aload_2
    //   33: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	34	0	this	Heartbeat
    //   6	2	1	bool	boolean
    //   29	4	2	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	7	29	finally
    //   14	26	29	finally
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.Heartbeat
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */