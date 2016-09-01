package com.adobe.mediacore;

import android.content.Context;
import android.os.Handler;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.AdAsset;
import com.adobe.mediacore.timeline.advertising.AdBreak;
import java.util.Iterator;

public final class CustomAdPlaybackManager
{
  private static final String LOG_TAG = "[PSDK]::" + CustomAdPlaybackManager.class.getSimpleName();
  private static final Logger _logger = Log.getLogger(LOG_TAG);
  private boolean _complete;
  private Context _context;
  private Ad _currentAd;
  private AdBreak _currentAdBreak;
  private int _currentAdIndex;
  private long _currentTime;
  private final MediaPlayer.CustomAdEventListener _customAdEventListener = new CustomAdPlaybackManager.2(this);
  private CustomAdView _customAdView;
  private Handler _handler;
  private boolean _isCustomAdPlaying;
  private int _lastKnownProgress;
  private final PauseAtPeriodEndListener _onPauseAtPeriodEndEventListener = new CustomAdPlaybackManager.3(this);
  private final DefaultMediaPlayer _player;
  private final SeekAdjustCompletedListener _seekAdjustCompletedListener = new CustomAdPlaybackManager.1(this);
  private long _startTimeOfSeekOrTrickPlay;
  private VideoEngineAdapter _videoEngineAdapter;
  private final VideoEngineDispatcher _videoEngineDispatcher;
  
  public CustomAdPlaybackManager(VideoEngineDispatcher paramVideoEngineDispatcher, VideoEngineAdapter paramVideoEngineAdapter, DefaultMediaPlayer paramDefaultMediaPlayer, Context paramContext)
  {
    if (paramVideoEngineDispatcher == null) {
      throw new IllegalArgumentException("Video Engine Dispatcher parameter must not be NULL");
    }
    if (paramVideoEngineAdapter == null) {
      throw new IllegalArgumentException("Video Engine Adapter parameter must not be NULL");
    }
    if (paramDefaultMediaPlayer == null) {
      throw new IllegalArgumentException("MediaPlayer parameter must not be NULL");
    }
    _videoEngineAdapter = paramVideoEngineAdapter;
    _videoEngineDispatcher = paramVideoEngineDispatcher;
    _player = paramDefaultMediaPlayer;
    _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.PAUSE_AT_PERIOD_END, _onPauseAtPeriodEndEventListener);
    _videoEngineDispatcher.addEventListener(MediaPlayer.Event.CUSTOM_AD, _customAdEventListener);
    _currentTime = 0L;
    _currentAdIndex = 0;
    _complete = false;
    _isCustomAdPlaying = false;
    _currentAdBreak = null;
    _context = paramContext;
    _startTimeOfSeekOrTrickPlay = -1L;
    _customAdView = new CustomAdView(_videoEngineDispatcher, _context, _player);
    _handler = new Handler();
  }
  
  private boolean containCustomAdOnly(AdBreak paramAdBreak)
  {
    boolean bool2;
    if (paramAdBreak != null)
    {
      paramAdBreak = paramAdBreak.adsIterator();
      boolean bool1 = true;
      bool2 = bool1;
      if (!paramAdBreak.hasNext()) {
        break label47;
      }
      if (((Ad)paramAdBreak.next()).getType() == MediaResource.Type.CUSTOM) {
        break label49;
      }
      bool1 = false;
    }
    label47:
    label49:
    for (;;)
    {
      break;
      bool2 = true;
      return bool2;
    }
  }
  
  private void playCustomAd(Ad paramAd, boolean paramBoolean)
  {
    if ((paramAd != null) && (paramAd.getType() == MediaResource.Type.CUSTOM))
    {
      _player.stopInternalTimer();
      String str = paramAd.getPrimaryAsset().getMediaResource().getUrl();
      if ((str != null) && ((str.toLowerCase().startsWith("http")) || (str.toLowerCase().startsWith("https"))))
      {
        if (!paramBoolean) {
          _player.pause();
        }
        if (_currentAdBreak.getFirstAd().equals(paramAd)) {
          _videoEngineDispatcher.dispatch(AdBreakPlaybackEvent.createStartEvent(_currentAdBreak));
        }
        _customAdView.playCustomAd(str, paramAd.getPrimaryAsset().getAdParameters());
      }
      _currentAd = paramAd;
    }
  }
  
  private boolean setAdBreak(AdBreak paramAdBreak)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (paramAdBreak != null)
    {
      bool1 = bool2;
      if (paramAdBreak != _currentAdBreak)
      {
        _currentAdBreak = paramAdBreak;
        _currentAdIndex = 0;
        bool1 = bool2;
        if (_currentAdBreak != null)
        {
          bool1 = bool2;
          if (_currentAdBreak.size() > 0L)
          {
            bool1 = bool2;
            if (_currentAdBreak.getFirstAd().getType() == MediaResource.Type.CUSTOM)
            {
              bool1 = bool2;
              if (_player.getTrickPlayManager() != null)
              {
                bool1 = bool2;
                if (!_player.getTrickPlayManager().trickPlayEnabled()) {
                  bool1 = true;
                }
              }
            }
          }
        }
      }
    }
    return bool1;
  }
  
  public void attachSeekListener()
  {
    _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.SEEK_ADJUST_COMPLETED, _seekAdjustCompletedListener);
  }
  
  public CustomAdView getCustomAdView()
  {
    return _customAdView;
  }
  
  public void handlePostRoll()
  {
    Object localObject1 = _videoEngineAdapter.getTimeline().getLastAdBreak();
    boolean bool = containCustomAdOnly((AdBreak)localObject1);
    if ((localObject1 != null) && (bool) && (_player.getTrickPlayManager() != null) && (!_player.getTrickPlayManager().trickPlayEnabled()))
    {
      setAdBreak((AdBreak)localObject1);
      _currentAdIndex = 0;
      localObject1 = ((AdBreak)localObject1).adsIterator();
      if (((Iterator)localObject1).hasNext())
      {
        localObject1 = (Ad)((Iterator)localObject1).next();
        if (((Ad)localObject1).getType() == MediaResource.Type.CUSTOM)
        {
          _complete = true;
          playCustomAd((Ad)localObject1, false);
        }
      }
      return;
    }
    if ((localObject1 != null) && (((AdBreak)localObject1).getLastAd().getType() == MediaResource.Type.CUSTOM))
    {
      Object localObject2 = ((AdBreak)localObject1).adsIterator();
      setAdBreak((AdBreak)localObject1);
      _currentAdIndex = 0;
      int i = 0;
      while (((Iterator)localObject2).hasNext())
      {
        if (((Ad)((Iterator)localObject2).next()).getType() != MediaResource.Type.CUSTOM) {
          _currentAdIndex = i;
        }
        i += 1;
      }
      localObject1 = ((AdBreak)localObject1).adsIterator();
      i = 0;
      while (i <= _currentAdIndex)
      {
        localObject2 = (Ad)((Iterator)localObject1).next();
        i += 1;
      }
      localObject1 = (Ad)((Iterator)localObject1).next();
      _currentAdIndex += 1;
      _complete = true;
      playCustomAd((Ad)localObject1, false);
      return;
    }
    _videoEngineDispatcher.dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.POST_ROLL_COMPLETE));
  }
  
  public void reset()
  {
    _videoEngineDispatcher.removeEventListener(MediaPlayerEvent.Type.PAUSE_AT_PERIOD_END, _onPauseAtPeriodEndEventListener);
    _videoEngineDispatcher.removeEventListener(MediaPlayer.Event.CUSTOM_AD, _customAdEventListener);
    _currentTime = 0L;
    _currentAdIndex = 0;
    _complete = false;
    _isCustomAdPlaying = false;
    _context = null;
    if (_currentAdBreak != null) {
      _currentAdBreak = null;
    }
    if (_customAdView != null)
    {
      _customAdView.reset();
      _customAdView = null;
    }
    if (_handler != null) {
      _handler = null;
    }
  }
  
  public void setCurrentTime(long paramLong)
  {
    _currentTime = paramLong;
    Object localObject = _videoEngineAdapter.getTimeline();
    Ad localAd = ((VideoEngineTimeline)localObject).getAdForTime(_currentTime, false);
    localObject = ((VideoEngineTimeline)localObject).getAdBreakForTime(_currentTime, 2000L);
    boolean bool1;
    boolean bool2;
    int i;
    if ((localAd != null) && (localObject != null))
    {
      bool1 = setAdBreak((AdBreak)localObject);
      bool2 = containCustomAdOnly((AdBreak)localObject);
      if (_currentAdBreak == null) {
        break label119;
      }
      if (_currentAdBreak.getTime() > 0L) {
        break label114;
      }
      i = 1;
    }
    for (;;)
    {
      if ((bool1) && ((bool2) || (i != 0)))
      {
        _currentAdIndex = 0;
        playCustomAd(localAd, false);
      }
      return;
      label114:
      i = 0;
      continue;
      label119:
      i = 0;
    }
  }
  
  public void setStartTimeOfSeekOrTrickPlay(long paramLong)
  {
    _startTimeOfSeekOrTrickPlay = paramLong;
  }
  
  void updateVideoEngineAdapter(VideoEngineAdapter paramVideoEngineAdapter)
  {
    _videoEngineAdapter = paramVideoEngineAdapter;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.CustomAdPlaybackManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */