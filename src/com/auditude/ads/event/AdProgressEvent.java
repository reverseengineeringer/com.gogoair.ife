package com.auditude.ads.event;

import com.auditude.ads.model.IAsset;
import java.util.HashMap;

public class AdProgressEvent
  extends AdPluginEvent
{
  public static final String AD_PROGRESS = "adProgress";
  private IAsset asset;
  private int duration;
  private int position;
  
  public AdProgressEvent(String paramString, int paramInt1, int paramInt2, IAsset paramIAsset)
  {
    this(paramString, paramInt1, paramInt2, paramIAsset, null);
  }
  
  public AdProgressEvent(String paramString, int paramInt1, int paramInt2, IAsset paramIAsset, HashMap paramHashMap)
  {
    super(paramString, paramHashMap);
    position = paramInt1;
    duration = paramInt2;
    asset = paramIAsset;
  }
  
  public final IAsset getAsset()
  {
    return asset;
  }
  
  public final int getDuration()
  {
    return duration;
  }
  
  public final int getPosition()
  {
    return position;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.event.AdProgressEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */