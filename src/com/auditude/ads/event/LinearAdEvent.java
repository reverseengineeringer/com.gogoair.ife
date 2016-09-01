package com.auditude.ads.event;

import com.auditude.ads.model.ILinearAsset;
import com.auditude.ads.model.IOnPageAsset;
import com.auditude.ads.session.IPlaybackSession;
import java.util.HashMap;

public class LinearAdEvent
  extends AdPluginEvent
{
  public static final String AD_BEGIN = "linearAdBegin";
  public static final String AD_END = "linearAdEnd";
  public static final String AD_PAUSED = "linearAdPaused";
  public static final String AD_RESUMED = "linearAdResumed";
  private ILinearAsset asset;
  private boolean auditudeHandlesAd;
  private IOnPageAsset[] banners;
  private IPlaybackSession session;
  
  public LinearAdEvent(String paramString, ILinearAsset paramILinearAsset, IOnPageAsset[] paramArrayOfIOnPageAsset, IPlaybackSession paramIPlaybackSession, boolean paramBoolean)
  {
    this(paramString, paramILinearAsset, paramArrayOfIOnPageAsset, paramIPlaybackSession, paramBoolean, null);
  }
  
  public LinearAdEvent(String paramString, ILinearAsset paramILinearAsset, IOnPageAsset[] paramArrayOfIOnPageAsset, IPlaybackSession paramIPlaybackSession, boolean paramBoolean, HashMap paramHashMap)
  {
    super(paramString, paramHashMap);
    asset = paramILinearAsset;
    banners = paramArrayOfIOnPageAsset;
    session = paramIPlaybackSession;
    auditudeHandlesAd = paramBoolean;
  }
  
  public final ILinearAsset getAsset()
  {
    return asset;
  }
  
  public final boolean getAuditudeHandlesAd()
  {
    return auditudeHandlesAd;
  }
  
  public final IOnPageAsset[] getBanners()
  {
    return banners;
  }
  
  public final IPlaybackSession getSession()
  {
    return session;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.event.LinearAdEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */