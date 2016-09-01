package com.gogoair.ife.drm;

import com.adobe.ave.drm.DRMLicense;

public abstract interface DRMHelper$DRMLicenseAcquisitionListener
{
  public abstract void onAcquired(DRMLicense paramDRMLicense);
  
  public abstract void onError(String paramString, long paramLong);
  
  public abstract void onStart();
}

/* Location:
 * Qualified Name:     com.gogoair.ife.drm.DRMHelper.DRMLicenseAcquisitionListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */