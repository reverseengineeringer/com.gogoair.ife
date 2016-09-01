package com.gogoair.ife.utils.image;

import android.graphics.Bitmap;
import android.os.AsyncTask;
import android.widget.ImageView;
import java.lang.ref.WeakReference;

class ImageDownloader$BitmapDownloaderTask
  extends AsyncTask
{
  private final WeakReference imageViewReference;
  private String url;
  
  public ImageDownloader$BitmapDownloaderTask(ImageDownloader paramImageDownloader, ImageView paramImageView)
  {
    imageViewReference = new WeakReference(paramImageView);
  }
  
  protected Bitmap doInBackground(String... paramVarArgs)
  {
    url = paramVarArgs[0];
    return ImageDownloader.access$100(this$0, url);
  }
  
  protected void onPostExecute(Bitmap paramBitmap)
  {
    if (isCancelled()) {
      paramBitmap = null;
    }
    ImageDownloader.access$200(this$0, url, paramBitmap);
    ImageView localImageView = (ImageView)imageViewReference.get();
    if ((this == ImageDownloader.access$300(localImageView)) || (ImageDownloader.access$400(this$0) != ImageDownloader.Mode.CORRECT)) {
      localImageView.setImageBitmap(paramBitmap);
    }
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.utils.image.ImageDownloader.BitmapDownloaderTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */