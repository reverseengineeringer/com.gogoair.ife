package com.gogoair.ife.views;

import com.adobe.ave.drm.DRMManager;
import com.adobe.mediacore.DRMMetadataInfo;
import com.adobe.mediacore.MediaPlayer;
import com.adobe.mediacore.MediaPlayer.DRMEventListener;
import com.gogoair.ife.drm.DRMHelper;
import com.gogoair.ife.gogo_vision.model.GVLibraryEntry;
import com.gogoair.ife.utils.GVLogger;

class PlayerActivity$6
  implements MediaPlayer.DRMEventListener
{
  PlayerActivity$6(PlayerActivity paramPlayerActivity) {}
  
  public void onDRMMetadata(DRMMetadataInfo paramDRMMetadataInfo)
  {
    GVLogger.getDefaultLogger().i("Player", "DRM metadata available: " + paramDRMMetadataInfo + ".");
    DRMManager localDRMManager = PlayerActivity.access$1400(this$0).getDRMManager();
    if (localDRMManager == null)
    {
      GVLogger.getDefaultLogger().e("Player#onDRMMetadata", "DRMManager is null.");
      return;
    }
    if (paramDRMMetadataInfo == null)
    {
      GVLogger.getDefaultLogger().i("Player#onDRMMetadata", "DrmMetadataInfo is null.");
      return;
    }
    DRMHelper.performDrmAuthentication(localDRMManager, paramDRMMetadataInfo.getDRMMetadata(), "", "", PlayerActivity.access$300(this$0).getToken(), new PlayerActivity.6.1(this, paramDRMMetadataInfo, localDRMManager));
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.PlayerActivity.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */