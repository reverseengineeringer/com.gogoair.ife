package com.gogoair.ife.utils.image;

import android.content.Context;
import android.os.Build.VERSION;
import android.os.Environment;
import java.io.File;

class Utils
{
  public static final int IO_BUFFER_SIZE = 8192;
  
  public static File getExternalCacheDir(Context paramContext)
  {
    if (hasExternalCacheDir()) {
      return paramContext.getExternalCacheDir();
    }
    paramContext = "/Android/data/" + paramContext.getPackageName() + "/cache/";
    return new File(Environment.getDownloadCacheDirectory().getPath() + paramContext);
  }
  
  private static boolean hasExternalCacheDir()
  {
    return Build.VERSION.SDK_INT >= 8;
  }
  
  public static boolean isExternalStorageRemovable()
  {
    return (Build.VERSION.SDK_INT < 9) || (Environment.isExternalStorageRemovable());
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.utils.image.Utils
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */