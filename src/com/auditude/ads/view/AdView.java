package com.auditude.ads.view;

import android.content.Context;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import com.auditude.ads.model.IAsset;
import com.auditude.ads.session.IPlaybackSession;
import com.auditude.ads.util.StringUtil;
import com.auditude.ads.util.event.IEventListener;
import com.auditude.ads.view.model.IAdViewSource;
import java.beans.PropertyChangeEvent;
import java.util.HashMap;

public abstract class AdView
  extends FrameLayout
  implements IEventListener, IAdView
{
  private IViewController controller = null;
  private IPlaybackSession session;
  private IAdViewSource source;
  
  public AdView(Context paramContext)
  {
    super(paramContext);
    setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
  }
  
  public void dispose()
  {
    source = null;
    if (controller != null)
    {
      controller.removePropertyChangeListener(this);
      controller = null;
    }
  }
  
  public final IAsset getAsset()
  {
    if (source != null) {
      return source.getAsset();
    }
    return null;
  }
  
  public final IViewController getController()
  {
    return controller;
  }
  
  public int getDuration()
  {
    return 0;
  }
  
  public float getLeftVolume()
  {
    if (controller != null) {
      return controller.getLeftVolume();
    }
    return 0.0F;
  }
  
  public IPlaybackSession getPlaybackSession()
  {
    return session;
  }
  
  public int getPosition()
  {
    return 0;
  }
  
  public float getRightVolume()
  {
    if (controller != null) {
      return controller.getRightVolume();
    }
    return 0.0F;
  }
  
  public final IAdViewSource getSource()
  {
    return source;
  }
  
  public void hide(IAdViewSource paramIAdViewSource) {}
  
  public void initialize(IViewController paramIViewController)
  {
    controller = paramIViewController;
    controller.addPropertyChangeListener(this);
  }
  
  public final void notifyAdEvent(AdViewEvent.AdViewEventType paramAdViewEventType)
  {
    notifyAdEvent(paramAdViewEventType, null);
  }
  
  public final void notifyAdEvent(AdViewEvent.AdViewEventType paramAdViewEventType, HashMap paramHashMap)
  {
    if (controller != null) {
      controller.notifyAdViewEvent(paramAdViewEventType, this, paramHashMap);
    }
  }
  
  public void onEvent(String paramString, Object paramObject)
  {
    if ((paramObject instanceof PropertyChangeEvent))
    {
      paramString = (PropertyChangeEvent)paramObject;
      propertyChanged(paramString.getPropertyName(), paramString.getOldValue(), paramString.getNewValue());
    }
  }
  
  protected void propertyChanged(String paramString, Object paramObject1, Object paramObject2)
  {
    try
    {
      if (StringUtil.isNullOrEmpty(paramString)) {
        return;
      }
      if (("width".equals(paramString)) || ("height".equals(paramString)))
      {
        resize(controller.getWidth(), controller.getHeight());
        return;
      }
      if ("leftVolume".equals(paramString)) {
        setVolume(controller.getLeftVolume(), controller.getRightVolume());
      }
      return;
    }
    catch (RuntimeException paramString) {}
  }
  
  public void reset() {}
  
  protected void resize(int paramInt1, int paramInt2) {}
  
  public void setPlaybackSession(IPlaybackSession paramIPlaybackSession)
  {
    session = paramIPlaybackSession;
  }
  
  protected final void setSource(IAdViewSource paramIAdViewSource)
  {
    source = paramIAdViewSource;
  }
  
  public void setVolume(float paramFloat1, float paramFloat2) {}
  
  public boolean shouldAddToStage()
  {
    return true;
  }
  
  public boolean shouldNotifyAdBeginOnLoad()
  {
    return false;
  }
  
  public void show(IAdViewSource paramIAdViewSource)
  {
    source = paramIAdViewSource;
    resize(controller.getWidth(), controller.getHeight());
  }
  
  public void show(IAdViewSource paramIAdViewSource1, IAdViewSource paramIAdViewSource2)
  {
    show(paramIAdViewSource1);
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.view.AdView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */