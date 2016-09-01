package com.adobe.mediacore;

import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.AdBreakAsWatched;
import com.adobe.mediacore.metadata.AdSignalingMode;
import com.adobe.mediacore.metadata.AdvertisingMetadata;
import com.adobe.mediacore.metadata.DefaultMetadataKeys;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.timeline.advertising.AdBreak;
import com.adobe.mediacore.timeline.advertising.AdBreakPlacement;
import com.adobe.mediacore.timeline.advertising.AdBreakPolicy;
import com.adobe.mediacore.timeline.advertising.AdPolicy;
import com.adobe.mediacore.timeline.advertising.AdPolicyInfo;
import com.adobe.mediacore.timeline.advertising.AdPolicyMode;
import com.adobe.mediacore.timeline.advertising.AdPolicySelector;
import java.util.ArrayList;
import java.util.List;

public class DefaultAdPolicySelector
  implements AdPolicySelector
{
  private static final String LOG_TAG = "[PSDK]::" + DefaultAdPolicySelector.class.getSimpleName();
  private final AdBreakAsWatched _adBreakAsWatchedPolicy;
  private final Logger _logger = Log.getLogger(LOG_TAG);
  private final MediaPlayerItem _mediaPlayerItem;
  
  public DefaultAdPolicySelector(MediaPlayerItem paramMediaPlayerItem)
  {
    _mediaPlayerItem = paramMediaPlayerItem;
    _adBreakAsWatchedPolicy = extractAdBreakAsWatchedPolicy(_mediaPlayerItem);
  }
  
  private AdBreakAsWatched extractAdBreakAsWatchedPolicy(MediaPlayerItem paramMediaPlayerItem)
  {
    AdBreakAsWatched localAdBreakAsWatched = AdBreakAsWatched.AD_BREAK_AS_WATCHED_ON_BEGIN;
    if (paramMediaPlayerItem != null)
    {
      paramMediaPlayerItem = (MetadataNode)paramMediaPlayerItem.getResource().getMetadata();
      if (paramMediaPlayerItem != null)
      {
        paramMediaPlayerItem = (AdvertisingMetadata)paramMediaPlayerItem.getNode(DefaultMetadataKeys.ADVERTISING_METADATA.getValue());
        if (paramMediaPlayerItem != null) {
          return paramMediaPlayerItem.getAdBreakAsWatched();
        }
      }
    }
    return localAdBreakAsWatched;
  }
  
  public List selectAdBreaksToPlay(AdPolicyInfo paramAdPolicyInfo)
  {
    _logger.i(LOG_TAG + "#selectAdBreaksToPlay", "currentTime=" + paramAdPolicyInfo.getCurrentTime() + " seekToTime=" + paramAdPolicyInfo.getSeekToTime() + " rate=" + paramAdPolicyInfo.getRate() + " adPolicyMode=" + paramAdPolicyInfo.getMode());
    List localList = paramAdPolicyInfo.getAdBreakPlacements();
    if (localList != null)
    {
      int i = localList.size();
      ArrayList localArrayList = new ArrayList();
      if ((i > 0) && (paramAdPolicyInfo.getCurrentTime() <= paramAdPolicyInfo.getSeekToTime()))
      {
        paramAdPolicyInfo = (AdBreakPlacement)localList.get(i - 1);
        if (!paramAdPolicyInfo.getAdBreak().isWatched().booleanValue())
        {
          localArrayList.add(paramAdPolicyInfo);
          return localArrayList;
        }
      }
    }
    return null;
  }
  
  public AdBreakPolicy selectPolicyForAdBreak(AdPolicyInfo paramAdPolicyInfo)
  {
    _logger.i(LOG_TAG + "#selectPolicyForAdBreak", "currentTime=" + paramAdPolicyInfo.getCurrentTime() + " seekToTime=" + paramAdPolicyInfo.getSeekToTime() + " rate=" + paramAdPolicyInfo.getRate() + " adPolicyMode=" + paramAdPolicyInfo.getMode());
    Object localObject;
    if (paramAdPolicyInfo.getAdBreakPlacements().size() > 0)
    {
      localObject = (AdBreakPlacement)paramAdPolicyInfo.getAdBreakPlacements().get(0);
      if ((paramAdPolicyInfo.getMode() == AdPolicyMode.SEEK) && (((AdBreakPlacement)localObject).getAdBreak().isWatched().booleanValue())) {
        return AdBreakPolicy.SKIP;
      }
    }
    paramAdPolicyInfo = AdSignalingMode.DEFAULT;
    if (_mediaPlayerItem != null)
    {
      localObject = (MetadataNode)_mediaPlayerItem.getResource().getMetadata();
      if (localObject != null)
      {
        localObject = (AdvertisingMetadata)((MetadataNode)localObject).getNode(DefaultMetadataKeys.ADVERTISING_METADATA.getValue());
        if (localObject != null) {
          paramAdPolicyInfo = ((AdvertisingMetadata)localObject).getSignalingMode();
        }
      }
    }
    for (;;)
    {
      if ((_mediaPlayerItem.isLive()) || (paramAdPolicyInfo == AdSignalingMode.MANIFEST_CUES)) {
        return AdBreakPolicy.PLAY;
      }
      return AdBreakPolicy.REMOVE_AFTER_PLAY;
    }
  }
  
  public AdPolicy selectPolicyForSeekIntoAd(AdPolicyInfo paramAdPolicyInfo)
  {
    _logger.i(LOG_TAG + "#selectPolicyForSeekIntoAd", "currentTime=" + paramAdPolicyInfo.getCurrentTime() + " seekToTime=" + paramAdPolicyInfo.getSeekToTime() + " rate=" + paramAdPolicyInfo.getRate() + " adPolicyMode=" + paramAdPolicyInfo.getMode());
    paramAdPolicyInfo = paramAdPolicyInfo.getAdBreakPlacements();
    if (paramAdPolicyInfo != null)
    {
      int i = paramAdPolicyInfo.size();
      if ((i > 0) && (((AdBreakPlacement)paramAdPolicyInfo.get(i - 1)).getAdBreak().isWatched().booleanValue())) {
        return AdPolicy.SKIP_AD_BREAK;
      }
    }
    return AdPolicy.PLAY_FROM_AD_BREAK_BEGIN;
  }
  
  public AdBreakAsWatched selectWatchedPolicyForAdBreak(AdPolicyInfo paramAdPolicyInfo)
  {
    _logger.i(LOG_TAG + "#selectWatchedPolicyForAdBreak", "currentTime=" + paramAdPolicyInfo.getCurrentTime() + " seekToTime=" + paramAdPolicyInfo.getSeekToTime() + " rate=" + paramAdPolicyInfo.getRate() + " adPolicyMode=" + paramAdPolicyInfo.getMode());
    return _adBreakAsWatchedPolicy;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DefaultAdPolicySelector
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */