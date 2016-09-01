package com.adobe.mediacore.timeline;

import com.adobe.mediacore.MediaResource;

public abstract class TimelineItem
{
  protected final long _duration;
  private final MediaResource _resource;
  
  protected TimelineItem(MediaResource paramMediaResource, long paramLong)
  {
    if (paramMediaResource == null) {
      throw new IllegalArgumentException("Resource parameter of TimelineItem constructor must be not nul");
    }
    if (paramLong <= 0L) {
      throw new IllegalArgumentException("Duration parameter of TimelineItem constructor must be greater than 0.");
    }
    _resource = paramMediaResource;
    _duration = paramLong;
  }
  
  public boolean equals(TimelineItem paramTimelineItem)
  {
    return (paramTimelineItem != null) && (_resource.equals(paramTimelineItem.getMediaResource()));
  }
  
  public final long getDuration()
  {
    return _duration;
  }
  
  public final MediaResource getMediaResource()
  {
    return _resource;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.TimelineItem
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */