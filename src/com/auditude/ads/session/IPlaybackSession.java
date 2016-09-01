package com.auditude.ads.session;

import java.util.HashMap;

public abstract interface IPlaybackSession
{
  public abstract void notify(String paramString, HashMap paramHashMap);
  
  public abstract void notifyClick();
  
  public abstract void notifyComplete();
  
  public abstract void notifyError(RuntimeException paramRuntimeException);
  
  public abstract void notifyPause();
  
  public abstract void notifyProgress(int paramInt1, int paramInt2);
  
  public abstract void notifyResume();
  
  public abstract void notifySkip();
  
  public abstract void notifyStart();
  
  public abstract void notifyStop();
}

/* Location:
 * Qualified Name:     com.auditude.ads.session.IPlaybackSession
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */