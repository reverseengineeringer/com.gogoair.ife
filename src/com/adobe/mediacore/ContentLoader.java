package com.adobe.mediacore;

import com.adobe.ave.ContainerType;
import com.adobe.ave.Timeline;
import com.adobe.ave.VideoEngineException;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.AdAsset;
import com.adobe.mediacore.timeline.advertising.AdBreak;
import com.adobe.mediacore.timeline.advertising.ContentTracker;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

final class ContentLoader
{
  public static final String FLV = "FLV";
  private static final String LOG_TAG = "[PSDK]::" + ContentLoader.class.getSimpleName();
  private static final int START_AD_LOADING_ID = 1;
  private final ContentCache _contentCache;
  private final ContentLoadCompleteListener _contentLoadCompleteListener;
  private final ContentLoadFailedListener _contentLoadFailedListener;
  private ContentLoaderMonitor _contentLoaderMonitor = new ContentLoaderMonitor(null);
  private final Logger _logger = Log.getLogger(LOG_TAG);
  private int _nextAvailableId = 1;
  private final VideoEngineDispatcher _videoEngineDispatcher;
  private Timeline _videoEngineTimeline;
  
  public ContentLoader(VideoEngineDispatcher paramVideoEngineDispatcher, ContentCache paramContentCache)
  {
    _videoEngineDispatcher = paramVideoEngineDispatcher;
    _contentLoadCompleteListener = new ContentLoadCompleteListener(null);
    _contentLoadFailedListener = new ContentLoadFailedListener(null);
    _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.AD_MANIFEST_LOAD_COMPLETE, _contentLoadCompleteListener);
    _videoEngineDispatcher.addEventListener(MediaPlayerEvent.Type.AD_MANIFEST_LOAD_FAILED, _contentLoadFailedListener);
    _contentCache = paramContentCache;
  }
  
  private ContainerType convertType(MediaResource.Type paramType)
  {
    ContainerType localContainerType = ContainerType.UNDEFINED;
    if (paramType.equals(MediaResource.Type.HLS)) {
      localContainerType = ContainerType.HLS;
    }
    return localContainerType;
  }
  
  private ContentLoaderMonitor createContentLoaderMonitorForAdBreak(AdBreak paramAdBreak, int paramInt)
  {
    ContentLoaderMonitor localContentLoaderMonitor = new ContentLoaderMonitor(null);
    paramAdBreak = paramAdBreak.adsIterator();
    while (paramAdBreak.hasNext())
    {
      Ad localAd = (Ad)paramAdBreak.next();
      if (!localAd.isCustomAdMarker()) {
        localContentLoaderMonitor.addPendingContent(paramInt, localAd);
      }
      paramInt += 1;
    }
    return localContentLoaderMonitor;
  }
  
  public void loadContent(AdBreak paramAdBreak)
  {
    if (_videoEngineTimeline == null) {
      throw new IllegalStateException("No timeline was set for loading manifests.");
    }
    _contentLoaderMonitor = createContentLoaderMonitorForAdBreak(paramAdBreak, _nextAvailableId);
    paramAdBreak = paramAdBreak.adsIterator();
    if (paramAdBreak.hasNext())
    {
      Ad localAd = (Ad)paramAdBreak.next();
      String str = localAd.getPrimaryAsset().getMediaResource().getUrl();
      if (!localAd.isCustomAdMarker())
      {
        if (!_contentCache.isCached(str)) {
          break label170;
        }
        _logger.i(LOG_TAG + "#loadContent", "Retrieving from cache content " + _nextAvailableId + " location = " + str);
        _contentLoaderMonitor.markContentResolved(_nextAvailableId);
      }
      for (;;)
      {
        _nextAvailableId += 1;
        break;
        try
        {
          label170:
          _logger.i(LOG_TAG + "#loadContent", "Starting the loading of manifest for content = " + _nextAvailableId + " location = " + str);
          _videoEngineTimeline.loadManifest(str, _nextAvailableId, convertType(localAd.getPrimaryAsset().getMediaResource().getType()));
        }
        catch (VideoEngineException localVideoEngineException)
        {
          _logger.w(LOG_TAG + "#loadContent", "Received exception { code = " + localVideoEngineException.getErrorCode() + ", description = " + localVideoEngineException.getDetailMessage() + "} while loading content { id = " + _nextAvailableId + ", location = " + str + "}");
          _contentLoaderMonitor.markContentResolved(_nextAvailableId);
        }
      }
    }
    if (_contentLoaderMonitor.hasFinishedLoading()) {
      _videoEngineDispatcher.dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.AD_BREAK_MANIFEST_LOAD_COMPLETE));
    }
  }
  
  public void releaseHandles()
  {
    removeListeners();
    if (_videoEngineTimeline != null)
    {
      Iterator localIterator = _contentCache.getCachedUrls().iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        AdHandle localAdHandle = _contentCache.getHandle(str);
        try
        {
          _videoEngineTimeline.releaseManifest(localAdHandle.getHandle());
        }
        catch (VideoEngineException localVideoEngineException)
        {
          _logger.w(LOG_TAG + "#loadContent", "Received exception { code = " + localVideoEngineException.getErrorCode() + ", description = " + localVideoEngineException.getDetailMessage() + "} while releasing content { handle = " + localAdHandle.getHandle() + ", location = " + str + "}");
        }
      }
      _contentCache.clearCache();
    }
  }
  
  public void removeListeners()
  {
    _videoEngineDispatcher.removeEventListener(MediaPlayerEvent.Type.AD_MANIFEST_LOAD_COMPLETE, _contentLoadCompleteListener);
    _videoEngineDispatcher.removeEventListener(MediaPlayerEvent.Type.AD_MANIFEST_LOAD_FAILED, _contentLoadFailedListener);
  }
  
  public void setVideoEngineTimeline(Timeline paramTimeline)
  {
    _videoEngineTimeline = paramTimeline;
  }
  
  private class ContentLoadCompleteListener
    implements AdManifestLoadCompleteListener
  {
    private ContentLoadCompleteListener() {}
    
    public void onCompleted(int paramInt1, int paramInt2, long paramLong)
    {
      AdHandle localAdHandle = new AdHandle(paramInt2, paramLong);
      String str = _contentLoaderMonitor.getUrl(paramInt1);
      _contentCache.addContent(str, localAdHandle);
      _contentLoaderMonitor.markContentResolved(paramInt1);
      if (_contentLoaderMonitor.hasFinishedLoading()) {
        _videoEngineDispatcher.dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.AD_BREAK_MANIFEST_LOAD_COMPLETE));
      }
    }
  }
  
  private class ContentLoadFailedListener
    implements AdManifestLoadFailedListener
  {
    private ContentLoadFailedListener() {}
    
    public void onError(int paramInt)
    {
      Ad localAd = _contentLoaderMonitor.getAd(paramInt);
      if ((localAd != null) && (localAd.getContentTracker() != null)) {
        localAd.getContentTracker().onAdError(localAd);
      }
      _contentLoaderMonitor.markContentResolved(paramInt);
      if (_videoEngineDispatcher != null)
      {
        MediaPlayerNotification.Warning localWarning = MediaPlayerNotification.createWarningNotification(MediaPlayerNotification.WarningCode.AD_MANIFEST_LOAD_FAILED, "fail to load ad manifest");
        MetadataNode localMetadataNode = new MetadataNode();
        localMetadataNode.setValue("AD", localAd.toString());
        localWarning.setMetadata(localMetadataNode);
        _videoEngineDispatcher.dispatch(OperationFailedEvent.createEvent(localWarning));
      }
      if (_contentLoaderMonitor.hasFinishedLoading()) {
        _videoEngineDispatcher.dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.AD_BREAK_MANIFEST_LOAD_COMPLETE));
      }
    }
  }
  
  private class ContentLoaderMonitor
  {
    private Map _pendingContentLoading = new Hashtable();
    
    private ContentLoaderMonitor() {}
    
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
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.ContentLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */