package com.auditude.ads.event;

import com.auditude.ads.model.INonLinearAsset;
import com.auditude.ads.model.IOnPageAsset;
import java.util.HashMap;

public class NonLinearAdEvent
  extends AdPluginEvent
{
  public static final String AD_BEGIN = "nonLinearAdBegin";
  public static final String AD_END = "nonLinearAdEnd";
  private INonLinearAsset asset;
  private IOnPageAsset[] banners;
  
  public NonLinearAdEvent(String paramString, INonLinearAsset paramINonLinearAsset, IOnPageAsset[] paramArrayOfIOnPageAsset)
  {
    this(paramString, paramINonLinearAsset, paramArrayOfIOnPageAsset, null);
  }
  
  public NonLinearAdEvent(String paramString, INonLinearAsset paramINonLinearAsset, IOnPageAsset[] paramArrayOfIOnPageAsset, HashMap paramHashMap)
  {
    super(paramString, paramHashMap);
    asset = paramINonLinearAsset;
    banners = paramArrayOfIOnPageAsset;
  }
  
  public final INonLinearAsset getAsset()
  {
    return asset;
  }
  
  public final IOnPageAsset[] getBanners()
  {
    return banners;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.event.NonLinearAdEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */