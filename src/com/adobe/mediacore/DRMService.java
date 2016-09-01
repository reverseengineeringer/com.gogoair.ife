package com.adobe.mediacore;

import com.adobe.ave.drm.DRMManager;

public abstract interface DRMService
{
  public abstract DRMManager getManager();
  
  public abstract boolean hasTriedToInitialize();
  
  public abstract void initialize();
  
  public abstract boolean isInitialized();
  
  public abstract void setDRMEventListener(DRMEventListener paramDRMEventListener);
  
  public static abstract interface DRMEventListener
  {
    public abstract void onError(long paramLong1, long paramLong2, Exception paramException);
    
    public abstract void onInitialized();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DRMService
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */