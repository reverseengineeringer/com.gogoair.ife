package com.auditude.ads.view;

import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import com.auditude.ads.core.APIBridge;
import com.auditude.ads.core.AdSettings;
import com.auditude.ads.core.AuditudeEnv;
import com.auditude.ads.model.Asset;
import com.auditude.ads.model.Click;
import com.auditude.ads.model.IAsset;
import com.auditude.ads.model.IContentViewAsset;
import com.auditude.ads.model.ILinearAsset;
import com.auditude.ads.model.INonLinearAsset;
import com.auditude.ads.model.IOnPageAsset;
import com.auditude.ads.model.OnPageAsset;
import com.auditude.ads.model.tracking.TrackingEvent;
import com.auditude.ads.model.tracking.TrackingUrl;
import com.auditude.ads.util.AuditudeUtil;
import com.auditude.ads.util.BrowserUtil;
import com.auditude.ads.util.StringUtil;
import com.auditude.ads.util.event.EventDispatcher;
import com.auditude.ads.util.event.IEventListener;
import com.auditude.ads.view.model.AdViewSource;
import com.auditude.ads.view.model.IAdViewSource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class ViewManager
  extends EventDispatcher
  implements IEventListener, AdPlaybackSession.OnAdPlaybackSessionEventListener
{
  public static final String VIEW_MANAGER_EVENT = "viewManagerEvent";
  private ViewGroup adContainer;
  private APIBridge api;
  private boolean isInitialized = false;
  private FrameLayout viewContainer;
  private ViewController viewController;
  private ViewFactory viewFactory;
  
  public ViewManager(ViewGroup paramViewGroup, APIBridge paramAPIBridge, AdSettings paramAdSettings)
  {
    adContainer = paramViewGroup;
    api = paramAPIBridge;
    viewController = new ViewController(paramAPIBridge, paramAdSettings);
    addViewEventHandlers();
  }
  
  private void addViewEventHandlers()
  {
    api.addEventListener("adViewEvent", this);
  }
  
  private boolean canShowAsset(ViewManagerEvent.ViewManagerEventType paramViewManagerEventType, IAsset paramIAsset)
  {
    return !dispatchViewManagerEvent(new ViewManagerEvent(this, paramViewManagerEventType, paramIAsset));
  }
  
  private Boolean checkCompanionRequired(IOnPageAsset[] paramArrayOfIOnPageAsset, String paramString)
  {
    if (paramString.equalsIgnoreCase("none")) {
      return Boolean.valueOf(true);
    }
    int k = paramArrayOfIOnPageAsset.length;
    int j = 0;
    int i = 0;
    if (j >= k)
    {
      if (i == paramArrayOfIOnPageAsset.length) {
        return Boolean.valueOf(true);
      }
    }
    else
    {
      IOnPageAsset localIOnPageAsset = paramArrayOfIOnPageAsset[j];
      boolean bool;
      if ((localIOnPageAsset.getCreativeType() != null) && (localIOnPageAsset.getCreativeType().equalsIgnoreCase("application/x-shockwave-flash"))) {
        bool = true;
      }
      while ((getBannerContainer(localIOnPageAsset.getWidth(), localIOnPageAsset.getHeight()) != null) && (!Boolean.valueOf(bool).booleanValue())) {
        if (paramString.equalsIgnoreCase("any"))
        {
          return Boolean.valueOf(true);
          bool = false;
        }
        else
        {
          i += 1;
        }
      }
    }
    for (;;)
    {
      j += 1;
      break;
      return Boolean.valueOf(false);
    }
  }
  
  private boolean dispatchViewManagerEvent(ViewManagerEvent paramViewManagerEvent)
  {
    dispatchEvent("viewManagerEvent", paramViewManagerEvent);
    return false;
  }
  
  private ViewGroup getBannerContainer(int paramInt1, int paramInt2)
  {
    Iterator localIterator = null;
    BannerContainer localBannerContainer = null;
    Object localObject = localIterator;
    if ((AuditudeEnv.getInstance().getAdSettings().getProperty("auditudeParamCountryCode") instanceof ArrayList))
    {
      ArrayList localArrayList = (ArrayList)AuditudeEnv.getInstance().getAdSettings().getProperty("auditudeParamCountryCode");
      localObject = localIterator;
      if (localArrayList != null)
      {
        localObject = localIterator;
        if (localArrayList.size() > 0) {
          localIterator = localArrayList.iterator();
        }
      }
    }
    for (localObject = localBannerContainer;; localObject = viewGroup) {
      do
      {
        if (!localIterator.hasNext()) {
          return (ViewGroup)localObject;
        }
        localBannerContainer = (BannerContainer)localIterator.next();
      } while ((width != paramInt1) || (height != paramInt2));
    }
  }
  
  private void hideView(IAdView paramIAdView, AdViewSource paramAdViewSource)
  {
    if (paramIAdView != null) {
      paramIAdView.hide(paramAdViewSource);
    }
    if (paramAdViewSource != null)
    {
      if (!(paramAdViewSource.getAsset() instanceof ILinearAsset)) {
        break label46;
      }
      dispatchViewManagerEvent(new ViewManagerEvent(this, ViewManagerEvent.ViewManagerEventType.LINEAR_AD_END, paramAdViewSource.getAsset()));
    }
    label46:
    while (!(paramAdViewSource.getAsset() instanceof INonLinearAsset)) {
      return;
    }
    dispatchViewManagerEvent(new ViewManagerEvent(this, ViewManagerEvent.ViewManagerEventType.NON_LINEAR_AD_END, paramAdViewSource.getAsset()));
  }
  
  private void initView(IAdView paramIAdView, AdViewSource paramAdViewSource)
  {
    paramIAdView.initialize(viewController);
    showView(paramIAdView, paramAdViewSource);
  }
  
  private void initialize()
  {
    if (isInitialized) {
      return;
    }
    viewContainer = new FrameLayout(adContainer.getContext());
    adContainer.addView(viewContainer, new FrameLayout.LayoutParams(-1, -1));
    viewFactory = new ViewFactory(adContainer.getContext());
    viewController.init();
    isInitialized = true;
  }
  
  private void loadView(AdViewSource paramAdViewSource)
  {
    Object localObject = paramAdViewSource.getAsset();
    ViewFactory localViewFactory = viewFactory;
    if ((localObject instanceof Asset))
    {
      localObject = localViewFactory.getViewForAsset((Asset)localObject);
      if (localObject == null) {
        break label42;
      }
      initView((IAdView)localObject, paramAdViewSource);
    }
    label42:
    while ((!(paramAdViewSource.getAsset() instanceof ILinearAsset)) && (!(paramAdViewSource.getAsset() instanceof INonLinearAsset)))
    {
      return;
      localObject = null;
      break;
    }
    if ((paramAdViewSource.getAsset() instanceof ILinearAsset)) {}
    for (localObject = ViewManagerEvent.ViewManagerEventType.LINEAR_AD_END;; localObject = ViewManagerEvent.ViewManagerEventType.NON_LINEAR_AD_END)
    {
      dispatchViewManagerEvent(new ViewManagerEvent(this, (ViewManagerEvent.ViewManagerEventType)localObject, paramAdViewSource.getAsset()));
      return;
    }
  }
  
  private void logVastgError(Asset paramAsset, int paramInt)
  {
    if (paramAsset != null)
    {
      paramAsset = paramAsset.getTrackingEventByType("vasterror");
      if (paramAsset != null) {
        paramAsset = paramAsset.getTrackingUrls().iterator();
      }
    }
    for (;;)
    {
      if (!paramAsset.hasNext()) {
        return;
      }
      ((TrackingUrl)paramAsset.next()).log(true, null, paramInt);
    }
  }
  
  private void onAdClick(Click paramClick)
  {
    if (paramClick == null) {
      return;
    }
    Object localObject = paramClick.getParent();
    if ((localObject instanceof Asset)) {}
    for (;;)
    {
      localObject = (Asset)localObject;
      if ((localObject == null) || ((!StringUtil.isNullOrEmpty(((Asset)localObject).getApiFramework())) && ("vpaid".equalsIgnoreCase(((Asset)localObject).getApiFramework()))) || (paramClick == null)) {
        break;
      }
      BrowserUtil.OpenUrl(AuditudeUtil.substituteTags(paramClick.getUrl()));
      return;
      localObject = null;
    }
  }
  
  private void onAdViewEvent(AdViewEvent paramAdViewEvent)
  {
    IAdViewSource localIAdViewSource = paramAdViewEvent.getSource();
    IAsset localIAsset = localIAdViewSource.getAsset();
    IOnPageAsset[] arrayOfIOnPageAsset = localIAdViewSource.getCompanions();
    IAdView localIAdView = paramAdViewEvent.getView();
    Object localObject = arrayOfIOnPageAsset;
    switch (paramAdViewEvent.getType())
    {
    case AD_RESUME: 
    case AD_STOP: 
    case AD_USER_CLOSE: 
    default: 
    case AD_LOG: 
    case AD_COMPLETE: 
    case AD_CLICK: 
      do
      {
        do
        {
          return;
        } while (!localIAdView.shouldNotifyAdBeginOnLoad());
        api.adBegin(localIAsset, arrayOfIOnPageAsset, localIAdView.getPlaybackSession(), ((Boolean)AuditudeEnv.getInstance().getAdSettings().getProperty("auditudeHandlesLinearVideoAds")).booleanValue());
        return;
        localObject = new OnPageAsset[0];
        showCompanions((IOnPageAsset[])localObject);
        if (!localIAdView.shouldNotifyAdBeginOnLoad()) {
          api.adBegin(localIAsset, (IOnPageAsset[])localObject, localIAdView.getPlaybackSession(), ((Boolean)AuditudeEnv.getInstance().getAdSettings().getProperty("auditudeHandlesLinearVideoAds")).booleanValue());
        }
        if (localIAsset != null) {
          ((Asset)localIAsset).Show();
        }
        if ((localIAsset instanceof INonLinearAsset))
        {
          dispatchViewManagerEvent(new ViewManagerEvent(this, ViewManagerEvent.ViewManagerEventType.NON_LINEAR_AD_BEGIN, localIAdViewSource.getAsset()));
          return;
        }
      } while (!(localIAsset instanceof ILinearAsset));
      dispatchViewManagerEvent(new ViewManagerEvent(this, ViewManagerEvent.ViewManagerEventType.LINEAR_AD_BEGIN, localIAdViewSource.getAsset()));
      return;
    case AD_PAUSE: 
      api.adProgress(localIAsset, localIAdView.getPosition(), localIAdView.getDuration(), null);
      return;
    case AD_ERROR: 
    case AD_LOAD: 
    case AD_SKIP: 
    case AD_VOLUME_CHANGE: 
      api.adEnd(localIAsset, true);
      if ((localIAdViewSource instanceof AdViewSource)) {}
      for (paramAdViewEvent = localIAdViewSource;; paramAdViewEvent = null)
      {
        hideView(localIAdView, (AdViewSource)paramAdViewEvent);
        return;
      }
    case AD_START: 
      paramAdViewEvent = localIAsset.getClick();
      if ((paramAdViewEvent instanceof Click)) {}
      for (;;)
      {
        onAdClick((Click)paramAdViewEvent);
        api.adClick(localIAsset.getClick(), null);
        return;
        paramAdViewEvent = null;
      }
    case AD_PROGRESS: 
      api.adPaused(localIAsset);
      return;
    }
    api.adResumed(localIAsset);
  }
  
  private void removeViewEventHandlers()
  {
    api.removeEventListener("adViewEvent", this);
  }
  
  private void setContentView(IContentViewAsset paramIContentViewAsset)
  {
    Object localObject2 = viewFactory;
    if ((paramIContentViewAsset instanceof Asset))
    {
      localObject1 = paramIContentViewAsset;
      localObject2 = ((ViewFactory)localObject2).getViewForAsset((Asset)localObject1, true);
      if ((localObject2 != null) && ((localObject2 instanceof View)))
      {
        ((IAdView)localObject2).initialize(viewController);
        if (!(paramIContentViewAsset instanceof IAsset)) {
          break label98;
        }
        localObject1 = paramIContentViewAsset;
        label54:
        ((IAdView)localObject2).show(new AdViewSource((IAsset)localObject1, null, null));
        if (!(localObject2 instanceof View)) {
          break label103;
        }
      }
    }
    label98:
    label103:
    for (Object localObject1 = localObject2;; localObject1 = null)
    {
      paramIContentViewAsset.setContentView((View)localObject1);
      return;
      localObject1 = null;
      break;
      localObject1 = null;
      break label54;
    }
  }
  
  private void showCompanions(IOnPageAsset[] paramArrayOfIOnPageAsset)
  {
    int i;
    if (paramArrayOfIOnPageAsset != null)
    {
      int j = paramArrayOfIOnPageAsset.length;
      i = 0;
      if (i < j) {}
    }
    else
    {
      return;
    }
    IOnPageAsset localIOnPageAsset = paramArrayOfIOnPageAsset[i];
    if ((localIOnPageAsset.getCreativeType() != null) && (localIOnPageAsset.getCreativeType().equalsIgnoreCase("application/x-shockwave-flash"))) {}
    for (boolean bool = true;; bool = false)
    {
      if (!Boolean.valueOf(bool).booleanValue())
      {
        ViewGroup localViewGroup = getBannerContainer(localIOnPageAsset.getWidth(), localIOnPageAsset.getHeight());
        if (localViewGroup != null)
        {
          localViewGroup.removeAllViews();
          BannerView localBannerView = new BannerView(localViewGroup.getContext());
          localBannerView.loadBanner(localIOnPageAsset, api);
          localViewGroup.addView(localBannerView);
        }
      }
      i += 1;
      break;
    }
  }
  
  private void showView(IAdView paramIAdView, AdViewSource paramAdViewSource)
  {
    if ((paramIAdView == null) && (((paramAdViewSource.getAsset() instanceof ILinearAsset)) || ((paramAdViewSource.getAsset() instanceof INonLinearAsset))))
    {
      if ((paramAdViewSource.getAsset() instanceof ILinearAsset)) {}
      for (paramIAdView = ViewManagerEvent.ViewManagerEventType.LINEAR_AD_END;; paramIAdView = ViewManagerEvent.ViewManagerEventType.NON_LINEAR_AD_END)
      {
        dispatchViewManagerEvent(new ViewManagerEvent(this, paramIAdView, paramAdViewSource.getAsset()));
        return;
      }
    }
    AdViewSource localAdViewSource;
    if (((paramIAdView instanceof View)) && (paramIAdView.shouldAddToStage()))
    {
      if (viewContainer.indexOfChild((View)paramIAdView) == -1) {
        viewContainer.addView((View)paramIAdView);
      }
    }
    else
    {
      if (!(paramAdViewSource instanceof AdViewSource)) {
        break label163;
      }
      localAdViewSource = paramAdViewSource;
      label115:
      if (!(paramIAdView instanceof AdView)) {
        break label168;
      }
    }
    label163:
    label168:
    for (IAdView localIAdView = paramIAdView;; localIAdView = null)
    {
      paramIAdView.setPlaybackSession(new AdPlaybackSession(localAdViewSource, (AdView)localIAdView, this));
      paramIAdView.show(paramAdViewSource);
      return;
      ((View)paramIAdView).bringToFront();
      break;
      localAdViewSource = null;
      break label115;
    }
  }
  
  public final void dispose()
  {
    reset();
    removeViewEventHandlers();
    if (viewFactory != null)
    {
      viewFactory.dispose();
      viewFactory = null;
    }
    if (viewController != null)
    {
      viewController.dispose();
      viewController = null;
    }
  }
  
  public final IViewController getViewController()
  {
    return viewController;
  }
  
  public void onAdPlaybackSessionEvent(AdPlaybackSession.PlaybackConstants paramPlaybackConstants, AdViewSource paramAdViewSource, AdView paramAdView, HashMap paramHashMap)
  {
    if (paramAdViewSource != null)
    {
      paramHashMap = paramAdViewSource.getAsset();
      if (paramHashMap != null) {
        break label22;
      }
    }
    label22:
    do
    {
      do
      {
        do
        {
          do
          {
            return;
            paramHashMap = null;
            break;
            switch (paramPlaybackConstants)
            {
            case PAUSE: 
            case PROGRESS: 
            default: 
              return;
            }
          } while (!(paramAdView instanceof ILinearAdView));
          ((ILinearAdView)paramAdView).pause();
          return;
        } while (!(paramAdView instanceof ILinearAdView));
        ((ILinearAdView)paramAdView).resume();
        return;
        onAdViewEvent(new AdViewEvent(this, AdViewEvent.AdViewEventType.AD_STOP, paramAdViewSource, paramAdView));
        return;
      } while (paramAdView == null);
      paramAdView.notifyAdEvent(AdViewEvent.AdViewEventType.AD_CLICK);
      return;
    } while (paramAdView == null);
    paramAdView.notifyAdEvent(AdViewEvent.AdViewEventType.AD_SKIP);
  }
  
  public void onEvent(String paramString, Object paramObject)
  {
    if ((paramString == "adViewEvent") && ((paramObject instanceof AdViewEvent))) {
      onAdViewEvent((AdViewEvent)paramObject);
    }
  }
  
  public final void reset()
  {
    if (viewContainer != null) {
      viewContainer.removeAllViews();
    }
    if (viewFactory != null) {
      viewFactory.reset();
    }
  }
  
  public final void showAdSource(AdViewSource paramAdViewSource)
  {
    initialize();
    Object localObject = checkCompanionRequired(paramAdViewSource.getCompanions(), paramAdViewSource.getAsset().getCompanionRequired());
    if ((paramAdViewSource.getAsset() instanceof ILinearAsset))
    {
      if ((!((Boolean)localObject).booleanValue()) || (!canShowAsset(ViewManagerEvent.ViewManagerEventType.LINEAR_AD_ABOUT_TO_BEGIN, paramAdViewSource.getAsset())))
      {
        dispatchViewManagerEvent(new ViewManagerEvent(this, ViewManagerEvent.ViewManagerEventType.LINEAR_AD_END, paramAdViewSource.getAsset()));
        if ((!((Boolean)localObject).booleanValue()) && (paramAdViewSource.getAsset().isNetworkAd())) {
          logVastgError((Asset)paramAdViewSource.getAsset(), 602);
        }
      }
    }
    else if (((paramAdViewSource.getAsset() instanceof INonLinearAsset)) && (!canShowAsset(ViewManagerEvent.ViewManagerEventType.NON_LINEAR_AD_ABOUT_TO_BEGIN, paramAdViewSource.getAsset())))
    {
      dispatchViewManagerEvent(new ViewManagerEvent(this, ViewManagerEvent.ViewManagerEventType.NON_LINEAR_AD_END, paramAdViewSource.getAsset()));
      return;
    }
    if ((paramAdViewSource.getAsset() instanceof IContentViewAsset))
    {
      localObject = paramAdViewSource.getAsset();
      if (!(localObject instanceof IContentViewAsset)) {
        break label188;
      }
    }
    for (;;)
    {
      setContentView((IContentViewAsset)localObject);
      loadView(paramAdViewSource);
      return;
      label188:
      localObject = null;
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.view.ViewManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */