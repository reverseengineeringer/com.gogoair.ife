package com.gogoair.ife.drm;

import com.adobe.ave.drm.DRMManager;
import com.adobe.ave.drm.DRMMetadata;
import com.gogoair.ife.utils.GVLogger;
import java.io.IOException;
import java.net.MalformedURLException;

final class DRMHelper$1
  extends Thread
{
  DRMHelper$1(DRMHelper.DRMLoadMetadataListener paramDRMLoadMetadataListener, String paramString, DRMManager paramDRMManager) {}
  
  public void run()
  {
    val$loadMetadataListener.onLoadMetadataUrlStart();
    try
    {
      byte[] arrayOfByte = DRMHelper.access$000(val$drmMetadataUrl);
      if (arrayOfByte == null)
      {
        val$loadMetadataListener.onLoadMetadataUrlError();
        return;
      }
    }
    catch (MalformedURLException localMalformedURLException)
    {
      for (;;)
      {
        GVLogger.getDefaultLogger().w("[DRMPLAYER]::DRMHelper", "Can't load meta data because " + val$drmMetadataUrl + " is not a well formed URL");
        Object localObject1 = null;
      }
    }
    catch (IOException localIOException)
    {
      boolean bool;
      do
      {
        for (;;)
        {
          GVLogger.getDefaultLogger().w("[DRMPLAYER]::DRMHelper", "Can't load metadata from " + val$drmMetadataUrl + " because of an IOError: " + localIOException.toString());
          localObject2 = null;
        }
        Object localObject2 = val$drmManager.createMetadataFromBytes((byte[])localObject2, new DRMHelper.1.1(this));
        bool = DRMHelper.access$100((DRMMetadata)localObject2);
        val$loadMetadataListener.onLoadMetadataUrlComplete(bool, (DRMMetadata)localObject2);
      } while (bool);
    }
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.drm.DRMHelper.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */