package com.adobe.primetime.va.service.clock;

import android.os.Handler;
import android.os.HandlerThread;
import com.adobe.primetime.core.ILogger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

final class TimerManager
{
  private static final int REPEAT_FOREVER = -1;
  static double TIMER_BASE_INTERVAL = 0.25D;
  private Timer _baseTimer;
  private boolean _isDestroyed;
  private String _logTag;
  private ILogger _logger;
  private ClockService _service;
  private Map _timers;
  
  TimerManager(ClockService paramClockService, ILogger paramILogger)
  {
    if (paramClockService == null) {
      throw new Error("Reference to ClockService object cannot be NULL.");
    }
    _service = paramClockService;
    if (paramILogger == null) {
      throw new Error("Reference to logger cannot be NULL.");
    }
    _logTag = TimerManager.class.getSimpleName();
    _logger = paramILogger;
    _isDestroyed = false;
    _timers = new HashMap();
    _baseTimer = new Timer();
  }
  
  private void _onTick()
  {
    if (_isDestroyed) {}
    do
    {
      return;
      ArrayList localArrayList = new ArrayList();
      for (;;)
      {
        TimerDescriptor localTimerDescriptor;
        synchronized (_timers)
        {
          Iterator localIterator = _timers.entrySet().iterator();
          if (!localIterator.hasNext()) {
            break;
          }
          localTimerDescriptor = (TimerDescriptor)((Map.Entry)localIterator.next()).getValue();
          if ((!localTimerDescriptor.isActive()) || (!localTimerDescriptor.shouldTick())) {
            continue;
          }
          i = localTimerDescriptor.getRepeatCount();
          if (localTimerDescriptor.getInterval() > 1.0D) {
            _logger.debug(_logTag, "#_onTick() > " + localTimerDescriptor.getName() + "(" + localTimerDescriptor.getTick() + " | " + localTimerDescriptor.getInterval() + " | " + i + ")");
          }
          if (i != 0)
          {
            localArrayList.add(new TimerHolder(localTimerDescriptor.getName(), localTimerDescriptor.getInterval(), localTimerDescriptor.getTick()));
            if (i == -1) {
              continue;
            }
            localTimerDescriptor.setRepeatCount(i);
          }
        }
        destroyTimer(localTimerDescriptor.getName());
      }
    } while (localObject1 == null);
    int i = 0;
    while (i < ((ArrayList)localObject1).size())
    {
      ??? = (TimerHolder)((ArrayList)localObject1).get(i);
      _service.onTick(((TimerHolder)???).getName(), ((TimerHolder)???).getInterval(), ((TimerHolder)???).getTick());
      i += 1;
    }
    ((ArrayList)localObject1).clear();
  }
  
  protected void createTimer(String paramString, double paramDouble, int paramInt)
  {
    synchronized (_timers)
    {
      _timers.put(paramString, new TimerDescriptor(paramString, paramDouble, paramInt));
      return;
    }
  }
  
  protected void destroy()
  {
    if (_isDestroyed) {
      return;
    }
    _isDestroyed = true;
    _timers.clear();
    _baseTimer.invalidate();
    _baseTimer.quit();
  }
  
  protected void destroyTimer(String paramString)
  {
    synchronized (_timers)
    {
      _timers.remove(paramString);
      return;
    }
  }
  
  protected boolean isTimerPaused(String paramString)
  {
    paramString = (TimerDescriptor)_timers.get(paramString);
    if (paramString != null) {
      return !paramString.isActive();
    }
    return false;
  }
  
  protected void pauseTimer(String paramString, boolean paramBoolean)
  {
    synchronized (_timers)
    {
      _logger.debug(_logTag, "#pauseTimer(name=" + paramString + ", " + "reset=" + paramBoolean + ")");
      paramString = (TimerDescriptor)_timers.get(paramString);
      if (paramString != null)
      {
        paramString.isActive(false);
        if (paramBoolean) {
          paramString.reset();
        }
      }
      return;
    }
  }
  
  protected void resumeTimer(String paramString, boolean paramBoolean)
  {
    synchronized (_timers)
    {
      _logger.debug(_logTag, "#resumedTimer(name=" + paramString + ", " + "reset=" + paramBoolean + ")");
      paramString = (TimerDescriptor)_timers.get(paramString);
      if (paramString != null)
      {
        paramString.isActive(true);
        if (paramBoolean) {
          paramString.reset();
        }
      }
      return;
    }
  }
  
  private class Timer
    extends HandlerThread
  {
    private Handler _handler;
    private boolean _shouldStop = false;
    
    Timer()
    {
      super();
      start();
      if (getLooper() == null)
      {
        _logger.error(_logTag, "Unable to obtain looper thread.");
        return;
      }
      _handler = new Handler(getLooper());
      Handler localHandler = _handler;
      localHandler.post(new TimerManager.Timer.1(this, TimerManager.this, localHandler));
    }
    
    public void invalidate()
    {
      _shouldStop = true;
    }
  }
  
  private class TimerHolder
  {
    private double _interval;
    private String _name;
    private int _tick;
    
    TimerHolder(String paramString, double paramDouble, int paramInt)
    {
      _name = paramString;
      _interval = paramDouble;
      _tick = paramInt;
    }
    
    double getInterval()
    {
      return _interval;
    }
    
    String getName()
    {
      return _name;
    }
    
    int getTick()
    {
      return _tick;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.service.clock.TimerManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */