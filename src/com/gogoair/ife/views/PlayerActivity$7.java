package com.gogoair.ife.views;

import com.adobe.ave.drm.DRMMetadata;
import com.gogoair.ife.drm.DRMHelper;
import com.gogoair.ife.drm.DRMHelper.DRMLoadMetadataListener;
import com.gogoair.ife.utils.GVLogger;

class PlayerActivity$7
  implements DRMHelper.DRMLoadMetadataListener
{
  PlayerActivity$7(PlayerActivity paramPlayerActivity) {}
  
  public void onLoadMetadataUrlComplete(boolean paramBoolean, DRMMetadata paramDRMMetadata)
  {
    GVLogger.getDefaultLogger().i("Player", "#onLoadMetadataUrlComplete:Loaded metadata URL contents. Auth needed: " + paramBoolean + ".");
    if (!paramBoolean)
    {
      DRMHelper.acquireLicense(PlayerActivity.access$2900(this$0), paramDRMMetadata, new PlayerActivity.7.2(this));
      return;
    }
    DRMHelper.performDrmAuthentication(PlayerActivity.access$2900(this$0), paramDRMMetadata, "", "", "", new PlayerActivity.7.3(this, paramDRMMetadata));
  }
  
  public void onLoadMetadataUrlError()
  {
    GVLogger.getDefaultLogger().i("Player", "#onLoadMetadataUrlError:Unable to load DRM metadata: [http://cs.video.gogoinflight.com/media/static/players/ReferencePlayer/onprem.metadata].");
    setupPlayer();
  }
  
  public void onLoadMetadataUrlStart()
  {
    GVLogger.getDefaultLogger().i("Player", "#onLoadMetadataUrlStart:Loading DRM metadata URL contents.");
  }
  
  public void setupPlayer()
  {
    this$0.runOnUiThread(new PlayerActivity.7.1(this));
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.PlayerActivity.7
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */