package com.adobe.mediacore;

abstract interface ContentMarkerListener
  extends MediaPlayer.EventListener
{
  public abstract void onContentMarker(int paramInt, long paramLong);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.ContentMarkerListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */