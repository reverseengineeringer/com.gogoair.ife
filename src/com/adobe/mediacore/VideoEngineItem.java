package com.adobe.mediacore;

import com.adobe.ave.ABRProfileInfo;
import com.adobe.ave.AudioTrackInfo;
import com.adobe.ave.DataTrackInfo;
import com.adobe.ave.DataTrackInfo.DataTrackInfoServiceType;
import com.adobe.ave.PayloadType;
import com.adobe.ave.PeriodInfo;
import com.adobe.ave.TagData;
import com.adobe.ave.Timeline;
import com.adobe.ave.VideoEngine;
import com.adobe.ave.VideoEngineException;
import com.adobe.ave.VideoTrackInfo;
import com.adobe.mediacore.info.AudioTrack;
import com.adobe.mediacore.info.ClosedCaptionsTrack;
import com.adobe.mediacore.info.Profile;
import com.adobe.mediacore.info.Track;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.TimedMetadata;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

final class VideoEngineItem
  implements MediaPlayerItem
{
  private static final String LOG_TAG = "[PSDK]::" + VideoEngineItem.class.getSimpleName();
  private static final int UNKNOWN_PERIOD_INDEX = -1;
  private static final Logger _logger = Log.getLogger(LOG_TAG);
  private List _adCueTags;
  private List _audioTracks;
  private List _closedCaptionsTracks;
  private int _contentId;
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
  
  public VideoEngineItem(VideoEngineDispatcher paramVideoEngineDispatcher, MediaResource paramMediaResource, int paramInt, DRMMetadataCache paramDRMMetadataCache, List paramList)
  {
    _videoEngineDispatcher = paramVideoEngineDispatcher;
    _resource = paramMediaResource;
    _contentId = paramInt;
    _adCueTags = paramList;
    _dispatchedTimedMetadata = new ArrayList();
    _drmMetadataCache = paramDRMMetadataCache;
  }
  
  private void checkAndDispatchTimedMetadata(TimedMetadata paramTimedMetadata)
  {
    if (!_dispatchedTimedMetadata.contains(paramTimedMetadata))
    {
      _dispatchedTimedMetadata.add(paramTimedMetadata);
      _videoEngineDispatcher.dispatch(TimedMetadataAddedEvent.createAddedEvent(paramTimedMetadata));
    }
  }
  
  private int getCurrentPeriodIndex()
  {
    try
    {
      Timeline localTimeline = _videoEngine.getTimeline();
      long l1 = _videoEngine.getTime();
      if (localTimeline != null)
      {
        int i = firstPeriodIndex;
        while (i <= lastPeriodIndex)
        {
          PeriodInfo localPeriodInfo = localTimeline.getPeriodInfo(i);
          if (localPeriodInfo != null)
          {
            long l2 = virtualStartTime;
            long l3 = duration;
            if ((l2 <= l1) && (l1 <= l3 + l2)) {
              return i;
            }
          }
          i += 1;
        }
      }
      return -1;
    }
    catch (VideoEngineException localVideoEngineException)
    {
      _logger.w(LOG_TAG + "#getCurrentPeriodIndex", "Unable to get current period index.");
    }
  }
  
  private int getIndexOfLastMainContentPeriod(Timeline paramTimeline)
    throws VideoEngineException
  {
    int i = lastPeriodIndex;
    while (i >= firstPeriodIndex)
    {
      PeriodInfo localPeriodInfo = paramTimeline.getPeriodInfo(i);
      if ((localPeriodInfo != null) && (userData == _contentId)) {
        return i;
      }
      i -= 1;
    }
    return -1;
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
  
  private List loadAudioTracks(Timeline paramTimeline, int paramInt)
    throws VideoEngineException
  {
    ArrayList localArrayList = new ArrayList();
    int j = paramTimeline.getTrackCount(paramInt, PayloadType.AUDIO);
    int i = 0;
    while (i < j)
    {
      AudioTrackInfo localAudioTrackInfo = (AudioTrackInfo)paramTimeline.getTrackInfo(paramInt, i, PayloadType.AUDIO);
      if (localAudioTrackInfo != null) {
        localArrayList.add(new AudioTrack(description, language, isDefault, isAutoSelect, isForced));
      }
      i += 1;
    }
    return localArrayList;
  }
  
  private List loadClosedCaptionsTrack(Timeline paramTimeline, int paramInt)
  {
    localArrayList = new ArrayList();
    try
    {
      int j = paramTimeline.getTrackCount(paramInt, PayloadType.DATA);
      int i = 0;
      while (i < j)
      {
        DataTrackInfo localDataTrackInfo = (DataTrackInfo)paramTimeline.getTrackInfo(paramInt, i, PayloadType.DATA);
        localArrayList.add(new ClosedCaptionsTrack(description, serviceType.getValue(), language, isDefault, activity));
        i += 1;
      }
      return localArrayList;
    }
    catch (VideoEngineException paramTimeline)
    {
      _logger.e(LOG_TAG + "#refreshClosedCaptionsTracks", "A video engine exception occurred ", paramTimeline);
    }
  }
  
  private List loadProfiles(Timeline paramTimeline, int paramInt)
    throws VideoEngineException
  {
    ArrayList localArrayList = new ArrayList();
    int j = paramTimeline.getABRProfileCount(paramInt);
    int i = 0;
    while (i < j)
    {
      ABRProfileInfo localABRProfileInfo = paramTimeline.getABRProfileInfoAtIndex(paramInt, i);
      if (localABRProfileInfo != null) {
        localArrayList.add(new Profile(bitsPerSecond, width, height));
      }
      i += 1;
    }
    return localArrayList;
  }
  
  private List loadTimedMetadata(Timeline paramTimeline, int paramInt)
    throws VideoEngineException
  {
    ArrayList localArrayList = new ArrayList();
    PeriodInfo localPeriodInfo = paramTimeline.getPeriodInfo(paramInt);
    if (localPeriodInfo == null)
    {
      VideoEngineTimeline.printTimeline(paramTimeline);
      _logger.e(LOG_TAG + "#loadTimedMetadata", "Could not get main period info. Period index is [" + paramInt + "]. Main period index is [" + getIndexOfLastMainContentPeriod(paramTimeline) + "].");
      return localArrayList;
    }
    long l = Math.min(_videoEngine.getTime(), virtualStartTime);
    Object localObject = new ArrayList();
    Iterator localIterator = _dispatchedTimedMetadata.iterator();
    while (localIterator.hasNext())
    {
      TimedMetadata localTimedMetadata = (TimedMetadata)localIterator.next();
      if (localTimedMetadata.getTime() < l) {
        ((List)localObject).add(localTimedMetadata);
      }
    }
    if (((List)localObject).size() > 0)
    {
      _dispatchedTimedMetadata.removeAll((Collection)localObject);
      _timedMetadatas.removeAll((Collection)localObject);
    }
    if (lastSubscribedTagIndex > 0)
    {
      i = firstSubscribedTagIndex;
      if (i <= lastSubscribedTagIndex)
      {
        localObject = paramTimeline.getMainManifestSubscribedTag(i);
        if (localObject == null) {}
        for (;;)
        {
          i += 1;
          break;
          localObject = TimedMetadataParser.parseTagData((TagData)localObject);
          if ((localObject != null) && (!localArrayList.contains(localObject)) && (!isTimedMetadataAdded((TimedMetadata)localObject)))
          {
            checkAndDispatchTimedMetadata((TimedMetadata)localObject);
            localArrayList.add(localObject);
          }
        }
      }
    }
    int i = firstSubscribedTagIndex;
    if (i <= lastSubscribedTagIndex)
    {
      localObject = paramTimeline.getSubscribedTag(paramInt, i);
      if (localObject == null) {}
      for (;;)
      {
        i += 1;
        break;
        localObject = TimedMetadataParser.parseTagData((TagData)localObject);
        if ((localObject != null) && (!localArrayList.contains(localObject)) && (!isTimedMetadataAdded((TimedMetadata)localObject)))
        {
          checkAndDispatchTimedMetadata((TimedMetadata)localObject);
          localArrayList.add(localObject);
        }
      }
    }
    Collections.sort(localArrayList);
    return localArrayList;
  }
  
  private void selectTrack(Timeline paramTimeline, int paramInt, String paramString, PayloadType paramPayloadType)
    throws VideoEngineException
  {
    int j = paramTimeline.getTrackCount(paramInt, paramPayloadType);
    int i = 0;
    for (;;)
    {
      Object localObject;
      boolean bool;
      if (i < j)
      {
        localObject = paramTimeline.getTrackInfo(paramInt, i, paramPayloadType);
        switch (paramPayloadType)
        {
        default: 
          bool = false;
        }
      }
      for (;;)
      {
        if (!bool) {
          break label164;
        }
        _videoEngine.selectTrack(paramInt, paramPayloadType, i);
        return;
        localObject = (DataTrackInfo)localObject;
        if (localObject == null) {
          break;
        }
        bool = description.equals(paramString);
        continue;
        localObject = (AudioTrackInfo)localObject;
        if (localObject == null) {
          break;
        }
        bool = description.equals(paramString);
        continue;
        localObject = (VideoTrackInfo)localObject;
        if (localObject == null) {
          break;
        }
        bool = description.equals(paramString);
      }
      label164:
      i += 1;
    }
  }
  
  private void selectTrackByNameAndServiceType(Timeline paramTimeline, int paramInt1, String paramString, int paramInt2, PayloadType paramPayloadType)
    throws VideoEngineException
  {
    int k = paramTimeline.getTrackCount(paramInt1, PayloadType.DATA);
    int j = 0;
    int i;
    if (j < k)
    {
      DataTrackInfo localDataTrackInfo = (DataTrackInfo)paramTimeline.getTrackInfo(paramInt1, j, PayloadType.DATA);
      if (localDataTrackInfo == null) {
        break label102;
      }
      if ((!description.equals(paramString)) || (serviceType.getValue() != paramInt2)) {
        break label87;
      }
      i = 1;
    }
    for (;;)
    {
      if (i != 0)
      {
        _videoEngine.selectTrack(paramInt1, paramPayloadType, j);
        return;
        label87:
        i = 0;
      }
      else
      {
        j += 1;
        break;
        label102:
        i = 0;
      }
    }
  }
  
  private void updateAudioTracks(Timeline paramTimeline, int paramInt)
    throws VideoEngineException
  {
    _internalAudioTracks = loadAudioTracks(paramTimeline, paramInt);
    _audioTracks = Collections.unmodifiableList(_internalAudioTracks);
    if (_audioTracks.size() > 0) {}
    for (boolean bool = true;; bool = false)
    {
      _hasAudio = bool;
      _currentAudioTrack = ((AudioTrack)updateTrack(_internalAudioTracks, _currentAudioTrack));
      if ((_currentAudioTrack == null) && (!_internalAudioTracks.isEmpty())) {
        _currentAudioTrack = ((AudioTrack)_internalAudioTracks.get(0));
      }
      return;
    }
  }
  
  private void updateClosedCaptionsTracks(Timeline paramTimeline, int paramInt)
    throws VideoEngineException
  {
    _internalClosedCaptionsTracks = loadClosedCaptionsTrack(paramTimeline, paramInt);
    _closedCaptionsTracks = Collections.unmodifiableList(_internalClosedCaptionsTracks);
    if (_closedCaptionsTracks.size() > 0) {}
    for (boolean bool = true;; bool = false)
    {
      _hasClosedCaptions = bool;
      _currentClosedCaptionsTrack = ((ClosedCaptionsTrack)updateTrack(_internalClosedCaptionsTracks, _currentClosedCaptionsTrack));
      if ((_currentClosedCaptionsTrack == null) && (!_internalClosedCaptionsTracks.isEmpty())) {
        _currentClosedCaptionsTrack = ((ClosedCaptionsTrack)_internalClosedCaptionsTracks.get(0));
      }
      return;
    }
  }
  
  private void updateProfiles(Timeline paramTimeline, int paramInt)
    throws VideoEngineException
  {
    boolean bool = true;
    _internalProfiles = loadProfiles(paramTimeline, paramInt);
    _profiles = Collections.unmodifiableList(_internalProfiles);
    if (_profiles.size() > 1) {}
    for (;;)
    {
      _isDynamic = bool;
      return;
      bool = false;
    }
  }
  
  private void updateTimedMetadata(Timeline paramTimeline, int paramInt)
    throws VideoEngineException
  {
    _internalTimedMetadatas = loadTimedMetadata(paramTimeline, paramInt);
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
  
  private void updateTrickPlayInfo(Timeline paramTimeline, int paramInt)
  {
    try
    {
      _isTrickPlaySupported = getPeriodInfosupportsTrickPlay;
      return;
    }
    catch (VideoEngineException paramTimeline)
    {
      _logger.e(LOG_TAG + "#updateTrickPlayInfo", "A video engine exception occurred ", paramTimeline);
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
    ArrayList localArrayList = new ArrayList();
    if (isTrickPlaySupported())
    {
      localArrayList.add(Float.valueOf(-128.0F));
      localArrayList.add(Float.valueOf(-64.0F));
      localArrayList.add(Float.valueOf(-32.0F));
      localArrayList.add(Float.valueOf(-16.0F));
      localArrayList.add(Float.valueOf(-8.0F));
      localArrayList.add(Float.valueOf(-4.0F));
      localArrayList.add(Float.valueOf(-2.0F));
      localArrayList.add(Float.valueOf(0.0F));
      localArrayList.add(Float.valueOf(0.25F));
      localArrayList.add(Float.valueOf(0.5F));
      localArrayList.add(Float.valueOf(0.75F));
      localArrayList.add(Float.valueOf(1.0F));
      localArrayList.add(Float.valueOf(2.0F));
      localArrayList.add(Float.valueOf(4.0F));
      localArrayList.add(Float.valueOf(8.0F));
      localArrayList.add(Float.valueOf(16.0F));
      localArrayList.add(Float.valueOf(32.0F));
      localArrayList.add(Float.valueOf(64.0F));
      localArrayList.add(Float.valueOf(128.0F));
      return localArrayList;
    }
    localArrayList.add(Float.valueOf(0.0F));
    localArrayList.add(Float.valueOf(0.25F));
    localArrayList.add(Float.valueOf(0.5F));
    localArrayList.add(Float.valueOf(0.75F));
    localArrayList.add(Float.valueOf(1.0F));
    return localArrayList;
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
    if (_currentAudioTrack != null) {
      return _currentAudioTrack;
    }
    if (_audioTracks.size() > 0) {
      return (AudioTrack)_audioTracks.get(0);
    }
    return null;
  }
  
  public ClosedCaptionsTrack getSelectedClosedCaptionsTrack()
  {
    if (_currentClosedCaptionsTrack != null) {
      return _currentClosedCaptionsTrack;
    }
    if (_closedCaptionsTracks.size() > 0) {
      return (ClosedCaptionsTrack)_closedCaptionsTracks.get(0);
    }
    return null;
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
  
  public void refreshClosedCaptionsTracks(VideoEngine paramVideoEngine)
  {
    try
    {
      paramVideoEngine = paramVideoEngine.getTimeline();
      int i = getIndexOfLastMainContentPeriod(paramVideoEngine);
      if (i != -1) {
        updateClosedCaptionsTracks(paramVideoEngine, i);
      }
      return;
    }
    catch (VideoEngineException paramVideoEngine)
    {
      _logger.e(LOG_TAG + "#refreshClosedCaptionsTracks", "A video engine exception occurred ", paramVideoEngine);
    }
  }
  
  public boolean selectAudioTrack(AudioTrack paramAudioTrack)
  {
    _currentAudioTrack = paramAudioTrack;
    _logger.i(LOG_TAG, "Selected audio track [" + _currentAudioTrack + "].");
    boolean bool2 = true;
    try
    {
      paramAudioTrack = _currentAudioTrack.getName();
      Timeline localTimeline = _videoEngine.getTimeline();
      int i = getCurrentPeriodIndex();
      if (i != -1) {
        selectTrack(localTimeline, i, paramAudioTrack, PayloadType.AUDIO);
      }
      boolean bool1 = bool2;
      if (localTimeline != null)
      {
        i = firstPeriodIndex;
        for (;;)
        {
          bool1 = bool2;
          if (i > lastPeriodIndex) {
            break;
          }
          selectTrack(localTimeline, i, paramAudioTrack, PayloadType.AUDIO);
          i += 1;
        }
      }
      return bool1;
    }
    catch (VideoEngineException paramAudioTrack)
    {
      bool1 = false;
    }
  }
  
  public boolean selectClosedCaptionsTrack(ClosedCaptionsTrack paramClosedCaptionsTrack)
  {
    _logger.i(LOG_TAG + "#selectClosedCaptionsTrack", "Selecting CC track: " + paramClosedCaptionsTrack);
    _currentClosedCaptionsTrack = paramClosedCaptionsTrack;
    try
    {
      paramClosedCaptionsTrack = _currentClosedCaptionsTrack.getName();
      int j = _currentClosedCaptionsTrack.getServiceType();
      Timeline localTimeline = _videoEngine.getTimeline();
      if (localTimeline != null)
      {
        int i = firstPeriodIndex;
        while (i <= lastPeriodIndex)
        {
          selectTrackByNameAndServiceType(localTimeline, i, paramClosedCaptionsTrack, j, PayloadType.DATA);
          i += 1;
        }
      }
      return true;
    }
    catch (VideoEngineException paramClosedCaptionsTrack)
    {
      _logger.e(LOG_TAG + "#refreshClosedCaptionsTracks", "A video engine exception occurred ", paramClosedCaptionsTrack);
    }
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
      paramVideoEngine = _videoEngine.getTimeline();
      if (paramVideoEngine != null) {
        if (complete != 0) {
          break label88;
        }
      }
      label88:
      for (boolean bool = true;; bool = false)
      {
        _isLive = bool;
        int i = getIndexOfLastMainContentPeriod(paramVideoEngine);
        if (i != -1)
        {
          updateProfiles(paramVideoEngine, i);
          updateAudioTracks(paramVideoEngine, i);
          updateClosedCaptionsTracks(paramVideoEngine, i);
          updateTimedMetadata(paramVideoEngine, i);
          updateTrickPlayInfo(paramVideoEngine, i);
          _drmMetadataCache.update(paramVideoEngine, _videoEngine.getTime());
        }
        return;
      }
      return;
    }
    catch (VideoEngineException paramVideoEngine)
    {
      _logger.e(LOG_TAG + "#update", "A video engine exception occurred.", paramVideoEngine);
    }
  }
  
  public Track updateTrack(List paramList, Track paramTrack)
  {
    if (paramTrack != null) {}
    for (paramTrack = paramTrack.getName();; paramTrack = null)
    {
      paramList = paramList.iterator();
      Track localTrack;
      do
      {
        if (!paramList.hasNext()) {
          break;
        }
        localTrack = (Track)paramList.next();
      } while (((paramTrack == null) || (!paramTrack.equals(localTrack.getName()))) && ((paramTrack != null) || (!localTrack.isDefault())));
      return localTrack;
    }
    return null;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.VideoEngineItem
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */