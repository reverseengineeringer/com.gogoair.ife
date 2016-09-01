package com.adobe.primetime.va.service.clock;

import java.util.Date;

final class TimerDescriptor
{
  private long _createdTimeStamp;
  private double _interval;
  private boolean _isActive;
  private String _name;
  private long _nextTickTimeStamp;
  private int _repeatCount;
  private int _tick;
  
  TimerDescriptor(String paramString, double paramDouble, int paramInt)
  {
    _interval = paramDouble;
    _name = paramString;
    _isActive = false;
    _repeatCount = paramInt;
    reset();
  }
  
  private void _updateNextTickTimeStamp()
  {
    _nextTickTimeStamp = (_createdTimeStamp + (_interval * 1000.0D * (_tick + 1)));
  }
  
  public double getInterval()
  {
    return _interval;
  }
  
  public String getName()
  {
    return _name;
  }
  
  public int getRepeatCount()
  {
    return _repeatCount;
  }
  
  public int getTick()
  {
    return _tick;
  }
  
  public void isActive(boolean paramBoolean)
  {
    _isActive = paramBoolean;
  }
  
  public boolean isActive()
  {
    return _isActive;
  }
  
  public void reset()
  {
    _tick = 0;
    _createdTimeStamp = new Date().getTime();
    _updateNextTickTimeStamp();
  }
  
  public void setRepeatCount(int paramInt)
  {
    _repeatCount = paramInt;
  }
  
  public boolean shouldTick()
  {
    if (new Date().getTime() > _nextTickTimeStamp - TimerManager.TIMER_BASE_INTERVAL / 2.0D)
    {
      _tick += 1;
      _updateNextTickTimeStamp();
      return true;
    }
    return false;
  }
}

/* Location:
 * Qualified Name:     com.adobe.primetime.va.service.clock.TimerDescriptor
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */