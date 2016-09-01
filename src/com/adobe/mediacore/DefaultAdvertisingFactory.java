package com.adobe.mediacore;

import android.content.Context;
import com.adobe.mediacore.metadata.AdSignalingMode;
import com.adobe.mediacore.timeline.advertising.AdPolicySelector;
import com.adobe.mediacore.timeline.advertising.ContentResolver;
import java.util.List;

public class DefaultAdvertisingFactory
  extends AdvertisingFactory
{
  private AdSignalingMode _adSignalingMode;
  private Context _context;
  
  public DefaultAdvertisingFactory(AdSignalingMode paramAdSignalingMode)
  {
    _adSignalingMode = paramAdSignalingMode;
  }
  
  public DefaultAdvertisingFactory(AdSignalingMode paramAdSignalingMode, Context paramContext)
  {
    _adSignalingMode = paramAdSignalingMode;
    _context = paramContext;
  }
  
  public AdPolicySelector createAdPolicySelector(MediaPlayerItem paramMediaPlayerItem)
  {
    return new DefaultAdPolicySelector(paramMediaPlayerItem);
  }
  
  public ContentResolver createContentResolver(MediaPlayerItem paramMediaPlayerItem)
  {
    return DefaultContentResolverFactory.createContentResolver(paramMediaPlayerItem.getResource(), _context);
  }
  
  public List createContentResolvers(MediaPlayerItem paramMediaPlayerItem)
  {
    return DefaultContentResolverFactory.createContentResolvers(paramMediaPlayerItem.getResource(), _context);
  }
  
  public PlacementOpportunityDetector createOpportunityDetector(MediaPlayerItem paramMediaPlayerItem)
  {
    return DefaultOpportunityDetectorFactory.createOpportunityDetector(paramMediaPlayerItem, _adSignalingMode);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DefaultAdvertisingFactory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */