package com.auditude.ads.view;

import com.auditude.ads.model.IAsset;
import com.auditude.ads.util.event.Event;
import com.auditude.ads.util.event.IEventDispatcher;

public class ViewManagerEvent
  extends Event
{
  private IAsset asset;
  private ViewManagerEventType type = ViewManagerEventType.values()[0];
  
  public ViewManagerEvent(IEventDispatcher paramIEventDispatcher, ViewManagerEventType paramViewManagerEventType, IAsset paramIAsset)
  {
    super(paramIEventDispatcher);
    type = paramViewManagerEventType;
    asset = paramIAsset;
  }
  
  public final IAsset getAsset()
  {
    return asset;
  }
  
  public final ViewManagerEventType getType()
  {
    return type;
  }
  
  public static enum ViewManagerEventType
  {
    LINEAR_AD_ABOUT_TO_BEGIN,  LINEAR_AD_BEGIN,  LINEAR_AD_END,  NON_LINEAR_AD_ABOUT_TO_BEGIN,  NON_LINEAR_AD_BEGIN,  NON_LINEAR_AD_END;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.view.ViewManagerEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */