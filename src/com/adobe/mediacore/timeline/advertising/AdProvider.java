package com.adobe.mediacore.timeline.advertising;

import com.adobe.mediacore.MediaPlayerNotification.Error;
import com.adobe.mediacore.MediaPlayerNotification.Warning;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.timeline.PlacementOpportunity;
import java.util.List;

@Deprecated
public abstract class AdProvider
{
  protected OnCompleteListener _listener;
  
  protected abstract ContentTracker doProvideAdTracker();
  
  protected abstract void doResolveAds(Metadata paramMetadata, PlacementOpportunity paramPlacementOpportunity);
  
  public ContentTracker getAdTracker()
  {
    return doProvideAdTracker();
  }
  
  protected void notifyResolveComplete(List paramList)
  {
    if (_listener != null) {
      _listener.onComplete(this, paramList);
    }
  }
  
  protected void notifyResolveError(MediaPlayerNotification.Error paramError)
  {
    if (_listener != null) {
      _listener.onError(this, paramError);
    }
  }
  
  protected void notifyResolveWarning(MediaPlayerNotification.Warning paramWarning)
  {
    if (_listener != null) {
      _listener.onWarning(this, paramWarning);
    }
  }
  
  public void registerOnCompleteListener(OnCompleteListener paramOnCompleteListener)
  {
    if (_listener != null) {
      throw new IllegalStateException("Only one OnCompleteListener can be registered at a time.Remove first the listener previously registered.");
    }
    if (paramOnCompleteListener == null) {
      throw new IllegalArgumentException("The listener which will be registered can't be null.");
    }
    _listener = paramOnCompleteListener;
  }
  
  public void resolveAds(Metadata paramMetadata)
  {
    doResolveAds(paramMetadata, null);
  }
  
  public void resolveAds(Metadata paramMetadata, PlacementOpportunity paramPlacementOpportunity)
  {
    doResolveAds(paramMetadata, paramPlacementOpportunity);
  }
  
  public void unregisterOnCompleteListener(OnCompleteListener paramOnCompleteListener)
  {
    if (_listener == null) {
      throw new IllegalStateException("No listener was previously registered.");
    }
    if (_listener != paramOnCompleteListener) {
      throw new IllegalArgumentException("The provided listener was not registered with this instance.Attempting to remove the wrong listener.");
    }
    _listener = null;
  }
  
  public static abstract interface OnCompleteListener
  {
    public abstract void onComplete(AdProvider paramAdProvider, List paramList);
    
    public abstract void onError(AdProvider paramAdProvider, MediaPlayerNotification.Error paramError);
    
    public abstract void onWarning(AdProvider paramAdProvider, MediaPlayerNotification.Warning paramWarning);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.AdProvider
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */