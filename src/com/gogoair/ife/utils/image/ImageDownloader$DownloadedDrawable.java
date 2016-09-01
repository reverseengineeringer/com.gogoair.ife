package com.gogoair.ife.utils.image;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import java.lang.ref.WeakReference;

class ImageDownloader$DownloadedDrawable
  extends BitmapDrawable
{
  private final WeakReference bitmapDownloaderTaskReference;
  
  public ImageDownloader$DownloadedDrawable(ImageDownloader.BitmapDownloaderTask paramBitmapDownloaderTask, Resources paramResources, Bitmap paramBitmap)
  {
    super(paramResources, paramBitmap);
    bitmapDownloaderTaskReference = new WeakReference(paramBitmapDownloaderTask);
  }
  
  public ImageDownloader.BitmapDownloaderTask getBitmapDownloaderTask()
  {
    return (ImageDownloader.BitmapDownloaderTask)bitmapDownloaderTaskReference.get();
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.utils.image.ImageDownloader.DownloadedDrawable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */