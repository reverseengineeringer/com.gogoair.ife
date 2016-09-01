package com.auditude.ads.network.vast.model;

public class VASTWrapperAd
  extends VASTInlineAd
{
  public String allowMultipleAds;
  public String fallbackOnNoAd = null;
  public Boolean followAdditionalWrappers = Boolean.valueOf(true);
  public String source;
}

/* Location:
 * Qualified Name:     com.auditude.ads.network.vast.model.VASTWrapperAd
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */