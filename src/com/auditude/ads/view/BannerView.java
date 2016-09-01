package com.auditude.ads.view;

import android.content.Context;
import android.graphics.Bitmap;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.auditude.ads.core.APIBridge;
import com.auditude.ads.event.AdClickThroughEvent;
import com.auditude.ads.model.Click;
import com.auditude.ads.model.IOnPageAsset;
import com.auditude.ads.model.OnPageAsset;
import com.auditude.ads.model.tracking.TrackingEvent;
import com.auditude.ads.model.tracking.TrackingUrl;
import com.auditude.ads.util.AuditudeUtil;
import java.util.ArrayList;
import java.util.Iterator;

public class BannerView
  extends WebView
{
  private APIBridge api;
  private OnPageAsset banner;
  
  public BannerView(Context paramContext)
  {
    super(paramContext);
    init();
  }
  
  public BannerView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init();
  }
  
  public BannerView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init();
  }
  
  private void adClick(String paramString)
  {
    Click localClick2 = (Click)banner.getClick();
    Click localClick1 = localClick2;
    if (localClick2 == null)
    {
      localClick1 = new Click(banner);
      banner.setClick(localClick1);
    }
    localClick1.setShouldAppendParState(false);
    localClick1.setUrl(paramString);
    paramString = new AdClickThroughEvent("adClick", banner.getClick(), null);
    api.dispatchEvent("apiEvent", paramString);
    paramString = localClick1.getTrackingEventByType("click");
    if ((paramString != null) && (paramString.getTrackingUrls() != null) && (paramString.getTrackingUrls().size() > 0)) {
      paramString = paramString.getTrackingUrls().iterator();
    }
    for (;;)
    {
      if (!paramString.hasNext()) {
        return;
      }
      ((TrackingUrl)paramString.next()).log(true, null);
    }
  }
  
  private void init()
  {
    getSettings().setJavaScriptEnabled(true);
    setWebViewClient(new MyWebViewClient(null));
  }
  
  private void pingImpression()
  {
    Object localObject = banner.getTrackingEventByType("creativeview");
    if ((localObject != null) && (((TrackingEvent)localObject).getTrackingUrls() != null)) {
      localObject = ((TrackingEvent)localObject).getTrackingUrls().iterator();
    }
    for (;;)
    {
      if (!((Iterator)localObject).hasNext()) {
        return;
      }
      ((TrackingUrl)((Iterator)localObject).next()).log(false);
    }
  }
  
  public void loadBanner(IOnPageAsset paramIOnPageAsset, APIBridge paramAPIBridge)
  {
    api = paramAPIBridge;
    banner = ((OnPageAsset)paramIOnPageAsset);
    if (banner != null)
    {
      if ((banner.getResourceType() != "static") && (banner.getResourceType() != "html")) {
        break label59;
      }
      loadData(banner.getSource(), "text/html", null);
    }
    label59:
    while (banner.getResourceType() != "iframe") {
      return;
    }
    loadUrl(AuditudeUtil.substituteTags(banner.getUrl()));
    pingImpression();
  }
  
  private class MyWebViewClient
    extends WebViewClient
  {
    private Boolean pageLoaded = Boolean.valueOf(false);
    
    private MyWebViewClient() {}
    
    public void onLoadResource(WebView paramWebView, String paramString)
    {
      if (pageLoaded.booleanValue())
      {
        paramWebView.stopLoading();
        BannerView.this.adClick(paramString);
      }
    }
    
    public void onPageFinished(WebView paramWebView, String paramString)
    {
      pageLoaded = Boolean.valueOf(true);
    }
    
    public void onPageStarted(WebView paramWebView, String paramString, Bitmap paramBitmap)
    {
      pageLoaded = Boolean.valueOf(false);
    }
    
    public boolean shouldOverrideKeyEvent(WebView paramWebView, KeyEvent paramKeyEvent)
    {
      return true;
    }
    
    public boolean shouldOverrideUrlLoading(WebView paramWebView, String paramString)
    {
      BannerView.this.adClick(paramString);
      return true;
    }
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.view.BannerView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */