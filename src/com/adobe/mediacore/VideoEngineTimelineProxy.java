package com.adobe.mediacore;

import com.adobe.ave.Timeline;
import com.adobe.ave.VideoEngineException;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.utils.TimeRange;
import java.util.Hashtable;
import java.util.Map;

final class VideoEngineTimelineProxy
{
  private static final String LOG_TAG = "[PSDK]::" + VideoEngineTimelineProxy.class.getSimpleName();
  private static final Logger _logger = Log.getLogger(LOG_TAG);
  private long _currentHoldTime = -1L;
  private final Timeline _timeline;
  private final Map _timelineHoldMap = new Hashtable();
  private final VideoEngineHoldManager _videoEngineHoldManager;
  private final VideoEngineAdapter.VideoEnginePlaybackMetrics _videoEnginePlaybackMetrics;
  
  public VideoEngineTimelineProxy(Timeline paramTimeline, VideoEngineAdapter.VideoEnginePlaybackMetrics paramVideoEnginePlaybackMetrics)
  {
    if (paramTimeline == null) {
      throw new IllegalArgumentException("Invalid argument received. Timeline cannot be null");
    }
    if (paramVideoEnginePlaybackMetrics == null) {
      throw new IllegalArgumentException("Invalid argument received. VideoEnginePlaybackMetrics cannot be null");
    }
    _timeline = paramTimeline;
    _videoEnginePlaybackMetrics = paramVideoEnginePlaybackMetrics;
    _videoEngineHoldManager = new VideoEngineHoldManager(this);
  }
  
  private boolean isInPlaybackRange(long paramLong)
  {
    return _videoEnginePlaybackMetrics.getPlaybackRange().contains(paramLong);
  }
  
  public void addHoldReference(long paramLong)
  {
    if (_timelineHoldMap.containsKey(Long.valueOf(paramLong))) {
      ((TimelineHold)_timelineHoldMap.get(Long.valueOf(paramLong))).addReference(paramLong);
    }
  }
  
  public void addHoldReference(TimelineHold paramTimelineHold)
  {
    long l = paramTimelineHold.getHoldTime();
    if (!_timelineHoldMap.containsKey(Long.valueOf(l))) {
      _timelineHoldMap.put(Long.valueOf(l), paramTimelineHold);
    }
    paramTimelineHold.addReference(l);
  }
  
  public boolean containsHoldFor(long paramLong)
  {
    return _timelineHoldMap.containsKey(Long.valueOf(paramLong));
  }
  
  public long getCurrentHoldTime()
  {
    return _currentHoldTime;
  }
  
  public TimelineHold getHoldAt(long paramLong)
  {
    if (!isInPlaybackRange(paramLong)) {
      _logger.w(LOG_TAG + "#getHoldAt", "Cannot retrieve HOLD for this time " + paramLong + ". Value given is not in playback range");
    }
    do
    {
      return null;
      if (isTimeBeforeReadHead(paramLong))
      {
        _logger.w(LOG_TAG + "#getHoldAt", "Cannot retrieve HOLD for this time " + paramLong + ". Value given is before read head");
        return null;
      }
      if ((_currentHoldTime != -1L) && (paramLong > _currentHoldTime))
      {
        _logger.i(LOG_TAG + "#getHoldAt", "Pending HOLD for time " + paramLong);
        _videoEngineHoldManager.addHoldPostion(paramLong);
        return new VideoEngineTimelineHold(this, paramLong);
      }
    } while (!setHoldAt(paramLong));
    _logger.i(LOG_TAG + "#getHoldAt", "Creating HOLD for time " + paramLong);
    VideoEngineTimeline.printTimeline(_timeline);
    VideoEngineAdapter.printLivePlaybackWindowState(_videoEnginePlaybackMetrics);
    _videoEngineHoldManager.addHoldPostion(paramLong);
    _currentHoldTime = paramLong;
    return new VideoEngineTimelineHold(this, paramLong);
  }
  
  public boolean isTimeBeforeReadHead(long paramLong)
  {
    _videoEnginePlaybackMetrics.update();
    long l = _videoEnginePlaybackMetrics.getReadHead();
    VideoEngineAdapter.printLivePlaybackWindowState(_videoEnginePlaybackMetrics);
    Logger localLogger = _logger;
    String str = LOG_TAG + "#isTimeBeforeReadHead";
    StringBuilder localStringBuilder = new StringBuilder().append("Is time provided [").append(paramLong).append("] before read head [").append(l).append("] - ");
    boolean bool;
    if (paramLong <= l)
    {
      bool = true;
      localLogger.i(str, bool);
      if (paramLong > 0L) {
        break label132;
      }
      if (paramLong >= l) {
        break label130;
      }
    }
    label130:
    label132:
    while (paramLong <= l)
    {
      return true;
      bool = false;
      break;
      return false;
    }
    return false;
  }
  
  public void releaseHoldReference(long paramLong)
  {
    if (_timelineHoldMap.containsKey(Long.valueOf(paramLong))) {
      ((TimelineHold)_timelineHoldMap.get(Long.valueOf(paramLong))).releaseReference(paramLong);
    }
  }
  
  protected void removeHoldFor(long paramLong)
  {
    if (_timelineHoldMap.containsKey(Long.valueOf(paramLong)))
    {
      VideoEngineTimeline.printTimeline(_timeline);
      VideoEngineAdapter.printLivePlaybackWindowState(_videoEnginePlaybackMetrics);
      _timelineHoldMap.remove(Long.valueOf(paramLong));
      _currentHoldTime = _videoEngineHoldManager.removeHoldFor(paramLong);
    }
  }
  
  protected boolean setHoldAt(long paramLong)
  {
    try
    {
      _logger.i(LOG_TAG + "#setHoldAt", "Setting AVE hold at " + paramLong);
      _timeline.setHoldAt(paramLong);
      return true;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      _logger.w(LOG_TAG + "#setHoldAdt", "VideoEngineException raise while placing HOLD for time " + paramLong, localVideoEngineException);
    }
    return false;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.VideoEngineTimelineProxy
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */