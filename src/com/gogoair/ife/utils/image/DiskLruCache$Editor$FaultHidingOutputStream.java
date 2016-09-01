package com.gogoair.ife.utils.image;

import android.support.annotation.NonNull;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;

class DiskLruCache$Editor$FaultHidingOutputStream
  extends FilterOutputStream
{
  private DiskLruCache$Editor$FaultHidingOutputStream(DiskLruCache.Editor paramEditor, OutputStream paramOutputStream)
  {
    super(paramOutputStream);
  }
  
  public void close()
  {
    try
    {
      out.close();
      return;
    }
    catch (IOException localIOException)
    {
      DiskLruCache.Editor.access$2402(this$1, true);
    }
  }
  
  public void flush()
  {
    try
    {
      out.flush();
      return;
    }
    catch (IOException localIOException)
    {
      DiskLruCache.Editor.access$2402(this$1, true);
    }
  }
  
  public void write(int paramInt)
  {
    try
    {
      out.write(paramInt);
      return;
    }
    catch (IOException localIOException)
    {
      DiskLruCache.Editor.access$2402(this$1, true);
    }
  }
  
  public void write(@NonNull byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    try
    {
      out.write(paramArrayOfByte, paramInt1, paramInt2);
      return;
    }
    catch (IOException paramArrayOfByte)
    {
      DiskLruCache.Editor.access$2402(this$1, true);
    }
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.utils.image.DiskLruCache.Editor.FaultHidingOutputStream
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */