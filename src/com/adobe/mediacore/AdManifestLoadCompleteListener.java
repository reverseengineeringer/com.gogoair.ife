package com.adobe.mediacore;

abstract interface AdManifestLoadCompleteListener
  extends MediaPlayer.EventListener
{
  public abstract void onCompleted(int paramInt1, int paramInt2, long paramLong);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.AdManifestLoadCompleteListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */