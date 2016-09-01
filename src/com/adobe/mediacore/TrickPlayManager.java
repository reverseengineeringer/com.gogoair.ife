package com.adobe.mediacore;

import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.timeline.advertising.AdPolicyMode;
import java.util.Iterator;
import java.util.List;

public class TrickPlayManager
{
  private static final String LOG_TAG = "[PSDK]::" + TrickPlayManager.class.getSimpleName();
  public static final float NORMAL_PLAYBACK_RATE = 1.0F;
  public static final float PAUSE_PLAYBACK_RATE = 0.0F;
  private static final Logger _logger = Log.getLogger(LOG_TAG);
  private float _currentPlaybackRate = 1.0F;
  private VideoEngineDispatcher _dispatcher;
  private VideoEngineAdapter _engine;
  private long _initialTrickPlayPosition = -1L;
  private MediaPlayerItem _item;
  private long _lastUpdatedTime = 0L;
  private boolean _pendingRatePlayingEvent = false;
  private MediaPlayer _player;
  private boolean _returningFromTrickPlay = false;
  private final SeekAdjustCompletedListener _seekAdjustCompletedListener = new TrickPlayManager.2(this);
  private TimelineMonitor _timelineMonitor;
  
  public TrickPlayManager(MediaPlayer paramMediaPlayer, MediaPlayerItem paramMediaPlayerItem, VideoEngineAdapter paramVideoEngineAdapter, TimelineMonitor paramTimelineMonitor, VideoEngineDispatcher paramVideoEngineDispatcher)
  {
    _player = paramMediaPlayer;
    _engine = paramVideoEngineAdapter;
    _timelineMonitor = paramTimelineMonitor;
    _dispatcher = paramVideoEngineDispatcher;
    _item = paramMediaPlayerItem;
    addEventListeners();
  }
  
  private void addEventListeners()
  {
    _dispatcher.addEventListener(MediaPlayerEvent.Type.SEEK_COMPLETED, new TrickPlayManager.1(this));
  }
  
  private void changeRateWithoutRemovingAds(float paramFloat)
  {
    _logger.i(LOG_TAG + "#changeRate", "switching from one slow motion rate to another slow motion rate");
    paramFloat = getActualRate(paramFloat);
    _engine.enableTrickPlay(paramFloat, false);
    _pendingRatePlayingEvent = true;
    _currentPlaybackRate = paramFloat;
  }
  
  private float getActualRate(float paramFloat)
  {
    Iterator localIterator = _item.getAvailablePlaybackRates().iterator();
    float f2 = -1.0F;
    float f1 = paramFloat;
    float f3;
    if (localIterator.hasNext())
    {
      float f4 = ((Float)localIterator.next()).floatValue();
      if ((paramFloat * f4 <= 0.0F) || (f4 == 1.0F) || (f4 == 0.0F)) {
        break label117;
      }
      f3 = Math.abs(Math.abs(paramFloat) - Math.abs(f4));
      if ((f3 >= f2) && (f2 != -1.0F)) {
        break label117;
      }
      f2 = f4;
      f1 = f3;
    }
    for (;;)
    {
      f3 = f2;
      f2 = f1;
      f1 = f3;
      break;
      return f1;
      label117:
      f3 = f1;
      f1 = f2;
      f2 = f3;
    }
  }
  
  private boolean isWithinNormalPlaybackRateRange(float paramFloat)
  {
    return (paramFloat >= 0.0F) && (paramFloat <= 1.0F);
  }
  
  public void changePlaybackRate(float paramFloat)
  {
    int k = 0;
    if (paramFloat == _currentPlaybackRate)
    {
      _logger.i(LOG_TAG + "#changePlaybackRate", "this rate has been already set.");
      return;
    }
    boolean bool;
    if ((!isWithinNormalPlaybackRateRange(_currentPlaybackRate)) && (isWithinNormalPlaybackRateRange(paramFloat)))
    {
      bool = true;
      _returningFromTrickPlay = bool;
      if ((!isWithinNormalPlaybackRateRange(_currentPlaybackRate)) || (!isWithinNormalPlaybackRateRange(paramFloat))) {
        break label177;
      }
    }
    int j;
    label177:
    for (int i = 1;; i = 0)
    {
      j = k;
      if (isWithinNormalPlaybackRateRange(_currentPlaybackRate)) {
        if (paramFloat <= 1.0F)
        {
          j = k;
          if (paramFloat >= -1.0F) {}
        }
        else
        {
          j = 1;
        }
      }
      if ((i != 0) || (!_timelineMonitor.isPlayingAdBreak())) {
        break label182;
      }
      _logger.w(LOG_TAG + "#changePlaybackRate", "Rate cannot be changed during ad breaks.");
      return;
      bool = false;
      break;
    }
    label182:
    _dispatcher.dispatch(PlaybackRateEvent.createRateSelectedEvent(paramFloat));
    if (i != 0)
    {
      _currentPlaybackRate = paramFloat;
      if (paramFloat == 0.0F)
      {
        _player.pause();
        return;
      }
      if (paramFloat == 1.0F)
      {
        _player.play();
        return;
      }
      changeRateWithoutRemovingAds(paramFloat);
      return;
    }
    if (_returningFromTrickPlay)
    {
      _logger.i(LOG_TAG + "#changePlaybackRate", "returning back from trick-play mode to playback rate");
      _engine.pause();
      long l = _engine.getCurrentTime();
      _engine.returnFromTrickPlay();
      _timelineMonitor.enableAdBreaks();
      VideoEngineTimeline.TimeMapping localTimeMapping = VideoEngineTimeline.TimeMapping.create(-1, _engine.getVirtualTimeForLocalTime(l));
      _logger.i(LOG_TAG + "#changePlaybackRate", "returning to normal mode,  current time=" + _engine.getCurrentTime() + ", desired position=" + localTimeMapping.getTime() + ", begin=" + _initialTrickPlayPosition);
      _currentPlaybackRate = paramFloat;
      if (_seekAdjustCompletedListener != null) {
        _dispatcher.addEventListener(MediaPlayerEvent.Type.SEEK_ADJUST_COMPLETED, _seekAdjustCompletedListener);
      }
      _timelineMonitor.adjustSeekPosition(localTimeMapping, _initialTrickPlayPosition, AdPolicyMode.TRICK_PLAY);
      return;
    }
    if (j != 0)
    {
      _logger.i(LOG_TAG + "#changePlaybackRate", "switching to trick-play mode from allowed playback rate range");
      if (_initialTrickPlayPosition == -1L) {
        _initialTrickPlayPosition = _engine.getCurrentTime();
      }
      paramFloat = getActualRate(paramFloat);
      _timelineMonitor.skipAdBreaks();
      _engine.enableTrickPlay(paramFloat, true);
      _pendingRatePlayingEvent = true;
      _currentPlaybackRate = paramFloat;
      return;
    }
    _logger.i(LOG_TAG + "#changePlaybackRate", "switching from one trick-play rate to another trick-play rate");
    changeRateWithoutRemovingAds(paramFloat);
  }
  
  public float getCurrentPlaybackRate()
  {
    return _currentPlaybackRate;
  }
  
  public boolean isReturningFromTrickPlay()
  {
    return _returningFromTrickPlay;
  }
  
  public boolean trickPlayEnabled()
  {
    return !isWithinNormalPlaybackRateRange(_currentPlaybackRate);
  }
  
  public void update(long paramLong)
  {
    if ((paramLong != _lastUpdatedTime) && (_pendingRatePlayingEvent))
    {
      _pendingRatePlayingEvent = false;
      _dispatcher.dispatch(PlaybackRateEvent.createRatePlayingEvent(_currentPlaybackRate));
    }
    _lastUpdatedTime = paramLong;
  }
  
  public void updatePlaybackRate(float paramFloat)
  {
    _currentPlaybackRate = paramFloat;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.TrickPlayManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */