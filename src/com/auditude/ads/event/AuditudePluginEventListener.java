package com.auditude.ads.event;

public abstract interface AuditudePluginEventListener
{
  public abstract void onAdClickEvent(AdClickThroughEvent paramAdClickThroughEvent);
  
  public abstract void onAdPluginErrorEvent(AdPluginErrorEvent paramAdPluginErrorEvent);
  
  public abstract void onAdPluginEvent(AdPluginEvent paramAdPluginEvent);
  
  public abstract void onAdProgressEvent(AdProgressEvent paramAdProgressEvent);
  
  public abstract void onLinearAdEvent(LinearAdEvent paramLinearAdEvent);
  
  public abstract void onNonLinearAdEvent(NonLinearAdEvent paramNonLinearAdEvent);
  
  public abstract void onOnPageAdEvent(OnPageEvent paramOnPageEvent);
}

/* Location:
 * Qualified Name:     com.auditude.ads.event.AuditudePluginEventListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */