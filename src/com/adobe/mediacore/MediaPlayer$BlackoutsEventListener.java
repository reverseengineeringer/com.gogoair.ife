package com.adobe.mediacore;

import com.adobe.mediacore.metadata.TimedMetadata;

public abstract interface MediaPlayer$BlackoutsEventListener
  extends MediaPlayer.EventListener
{
  public abstract void onBackgroundManifestFailed();
  
  public abstract void onTimedMetadataInBackgroundItem(TimedMetadata paramTimedMetadata);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.MediaPlayer.BlackoutsEventListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */