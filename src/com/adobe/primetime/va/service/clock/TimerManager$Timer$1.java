package com.adobe.primetime.va.service.clock;

import android.os.Handler;

class TimerManager$Timer$1
  implements Runnable
{
  TimerManager$Timer$1(TimerManager.Timer paramTimer, TimerManager paramTimerManager, Handler paramHandler) {}
  
  public void run()
  {
    if (!TimerManager.Timer.access$200(this$1))
    {
      TimerManager.access$300(this$1.this$0);
      val$handler.postDelayed(this, (TimerManager.TIMER_BASE_INTERVAL * 1000.0D));
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.service.clock.TimerManager.Timer.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */