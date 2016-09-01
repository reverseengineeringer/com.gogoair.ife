package com.adobe.mediacore;

class VideoEngineContentMarkerCache$MarkerInfo
{
  private final int _contentId;
  private final long _duration;
  private boolean _eventDispatched;
  private final long _timestamp;
  
  public VideoEngineContentMarkerCache$MarkerInfo(int paramInt, long paramLong1, long paramLong2)
  {
    _timestamp = paramLong1;
    _contentId = paramInt;
    _duration = paramLong2;
  }
  
  public int getContentId()
  {
    return _contentId;
  }
  
  long getDuration()
  {
    return _duration;
  }
  
  public long getTimestamp()
  {
    return _timestamp;
  }
  
  public boolean isEventDispatched()
  {
    return _eventDispatched;
  }
  
  public void setEventDispatched(boolean paramBoolean)
  {
    _eventDispatched = paramBoolean;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.VideoEngineContentMarkerCache.MarkerInfo
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */