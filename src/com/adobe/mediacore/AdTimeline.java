package com.adobe.mediacore;

import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.timeline.Timeline;
import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.AdBreak;
import com.adobe.mediacore.timeline.advertising.AdBreakPlacement;
import com.adobe.mediacore.timeline.advertising.AdPolicyMode;
import java.util.Iterator;
import java.util.List;

final class AdTimeline
  implements Timeline
{
  private static final String LOG_TAG = "[PSDK]::" + AdTimeline.class.getSimpleName();
  private Logger _logger = Log.getLogger(LOG_TAG);
  private final VideoEngineTimeline _videoEngineTimeline;
  
  public AdTimeline(VideoEngineTimeline paramVideoEngineTimeline)
  {
    if (paramVideoEngineTimeline == null) {
      throw new IllegalArgumentException("Video engine timeline parameter must not be null.");
    }
    _videoEngineTimeline = paramVideoEngineTimeline;
  }
  
  public VideoEngineTimeline.TimeMapping getAdjustedPosition(VideoEngineTimeline.TimeMapping paramTimeMapping, long paramLong, AdPolicyMode paramAdPolicyMode)
  {
    return _videoEngineTimeline.adjustSeekPosition(paramTimeMapping, paramLong, paramAdPolicyMode);
  }
  
  public Info getInfoForContentId(long paramLong)
  {
    Object localObject = _videoEngineTimeline.getAdBreakPlacements();
    if (!((List)localObject).isEmpty())
    {
      AdBreakPlacement localAdBreakPlacement;
      Ad localAd;
      do
      {
        localObject = ((List)localObject).iterator();
        Iterator localIterator;
        while (!localIterator.hasNext())
        {
          if (!((Iterator)localObject).hasNext()) {
            break;
          }
          localAdBreakPlacement = (AdBreakPlacement)((Iterator)localObject).next();
          localIterator = localAdBreakPlacement.getAdBreak().adsIterator();
        }
        localAd = (Ad)localIterator.next();
      } while ((localAd == null) || (paramLong != localAd.getId()));
      return Info.createInfo(localAdBreakPlacement.getAdBreak(), localAd);
    }
    return null;
  }
  
  public Iterator timelineMarkers()
  {
    return _videoEngineTimeline.getAdBreakPlacements().iterator();
  }
  
  public void update(long paramLong)
  {
    _videoEngineTimeline.updateTimelineMarkers(paramLong);
  }
  
  public static class AdInformation
  {
    private final Ad _ad;
    private final int _progress;
    
    public AdInformation(Ad paramAd, int paramInt)
    {
      _ad = paramAd;
      _progress = paramInt;
    }
    
    public Ad getAd()
    {
      return _ad;
    }
    
    public int getProgress()
    {
      return _progress;
    }
  }
  
  public static class Info
  {
    private final Ad _ad;
    private final AdBreak _adBreak;
    
    private Info(AdBreak paramAdBreak, Ad paramAd)
    {
      _adBreak = paramAdBreak;
      _ad = paramAd;
    }
    
    public static Info createInfo(AdBreak paramAdBreak, Ad paramAd)
    {
      if ((paramAdBreak != null) && (paramAd != null)) {
        return new Info(paramAdBreak, paramAd);
      }
      return null;
    }
    
    public boolean equals(Info paramInfo)
    {
      return (paramInfo != null) && (_adBreak == paramInfo.getAdBreak()) && (_ad == paramInfo.getAd());
    }
    
    public Ad getAd()
    {
      return _ad;
    }
    
    public AdBreak getAdBreak()
    {
      return _adBreak;
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.AdTimeline
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */