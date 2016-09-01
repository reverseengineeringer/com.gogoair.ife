package com.adobe.mediacore;

import android.content.Context;
import com.adobe.ave.drm.DRMManager;

public final class DefaultDRMService
  implements DRMService
{
  public static final String LOG_TAG = "[PSDK]::" + DefaultDRMService.class.getSimpleName();
  private boolean _drmHasTriedToInitialize = false;
  private boolean _drmInitialized = false;
  private DRMManager _drmManager;
  private DRMService.DRMEventListener _listener;
  
  public DefaultDRMService(Context paramContext)
  {
    _drmManager = DRMManager.getSharedManager(paramContext);
  }
  
  public DRMManager getManager()
  {
    return _drmManager;
  }
  
  public boolean hasTriedToInitialize()
  {
    return _drmHasTriedToInitialize;
  }
  
  public void initialize()
  {
    _drmHasTriedToInitialize = true;
    _drmManager.initialize(new DefaultDRMService.1(this), new DefaultDRMService.2(this));
  }
  
  public boolean isInitialized()
  {
    return _drmInitialized;
  }
  
  public void setDRMEventListener(DRMService.DRMEventListener paramDRMEventListener)
  {
    _listener = paramDRMEventListener;
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DefaultDRMService
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */