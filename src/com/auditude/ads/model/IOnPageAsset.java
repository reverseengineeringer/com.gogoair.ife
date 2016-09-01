package com.auditude.ads.model;

public abstract interface IOnPageAsset
  extends IAsset
{
  public abstract String getAltText();
  
  public abstract String getSource();
  
  public abstract IOnPageAsset getStaticAsset();
}

/* Location:
 * Qualified Name:     com.auditude.ads.model.IOnPageAsset
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */