package com.auditude.ads.session;

import com.auditude.ads.core.APIBridge;
import com.auditude.ads.core.AdSettings;
import com.auditude.ads.view.ViewManager;
import com.auditude.ads.view.model.AdViewSource;

public class ChapterManager
  extends GroupManager
{
  private int position = 0;
  
  public ChapterManager(APIBridge paramAPIBridge, ViewManager paramViewManager, AdSettings paramAdSettings)
  {
    super(paramAPIBridge, paramViewManager, paramAdSettings);
  }
  
  public final int getPosition()
  {
    return position;
  }
  
  protected void groupEnd() {}
  
  public final boolean isHandlingChapter()
  {
    return isHandlingGroup();
  }
  
  public final void pause() {}
  
  public final void resume() {}
  
  public final void setPosition(int paramInt)
  {
    position = paramInt;
  }
  
  protected void showAdSource(AdViewSource paramAdViewSource) {}
}

/* Location:
 * Qualified Name:     com.auditude.ads.session.ChapterManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */