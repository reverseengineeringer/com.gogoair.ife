package com.adobe.mediacore;

import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.metadata.DefaultMetadataKeys;
import com.adobe.mediacore.metadata.Metadata;
import com.adobe.mediacore.metadata.MetadataNode;

class DefaultMediaPlayer$5
  implements ItemCreatedListener
{
  DefaultMediaPlayer$5(DefaultMediaPlayer paramDefaultMediaPlayer) {}
  
  public void onCreated()
  {
    if (DefaultMediaPlayer.access$1800(this$0) == MediaPlayer.PlayerState.ERROR) {
      DefaultMediaPlayer.access$1700(this$0).w(DefaultMediaPlayer.access$1500() + "#onPlayerItemAvailable", "Ignore event as media player is in ERROR state.");
    }
    do
    {
      return;
      DefaultMediaPlayer.access$1700(this$0).i(DefaultMediaPlayer.access$1500() + "#onPlayerItemAvailable", "Media player item available.");
      DefaultMediaPlayer.access$402(this$0, DefaultMediaPlayer.access$200(this$0).getCurrentItem());
      if ((DefaultMediaPlayer.access$400(this$0).isLive()) && (DefaultMediaPlayer.access$400(this$0).getResource().getMetadata() != null) && (DefaultMediaPlayer.access$400(this$0).getResource().getMetadata().containsKey(DefaultMetadataKeys.CUSTOM_AD_MARKERS_METADATA_KEY.getValue())))
      {
        DefaultMediaPlayer.access$1700(this$0).e(DefaultMediaPlayer.access$1500() + "#onPlayerItemAvailable", "Cannot place custom ad-markers on LIVE content.");
        MediaPlayerNotification.Error localError = MediaPlayerNotification.createErrorNotification(MediaPlayerNotification.ErrorCode.RESOURCE_LOAD_ERROR, "Resource loading failed due to invalid media-resource metadata.");
        MetadataNode localMetadataNode = new MetadataNode();
        localMetadataNode.setValue("DESCRIPTION", "Cannot place custom ad-markers on LIVE content.");
        localError.setMetadata(localMetadataNode);
        DefaultMediaPlayer.access$100(this$0).dispatch(ErrorEvent.createVideoErrorEvent(localError));
        return;
      }
      this$0.setStatus(MediaPlayer.PlayerState.INITIALIZED, null);
    } while (!DefaultMediaPlayer.access$1900(this$0));
    this$0.prepareToPlay(DefaultMediaPlayer.access$2000(this$0));
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DefaultMediaPlayer.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */