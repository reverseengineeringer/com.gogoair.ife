package com.auditude.ads.model;

import com.auditude.ads.util.StringUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class Ad
  extends BaseElement
{
  private String allowMultipleAds;
  private ArrayList assets;
  private HashMap assetsBySegment;
  private HashMap auditudeParams = new HashMap();
  private Boolean dispatchError = Boolean.valueOf(true);
  private Boolean followRedirects = Boolean.valueOf(true);
  private Boolean isFromVmapDoc = Boolean.valueOf(false);
  private boolean isNetworkAd;
  private Object networkAdSource;
  private String networkAdType;
  private boolean repackagingEnabled = false;
  private ArrayList trackingAssets = new ArrayList();
  
  public Ad(BaseElement paramBaseElement)
  {
    super(paramBaseElement);
  }
  
  public static void consolidateOnPageAsset(ArrayList paramArrayList, Asset paramAsset)
  {
    if ((!(paramAsset instanceof OnPageAsset)) || (paramArrayList == null)) {}
    Asset localAsset;
    do
    {
      return;
      while (!((Iterator)localObject).hasNext()) {
        localObject = paramArrayList.iterator();
      }
      localAsset = (Asset)((Iterator)localObject).next();
    } while ((localAsset == paramAsset) || (!(localAsset instanceof OnPageAsset)) || (localAsset.getWidth() != paramAsset.getWidth()) || (localAsset.getHeight() != paramAsset.getHeight()));
    int i = getCompanionPriority((OnPageAsset)paramAsset);
    int j = getCompanionPriority((OnPageAsset)localAsset);
    if (j < i) {}
    for (Object localObject = localAsset;; localObject = paramAsset)
    {
      if (j < i) {
        localAsset = paramAsset;
      }
      if (((Asset)localObject).getResourceType().equals("static")) {
        ((OnPageAsset)localAsset).setStaticAsset((OnPageAsset)localObject);
      }
      paramArrayList.remove(paramArrayList.indexOf(localObject));
      return;
    }
  }
  
  private static int getCompanionPriority(OnPageAsset paramOnPageAsset)
  {
    if ((paramOnPageAsset.getCreativeType() != null) && (paramOnPageAsset.getCreativeType().equalsIgnoreCase("application/x-shockwave-flash"))) {
      return 0;
    }
    HashMap localHashMap = new HashMap();
    localHashMap.put("static", Integer.valueOf(3));
    localHashMap.put("iframe", Integer.valueOf(2));
    localHashMap.put("html", Integer.valueOf(1));
    return ((Integer)localHashMap.get(paramOnPageAsset.getResourceType())).intValue();
  }
  
  public final void addAsset(Asset paramAsset)
  {
    if (paramAsset == null) {
      return;
    }
    if (assets == null) {
      assets = new ArrayList();
    }
    assets.add(paramAsset);
    consolidateOnPageAsset(assets, paramAsset);
  }
  
  public final void addSegmentById(String paramString, Asset[] paramArrayOfAsset)
  {
    if (assetsBySegment == null) {
      assetsBySegment = new HashMap();
    }
    if ((paramArrayOfAsset != null) && (!StringUtil.isNullOrEmpty(paramString))) {
      assetsBySegment.put(paramString, paramArrayOfAsset);
    }
  }
  
  public final void addTrackingAsset(Asset paramAsset)
  {
    if (paramAsset != null) {
      trackingAssets.add(paramAsset);
    }
  }
  
  public final String getAllowMultipleAds()
  {
    return allowMultipleAds;
  }
  
  public final Asset getAssetById(String paramString)
  {
    Iterator localIterator;
    if ((!StringUtil.isNullOrEmpty(paramString)) && (assets != null)) {
      localIterator = assets.iterator();
    }
    Asset localAsset;
    do
    {
      if (!localIterator.hasNext()) {
        return null;
      }
      localAsset = (Asset)localIterator.next();
    } while (!localAsset.getID().equals(paramString));
    return localAsset;
  }
  
  public final Asset[] getAssetsBySegment(String paramString)
  {
    if ((assetsBySegment == null) || (!assetsBySegment.containsKey(paramString))) {
      return null;
    }
    return (Asset[])assetsBySegment.get(paramString);
  }
  
  public final HashMap getAuditudeParams()
  {
    return auditudeParams;
  }
  
  public final Boolean getDispatchError()
  {
    return dispatchError;
  }
  
  public final Boolean getFollowRedirects()
  {
    return followRedirects;
  }
  
  public final Boolean getIsFromVmapDoc()
  {
    return isFromVmapDoc;
  }
  
  public final boolean getIsNetworkAd()
  {
    return isNetworkAd;
  }
  
  public final Object getNetworkAdSource()
  {
    return networkAdSource;
  }
  
  public final String getNetworkAdType()
  {
    return networkAdType;
  }
  
  public final Asset getTrackingAssetByType(String paramString)
  {
    Iterator localIterator;
    if (trackingAssets != null) {
      localIterator = trackingAssets.iterator();
    }
    Asset localAsset;
    do
    {
      Object localObject;
      if (!localIterator.hasNext()) {
        localObject = null;
      }
      do
      {
        do
        {
          return (Asset)localObject;
          localAsset = (Asset)localIterator.next();
          if (!(localAsset instanceof ILinearAsset)) {
            break;
          }
          localObject = localAsset;
        } while ("linear".equals(paramString));
        if (!(localAsset instanceof INonLinearAsset)) {
          break;
        }
        localObject = localAsset;
      } while ("nonlinear".equals(paramString));
    } while ((!(localAsset instanceof IOnPageAsset)) || (!"companion".equals(paramString)));
    return localAsset;
  }
  
  public final Boolean hasAssetsWithMimeType(ArrayList paramArrayList)
  {
    Iterator localIterator;
    if (assets != null) {
      localIterator = assets.iterator();
    }
    do
    {
      if (!localIterator.hasNext()) {
        return Boolean.valueOf(false);
      }
    } while (!((Asset)localIterator.next()).hasAssetsWithMimeType(paramArrayList).booleanValue());
    return Boolean.valueOf(true);
  }
  
  public final boolean isRepackagingEnabled()
  {
    return repackagingEnabled;
  }
  
  public final void setAllowMultipleAds(String paramString)
  {
    allowMultipleAds = paramString;
  }
  
  public final void setAuditudeParams(HashMap paramHashMap)
  {
    auditudeParams = paramHashMap;
  }
  
  public final void setDispatchError(Boolean paramBoolean)
  {
    dispatchError = paramBoolean;
  }
  
  public final void setFollowRedirects(Boolean paramBoolean)
  {
    followRedirects = paramBoolean;
  }
  
  public final void setIsFromVmapDoc(Boolean paramBoolean)
  {
    isFromVmapDoc = paramBoolean;
  }
  
  public final void setIsNetworkAd(boolean paramBoolean)
  {
    isNetworkAd = paramBoolean;
  }
  
  public final void setNetworkAdSource(Object paramObject)
  {
    networkAdSource = paramObject;
  }
  
  public final void setNetworkAdType(String paramString)
  {
    networkAdType = paramString;
  }
  
  public final void setRepackagingEnabled(boolean paramBoolean)
  {
    repackagingEnabled = paramBoolean;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.model.Ad
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */