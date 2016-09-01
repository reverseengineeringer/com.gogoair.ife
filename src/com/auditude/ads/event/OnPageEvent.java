package com.auditude.ads.event;

import com.auditude.ads.model.IOnPageAsset;
import java.util.HashMap;

public class OnPageEvent
  extends AdPluginEvent
{
  public static final String HIDE_BANNER = "hideBanner";
  public static final String SHOW_BANNER = "showBanner";
  private IOnPageAsset asset;
  
  public OnPageEvent(String paramString, IOnPageAsset paramIOnPageAsset)
  {
    this(paramString, paramIOnPageAsset, null);
  }
  
  public OnPageEvent(String paramString, IOnPageAsset paramIOnPageAsset, HashMap paramHashMap)
  {
    super(paramString, paramHashMap);
    asset = paramIOnPageAsset;
  }
  
  public final IOnPageAsset getAsset()
  {
    return asset;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.event.OnPageEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */