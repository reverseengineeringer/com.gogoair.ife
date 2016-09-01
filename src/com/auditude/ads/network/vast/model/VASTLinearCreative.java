package com.auditude.ads.network.vast.model;

import java.util.ArrayList;
import java.util.Iterator;

public class VASTLinearCreative
  extends VASTAdCreativeBase
{
  public VASTClick click;
  public int duration = 0;
  private ArrayList mediaFiles;
  
  public final void addMediaFile(VASTMediaFile paramVASTMediaFile)
  {
    if (paramVASTMediaFile == null) {
      return;
    }
    if (mediaFiles == null) {
      mediaFiles = new ArrayList();
    }
    mediaFiles.add(paramVASTMediaFile);
  }
  
  public final VASTMediaFile getBestMediaFile()
  {
    String[] arrayOfString = new String[5];
    arrayOfString[0] = "application/x-mpegurl";
    arrayOfString[1] = "video/mp4";
    arrayOfString[2] = "video/m4v";
    arrayOfString[3] = "video/x-flv";
    arrayOfString[4] = "video/webm";
    int[] arrayOfInt = new int[5];
    int[] tmp43_41 = arrayOfInt;
    tmp43_41[0] = 50;
    int[] tmp48_43 = tmp43_41;
    tmp48_43[1] = 40;
    int[] tmp53_48 = tmp48_43;
    tmp53_48[2] = 30;
    int[] tmp58_53 = tmp53_48;
    tmp58_53[3] = 20;
    int[] tmp63_58 = tmp58_53;
    tmp63_58[4] = 10;
    tmp63_58;
    Object localObject1 = null;
    VASTMediaFile localVASTMediaFile = null;
    int j;
    int m;
    if (mediaFiles != null)
    {
      j = 0;
      m = 0;
    }
    int k;
    Object localObject2;
    for (localObject1 = localVASTMediaFile;; localObject1 = localObject2)
    {
      if (j >= mediaFiles.size()) {
        return (VASTMediaFile)localObject1;
      }
      localVASTMediaFile = (VASTMediaFile)mediaFiles.get(j);
      if (type.toLowerCase().equalsIgnoreCase(arrayOfString[0]))
      {
        i = arrayOfInt[0];
        return localVASTMediaFile;
      }
      k = 1;
      localObject2 = localObject1;
      if (k < arrayOfString.length) {
        break;
      }
      j += 1;
    }
    int i = m;
    localObject1 = localObject2;
    if (type.toLowerCase().equalsIgnoreCase(arrayOfString[k]))
    {
      i = m;
      localObject1 = localObject2;
      if (m < arrayOfInt[(k - 1)])
      {
        if (localObject2 == null) {
          break label294;
        }
        if ((!type.toLowerCase().equalsIgnoreCase(type)) || (bitrate <= bitrate))
        {
          i = m;
          localObject1 = localObject2;
          if (type.equalsIgnoreCase(type)) {}
        }
        else
        {
          i = arrayOfInt[k];
        }
      }
    }
    for (localObject1 = localVASTMediaFile;; localObject1 = localVASTMediaFile)
    {
      k += 1;
      m = i;
      localObject2 = localObject1;
      break;
      label294:
      i = arrayOfInt[k];
    }
  }
  
  public final ArrayList getMediaFiles()
  {
    return mediaFiles;
  }
  
  public final Boolean hasAssetsWithMimeType(ArrayList paramArrayList)
  {
    if ((paramArrayList != null) && (paramArrayList.size() > 0)) {}
    VASTMediaFile localVASTMediaFile;
    String str;
    do
    {
      Iterator localIterator1 = mediaFiles.iterator();
      Iterator localIterator2;
      while (!localIterator2.hasNext())
      {
        if (!localIterator1.hasNext()) {
          return Boolean.valueOf(false);
        }
        localVASTMediaFile = (VASTMediaFile)localIterator1.next();
        localIterator2 = paramArrayList.iterator();
      }
      str = (String)localIterator2.next();
    } while (!type.toLowerCase().equalsIgnoreCase(str));
    return Boolean.valueOf(true);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.network.vast.model.VASTLinearCreative
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */