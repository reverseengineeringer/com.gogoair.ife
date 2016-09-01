package com.adobe.primetime.va.service.clock;

class TimerManager$TimerHolder
{
  private double _interval;
  private String _name;
  private int _tick;
  
  TimerManager$TimerHolder(TimerManager paramTimerManager, String paramString, double paramDouble, int paramInt)
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

/* Location:
 * Qualified Name:     com.adobe.primetime.va.service.clock.TimerManager.TimerHolder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */