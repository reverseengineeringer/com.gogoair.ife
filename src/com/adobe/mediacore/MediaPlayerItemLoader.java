package com.adobe.mediacore;

import android.content.Context;
import com.adobe.ave.ContainerType;
import com.adobe.ave.ListenerType;
import com.adobe.ave.MediaErrorCode;
import com.adobe.ave.VideoEngine;
import com.adobe.ave.VideoEngineException;
import com.adobe.ave.VideoEngineListener;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import java.io.File;
import java.util.EnumSet;

public class MediaPlayerItemLoader
{
  private static final String LOG_TAG = "[PSDK]::" + MediaPlayerItemLoader.class.getSimpleName();
  private Context _context;
  private boolean _isProtected;
  private LoaderListener _listener;
  private final Logger _logger = Log.getLogger(LOG_TAG);
  private MediaResource _mediaResource;
  private VideoEngine _videoEngine;
  private VideoEngineDispatcher _videoEngineDispatcher;
  private VideoEngineItem _videoEngineItem;
  private VideoEngineListener _videoEngineListener;
  private final int contentId = 0;
  
  public MediaPlayerItemLoader(Context paramContext, LoaderListener paramLoaderListener)
  {
    if (paramContext == null) {
      throw new IllegalArgumentException("Video engine context parameter must not be null.");
    }
    if (paramLoaderListener == null) {
      throw new IllegalArgumentException("Video engine dispatcher parameter must not be null.");
    }
    _context = paramContext;
    _listener = paramLoaderListener;
    _videoEngineDispatcher = new VideoEngineDispatcher();
    try
    {
      _videoEngine = new VideoEngine();
      paramContext = EnumSet.of(ListenerType.ERROR, ListenerType.DRM_METADATA, ListenerType.TIMELINE);
      _videoEngineListener = createEngineListener();
      _videoEngine.addListener(paramContext, _videoEngineListener);
      paramContext = _context.getFilesDir().getAbsolutePath();
      _videoEngine.setLocalStoragePath(paramContext);
      return;
    }
    catch (VideoEngineException paramContext)
    {
      _listener.onError(paramContext.getErrorCode(), paramContext.getMessage());
    }
  }
  
  private ContainerType convertType(MediaResource.Type paramType)
  {
    if (paramType == MediaResource.Type.HDS) {
      return ContainerType.F4M;
    }
    if (paramType == MediaResource.Type.HLS) {
      return ContainerType.HLS;
    }
    return ContainerType.UNDEFINED;
  }
  
  private VideoEngineListener createEngineListener()
  {
    return new MediaPlayerItemLoader.1(this);
  }
  
  public void load(MediaResource paramMediaResource)
  {
    _mediaResource = paramMediaResource;
    try
    {
      paramMediaResource = _mediaResource.getUrl();
      ContainerType localContainerType = convertType(_mediaResource.getType());
      _videoEngine.load(paramMediaResource, localContainerType, 0);
      return;
    }
    catch (VideoEngineException paramMediaResource)
    {
      _listener.onError(paramMediaResource.getErrorCode(), paramMediaResource.getMessage());
    }
  }
  
  public static abstract interface LoaderListener
  {
    public abstract void onError(MediaErrorCode paramMediaErrorCode, String paramString);
    
    public abstract void onLoadComplete(MediaPlayerItem paramMediaPlayerItem);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.MediaPlayerItemLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */