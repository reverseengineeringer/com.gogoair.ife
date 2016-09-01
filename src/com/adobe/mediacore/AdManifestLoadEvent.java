package com.adobe.mediacore;

class AdManifestLoadEvent
  extends MediaPlayerEvent
{
  private static final int INVALID_DURATION = 0;
  private static final int INVALID_HANDLE = -1;
  private final int _contentId;
  private final long _duration;
  private final int _handle;
  
  private AdManifestLoadEvent(MediaPlayerEvent.Type paramType, int paramInt1, int paramInt2, long paramLong)
  {
    super(paramType);
    _contentId = paramInt1;
    _handle = paramInt2;
    _duration = paramLong;
  }
  
  public static AdManifestLoadEvent createAdManifestLoadCompletedEvent(int paramInt1, int paramInt2, long paramLong)
  {
    return new AdManifestLoadEvent(MediaPlayerEvent.Type.AD_MANIFEST_LOAD_COMPLETE, paramInt1, paramInt2, paramLong);
  }
  
  public static AdManifestLoadEvent createAdManifestLoadFailedEvent(int paramInt)
  {
    return new AdManifestLoadEvent(MediaPlayerEvent.Type.AD_MANIFEST_LOAD_FAILED, paramInt, -1, 0L);
  }
  
  public int getContentId()
  {
    return _contentId;
  }
  
  public long getDuration()
  {
    return _duration;
  }
  
  public int getHandle()
  {
    return _handle;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.AdManifestLoadEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */