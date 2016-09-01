package com.gogoair.ife.drm;

import com.adobe.ave.drm.DRMAcquireLicenseSettings;
import com.adobe.ave.drm.DRMAuthenticationMethod;
import com.adobe.ave.drm.DRMLicense;
import com.adobe.ave.drm.DRMManager;
import com.adobe.ave.drm.DRMMetadata;
import com.adobe.ave.drm.DRMPolicy;
import com.adobe.mediacore.utils.StringUtils;
import com.gogoair.ife.utils.GVLogger;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

public class DRMHelper
{
  private static final String LOG_TAG = "[DRMPLAYER]::DRMHelper";
  private static Boolean useCloudDRM = Boolean.valueOf(false);
  
  public static void acquireLicense(DRMManager paramDRMManager, DRMMetadata paramDRMMetadata, DRMLicenseAcquisitionListener paramDRMLicenseAcquisitionListener)
  {
    if (paramDRMMetadata == null) {
      return;
    }
    GVLogger.getDefaultLogger().i("[DRMPLAYER]::DRMHelper", "Acquiring license.");
    if (paramDRMLicenseAcquisitionListener != null) {
      paramDRMLicenseAcquisitionListener.onStart();
    }
    paramDRMManager.acquireLicense(paramDRMMetadata, DRMAcquireLicenseSettings.FORCE_REFRESH, new DRMHelper.3(paramDRMLicenseAcquisitionListener), new DRMHelper.4(paramDRMLicenseAcquisitionListener));
  }
  
  private static byte[] getBytesFromInputStream(InputStream paramInputStream)
    throws IOException
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    byte[] arrayOfByte = new byte['Ѐ'];
    int i;
    do
    {
      i = paramInputStream.read(arrayOfByte);
      if (i > 0) {
        localByteArrayOutputStream.write(arrayOfByte, 0, i);
      }
    } while (i != -1);
    localByteArrayOutputStream.flush();
    return localByteArrayOutputStream.toByteArray();
  }
  
  private static byte[] getBytesFromURL(String paramString)
    throws IOException
  {
    paramString = new URL(paramString).openStream();
    byte[] arrayOfByte = getBytesFromInputStream(paramString);
    paramString.close();
    return arrayOfByte;
  }
  
  public static Boolean getUseCloudDRM()
  {
    return useCloudDRM;
  }
  
  private static boolean isAuthNeeded(DRMMetadata paramDRMMetadata)
  {
    if (paramDRMMetadata == null) {}
    while (paramDRMMetadata.getPolicies()[0].getAuthenticationMethod() != DRMAuthenticationMethod.USERNAME_AND_PASSWORD) {
      return false;
    }
    return true;
  }
  
  public static void loadDRMMetadata(DRMManager paramDRMManager, String paramString, DRMLoadMetadataListener paramDRMLoadMetadataListener)
  {
    if (StringUtils.isEmpty(paramString))
    {
      paramDRMLoadMetadataListener.onLoadMetadataUrlError();
      return;
    }
    if (paramDRMLoadMetadataListener == null)
    {
      GVLogger.getDefaultLogger().e("[DRMPLAYER]::DRMHelper", "DRMLoadMetadataListener is null.");
      return;
    }
    new DRMHelper.1(paramDRMLoadMetadataListener, paramString, paramDRMManager).start();
  }
  
  public static void performDrmAuthentication(DRMManager paramDRMManager, DRMMetadata paramDRMMetadata, String paramString1, String paramString2, String paramString3, DRMAuthenticationListener paramDRMAuthenticationListener)
  {
    if (paramDRMMetadata == null)
    {
      GVLogger.getDefaultLogger().w("[DRMPLAYER]::DRMHelper", "DRM Metadata is null.");
      return;
    }
    if (paramDRMAuthenticationListener == null)
    {
      GVLogger.getDefaultLogger().w("[DRMPLAYER]::DRMHelper", "DRMAuthenticationListener is null.");
      return;
    }
    if (paramDRMManager == null)
    {
      GVLogger.getDefaultLogger().w("[DRMPLAYER]::DRMHelper", "DRMManager is null.");
      return;
    }
    new DRMHelper.2(paramDRMMetadata, paramString1, paramString2, paramDRMAuthenticationListener, paramDRMManager, paramString3).start();
  }
  
  public static void setUseCloudDRM(Boolean paramBoolean)
  {
    useCloudDRM = Boolean.valueOf(false);
  }
  
  public static abstract interface DRMAuthenticationListener
  {
    public abstract void onAuthenticationComplete(byte[] paramArrayOfByte);
    
    public abstract void onAuthenticationError(long paramLong1, long paramLong2, Exception paramException);
    
    public abstract void onAuthenticationStart();
  }
  
  public static abstract interface DRMLicenseAcquisitionListener
  {
    public abstract void onAcquired(DRMLicense paramDRMLicense);
    
    public abstract void onError(String paramString, long paramLong);
    
    public abstract void onStart();
  }
  
  public static abstract interface DRMLoadMetadataListener
  {
    public abstract void onLoadMetadataUrlComplete(boolean paramBoolean, DRMMetadata paramDRMMetadata);
    
    public abstract void onLoadMetadataUrlError();
    
    public abstract void onLoadMetadataUrlStart();
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.drm.DRMHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */