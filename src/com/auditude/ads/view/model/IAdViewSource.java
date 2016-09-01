package com.auditude.ads.view.model;

import com.auditude.ads.model.IAsset;
import com.auditude.ads.model.IOnPageAsset;

public abstract interface IAdViewSource
{
  public abstract Object getAdParameters();
  
  public abstract IAsset getAsset();
  
  public abstract IOnPageAsset[] getCompanions();
}

/* Location:
 * Qualified Name:     com.auditude.ads.view.model.IAdViewSource
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */