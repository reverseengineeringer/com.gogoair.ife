package com.auditude.ads.model;

import java.util.HashMap;

public abstract interface IAsset
{
  public abstract String getAdParameters();
  
  public abstract String getApiFramework();
  
  public abstract IClick getClick();
  
  public abstract String getCompanionRequired();
  
  public abstract String getCreativeType();
  
  public abstract HashMap getCustomData();
  
  public abstract String getDescription();
  
  public abstract int getDurationInMillis();
  
  public abstract String getFormat();
  
  public abstract int getHeight();
  
  public abstract String getID();
  
  public abstract Boolean getIsSkippable();
  
  public abstract int getLeadTimeInMillis();
  
  public abstract String getResourceType();
  
  public abstract int getSkipOffset();
  
  public abstract String getTitle();
  
  public abstract String getUrl();
  
  public abstract int getWidth();
  
  public abstract boolean isNetworkAd();
}

/* Location:
 * Qualified Name:     com.auditude.ads.model.IAsset
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */