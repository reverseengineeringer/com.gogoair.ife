package com.adobe.mediacore;

import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;

final class VideoEngineTimelineHold
  implements TimelineHold
{
  private static final String LOG_TAG = "[PSDK]::" + VideoEngineTimelineHold.class.getSimpleName();
  private static final Logger _logger = Log.getLogger(LOG_TAG);
  private final long _time;
  private final VideoEngineTimelineProxy _videoEngineTimelineProxy;
  private int referenceCount;
  
  public VideoEngineTimelineHold(VideoEngineTimelineProxy paramVideoEngineTimelineProxy, long paramLong)
  {
    _videoEngineTimelineProxy = paramVideoEngineTimelineProxy;
    _time = paramLong;
  }
  
  public void addReference(long paramLong)
  {
    if (paramLong == _time)
    {
      referenceCount += 1;
      _logger.i(LOG_TAG + "#addReference", "Number of references for HOLD at time = " + paramLong + " is " + referenceCount);
    }
  }
  
  public long getHoldTime()
  {
    return _time;
  }
  
  public boolean isReleased()
  {
    return referenceCount == 0;
  }
  
  public void releaseReference(long paramLong)
  {
    if (paramLong == _time)
    {
      referenceCount -= 1;
      _logger.i(LOG_TAG + "#releaseReference", "Number of references for HOLD at time = " + paramLong + " is " + referenceCount);
      if (referenceCount == 0) {
        _videoEngineTimelineProxy.removeHoldFor(_time);
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.VideoEngineTimelineHold
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */