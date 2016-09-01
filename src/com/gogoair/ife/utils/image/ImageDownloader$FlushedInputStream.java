package com.gogoair.ife.utils.image;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

class ImageDownloader$FlushedInputStream
  extends FilterInputStream
{
  public ImageDownloader$FlushedInputStream(InputStream paramInputStream)
  {
    super(paramInputStream);
  }
  
  public long skip(long paramLong)
    throws IOException
  {
    long l2;
    for (long l1 = 0L;; l1 = l2 + l1)
    {
      if (l1 < paramLong)
      {
        long l3 = in.skip(paramLong - l1);
        l2 = l3;
        if (l3 != 0L) {
          continue;
        }
        if (read() >= 0) {}
      }
      else
      {
        return l1;
      }
      l2 = 1L;
    }
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.utils.image.ImageDownloader.FlushedInputStream
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */