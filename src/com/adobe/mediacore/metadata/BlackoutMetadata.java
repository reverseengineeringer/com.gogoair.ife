package com.adobe.mediacore.metadata;

import com.adobe.mediacore.utils.TimeRange;

public class BlackoutMetadata
  extends MetadataNode
{
  private TimeRange[] _nonSeekableRanges;
  
  public BlackoutMetadata(TimeRange[] paramArrayOfTimeRange)
  {
    _nonSeekableRanges = paramArrayOfTimeRange;
  }
  
  public TimeRange[] getNonSeekableRanges()
  {
    return _nonSeekableRanges;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.metadata.BlackoutMetadata
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */