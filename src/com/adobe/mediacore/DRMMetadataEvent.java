package com.adobe.mediacore;

import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;

class DRMMetadataEvent
  extends MediaPlayerEvent
{
  private final DRMMetadataInfo _drmMetadataInfo;
  
  private DRMMetadataEvent(DRMMetadataInfo paramDRMMetadataInfo)
  {
    super(MediaPlayerEvent.Type.DRM_METADATA);
    _drmMetadataInfo = paramDRMMetadataInfo;
  }
  
  public static DRMMetadataEvent createDRMMetadataEvent(DRMMetadataInfo paramDRMMetadataInfo)
  {
    DRMMetadataEvent localDRMMetadataEvent = new DRMMetadataEvent(paramDRMMetadataInfo);
    MediaPlayerNotification.Info localInfo = new MediaPlayerNotification.Info(MediaPlayerNotification.InfoCode.DRM_METADATA_AVAILABLE, "DRM metadata is available.");
    MetadataNode localMetadataNode = new MetadataNode();
    localMetadataNode.setValue("PREFETCH_TIMESTAMP", paramDRMMetadataInfo.getPrefetchTimestamp() + "");
    localInfo.setMetadata(localMetadataNode);
    localDRMMetadataEvent.setNotification(localInfo);
    return localDRMMetadataEvent;
  }
  
  public DRMMetadataInfo getDrmMetadataInfo()
  {
    return _drmMetadataInfo;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DRMMetadataEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */