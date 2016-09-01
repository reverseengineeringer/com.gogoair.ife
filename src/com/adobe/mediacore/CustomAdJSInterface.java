package com.adobe.mediacore;

import android.webkit.JavascriptInterface;
import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import java.util.ArrayList;
import java.util.Iterator;

final class CustomAdJSInterface
{
  private static final String LOG_TAG = "[PSDK]::" + CustomAdJSInterface.class.getSimpleName();
  private final Logger _logger = Log.getLogger(LOG_TAG);
  private final ArrayList eventListeners = new ArrayList();
  
  public void addEventListener(JSEventListener paramJSEventListener)
  {
    eventListeners.add(paramJSEventListener);
  }
  
  @JavascriptInterface
  public void onAdClickThru(String paramString, boolean paramBoolean)
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdClickThru(paramString, paramBoolean);
    }
  }
  
  @JavascriptInterface
  public void onAdDurationChange()
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdDurationChange();
    }
  }
  
  @JavascriptInterface
  public void onAdError(String paramString)
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdError(paramString);
    }
  }
  
  @JavascriptInterface
  public void onAdExpandedChange()
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdExpandedChange();
    }
  }
  
  @JavascriptInterface
  public void onAdImpression()
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdImpression();
    }
  }
  
  @JavascriptInterface
  public void onAdInteraction()
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdInteraction();
    }
  }
  
  @JavascriptInterface
  public void onAdLinearChange()
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdLinearChange();
    }
  }
  
  @JavascriptInterface
  public void onAdPaused()
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdPaused();
    }
  }
  
  @JavascriptInterface
  public void onAdPlaying()
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdPlaying();
    }
  }
  
  @JavascriptInterface
  public void onAdRemainingTimeChange(float paramFloat1, float paramFloat2)
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdRemainingTimeChange(paramFloat1, paramFloat2);
    }
  }
  
  @JavascriptInterface
  public void onAdSizeChange()
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdSizeChange();
    }
  }
  
  @JavascriptInterface
  public void onAdSkippableStateChange()
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdSkippableStateChange();
    }
  }
  
  @JavascriptInterface
  public void onAdSkipped()
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdSkipped();
    }
  }
  
  @JavascriptInterface
  public void onAdStarted()
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdStarted();
    }
  }
  
  @JavascriptInterface
  public void onAdStopped()
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdStopped();
    }
  }
  
  @JavascriptInterface
  public void onAdUserAcceptInvitation()
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdUserAcceptInvitation();
    }
  }
  
  @JavascriptInterface
  public void onAdUserClose()
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdUserClose();
    }
  }
  
  @JavascriptInterface
  public void onAdUserMinimize()
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdUserMinimize();
    }
  }
  
  @JavascriptInterface
  public void onAdVideoComplete()
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdVideoComplete();
    }
  }
  
  @JavascriptInterface
  public void onAdVideoFirstQuartile()
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdVideoFirstQuartile();
    }
  }
  
  @JavascriptInterface
  public void onAdVideoMidpoint()
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdVideoMidpoint();
    }
  }
  
  @JavascriptInterface
  public void onAdVideoStart()
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdVideoStart();
    }
  }
  
  @JavascriptInterface
  public void onAdVideoThirdQuartile()
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdVideoThirdQuartile();
    }
  }
  
  @JavascriptInterface
  public void onAdVolumeChange()
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onAdVolumeChange();
    }
  }
  
  @JavascriptInterface
  public void onDocumentReady()
  {
    Iterator localIterator = eventListeners.iterator();
    while (localIterator.hasNext()) {
      ((JSEventListener)localIterator.next()).onDocumentReady();
    }
  }
  
  public void removeEventListener(JSEventListener paramJSEventListener)
  {
    eventListeners.remove(paramJSEventListener);
  }
  
  public static abstract interface JSEventListener
  {
    public abstract void onAdClickThru(String paramString, boolean paramBoolean);
    
    public abstract void onAdDurationChange();
    
    public abstract void onAdError(String paramString);
    
    public abstract void onAdExpandedChange();
    
    public abstract void onAdImpression();
    
    public abstract void onAdInteraction();
    
    public abstract void onAdLinearChange();
    
    public abstract void onAdPaused();
    
    public abstract void onAdPlaying();
    
    public abstract void onAdRemainingTimeChange(float paramFloat1, float paramFloat2);
    
    public abstract void onAdSizeChange();
    
    public abstract void onAdSkippableStateChange();
    
    public abstract void onAdSkipped();
    
    public abstract void onAdStarted();
    
    public abstract void onAdStopped();
    
    public abstract void onAdUserAcceptInvitation();
    
    public abstract void onAdUserClose();
    
    public abstract void onAdUserMinimize();
    
    public abstract void onAdVideoComplete();
    
    public abstract void onAdVideoFirstQuartile();
    
    public abstract void onAdVideoMidpoint();
    
    public abstract void onAdVideoStart();
    
    public abstract void onAdVideoThirdQuartile();
    
    public abstract void onAdVolumeChange();
    
    public abstract void onDocumentReady();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.CustomAdJSInterface
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */