package com.adobe.mediacore;

final class Profiler
{
  private long _elapsedTime;
  private long _totalElapsedTime;
  
  long getElapsedTime()
  {
    return _elapsedTime;
  }
  
  long getTotalElapsedTime()
  {
    return _totalElapsedTime;
  }
  
  void registerElapsedTime()
  {
    _elapsedTime = (System.currentTimeMillis() - _elapsedTime);
    _totalElapsedTime += _elapsedTime;
  }
  
  void registerStartElapsedTime()
  {
    _elapsedTime = System.currentTimeMillis();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.Profiler
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */