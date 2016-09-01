package com.gogoair.ife.utils.image;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

class DiskLruImageCache
{
  private static final int APP_VERSION = 1;
  private static final int VALUE_COUNT = 1;
  private Bitmap.CompressFormat mCompressFormat = Bitmap.CompressFormat.JPEG;
  private int mCompressQuality = 70;
  private DiskLruCache mDiskCache;
  
  public DiskLruImageCache(Context paramContext, String paramString, int paramInt1, Bitmap.CompressFormat paramCompressFormat, int paramInt2)
  {
    try
    {
      mDiskCache = DiskLruCache.open(getDiskCacheDir(paramContext, paramString), 1, 1, paramInt1);
      mCompressFormat = paramCompressFormat;
      mCompressQuality = paramInt2;
      return;
    }
    catch (IOException paramContext)
    {
      paramContext.printStackTrace();
    }
  }
  
  private File getDiskCacheDir(Context paramContext, String paramString)
  {
    paramContext = paramContext.getCacheDir().getPath();
    return new File(paramContext + File.separator + paramString);
  }
  
  private boolean writeBitmapToFile(Bitmap paramBitmap, DiskLruCache.Editor paramEditor)
    throws IOException
  {
    try
    {
      paramEditor = new BufferedOutputStream(paramEditor.newOutputStream(0), 8192);
      boolean bool;
      if (paramEditor == null) {
        break label51;
      }
    }
    finally
    {
      try
      {
        bool = paramBitmap.compress(mCompressFormat, mCompressQuality, paramEditor);
        if (paramEditor != null) {
          paramEditor.close();
        }
        return bool;
      }
      finally {}
      paramBitmap = finally;
      paramEditor = null;
    }
    paramEditor.close();
    label51:
    throw paramBitmap;
  }
  
  public void clearCache()
  {
    try
    {
      mDiskCache.delete();
      return;
    }
    catch (IOException localIOException)
    {
      localIOException.printStackTrace();
    }
  }
  
  public boolean containsKey(String paramString)
  {
    boolean bool2 = false;
    boolean bool1 = false;
    try
    {
      paramString = mDiskCache.get(paramString);
      if (paramString != null) {
        bool1 = true;
      }
      bool2 = bool1;
      if (paramString != null)
      {
        paramString.close();
        bool2 = bool1;
      }
    }
    catch (IOException paramString)
    {
      paramString.printStackTrace();
    }
    finally
    {
      if (0 == 0) {
        break label63;
      }
      throw new NullPointerException();
    }
    return bool2;
  }
  
  /* Error */
  public Bitmap getBitmap(String paramString)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_3
    //   2: aconst_null
    //   3: astore 4
    //   5: aload_0
    //   6: getfield 41	com/gogoair/ife/utils/image/DiskLruImageCache:mDiskCache	Lcom/gogoair/ife/utils/image/DiskLruCache;
    //   9: aload_1
    //   10: invokevirtual 109	com/gogoair/ife/utils/image/DiskLruCache:get	(Ljava/lang/String;)Lcom/gogoair/ife/utils/image/DiskLruCache$Snapshot;
    //   13: astore_1
    //   14: aload_1
    //   15: ifnonnull +19 -> 34
    //   18: aload 4
    //   20: astore_3
    //   21: aload_1
    //   22: ifnull +10 -> 32
    //   25: aload_1
    //   26: invokevirtual 112	com/gogoair/ife/utils/image/DiskLruCache$Snapshot:close	()V
    //   29: aload 4
    //   31: astore_3
    //   32: aload_3
    //   33: areturn
    //   34: aload_1
    //   35: astore_2
    //   36: aload_1
    //   37: iconst_0
    //   38: invokevirtual 121	com/gogoair/ife/utils/image/DiskLruCache$Snapshot:getInputStream	(I)Ljava/io/InputStream;
    //   41: astore 5
    //   43: aload_3
    //   44: astore_2
    //   45: aload 5
    //   47: ifnull +23 -> 70
    //   50: aload_1
    //   51: astore_2
    //   52: new 123	java/io/BufferedInputStream
    //   55: dup
    //   56: aload 5
    //   58: sipush 8192
    //   61: invokespecial 126	java/io/BufferedInputStream:<init>	(Ljava/io/InputStream;I)V
    //   64: invokestatic 132	android/graphics/BitmapFactory:decodeStream	(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    //   67: astore_3
    //   68: aload_3
    //   69: astore_2
    //   70: aload_2
    //   71: astore_3
    //   72: aload_1
    //   73: ifnull -41 -> 32
    //   76: aload_1
    //   77: invokevirtual 112	com/gogoair/ife/utils/image/DiskLruCache$Snapshot:close	()V
    //   80: aload_2
    //   81: areturn
    //   82: astore_3
    //   83: aconst_null
    //   84: astore_1
    //   85: aload_1
    //   86: astore_2
    //   87: aload_3
    //   88: invokevirtual 44	java/io/IOException:printStackTrace	()V
    //   91: aload 4
    //   93: astore_3
    //   94: aload_1
    //   95: ifnull -63 -> 32
    //   98: aload_1
    //   99: invokevirtual 112	com/gogoair/ife/utils/image/DiskLruCache$Snapshot:close	()V
    //   102: aconst_null
    //   103: areturn
    //   104: astore_1
    //   105: aconst_null
    //   106: astore_2
    //   107: aload_2
    //   108: ifnull +7 -> 115
    //   111: aload_2
    //   112: invokevirtual 112	com/gogoair/ife/utils/image/DiskLruCache$Snapshot:close	()V
    //   115: aload_1
    //   116: athrow
    //   117: astore_1
    //   118: goto -11 -> 107
    //   121: astore_3
    //   122: goto -37 -> 85
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	125	0	this	DiskLruImageCache
    //   0	125	1	paramString	String
    //   35	77	2	localObject1	Object
    //   1	71	3	localObject2	Object
    //   82	6	3	localIOException1	IOException
    //   93	1	3	localObject3	Object
    //   121	1	3	localIOException2	IOException
    //   3	89	4	localObject4	Object
    //   41	16	5	localInputStream	java.io.InputStream
    // Exception table:
    //   from	to	target	type
    //   5	14	82	java/io/IOException
    //   5	14	104	finally
    //   36	43	117	finally
    //   52	68	117	finally
    //   87	91	117	finally
    //   36	43	121	java/io/IOException
    //   52	68	121	java/io/IOException
  }
  
  public File getCacheFolder()
  {
    return mDiskCache.getDirectory();
  }
  
  public void put(String paramString, Bitmap paramBitmap)
  {
    String str = null;
    try
    {
      paramString = mDiskCache.edit(paramString);
      if (paramString == null) {
        return;
      }
      str = paramString;
      if (writeBitmapToFile(paramBitmap, paramString))
      {
        str = paramString;
        paramString.commit();
        str = paramString;
        mDiskCache.flush();
        return;
      }
    }
    catch (IOException paramString)
    {
      if (str != null)
      {
        try
        {
          str.abort();
          return;
        }
        catch (IOException paramString)
        {
          return;
        }
        str = paramString;
        paramString.abort();
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.utils.image.DiskLruImageCache
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */