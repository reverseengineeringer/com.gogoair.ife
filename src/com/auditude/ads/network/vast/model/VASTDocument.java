package com.auditude.ads.network.vast.model;

import java.util.ArrayList;

public class VASTDocument
{
  public static final String VERSION_2_0 = "2.0";
  public static final String VERSION_2_0_0 = "2.0.0";
  public static final String VERSION_2_0_1 = "2.0.1";
  public static final String VERSION_3_0 = "3.0";
  public String adTagURI;
  private ArrayList ads;
  public VASTAd parentAd = null;
  private ArrayList podAds;
  public boolean reachedMaxWrapper = false;
  private ArrayList standAloneAds;
  private ArrayList ununsedAds;
  private ArrayList usedAds;
  public String version = "2.0";
  
  public VASTDocument(VASTAd paramVASTAd)
  {
    parentAd = paramVASTAd;
    ads = new ArrayList();
    podAds = new ArrayList();
    standAloneAds = new ArrayList();
  }
  
  public final void addVASTAd(VASTAd paramVASTAd)
  {
    if ((paramVASTAd == null) || ((paramVASTAd.getWrapperAd() != null) && (parentAd != null) && (parentAd.getWrapperAd() != null) && (!parentAd.getWrapperAd().followAdditionalWrappers.booleanValue()))) {
      return;
    }
    if ((paramVASTAd.getWrapperAd() != null) && (parentAd != null) && (parentAd.getWrapperAd() != null) && (parentAd.getWrapperAd().allowMultipleAds != null) && (parentAd.getWrapperAd().allowMultipleAds.equalsIgnoreCase("false"))) {
      getWrapperAdallowMultipleAds = "false";
    }
    paramVASTAd.setDocument(this);
    ads.add(paramVASTAd);
    if (paramVASTAd.getSequence() >= 0)
    {
      int i = 0;
      for (;;)
      {
        Boolean localBoolean;
        if (i >= podAds.size()) {
          localBoolean = Boolean.valueOf(false);
        }
        while (!localBoolean.booleanValue())
        {
          podAds.add(paramVASTAd);
          return;
          if (((VASTAd)podAds.get(i)).getSequence() <= paramVASTAd.getSequence()) {
            break label203;
          }
          localBoolean = Boolean.valueOf(true);
          podAds.add(i, paramVASTAd);
        }
        break;
        label203:
        i += 1;
      }
    }
    standAloneAds.add(paramVASTAd);
  }
  
  public final ArrayList getAds()
  {
    int j = 0;
    if ((parentAd == null) || (parentAd.getWrapperAd() == null) || (ads.size() == 0)) {
      return ads;
    }
    if (usedAds != null) {
      return usedAds;
    }
    usedAds = new ArrayList();
    ununsedAds = new ArrayList();
    int i;
    if ((parentAd.getWrapperAd().allowMultipleAds != null) && (parentAd.getWrapperAd().allowMultipleAds.equalsIgnoreCase("false"))) {
      if (standAloneAds.size() == 0)
      {
        i = j;
        if (podAds.size() > 0)
        {
          usedAds.add((VASTAd)podAds.get(0));
          i = j;
        }
      }
    }
    for (;;)
    {
      if (i >= standAloneAds.size())
      {
        return usedAds;
        if (podAds.size() == 0)
        {
          usedAds.add((VASTAd)standAloneAds.get(0));
          i = j;
        }
        else
        {
          usedAds.add((VASTAd)standAloneAds.get(0));
          i = j;
          continue;
          if ((parentAd.getWrapperAd().allowMultipleAds != null) && (parentAd.getWrapperAd().allowMultipleAds.equalsIgnoreCase("true")))
          {
            if (podAds.size() > 0)
            {
              usedAds.addAll(podAds);
              i = j;
            }
            else
            {
              i = j;
              if (standAloneAds.size() > 0)
              {
                usedAds.add((VASTAd)standAloneAds.get(0));
                i = j;
              }
            }
          }
          else
          {
            usedAds.addAll(ads);
            i = j;
          }
        }
      }
      else
      {
        if (usedAds.indexOf(standAloneAds.get(i)) < 0) {
          ununsedAds.add((VASTAd)standAloneAds.get(i));
        }
        i += 1;
      }
    }
  }
  
  public final VASTAd getNextUnusedAd()
  {
    if ((ununsedAds == null) || (ununsedAds.size() == 0)) {
      return null;
    }
    VASTAd localVASTAd = (VASTAd)ununsedAds.get(0);
    ununsedAds.remove(0);
    return localVASTAd;
  }
  
  public final void replaceAd(VASTAd paramVASTAd1, VASTAd paramVASTAd2)
  {
    getAds();
    if (usedAds != null)
    {
      int i = usedAds.indexOf(paramVASTAd1);
      if (i >= 0) {
        usedAds.set(i, paramVASTAd2);
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.network.vast.model.VASTDocument
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */