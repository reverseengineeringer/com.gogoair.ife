package com.auditude.ads.network.vast.model;

import com.auditude.ads.network.vast.repackaging.VastAssetRepackager;
import com.auditude.ads.network.vast.repackaging.VastAssetRepackager.VastAssetRepackagingCompletionListener;
import com.auditude.ads.network.vast.repackaging.VastAssetRepackagerInfo;
import java.util.ArrayList;
import java.util.Iterator;

public class VASTAd
  implements VastAssetRepackager.VastAssetRepackagingCompletionListener
{
  private Boolean fallbackOnInvalidCreative = Boolean.valueOf(false);
  private Boolean fallbackOnNoAd = Boolean.valueOf(false);
  private String id;
  private ArrayList inlineAds;
  private Boolean isFromVmapDoc = Boolean.valueOf(false);
  private int repackageCount = 0;
  private int repackageTotal = 0;
  private VastAssetRepackager.VastAssetRepackagingCompletionListener repackagingListener = null;
  private int sequence = -1;
  private VASTDocument vastDocument;
  private VASTWrapperAd wrapperAd;
  
  public VASTAd(String paramString, Boolean paramBoolean)
  {
    id = paramString;
    fallbackOnInvalidCreative = paramBoolean;
  }
  
  public final void addInlineAds(VASTInlineAd paramVASTInlineAd)
  {
    if (paramVASTInlineAd != null)
    {
      if (inlineAds == null) {
        inlineAds = new ArrayList();
      }
      inlineAds.add(paramVASTInlineAd);
    }
  }
  
  public final VASTDocument getDocument()
  {
    return vastDocument;
  }
  
  public final Boolean getFallbackOnInvalidCreative()
  {
    return fallbackOnInvalidCreative;
  }
  
  public final Boolean getFallbackOnNoAd()
  {
    return fallbackOnNoAd;
  }
  
  public final String getID()
  {
    return id;
  }
  
  public final ArrayList getInlineAds()
  {
    return inlineAds;
  }
  
  public final Boolean getIsFromVmapDoc()
  {
    return isFromVmapDoc;
  }
  
  public String getRootAdId()
  {
    if ((vastDocument != null) && (vastDocument.parentAd != null)) {
      return vastDocument.parentAd.getRootAdId();
    }
    return id;
  }
  
  public final int getSequence()
  {
    return sequence;
  }
  
  public final VASTWrapperAd getWrapperAd()
  {
    return wrapperAd;
  }
  
  public final Boolean hasAssetsWithMimeType(ArrayList paramArrayList)
  {
    Iterator localIterator;
    if (inlineAds != null) {
      localIterator = inlineAds.iterator();
    }
    VASTInlineAd localVASTInlineAd;
    do
    {
      if (!localIterator.hasNext()) {
        return Boolean.valueOf(false);
      }
      localVASTInlineAd = (VASTInlineAd)localIterator.next();
    } while ((linearAd == null) || (!linearAd.hasAssetsWithMimeType(paramArrayList).booleanValue()));
    return Boolean.valueOf(true);
  }
  
  public void onRepackagingComplete(VASTLinearCreative paramVASTLinearCreative, boolean paramBoolean)
  {
    repackageCount += 1;
    if (repackageCount >= repackageTotal) {
      repackagingListener.onRepackagingComplete(paramVASTLinearCreative, false);
    }
  }
  
  public final void repackageIncompatibleCreatives(VastAssetRepackager.VastAssetRepackagingCompletionListener paramVastAssetRepackagingCompletionListener, VastAssetRepackagerInfo paramVastAssetRepackagerInfo)
  {
    repackagingListener = paramVastAssetRepackagingCompletionListener;
    repackageCount = 0;
    repackageTotal = 0;
    Iterator localIterator;
    if (inlineAds != null) {
      localIterator = inlineAds.iterator();
    }
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        if (repackageTotal == 0) {
          paramVastAssetRepackagingCompletionListener.onRepackagingComplete(null, false);
        }
        return;
      }
      VASTInlineAd localVASTInlineAd = (VASTInlineAd)localIterator.next();
      if (localVASTInlineAd != null)
      {
        VASTMediaFile localVASTMediaFile = linearAd.getBestMediaFile();
        if ((localVASTMediaFile != null) && (!type.toLowerCase().equalsIgnoreCase(requiredFormat)))
        {
          repackageTotal += 1;
          new VastAssetRepackager(this, linearAd, getRootAdId(), paramVastAssetRepackagerInfo).repackage();
        }
      }
    }
  }
  
  public final void setDocument(VASTDocument paramVASTDocument)
  {
    vastDocument = paramVASTDocument;
  }
  
  public final void setFallbackOnNoAd(Boolean paramBoolean)
  {
    fallbackOnNoAd = paramBoolean;
  }
  
  public final void setIsFromVmapDoc(Boolean paramBoolean)
  {
    isFromVmapDoc = paramBoolean;
  }
  
  public final void setSequence(int paramInt)
  {
    sequence = paramInt;
  }
  
  public final void setWrapperAd(VASTWrapperAd paramVASTWrapperAd)
  {
    wrapperAd = paramVASTWrapperAd;
    if (wrapperAd != null)
    {
      if (wrapperAd.fallbackOnNoAd == null) {
        fallbackOnNoAd = fallbackOnInvalidCreative;
      }
    }
    else {
      return;
    }
    fallbackOnNoAd = Boolean.valueOf(wrapperAd.fallbackOnNoAd.equalsIgnoreCase("true"));
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.network.vast.model.VASTAd
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */