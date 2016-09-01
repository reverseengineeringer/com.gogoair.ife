package com.adobe.mediacore;

class CustomAdView$3
  implements CustomAdJSInterface.JSEventListener
{
  CustomAdView$3(CustomAdView paramCustomAdView) {}
  
  public void onAdClickThru(String paramString, boolean paramBoolean)
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdClickThru(paramString, paramBoolean));
  }
  
  public void onAdDurationChange()
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdDurationChange());
  }
  
  public void onAdError(String paramString)
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdError(paramString));
  }
  
  public void onAdExpandedChange()
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdExpandedChange());
  }
  
  public void onAdImpression()
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdImpression());
  }
  
  public void onAdInteraction()
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdInteraction());
  }
  
  public void onAdLinearChange()
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdLinearChange());
  }
  
  public void onAdPaused()
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdPaused());
  }
  
  public void onAdPlaying()
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdPlaying());
  }
  
  public void onAdRemainingTimeChange(float paramFloat1, float paramFloat2)
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdProgress(paramFloat1, paramFloat2));
  }
  
  public void onAdSizeChange()
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdSizeChange());
  }
  
  public void onAdSkippableStateChange()
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdSkippableStateChange());
  }
  
  public void onAdSkipped()
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdSkipped());
  }
  
  public void onAdStarted()
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdStarted());
  }
  
  public void onAdStopped()
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdStopped());
  }
  
  public void onAdUserAcceptInvitation()
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdUserAcceptInvitation());
  }
  
  public void onAdUserClose()
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdUserClose());
  }
  
  public void onAdUserMinimize()
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdUserMinimize());
  }
  
  public void onAdVideoComplete()
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdVideoComplete());
  }
  
  public void onAdVideoFirstQuartile()
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdVideoFirstQuartile());
  }
  
  public void onAdVideoMidpoint()
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdVideoMidpoint());
  }
  
  public void onAdVideoStart()
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdVideoStart());
  }
  
  public void onAdVideoThirdQuartile()
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdVideoThirdQuartile());
  }
  
  public void onAdVolumeChange()
  {
    CustomAdView.access$000(this$0).dispatch(CustomAdEvent.createAdVolumeChange());
  }
  
  public void onDocumentReady()
  {
    String str = "javascript:PrimetimeJS.setOptions(" + this$0.getWidth() + ", " + this$0.getHeight() + ", " + CustomAdView.access$300(this$0) + ", '" + CustomAdView.access$400(this$0) + "', '" + CustomAdView.access$500(this$0) + "', " + CustomAdView.access$600(this$0) + ")";
    this$0.loadUrl(str);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.CustomAdView.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */