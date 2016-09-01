package com.auditude.ads.core;

import com.auditude.ads.event.AdClickThroughEvent;
import com.auditude.ads.event.AdPluginEvent;
import com.auditude.ads.event.AdProgressEvent;
import com.auditude.ads.event.LinearAdEvent;
import com.auditude.ads.event.NonLinearAdEvent;
import com.auditude.ads.event.OnPageEvent;
import com.auditude.ads.model.IAsset;
import com.auditude.ads.model.IClick;
import com.auditude.ads.model.ILinearAsset;
import com.auditude.ads.model.INonLinearAsset;
import com.auditude.ads.model.IOnPageAsset;
import com.auditude.ads.session.IPlaybackSession;
import com.auditude.ads.util.event.EventDispatcher;
import java.util.HashMap;

public class APIBridge
  extends EventDispatcher
{
  public static final String AD_VIEW_EVENT = "adViewEvent";
  public static final String API_EVENT = "apiEvent";
  public static final String SMIL_EVENT = "smilEvent";
  
  public final void adBegin(IAsset paramIAsset, IOnPageAsset[] paramArrayOfIOnPageAsset, IPlaybackSession paramIPlaybackSession, boolean paramBoolean)
  {
    IAsset localIAsset = null;
    if ((paramIAsset instanceof ILinearAsset))
    {
      if ((paramIAsset instanceof ILinearAsset)) {
        localIAsset = paramIAsset;
      }
      dispatchEvent("apiEvent", new LinearAdEvent("linearAdBegin", (ILinearAsset)localIAsset, paramArrayOfIOnPageAsset, paramIPlaybackSession, paramBoolean));
      return;
    }
    if ((paramIAsset instanceof INonLinearAsset))
    {
      if ((paramIAsset instanceof INonLinearAsset)) {}
      for (;;)
      {
        dispatchEvent("apiEvent", new NonLinearAdEvent("nonLinearAdBegin", (INonLinearAsset)paramIAsset, paramArrayOfIOnPageAsset));
        return;
        paramIAsset = null;
      }
    }
    if (((paramIAsset instanceof IOnPageAsset)) && (paramIAsset.getFormat().equals("onpage"))) {
      if (!(paramIAsset instanceof IOnPageAsset)) {
        break label174;
      }
    }
    for (;;)
    {
      dispatchEvent("apiEvent", new OnPageEvent("showBanner", (IOnPageAsset)paramIAsset));
      if (paramArrayOfIOnPageAsset == null) {
        break;
      }
      int i = 0;
      while (i < paramArrayOfIOnPageAsset.length)
      {
        dispatchEvent("apiEvent", new OnPageEvent("showBanner", paramArrayOfIOnPageAsset[i]));
        i += 1;
      }
      break;
      label174:
      paramIAsset = null;
    }
  }
  
  public final void adClick(IClick paramIClick, HashMap paramHashMap)
  {
    dispatchEvent("apiEvent", new AdClickThroughEvent("adClick", paramIClick, paramHashMap));
  }
  
  public final void adEnd(IAsset paramIAsset, boolean paramBoolean)
  {
    if ((paramIAsset instanceof ILinearAsset)) {
      if ((paramIAsset instanceof ILinearAsset)) {
        dispatchEvent("apiEvent", new LinearAdEvent("linearAdEnd", (ILinearAsset)paramIAsset, null, null, paramBoolean));
      }
    }
    do
    {
      return;
      paramIAsset = null;
      break;
      if ((paramIAsset instanceof INonLinearAsset))
      {
        if ((paramIAsset instanceof INonLinearAsset)) {}
        for (;;)
        {
          dispatchEvent("apiEvent", new NonLinearAdEvent("nonLinearAdEnd", (INonLinearAsset)paramIAsset, null));
          return;
          paramIAsset = null;
        }
      }
    } while ((!(paramIAsset instanceof IOnPageAsset)) || (!paramIAsset.getFormat().equals("onpage")));
    if ((paramIAsset instanceof IOnPageAsset)) {}
    for (;;)
    {
      dispatchEvent("apiEvent", new OnPageEvent("hideBanner", (IOnPageAsset)paramIAsset));
      return;
      paramIAsset = null;
    }
  }
  
  public final void adPaused(IAsset paramIAsset)
  {
    if ((paramIAsset instanceof ILinearAsset)) {
      if (!(paramIAsset instanceof ILinearAsset)) {
        break label37;
      }
    }
    for (;;)
    {
      dispatchEvent("apiEvent", new LinearAdEvent("linearAdPaused", (ILinearAsset)paramIAsset, null, null, true));
      return;
      label37:
      paramIAsset = null;
    }
  }
  
  public final void adProgress(IAsset paramIAsset, int paramInt1, int paramInt2, HashMap paramHashMap)
  {
    dispatchEvent("apiEvent", new AdProgressEvent("adProgress", paramInt1, paramInt2, paramIAsset, paramHashMap));
  }
  
  public final void adResumed(IAsset paramIAsset)
  {
    if ((paramIAsset instanceof ILinearAsset)) {
      if (!(paramIAsset instanceof ILinearAsset)) {
        break label37;
      }
    }
    for (;;)
    {
      dispatchEvent("apiEvent", new LinearAdEvent("linearAdResumed", (ILinearAsset)paramIAsset, null, null, true));
      return;
      label37:
      paramIAsset = null;
    }
  }
  
  public final void breakBegin(HashMap paramHashMap)
  {
    dispatchEvent("apiEvent", new AdPluginEvent("breakBegin", paramHashMap));
  }
  
  public final void breakEnd(HashMap paramHashMap)
  {
    dispatchEvent("apiEvent", new AdPluginEvent("breakEnd", paramHashMap));
  }
  
  public final void pauseMainMedia(HashMap paramHashMap)
  {
    dispatchEvent("apiEvent", new AdPluginEvent("pausePlayback", paramHashMap));
  }
  
  public final void resumeMainMedia(HashMap paramHashMap)
  {
    dispatchEvent("apiEvent", new AdPluginEvent("resumePlayback", paramHashMap));
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.core.APIBridge
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */