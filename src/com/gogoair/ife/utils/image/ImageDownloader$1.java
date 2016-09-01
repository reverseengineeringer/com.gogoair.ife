package com.gogoair.ife.utils.image;

import java.lang.ref.SoftReference;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;

class ImageDownloader$1
  extends LinkedHashMap
{
  private static final long serialVersionUID = 1L;
  
  ImageDownloader$1(ImageDownloader paramImageDownloader, int paramInt, float paramFloat, boolean paramBoolean)
  {
    super(paramInt, paramFloat, paramBoolean);
  }
  
  protected boolean removeEldestEntry(Map.Entry paramEntry)
  {
    if (size() > 10)
    {
      ImageDownloader.access$500().put(paramEntry.getKey(), new SoftReference(paramEntry.getValue()));
      return true;
    }
    return false;
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.utils.image.ImageDownloader.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */