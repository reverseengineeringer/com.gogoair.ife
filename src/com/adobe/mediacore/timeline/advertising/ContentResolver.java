package com.adobe.mediacore.timeline.advertising;

import com.adobe.mediacore.MediaPlayerNotification.Error;
import com.adobe.mediacore.MediaPlayerNotification.Warning;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.timeline.PlacementOpportunity;
import java.util.List;

public abstract class ContentResolver
  extends AdProvider
{
  private AdProvider.OnCompleteListener _listener;
  
  public final boolean canResolve(PlacementOpportunity paramPlacementOpportunity)
  {
    return doCanResolve(paramPlacementOpportunity);
  }
  
  protected abstract boolean doCanResolve(PlacementOpportunity paramPlacementOpportunity);
  
  protected abstract ContentTracker doProvideAdTracker();
  
  protected abstract void doResolveAds(Metadata paramMetadata, PlacementOpportunity paramPlacementOpportunity);
  
  public final ContentTracker getAdTracker()
  {
    return doProvideAdTracker();
  }
  
  protected final void notifyResolveComplete(List paramList)
  {
    if (_listener != null) {
      _listener.onComplete(this, paramList);
    }
  }
  
  protected final void notifyResolveError(MediaPlayerNotification.Error paramError)
  {
    if (_listener != null) {
      _listener.onError(this, paramError);
    }
  }
  
  protected final void notifyResolveWarning(MediaPlayerNotification.Warning paramWarning)
  {
    if (_listener != null) {
      _listener.onWarning(this, paramWarning);
    }
  }
  
  public final void registerOnCompleteListener(AdProvider.OnCompleteListener paramOnCompleteListener)
  {
    if (_listener != null) {
      throw new IllegalStateException("Only one OnCompleteListener can be registered at a time.Remove first the listener previously registered.");
    }
    if (paramOnCompleteListener == null) {
      throw new IllegalArgumentException("The listener which will be registered can't be null.");
    }
    _listener = paramOnCompleteListener;
  }
  
  public final void resolveAds(Metadata paramMetadata)
  {
    doResolveAds(paramMetadata, null);
  }
  
  public final void resolveAds(Metadata paramMetadata, PlacementOpportunity paramPlacementOpportunity)
  {
    doResolveAds(paramMetadata, paramPlacementOpportunity);
  }
  
  public final void unregisterOnCompleteListener(AdProvider.OnCompleteListener paramOnCompleteListener)
  {
    if (_listener == null) {
      throw new IllegalStateException("No listener was previously registered.");
    }
    if (_listener != paramOnCompleteListener) {
      throw new IllegalArgumentException("The provided listener was not registered with this instance.Attempting to remove the wrong listener.");
    }
    _listener = null;
  }
  
  public static abstract interface OnTimeUpdateListener
  {
    public abstract void onTimeUpdate(long paramLong1, long paramLong2);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.ContentResolver
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */