package com.adobe.mediacore;

abstract interface DRMMetadataListener
  extends MediaPlayer.EventListener
{
  public abstract void onDRMMetadata(DRMMetadataInfo paramDRMMetadataInfo);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DRMMetadataListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */