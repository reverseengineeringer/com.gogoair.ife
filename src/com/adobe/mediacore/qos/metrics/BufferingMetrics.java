package com.adobe.mediacore.qos.metrics;

import com.adobe.mediacore.utils.DateUtils;
import java.util.Date;

public class BufferingMetrics
{
  private long _emptyBufferCount;
  private Date _lastBufferingStartDate;
  private long _totalBufferingTime;
  
  public BufferingMetrics()
  {
    reset();
  }
  
  public long getEmptyBufferCount()
  {
    return _emptyBufferCount;
  }
  
  public long getTotalBufferingTime()
  {
    return _totalBufferingTime;
  }
  
  public void recordBufferEmpty()
  {
    _emptyBufferCount += 1L;
    _lastBufferingStartDate = new Date();
  }
  
  public void recordBufferFull()
  {
    _totalBufferingTime += DateUtils.getMillisecondsSince(_lastBufferingStartDate);
    _lastBufferingStartDate = null;
  }
  
  public void reset()
  {
    _emptyBufferCount = 0L;
    _totalBufferingTime = 0L;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.qos.metrics.BufferingMetrics
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */