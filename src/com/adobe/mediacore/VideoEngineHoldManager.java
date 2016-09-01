package com.adobe.mediacore;

import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;

final class VideoEngineHoldManager
{
  private static final String LOG_TAG = "[PSDK]::" + VideoEngineHoldManager.class.getSimpleName();
  private static final Logger _logger = Log.getLogger(LOG_TAG);
  private final Set _holdPositions = new TreeSet();
  private final VideoEngineTimelineProxy _videoEngineTimelineProxy;
  
  public VideoEngineHoldManager(VideoEngineTimelineProxy paramVideoEngineTimelineProxy)
  {
    _videoEngineTimelineProxy = paramVideoEngineTimelineProxy;
  }
  
  public void addHoldPostion(long paramLong)
  {
    if (!_holdPositions.contains(Long.valueOf(paramLong)))
    {
      _logger.i(LOG_TAG + "#addHoldPosition", "Adding in backend new hold positon " + paramLong);
      _holdPositions.add(Long.valueOf(paramLong));
    }
  }
  
  public long removeHoldFor(long paramLong)
  {
    for (;;)
    {
      try
      {
        if (_holdPositions.contains(Long.valueOf(paramLong)))
        {
          _logger.i(LOG_TAG + "#removeHoldFor", "Removing HOLD at " + paramLong);
          _holdPositions.remove(Long.valueOf(paramLong));
          Iterator localIterator = _holdPositions.iterator();
          if (localIterator.hasNext())
          {
            paramLong = ((Long)localIterator.next()).longValue();
            if (!_videoEngineTimelineProxy.setHoldAt(paramLong)) {
              continue;
            }
            _logger.i(LOG_TAG + "#removeHoldFor", "Moved HOLD position to " + paramLong);
            return paramLong;
          }
          if (_videoEngineTimelineProxy.setHoldAt(0L))
          {
            _logger.i(LOG_TAG + "#removeHoldFor", "No hold is active anymore.");
            paramLong = -1L;
            continue;
          }
          _logger.e(LOG_TAG + "#removeHoldFor", "Unable to remove hold!");
        }
        else
        {
          _logger.i(LOG_TAG + "#removeHoldFor", "Unable to remove HOLD at [" + paramLong + "]. Position does not exist in internal list.");
        }
      }
      finally {}
      paramLong = -1L;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.VideoEngineHoldManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */