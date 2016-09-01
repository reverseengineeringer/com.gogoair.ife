package com.auditude.ads.model.media;

import com.auditude.ads.util.StringUtil;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

public class MediaStreamSet
{
  private static ArrayList MIME_TYPES_SUPPORTED = new ArrayList(Arrays.asList(new String[] { "video/mp4" }));
  
  public static MediaFile Search(ArrayList paramArrayList, int paramInt)
  {
    Object localObject;
    if ((paramArrayList == null) || (paramArrayList.isEmpty()))
    {
      localObject = null;
      return (MediaFile)localObject;
    }
    Collections.sort(paramArrayList, new MediaFileComparator());
    int i = paramArrayList.size() - 1;
    label33:
    if (i < 0) {
      paramInt = 0;
    }
    for (;;)
    {
      if (paramInt >= paramArrayList.size())
      {
        return null;
        localMediaFile = (MediaFile)paramArrayList.get(i);
        if (bitrate <= paramInt)
        {
          localObject = localMediaFile;
          if (StringUtil.isNullOrEmpty(mimeType)) {
            break;
          }
        }
        localObject = localMediaFile;
        if (MIME_TYPES_SUPPORTED.indexOf(mimeType) >= 0) {
          break;
        }
        i -= 1;
        break label33;
      }
      MediaFile localMediaFile = (MediaFile)paramArrayList.get(paramInt);
      localObject = localMediaFile;
      if (StringUtil.isNullOrEmpty(mimeType)) {
        break;
      }
      localObject = localMediaFile;
      if (MIME_TYPES_SUPPORTED.indexOf(mimeType) >= 0) {
        break;
      }
      paramInt += 1;
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.model.media.MediaStreamSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */