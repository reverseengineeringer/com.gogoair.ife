package com.adobe.mediacore;

import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;
import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.ContentTracker;

class ContentLoader$ContentLoadFailedListener
  implements AdManifestLoadFailedListener
{
  private ContentLoader$ContentLoadFailedListener(ContentLoader paramContentLoader) {}
  
  public void onError(int paramInt)
  {
    Ad localAd = ContentLoader.access$300(this$0).getAd(paramInt);
    if ((localAd != null) && (localAd.getContentTracker() != null)) {
      localAd.getContentTracker().onAdError(localAd);
    }
    ContentLoader.access$300(this$0).markContentResolved(paramInt);
    if (ContentLoader.access$500(this$0) != null)
    {
      MediaPlayerNotification.Warning localWarning = MediaPlayerNotification.createWarningNotification(MediaPlayerNotification.WarningCode.AD_MANIFEST_LOAD_FAILED, "fail to load ad manifest");
      MetadataNode localMetadataNode = new MetadataNode();
      localMetadataNode.setValue("AD", localAd.toString());
      localWarning.setMetadata(localMetadataNode);
      ContentLoader.access$500(this$0).dispatch(OperationFailedEvent.createEvent(localWarning));
    }
    if (ContentLoader.access$300(this$0).hasFinishedLoading()) {
      ContentLoader.access$500(this$0).dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.AD_BREAK_MANIFEST_LOAD_COMPLETE));
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.ContentLoader.ContentLoadFailedListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */