package com.auditude.ads.network.vast.model;

import java.util.ArrayList;
import java.util.Iterator;

public class VASTInlineAd
  extends VASTAdBase
{
  public String adTitle;
  public Boolean asInvalideXML = Boolean.valueOf(false);
  private ArrayList companionAds;
  public String companionRequired = "none";
  public String description;
  public VASTLinearCreative linearAd;
  private ArrayList nonLinearAds;
  public String surveyUrl;
  
  public final void addCompanionAd(VASTCompanionCreative paramVASTCompanionCreative)
  {
    if (paramVASTCompanionCreative == null) {
      return;
    }
    if (companionAds == null) {
      companionAds = new ArrayList();
    }
    companionAds.add(paramVASTCompanionCreative);
  }
  
  public final void addNonLinearAd(VASTNonLinearCreative paramVASTNonLinearCreative)
  {
    if (paramVASTNonLinearCreative == null) {
      return;
    }
    if (nonLinearAds == null) {
      nonLinearAds = new ArrayList();
    }
    nonLinearAds.add(paramVASTNonLinearCreative);
  }
  
  public final ArrayList getCompanionAds()
  {
    return companionAds;
  }
  
  public final ArrayList getNonLinearAds()
  {
    return nonLinearAds;
  }
  
  public void setNonLinearAdTrackingEvents(ArrayList paramArrayList)
  {
    Iterator localIterator;
    if (nonLinearAds != null) {
      localIterator = nonLinearAds.iterator();
    }
    for (;;)
    {
      if (!localIterator.hasNext()) {
        return;
      }
      ((VASTNonLinearCreative)localIterator.next()).setTrackingEvents(paramArrayList);
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.network.vast.model.VASTInlineAd
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */