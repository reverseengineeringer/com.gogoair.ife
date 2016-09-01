package com.auditude.ads.view;

import android.graphics.Bitmap;
import android.view.KeyEvent;
import android.webkit.WebView;
import android.webkit.WebViewClient;

class BannerView$MyWebViewClient
  extends WebViewClient
{
  private Boolean pageLoaded = Boolean.valueOf(false);
  
  private BannerView$MyWebViewClient(BannerView paramBannerView) {}
  
  public void onLoadResource(WebView paramWebView, String paramString)
  {
    if (pageLoaded.booleanValue())
    {
      paramWebView.stopLoading();
      BannerView.access$0(this$0, paramString);
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
    BannerView.access$0(this$0, paramString);
    return true;
  }
}

/* Location:
 * Qualified Name:     com.auditude.ads.view.BannerView.MyWebViewClient
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */