package com.adobe.mediacore;

import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.AdAsset;
import java.util.Hashtable;
import java.util.Map;

class ContentLoader$ContentLoaderMonitor
{
  private Map _pendingContentLoading = new Hashtable();
  
  private ContentLoader$ContentLoaderMonitor(ContentLoader paramContentLoader) {}
  
  public void addPendingContent(int paramInt, Ad paramAd)
  {
    _pendingContentLoading.put(Integer.valueOf(paramInt), paramAd);
  }
  
  public void clear()
  {
    _pendingContentLoading = null;
  }
  
  public Ad getAd(int paramInt)
  {
    return (Ad)_pendingContentLoading.get(Integer.valueOf(paramInt));
  }
  
  public String getUrl(int paramInt)
  {
    Ad localAd = (Ad)_pendingContentLoading.get(Integer.valueOf(paramInt));
    if ((localAd != null) && (localAd.getPrimaryAsset() != null) && (localAd.getPrimaryAsset().getMediaResource() != null)) {
      return localAd.getPrimaryAsset().getMediaResource().getUrl();
    }
    return "";
  }
  
  public boolean hasFinishedLoading()
  {
    return _pendingContentLoading.isEmpty();
  }
  
  public void markContentResolved(int paramInt)
  {
    _pendingContentLoading.remove(Integer.valueOf(paramInt));
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.ContentLoader.ContentLoaderMonitor
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */