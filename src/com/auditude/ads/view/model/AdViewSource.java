package com.auditude.ads.view.model;

import com.auditude.ads.model.IAsset;
import com.auditude.ads.model.IOnPageAsset;

public class AdViewSource
  implements IAdViewSource
{
  private Object adParameters;
  private IAsset asset;
  private IOnPageAsset[] companions;
  
  public AdViewSource(IAsset paramIAsset, IOnPageAsset[] paramArrayOfIOnPageAsset, Object paramObject)
  {
    asset = paramIAsset;
    companions = paramArrayOfIOnPageAsset;
    adParameters = paramObject;
  }
  
  public final Object getAdParameters()
  {
    return adParameters;
  }
  
  public final IAsset getAsset()
  {
    return asset;
  }
  
  public final IOnPageAsset[] getCompanions()
  {
    return companions;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.view.model.AdViewSource
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */