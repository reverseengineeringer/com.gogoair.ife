package com.adobe.mediacore;

import com.adobe.mediacore.timeline.advertising.AdPolicySelector;
import com.adobe.mediacore.timeline.advertising.AdProvider;
import com.adobe.mediacore.timeline.advertising.ContentResolver;
import java.util.List;

public abstract class AdvertisingFactory
  implements AdClientFactory
{
  public abstract AdPolicySelector createAdPolicySelector(MediaPlayerItem paramMediaPlayerItem);
  
  public AdProvider createAdProvider(MediaPlayerItem paramMediaPlayerItem)
  {
    return null;
  }
  
  public abstract ContentResolver createContentResolver(MediaPlayerItem paramMediaPlayerItem);
  
  public abstract List createContentResolvers(MediaPlayerItem paramMediaPlayerItem);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.AdvertisingFactory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */