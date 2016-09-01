package com.gogoair.ife.views;

import android.os.Handler;
import com.adobe.ave.drm.DRMManager;
import com.adobe.mediacore.DRMMetadataInfo;
import com.gogoair.ife.drm.DRMHelper;
import com.gogoair.ife.drm.DRMHelper.DRMAuthenticationListener;
import com.gogoair.ife.utils.GVLogger;

class PlayerActivity$6$1
  implements DRMHelper.DRMAuthenticationListener
{
  PlayerActivity$6$1(PlayerActivity.6 param6, DRMMetadataInfo paramDRMMetadataInfo, DRMManager paramDRMManager) {}
  
  public void onAuthenticationComplete(byte[] paramArrayOfByte)
  {
    GVLogger.getDefaultLogger().i("Player", "Auth successful for DRM metadata at [" + val$drmMetadataInfo.getPrefetchTimestamp() + "].");
    DRMHelper.acquireLicense(val$drmManager, val$drmMetadataInfo.getDRMMetadata(), PlayerActivity.access$2600(this$1.this$0));
  }
  
  public void onAuthenticationError(long paramLong1, long paramLong2, Exception paramException)
  {
    GVLogger.getDefaultLogger().e("Player", "DRM authentication failed. " + paramLong1 + " 0x" + Long.toHexString(paramLong2));
    new Handler().post(new PlayerActivity.6.1.1(this, paramLong1, paramException));
  }
  
  public void onAuthenticationStart()
  {
    GVLogger.getDefaultLogger().i("Player", "DRM authentication started for DRM metadata at [" + val$drmMetadataInfo.getPrefetchTimestamp() + "].");
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.PlayerActivity.6.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */