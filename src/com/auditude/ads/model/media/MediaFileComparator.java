package com.auditude.ads.model.media;

import java.util.Comparator;

class MediaFileComparator
  implements Comparator
{
  public int compare(MediaFile paramMediaFile1, MediaFile paramMediaFile2)
  {
    if (bitrate > bitrate) {
      return 1;
    }
    if (bitrate < bitrate) {
      return -1;
    }
    return 0;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.model.media.MediaFileComparator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */