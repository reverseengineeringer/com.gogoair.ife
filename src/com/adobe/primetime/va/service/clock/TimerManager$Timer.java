package com.adobe.primetime.va.service.clock;

import android.os.Handler;
import android.os.HandlerThread;
import com.adobe.primetime.core.ILogger;

class TimerManager$Timer
  extends HandlerThread
{
  private Handler _handler;
  private boolean _shouldStop = false;
  
  TimerManager$Timer(TimerManager paramTimerManager)
  {
    super("VideoHeartbeatClock");
    start();
    if (getLooper() == null)
    {
      TimerManager.access$100(paramTimerManager).error(TimerManager.access$000(paramTimerManager), "Unable to obtain looper thread.");
      return;
    }
    _handler = new Handler(getLooper());
    Handler localHandler = _handler;
    localHandler.post(new TimerManager.Timer.1(this, paramTimerManager, localHandler));
  }
  
  public void invalidate()
  {
    _shouldStop = true;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.service.clock.TimerManager.Timer
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */