package com.gogoair.ife.drm;

import com.adobe.ave.drm.DRMMetadata;

public abstract interface DRMHelper$DRMLoadMetadataListener
{
  public abstract void onLoadMetadataUrlComplete(boolean paramBoolean, DRMMetadata paramDRMMetadata);
  
  public abstract void onLoadMetadataUrlError();
  
  public abstract void onLoadMetadataUrlStart();
}

/* Location:
 * Qualified Name:     com.gogoair.ife.drm.DRMHelper.DRMLoadMetadataListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */