package com.adobe.mediacore;

import com.adobe.ave.PeriodInfo;
import com.adobe.ave.TagData;
import com.adobe.ave.Timeline;
import com.adobe.ave.VideoEngine;
import com.adobe.ave.VideoEngineException;
import com.adobe.mediacore.info.AudioTrack;
import com.adobe.mediacore.info.ClosedCaptionsTrack;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.TimedMetadata;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

final class BackgroundVideoEngineItem
  implements MediaPlayerItem
{
  private static final String LOG_TAG = "[PSDK]::" + BackgroundVideoEngineItem.class.getSimpleName();
  private static final int UNKNOWN_PERIOD_INDEX = -1;
  private static final Logger _logger = Log.getLogger(LOG_TAG);
  private List _adCueTags;
  private List _audioTracks;
  private List _closedCaptionsTracks;
  private AudioTrack _currentAudioTrack;
  private ClosedCaptionsTrack _currentClosedCaptionsTrack;
  private List _dispatchedTimedMetadata;
  private DRMMetadataCache _drmMetadataCache;
  private boolean _hasAudio;
  private boolean _hasClosedCaptions;
  private boolean _hasTimedMetadata;
  private List _internalAudioTracks;
  private List _internalClosedCaptionsTracks;
  private List _internalProfiles;
  private List _internalTimedMetadatas;
  private boolean _isDynamic;
  private boolean _isLive;
  private boolean _isProtected;
  private boolean _isTrickPlaySupported;
  private List _profiles;
  private MediaResource _resource;
  private List _timedMetadatas = new CopyOnWriteArrayList();
  private VideoEngine _videoEngine;
  private VideoEngineDispatcher _videoEngineDispatcher;
  
  public BackgroundVideoEngineItem(VideoEngineDispatcher paramVideoEngineDispatcher, MediaResource paramMediaResource, DRMMetadataCache paramDRMMetadataCache, List paramList)
  {
    _videoEngineDispatcher = paramVideoEngineDispatcher;
    _resource = paramMediaResource;
    _adCueTags = paramList;
    _dispatchedTimedMetadata = new ArrayList();
    _drmMetadataCache = paramDRMMetadataCache;
  }
  
  private void checkAndDispatchTimedMetadata(TimedMetadata paramTimedMetadata)
  {
    if (!_dispatchedTimedMetadata.contains(paramTimedMetadata))
    {
      _dispatchedTimedMetadata.add(paramTimedMetadata);
      _videoEngineDispatcher.dispatch(TimedMetadataAddedEvent.createBackgroundAddedEvent(paramTimedMetadata));
    }
  }
  
  private boolean isTimedMetadataAdded(TimedMetadata paramTimedMetadata)
  {
    if (_timedMetadatas != null)
    {
      Iterator localIterator = _dispatchedTimedMetadata.iterator();
      while (localIterator.hasNext()) {
        if (((TimedMetadata)localIterator.next()).equals(paramTimedMetadata)) {
          return true;
        }
      }
    }
    return false;
  }
  
  private List loadTimedMetadata(Timeline paramTimeline)
    throws VideoEngineException
  {
    ArrayList localArrayList = new ArrayList();
    long l = Math.min(_videoEngine.getTime(), virtualStartTime);
    Object localObject1 = new ArrayList();
    Object localObject2 = _dispatchedTimedMetadata.iterator();
    while (((Iterator)localObject2).hasNext())
    {
      TimedMetadata localTimedMetadata = (TimedMetadata)((Iterator)localObject2).next();
      if (localTimedMetadata.getTime() < l) {
        ((List)localObject1).add(localTimedMetadata);
      }
    }
    if (((List)localObject1).size() > 0)
    {
      _dispatchedTimedMetadata.removeAll((Collection)localObject1);
      _timedMetadatas.removeAll((Collection)localObject1);
    }
    localObject1 = paramTimeline.getPeriodInfo(0);
    _logger.i(LOG_TAG, "#loadTimedMetadata : # of subTag in period [" + 0 + "] = " + (lastSubscribedTagIndex - firstSubscribedTagIndex + 1));
    int i = firstSubscribedTagIndex;
    if (i <= lastSubscribedTagIndex)
    {
      localObject2 = paramTimeline.getSubscribedTag(0, i);
      if ((localObject2 != null) && (data != null))
      {
        localObject2 = TimedMetadataParser.parseTagData((TagData)localObject2);
        if ((localObject2 != null) && (!localArrayList.contains(localObject2)) && (!isTimedMetadataAdded((TimedMetadata)localObject2))) {
          break label257;
        }
      }
      for (;;)
      {
        i += 1;
        break;
        label257:
        checkAndDispatchTimedMetadata((TimedMetadata)localObject2);
        localArrayList.add(localObject2);
      }
    }
    Collections.sort(localArrayList);
    return localArrayList;
  }
  
  private void updateTimedMetadata(Timeline paramTimeline)
    throws VideoEngineException
  {
    _internalTimedMetadatas = loadTimedMetadata(paramTimeline);
    paramTimeline = _internalTimedMetadatas.iterator();
    while (paramTimeline.hasNext())
    {
      TimedMetadata localTimedMetadata = (TimedMetadata)paramTimeline.next();
      if (!_timedMetadatas.contains(localTimedMetadata)) {
        _timedMetadatas.add(localTimedMetadata);
      }
    }
    if (_timedMetadatas.size() > 0) {}
    for (boolean bool = true;; bool = false)
    {
      _hasTimedMetadata = bool;
      return;
    }
  }
  
  public List getAdTags()
  {
    return _adCueTags;
  }
  
  public List getAudioTracks()
  {
    return _audioTracks;
  }
  
  public List getAvailablePlaybackRates()
  {
    return new ArrayList();
  }
  
  public List getClosedCaptionsTracks()
  {
    return _closedCaptionsTracks;
  }
  
  public List getDRMMetadataInfos()
  {
    return _drmMetadataCache.getDRMMetadataInfos();
  }
  
  public List getProfiles()
  {
    return _profiles;
  }
  
  public MediaResource getResource()
  {
    return _resource;
  }
  
  public AudioTrack getSelectedAudioTrack()
  {
    return _currentAudioTrack;
  }
  
  public ClosedCaptionsTrack getSelectedClosedCaptionsTrack()
  {
    return _currentClosedCaptionsTrack;
  }
  
  public List getTimedMetadata()
  {
    return _timedMetadatas;
  }
  
  public boolean hasAlternateAudio()
  {
    return _hasAudio;
  }
  
  public boolean hasClosedCaptions()
  {
    return _hasClosedCaptions;
  }
  
  public boolean hasTimedMetadata()
  {
    return _hasTimedMetadata;
  }
  
  public boolean isDynamic()
  {
    return _isDynamic;
  }
  
  public boolean isLive()
  {
    return _isLive;
  }
  
  public boolean isProtected()
  {
    return _isProtected;
  }
  
  public boolean isTrickPlaySupported()
  {
    return _isTrickPlaySupported;
  }
  
  public boolean selectAudioTrack(AudioTrack paramAudioTrack)
  {
    return false;
  }
  
  public boolean selectClosedCaptionsTrack(ClosedCaptionsTrack paramClosedCaptionsTrack)
  {
    return false;
  }
  
  public void setIsProtected(boolean paramBoolean)
  {
    _isProtected = paramBoolean;
  }
  
  public void update(VideoEngine paramVideoEngine)
  {
    try
    {
      _videoEngine = paramVideoEngine;
      paramVideoEngine = _videoEngine.getBackgroundTimeline();
      if (paramVideoEngine != null) {
        if (complete != 0) {
          break label37;
        }
      }
      label37:
      for (boolean bool = true;; bool = false)
      {
        _isLive = bool;
        updateTimedMetadata(paramVideoEngine);
        return;
      }
      return;
    }
    catch (VideoEngineException paramVideoEngine)
    {
      _logger.e(LOG_TAG + "#update", "A video engine exception occurred.", paramVideoEngine);
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.BackgroundVideoEngineItem
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */