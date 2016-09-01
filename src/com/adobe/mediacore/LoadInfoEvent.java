package com.adobe.mediacore;

import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.qos.LoadInfo;

class LoadInfoEvent
  extends MediaPlayerEvent
{
  private final LoadInfo _loadInfo;
  
  private LoadInfoEvent(LoadInfo paramLoadInfo)
  {
    super(MediaPlayerEvent.Type.LOAD_INFO);
    _loadInfo = paramLoadInfo;
  }
  
  public static LoadInfoEvent createLoadInfoEvent(LoadInfo paramLoadInfo)
  {
    LoadInfoEvent localLoadInfoEvent = new LoadInfoEvent(paramLoadInfo);
    MediaPlayerNotification.Info localInfo = new MediaPlayerNotification.Info(MediaPlayerNotification.InfoCode.LOAD_INFO_AVAILABLE, "Fragment load information is available.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("FRAGMENT_URL", paramLoadInfo.getFragmentUrl());
    localMetadataNode.setValue("FRAGMENT_SIZE", paramLoadInfo.getFragmentSize() + "");
    localMetadataNode.setValue("FRAGMENT_DOWNLOAD_DURATION", paramLoadInfo.getDownloadDuration() + "");
    localMetadataNode.setValue("PERIOD_INDEX", paramLoadInfo.getPeriodIndex() + "");
    localInfo.setMetadata(localMetadataNode);
    localLoadInfoEvent.setNotification(localInfo);
    return localLoadInfoEvent;
  }
  
  public LoadInfo getLoadInfo()
  {
    return _loadInfo;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.LoadInfoEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */